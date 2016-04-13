package com.infohold.cms.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.ParallelSalesEntity;

/**
 * 4s店品牌Dao
 * @author fwy
 *
 */
@SuppressWarnings("unchecked")
@Repository("pasalesDao")
public class ParallelSalesDao extends BaseDao<BaseEntity> {
	
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> querysalesList(Page page,String orgid){
		StringBuffer sql = new StringBuffer();
		sql.append("select sl.id,");
		sql.append("sl.salesName,");
		sql.append("sl.imageName,");
		sql.append("sl.phone,");
		sql.append("sl.wxQQ,");
		sql.append("sl.belong,");
		sql.append("sl.belongName,");
		sql.append("sl.url,");
		sql.append("sl.urlreal,");
		sql.append("sl.description,");
		sql.append("sl.createDate,");
		sql.append("sl.createName ");
		sql.append("from fc_parallel_sales sl ");
		sql.append(" where sl.orgid=");
		sql.append("'");
		sql.append(orgid);
		sql.append("'");
		sql.append(" order by sl.createDate desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryDealerList(Page page,String orgid){
		StringBuffer sql = new StringBuffer();
		sql.append("select dlr.id,");
		sql.append("dlr.telephone,");
		sql.append("dlr.dealerName ");
		sql.append("from fc_parallel_dealer dlr ");
		sql.append(" where dlr.orgid=");
		sql.append("'");
		sql.append(orgid);
		sql.append("'");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> querysalesList1(String belong,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select sl.id,");
		sql.append("sl.belong,");
		sql.append("sl.belongName,");
		sql.append("sl.salesName,");
		sql.append("sl.phone,");
		sql.append("sl.wxQQ,");
		sql.append("sl.url,");
		sql.append("sl.urlreal ");
		sql.append("from fc_parallel_sales sl ");
		sql.append(" where sl.belong=");
		sql.append("'");
		sql.append(belong);
		sql.append("'");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存4s店车辆信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean savesalesEntity(ParallelSalesEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 4s店车辆信息删除
	 * @param id
	 * @return
	 */
	public boolean deletesalesEntity(String id) {
		String deleteUser_HQL = "delete from ParallelSalesEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询4s店车辆信息信息
	 * @return
	 */

	public ParallelSalesEntity getsalesEntity(String id) {
		ParallelSalesEntity entity = new ParallelSalesEntity();
		entity = (ParallelSalesEntity) super.get(ParallelSalesEntity.class, id);
		return entity;
	}
	
	/**
	 * 4s店车辆信息更新
	 * @param id，用户主键
	 * @return
	 */
	public boolean sales_update(ParallelSalesEntity entity) {
		super.update(entity);
		return true;
	}
	
}
