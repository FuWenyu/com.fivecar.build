package com.infohold.cms.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.basic.util.StrUtil;
import com.infohold.cms.entity.RoleEntity;
import com.infohold.cms.entity.RoleMenuEntity;
import com.infohold.cms.entity.TmpOrganizationEntity;
import com.infohold.cms.entity.TmpRoleMenuEntity;
import com.infohold.cms.entity.TmpRoleUserEntity;

/**
 * 角色Dao
 * @author wanglei
 *
 */
@Repository("roleDao")
@SuppressWarnings("unchecked")
public class RoleDao extends BaseDao<BaseEntity>{

	/**
	 * 角色列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String,Object>> queryRoleList(Map<String,Object> map,Page page) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT "
					+" r.id, "
					+" r.name, "
					+" r.role_type, "
					+" r.role_code "
					+" FROM "
					+" auth_role r"
					+" WHERE 1=1"
				//	+" auth_role.role_type = 1"
					+ " and r.role_code <> '999999'");
		if(!map.isEmpty()){
			if(!StrUtil.isNullOrEmpty(map.get("name"))){
				sql.append(" AND r.name like '%"+map.get("name")+"%'");
			}
		}
		sql.append(" order by r.id desc ");
		return super.excutePageQuery(sql.toString(),page);
	}

	/**
	 * 通过角色id获取菜单信息
	 * @param roleId
	 * @return
	 */
	public List<Map<String, Object>> findMenuByRoleId(String roleId) {
		String sql = "SELECT "
					+" auth_role_menu.MENUID "
					+" FROM "
					+" auth_role_menu "
					+" WHERE "
					+" auth_role_menu.ROLEID = '"+roleId+"' "
					+" ORDER BY "
					+" auth_role_menu.MENUID ASC";
		return super.queryForList(sql);
	}

	/**
	 * 菜单列表查询
	 * @return
	 */
	public List<Map<String, Object>> findMenu() {
		String sql = "SELECT "
				+" m.ID, "
				+" m.NAME, "
				+" m.PID, "
				+" m.URL "
				+" FROM "
				+" auth_menu m "
				+" WHERE 1=1 "
				//+" auth_menu.TYPE = '0' " //运营中心菜单
				+" and m.ID not like '001%' "
				+" ORDER BY "
				+" m.ID ASC ";
		return super.queryForList(sql);
	}

	/**
	 * 通过ID查询角色
	 * @return
	 */
	public Map<String, Object> getRoleByid(String id) {
		String sql = "SELECT "
				+" r.id, "
				+" r.name, "
				+" r.role_type, "
				+" r.role_code  "
				+" FROM "
				+" auth_role r "
				+" WHERE 1=1 "
				+" and r.id = "+id
				;
		return super.queryForMap(sql);
	}
	
	/**
	 * 保存角色菜单关联关系
	 * @param roleId
	 * @param menuId
	 * @return
	 */
	public boolean saveRole_Menu(String roleId, String menuId) {
		RoleMenuEntity roleMenu = new RoleMenuEntity();
		roleMenu.setRoleid(roleId);
		roleMenu.setMenuid(menuId);
		super.save(roleMenu);
		return true;
		
	}

	/**
	 * 通过角色id删除角色菜单关联关系
	 * @param roleId
	 * @return
	 */
	public boolean deleteMenuById(String roleId) {
		String delete_menu_sql = "delete from RoleMenuEntity where roleid = '"+roleId+"'";
		excuteUpdate(delete_menu_sql);
		return true;
	}

	/**
	 * 通过角色id删除角色
	 * @param roleId
	 * @return
	 */
	public boolean deleteRoleById(String Id) {
		String delete_sql = "delete from RoleEntity where id = '"+Id+"'";
		excuteUpdate(delete_sql);
		return true;
	}
	
	/**
	 * 根据role_code获取角色信息
	 */
	public RoleEntity getRoleByRoleCode(String role_code){
		String hql = "from RoleEntity where role_code = '"+role_code+"'";
		System.out.println(hql);
		return (RoleEntity) super.find(hql).get(0);
	}
	
	/**
	 * 通过角色id删除角色用户关联关系
	 * @param roleId
	 * @return
	 */
	public boolean deleteRoleUserByRoleId(String roleid) {
		String delete_menu_sql = "delete from UserRoleEntity where roleid = '"+roleid+"'";
		excuteUpdate(delete_menu_sql);
		return true;
	}
	
	/**
	 * 通过用户id删除角色用户关联关系
	 * @param roleId
	 * @return
	 */
	public boolean deleteRoleUserByUserId(String userid) {
		String delete_menu_sql = "delete from UserRoleEntity where userid = '"+userid+"'";
		excuteUpdate(delete_menu_sql);
		return true;
	}
	
	/**
	 * 通过菜单id删除角色菜单关联关系
	 * @param id
	 */
	public void deleteRoleMenuByMenuId(String menuid) {
		String hql = "delete from RoleMenuEntity where menuid = '"+menuid+"'";
		excuteUpdate(hql);
	}
	
	/**
	 * 清空角色用户信息临时表
	 */
	public void deleteTmpRoleUser(){
		String hql = "delete from TmpRoleUserEntity";
		excuteUpdate(hql);
	}
	
	/**
	 * 清空角色菜单信息临时表
	 */
	public void deleteTmpRoleMenu() {
		String hql = "delete from TmpRoleMenuEntity";
		excuteUpdate(hql);
	}
	
	/**
	 * 清空机构信息临时表
	 */
	public void deleteTmpOrganization() {
		String hql = "delete from TmpOrganizationEntity";
		excuteUpdate(hql);
	}

	/**
	 * 获取角色用户临时表信息
	 * @return
	 */
	public List<TmpRoleUserEntity> getTmpRoleUserList(){
		String hql = "from TmpRoleUserEntity where bsid='100'";
		return super.find(hql);
	}
	
	/**
	 * 获取角色用户临时表信息
	 * @return
	 */
	public List<TmpRoleMenuEntity> getTmpRoleMenuList() {
		String hql = "from TmpRoleMenuEntity where bsid='100'";
		return super.find(hql);
	}
	
	/**
	 * 获取机构临时表信息
	 * @return
	 */
	public List<TmpOrganizationEntity> getTmpOrganizationList() {
		String hql = "from TmpOrganizationEntity";
		return super.find(hql);
	}

}
