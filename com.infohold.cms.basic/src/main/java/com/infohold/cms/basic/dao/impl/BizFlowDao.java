package com.infohold.cms.basic.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
/**
 * 
 * 描述：业务流水DAO接口
 * @author yangyantao
 */
@Repository(value="bizFlowDao")
public class BizFlowDao extends BaseDao<BaseEntity>{

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	public void saveBizFlow(BaseEntity entity) {
		hibernateTemplate.save(entity);
	}
	
	/**
	 * 查询用户信息
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> queryUserInfo(String loginid) {
		//String loginid=map.get("user_id")+"";
		//String user_password=map.get("user_pass")+"";
		String sql ="SELECT "
					+" u.userid, "
					+" u.loginid, "
					+" u.name, "
					+" u.password, "
					+" u.organizationid, "
					+ "o.name as branch_name ,"
					+" u.status "
					+" FROM "
					+" auth_user u,"
					+"	auth_organization o"
					+" WHERE "
					+" u.organizationid=o.orgid  "
					//+" AND type='0'"
				//	+" AND status <> '2' "
					+" AND u.loginid =  '"+loginid+"' "
					//+" AND u.password = '"+MD5Util.encryption(user_password)+"' "
					;	
		return super.queryForList(sql);
	}
	
	/**
	 * 查询用户角色信息
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> queryUserRoleInfo(String loginid) {
		//String loginid=map.get("user_id")+"";
		String sql =" select a.userid user_id,"
				+ " a.name user_name,"
				+ " c.id role_id,"
				+ " c.role_code role_code,"
				+ " c.name role_name"
				+ " from auth_user a,auth_user_role b,auth_role c"
				+ " where a.userid=b.userid "
				+ " and b.roleid=c.id"
				+ " and a.loginid='"+loginid+"'"
				;
		return super.queryForList(sql);
	}
}
