package com.infohold.cms.basic.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.entity.BaseEntity;

public abstract class BaseDao<T> {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public Serializable save(BaseEntity entity) {
		return hibernateTemplate.save(entity);
	}

	public void remove(T entity) {
		hibernateTemplate.delete(entity);
	}

	public void update(T entity) {
		hibernateTemplate.update(entity);
	}

	public T get(Class<?> entityClass, Serializable id) {
		return (T) hibernateTemplate.get(entityClass, id);
	}
	
	public List find(String queryString) {
		return hibernateTemplate.find(queryString);
	}

	public List find(String queryString, Object... values) {
		return hibernateTemplate.find(queryString, values);
	}
	
	public List<T> findAll(Class<T> entityClass,Page page) {
		String queryString = "from " + entityClass.getSimpleName();
		return find(queryString, page);
	}
	
	public List<Map<String,Object>> excutePageQuery(final String sql, final Page page,
			final Object... values) {
		String countQueryString = "select count(1) from  ("+sql+") subTB";
		int totalCount =jdbcTemplate.queryForInt(countQueryString);
		if (totalCount < 1)
			return null;
		page.setTotalCount(totalCount);
		List<Map<String,Object>> list = hibernateTemplate.execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createSQLQuery(sql);
				query.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);
				return query.setFirstResult(page.getStartOfPage()).setMaxResults(page.getPageSize()).list();
			}
		});
		return list;
	}

	public List<T> find(final String queryString, final Page page,
			final Object... values) {

		int beginIndex = queryString.toLowerCase().indexOf("from");
		String countQueryString = "select count(*) "
				+ queryString.substring(beginIndex);
		int totalCount = ((Long) hibernateTemplate.find(countQueryString,
				values).get(0)).intValue();
		if (totalCount < 1)
			return null;
		page.setTotalCount(totalCount);
		List<T> list = hibernateTemplate.execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(queryString);
				for (int i = 0; i < values.length; i++)
					query.setParameter(i, values[i]);
				return (List<T>) query.setFirstResult(page.getStartOfPage())
						.setMaxResults(page.getPageSize()).list();
			}
		});
		return list;
	}
	
	public List<Object[]> findBySQL(final String queryString,
			final Object... values) {
		hibernateTemplate.setCacheQueries(false); 
		List<Object[]> list = hibernateTemplate
				.execute(new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createSQLQuery(queryString);
						for (int i = 0; i < values.length; i++)
							query.setParameter(i, values[i]);
						return query.list();
					}
				});
		return list;
	}	
	
	public void excuteUpdate(final String queryString, final Object... values) {
		hibernateTemplate.execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(queryString);
				for (int i = 0; i < values.length; i++)
					query.setParameter(i, values[i]);
				return query.executeUpdate();
			}
		});
	}
	
	public void save(final List<T> entityList) {
		hibernateTemplate.execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				int count = 0;
				for (T entity : entityList) {
					session.save(entity);
					if (++count % 10 == 0) {
						session.flush();
						session.clear();
					}
				}
				return null;
			}
		});
	}	
	
	/**
	 * 通过JDBC执行SQL查询语句
	 * @param sql
	 * @return
	 */
	public List<Map<String,Object>> queryForList(String sql){
		return this.jdbcTemplate.queryForList(sql);
	}
	
	/**
	 * 通过JDBC执行SQL查询语句,返回单条
	 * 注意，如果没有查出数据，会报空异常，尽量使用queryForList
	 * @param sql
	 * @return
	 */
	public Map<String,Object> queryForMap(String sql){
		return this.jdbcTemplate.queryForMap(sql);
	}
	
	/**
	 * 通过JDBC执行SQL查询语句,返回int型数据
	 * @param sql
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public int queryForInt(String sql){
		return this.jdbcTemplate.queryForInt(sql);
	}
	
	public void deleteBySql(String sql){
		this.jdbcTemplate.execute(sql);
	}
	
}
