package com.infohold.cms.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Label;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.basic.util.StrUtil;
import com.infohold.cms.entity.UserEntity;
import com.infohold.cms.entity.UserRoleEntity;

/**
 * 用户Dao
 * @author wanglei
 *
 */
@SuppressWarnings("unchecked")
@Repository("userDao")
public class UserDao extends BaseDao<BaseEntity> {
	
	/**
	 * 运营用户列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String,Object>> queryOmsUserList(Map<String,Object> map,Page page) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT "
				+" auth_user.userid, "
				+" auth_user.loginid, "
				+" auth_user.name, "
				+" auth_user.password, "
				+" auth_user.status, "
				+" auth_user.organizationid "
				+" FROM "
				+" auth_user "
				+ "WHERE auth_user.type = '0' AND auth_user.status <> '2' AND auth_user.loginid <> 'admin' ");
		
		/*sql.append(" union all ");
		sql.append(" (SELECT "
				+" a.userid, "
				+" a.loginid, "
				+" a.name, "
				+" a.password, "
				+" a.status, "
				+" a.organizationid "
				+" FROM "
				+" auth_user a,auth_user_role ar,auth_role r "
				+ "WHERE a.userid = ar.userid AND ar.roleid = r.id AND a.type = '1' AND r.role_code = '999999' ))tb  WHERE 1=1 ");
		*/
		if(!map.isEmpty()){
			if(!StrUtil.isNullOrEmpty(map.get("name"))){
				sql.append(" AND auth_user.name like '%"+map.get("name")+"%' ");
			}
		}
		return super.excutePageQuery(sql.toString(),page);
	}

	/**
	 * 担保公司用户列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String,Object>> queryCmsUserList(Map<String,Object> map,Page page) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT DISTINCT "
				+"	a.userid, "
				+"	a.loginid, "
				+"	a.name, "
				+"	a.password, "
				+"	a.status, "
				+"	a.organizationid "
				+"FROM "
				+"	auth_user a, "
				+"	auth_user_role ar, "
				+"	auth_role r "
				+"WHERE "
				+"	a.userid = ar.userid "
				+"AND ar.roleid = r.id ");
			//	+"AND r.role_code <> '999999'");
		
		if(!map.isEmpty()){
			if(!StrUtil.isNullOrEmpty(map.get("name"))){
				sql.append(" AND a.name like '%"+map.get("name")+"%'");
			}
		}
		return super.excutePageQuery(sql.toString(),page);
	}

	/**
	 * 机构列表
	 * @return
	 */
	public List<Label> getOrganizationList() {
		String sql_org = "SELECT "
						+" auth_organization.ID, "
						+" auth_organization.orgid, "
						+" auth_organization.NAME "
						+" FROM "
						+" auth_organization ";
		List<Map<String,Object>> org = queryForList(sql_org);
		List<Label> list = new ArrayList<Label>();
		for(Map<String,Object> map:org){
			Label label = new Label((String)map.get("orgid"),(String)map.get("NAME"));
			list.add(label);
		}
		return list;
	}
	
	/**
	 * 担保公司列表
	 * @return
	 */
	public List<Label> getGuaranteeList() {
		String sql_guarantee_org ="SELECT "
								+" pub_guarantee_org.branch_no, "
								+" pub_guarantee_org.branch_name "
								+" FROM "
								+" pub_guarantee_org "
								+" WHERE "
								+" pub_guarantee_org.status = '1' ";
		List<Map<String,Object>> guarantee_org = queryForList(sql_guarantee_org);
		List<Label> list = new ArrayList<Label>();
		for(Map<String,Object> map:guarantee_org){
			Label label = new Label((String)map.get("branch_no"),(String)map.get("branch_name"));
			list.add(label);
		}
		return list;
	}

	/**
	 * 角色列表查询
	 * @param type
	 * @return
	 */
	public List<Label> getRoleList(String type) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT "
				+" auth_role.id, "
				+" auth_role.name, "
				+" auth_role.role_type, "
				+" auth_role.role_code "
				+" FROM "
				+" auth_role ");
		/*if(!StrUtil.isNullOrEmpty(type)){
			//运营中心角色
			if("1".equals(type)){
				sql.append(" AND role_type = '1' AND role_code <> '999999' ");
			}
			//担保公司角色,在运营中心只显示超级管理员(role_code:999999 role_type:2)
			else{
				sql.append(" AND role_type = '2' AND role_code = '999999'");
			}
		}*/
		List<Label> list = new ArrayList<Label>();
		List<Map<String,Object>> roleList = queryForList(sql.toString());
		for(Map<String,Object> map:roleList){
			Label label = new Label((String)map.get("id"),(String)map.get("name"));
			list.add(label);
		}
		return list;
	}
	
	/**
	 * 用户保存
	 * @param entity
	 * @return
	 */
	public boolean saveUserEntity(UserEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 用户角色关联关系保存
	 * @param entity
	 * @return
	 */
	public boolean saveUser_Role(UserRoleEntity entity) {
		super.save(entity);
		return true;
	}

	/**
	 * 用户删除
	 * @param id
	 * @return
	 */
	public boolean deleteUserEntity(String id) {
		//String deleteUser_HQL = "delete from UserEntity u where u.id = '"+id+"'";
		//将用户状态更新为2：停用
		String deleteUser_HQL = "update UserEntity u set u.status = '2' where u.id = '"+id+"'";
		excuteUpdate(deleteUser_HQL);
		return true;
	}
	
	/**
	 * 用户角色关联关系删除
	 * @param id
	 * @return
	 */
	public boolean deleteUserRoleEntity(String id) {
		String deleteUser_Role_HQL = "delete from UserRoleEntity ur where ur.userid = '"+id+"'";
		excuteUpdate(deleteUser_Role_HQL);
		return true;
	}

	/**
	 * 通过用户id获取角色ids
	 * @param id
	 * @return
	 */
	public List<UserRoleEntity> findUserRoleById(String id) {
		//super.find("from UserRoleEntity where userid = '"+id+"'");
		return super.find("from UserRoleEntity where userid = '"+id+"'");
	}

	/**
	 * 通过角色id获取用户列表
	 * @param roleId
	 * @return
	 */
	public List<Label> getUserListByRoleId(String roleId) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT  u.userId,  u.name  FROM  auth_user u,auth_user_role o,auth_role r WHERE u.userId = o.userid  and o.roleid = r.id ");
		sql.append(" and r.role_code = '"+roleId+"'");
		List<Label> list = new ArrayList<Label>();
		List<Map<String,Object>> userList = queryForList(sql.toString());
		for(Map<String,Object> map:userList){
			Label label = new Label((String)map.get("userId"),(String)map.get("name"));
			list.add(label);
		}
		return list;
	}
	
	/**
	 * 根据登录名查用户
	 * @param id
	 * @return
	 */
	public List<UserEntity> findUserByLoginName(String loginName) {
		return super.find("from UserEntity where loginid = '"+loginName+"' AND status <> '2'");
	}
	
	/**
	 * 根据登录名查用户
	 * @param id
	 * @return
	 */
	public UserEntity findUserByLoginId(String loginName) {
		List<UserEntity> list =  super.find("from UserEntity where loginid = '"+loginName+"'");
		if(list.size() != 0){
			return list.get(0);
		}else{
			return null;
		}
		//return (UserEntity) super.find("from UserEntity where loginid = '"+loginName+"'").get(0);
	}

}
