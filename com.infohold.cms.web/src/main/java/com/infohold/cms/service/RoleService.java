package com.infohold.cms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.MD5Util;
import com.infohold.cms.basic.util.StrUtil;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.RoleDao;
import com.infohold.cms.dao.UserDao;
import com.infohold.cms.entity.MenuEntity;
import com.infohold.cms.entity.OrganizationEntity;
import com.infohold.cms.entity.RoleEntity;
import com.infohold.cms.entity.RoleMenuEntity;
import com.infohold.cms.entity.TmpOrganizationEntity;
import com.infohold.cms.entity.TmpRoleMenuEntity;
import com.infohold.cms.entity.TmpRoleUserEntity;
import com.infohold.cms.entity.UserEntity;
import com.infohold.cms.entity.UserRoleEntity;

/**
 * 角色Service
 * @author 张洪超
 *
 */
@SuppressWarnings("unchecked")
@Service("roleService")
public class RoleService implements IBusinessService{
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private SysConfigUtil sysConfigUtil;
	
	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode=transData.getTradeCode();
		if(tradCode.equals("T50001")){
			return this.findAll(transData);
		}
		else if(tradCode.equals("T50002")){
			return this.getRole_Menu(transData);
		}
		else if(tradCode.equals("T50003")){
			return this.saveRole_Menu(transData);
		}
		else if(tradCode.equals("T50004")){
			return this.role_add(transData);
		}
		else if(tradCode.equals("T50005")){
			return this.role_addSave(transData);
		}
		else if(tradCode.equals("T50006")){
			return this.role_edit(transData);
		}
		else if(tradCode.equals("T50007")){
			return this.role_editSave(transData);
		}
		else if(tradCode.equals("T50008")){
			return this.role_delete(transData);
		}
		else if(tradCode.equals("T50030")){
			return this.handRoleUserInfo(transData);
		}
		else if(tradCode.equals("T50031")){
			return this.handRoleMenuInfo(transData);
		}
		return transData;	
	}
	
	/**
	 * 保存角色菜单关联关系
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData saveRole_Menu(TransData transData) throws BusinessException{
		Map<String,Object> param_map = (Map<String, Object>) transData.getObj();
		String roleId = (String) transData.getViewMap().get("id");
		String[] ids = (String[]) param_map.get("ids");
		
		roleDao.deleteMenuById(roleId);
		if (roleId.equals("1")) {
			roleDao.saveRole_Menu(roleId,"001");
			roleDao.saveRole_Menu(roleId,"001001");
			roleDao.saveRole_Menu(roleId,"001002");
			roleDao.saveRole_Menu(roleId,"001003");
		}
		for(String menuId : ids){
			if(!StrUtil.isNullOrEmpty(menuId)){
				roleDao.saveRole_Menu(roleId,menuId);
			}
		}
		transData.setObj(true);
		return transData;
	}

	/**
	 * 获取角色菜单关联关系
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData getRole_Menu(TransData transData) throws BusinessException{
		String roleId = (String) transData.getViewMap().get("id");
		RoleEntity roleEntity = (RoleEntity) roleDao.get(RoleEntity.class, roleId);
		List<Map<String, Object>> roleMenu = roleDao.findMenuByRoleId(roleId);
		List<Map<String, Object>> menu_list = roleDao.findMenu();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("roleEntity", roleEntity);
		map.put("menu_list", menu_list);
		map.put("roleMenu", roleMenu);
		transData.setObj(map);
		return transData;
	}

	/**
	 * 角色列表
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData findAll(TransData transData) throws BusinessException{
		List<Map<String,Object>> list = roleDao.queryRoleList(transData.getViewMap(),transData.getPageInfo());
		transData.setObj(list);
		return transData;
	}
	
	/**
	 * 角色新增生成角色编号
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData role_add(TransData transData) throws BusinessException{
		String roel_code = String.valueOf(sysConfigUtil.getPrimaryId());
		transData.setObj(roel_code);
		return transData;
	}
	
	/**
	 * 角色新增保存
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData role_addSave(TransData transData) throws BusinessException{
		Map<String,Object> map= transData.getViewMap();
		String id = String.valueOf(sysConfigUtil.getPrimaryId());
		String role_code=map.get("role_code")+"";
		String role_name=map.get("role_name")+"";
		RoleEntity roleEntity= new RoleEntity();
		roleEntity.setId(id);
		roleEntity.setName(role_name);
		roleEntity.setRole_code(role_code);
		roleEntity.setRole_type("1");//默认都是普通用户0管理员1用户
		roleDao.save(roleEntity);
		transData.setExpMsg("success");
		return transData;
	}
	
	/**
	 * 角色详细信息
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData role_edit(TransData transData) throws BusinessException{
		Map<String,Object> map= transData.getViewMap();
		String id = map.get("id")+"";
		Map<String,Object> roleEntity=roleDao.getRoleByid(id);
		transData.setObj(roleEntity);
		return transData;
	}
	/**
	 * 角色编辑保存
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData role_editSave(TransData transData) throws BusinessException{
		Map<String,Object> map= transData.getViewMap();
		String id = map.get("id")+"";
		String role_code=map.get("role_code")+"";
		String role_name=map.get("role_name")+"";
		RoleEntity roleEntity= new RoleEntity();
		roleEntity.setId(id);
		roleEntity.setName(role_name);
		roleEntity.setRole_code(role_code);
		roleEntity.setRole_type("1");//默认都是普通用户0管理员1用户
		roleDao.update(roleEntity);
		transData.setExpMsg("success");
		return transData;
	}
	
	/**
	 * 角色删除
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData role_delete(TransData transData) throws BusinessException{
		Map<String,Object> map= transData.getViewMap();
		String id = map.get("id")+"";
		roleDao.deleteMenuById(id);
		roleDao.deleteRoleById(id);
		transData.setExpMsg("success");
		return transData;
	}
	
	/**
	 * 临时表角色用户信息处理
	 */
	public TransData handRoleUserInfo(TransData transData){
		List<TmpRoleUserEntity> tmpRoleUserList = roleDao.getTmpRoleUserList();
		//拼装数据：role_code - List<UserEntity>
		Map<String,List<UserEntity>> map = new HashMap<String,List<UserEntity>>();
		if(tmpRoleUserList.size() == 0){
			System.out.println("角色用户信息临时表暂无数据，停止处理。");
			return transData;
		}else{
			for(TmpRoleUserEntity role_user : tmpRoleUserList){
				String role_code = role_user.getRole_code();
				//存在role_code
				if(map.containsKey(role_code)){
					List<UserEntity> userList = map.get(role_code);
					UserEntity userEntity = new UserEntity();
					userEntity.setLoginid(role_user.getUser_id());
					userEntity.setName(role_user.getUser_name());
					userEntity.setOrganizationid(role_user.getBanch_no());
					userList.add(userEntity);
				}
				//不存在role_code
				else{
					List<UserEntity> userList = new ArrayList<UserEntity>();
					UserEntity userEntity = new UserEntity();
					userEntity.setLoginid(role_user.getUser_id());
					userEntity.setName(role_user.getUser_name());
					userEntity.setOrganizationid(role_user.getBanch_no());
					userList.add(userEntity);
					map.put(role_code, userList);
				}
			}
		}
		//处理数据
		if(!map.isEmpty()){
			Set<Entry<String, List<UserEntity>>> set = map.entrySet();
			for(Entry<String, List<UserEntity>> entry : set){
				//角色信息
				String role_code = entry.getKey();
				RoleEntity role = roleDao.getRoleByRoleCode(role_code);
				//用户信息
				List<UserEntity> userList = entry.getValue();
				for(UserEntity user : userList){
					System.out.println(role_code+"      "+user);
					//UserEntity tmp = (UserEntity) roleDao.get(UserEntity.class, user.getUserid());
					UserEntity tmp = userDao.findUserByLoginId(user.getLoginid());
					//用户新增操作
					if(tmp == null){
						user.setUserid(String.valueOf(sysConfigUtil.getPrimaryId()));
						user.setLoginid(user.getLoginid());
						user.setType("0");
						user.setStatus("0");
						user.setPassword(MD5Util.encryption("000000"));
						roleDao.save(user);
						//删除角色用户关联关系
						roleDao.deleteRoleUserByUserId(user.getUserid());
						//维护角色用户关系信息
						UserRoleEntity user_role = new UserRoleEntity();
						user_role.setUserid(user.getUserid());
						user_role.setRoleid(role.getId());
						roleDao.save(user_role);
					}
					//用户更新操作
					else{
						UserEntity user_update = (UserEntity) userDao.get(UserEntity.class, tmp.getUserid());
						user_update.setName(user.getName());
						user_update.setOrganizationid(user.getOrganizationid());
						roleDao.update(user_update);
						//删除角色用户关联关系
						roleDao.deleteRoleUserByUserId(user_update.getUserid());
						//角色用户关系信息
						UserRoleEntity user_role = new UserRoleEntity();
						user_role.setUserid(user_update.getUserid());
						user_role.setRoleid(role.getId());
						roleDao.save(user_role);
					}
				}
			}
			//清空角色用户信息临时表
			roleDao.deleteTmpRoleUser();
			
			System.out.println("数据处理成功。");
		}else{
			System.out.println("拼装数据为空，停止处理。");
			return transData;
		}
		return transData;
	}
	
	/**
	 * 临时表角色菜单信息处理
	 */
	public TransData handRoleMenuInfo(TransData transData){
		List<TmpRoleMenuEntity> tmpRoleMenuList = roleDao.getTmpRoleMenuList();
		//拼装数据：role_code - List<UserEntity>
		Map<String,List<MenuEntity>> map = new HashMap<String,List<MenuEntity>>();
		if(tmpRoleMenuList.size() == 0){
			System.out.println("角色菜单信息临时表暂无数据，停止处理。");
			return transData;
		}else{
			for(TmpRoleMenuEntity role_menu : tmpRoleMenuList){
				String role_code = role_menu.getRole_code();
				//存在role_code
				if(map.containsKey(role_code)){
					List<MenuEntity> menuList = map.get(role_code);
					MenuEntity menuEntity = new MenuEntity();
					menuEntity.setId(role_menu.getMenu_id());
					menuEntity.setName(role_menu.getMenu_name());
					menuEntity.setPid(role_menu.getMenu_pid());
					menuEntity.setUrl(role_menu.getMenu_url());
					menuList.add(menuEntity);
				}
				//不存在role_code
				else{
					List<MenuEntity> menuList = new ArrayList<MenuEntity>();
					MenuEntity menuEntity = new MenuEntity();
					menuEntity.setId(role_menu.getMenu_id());
					menuEntity.setName(role_menu.getMenu_name());
					menuEntity.setPid(role_menu.getMenu_pid());
					menuEntity.setUrl(role_menu.getMenu_url());
					menuList.add(menuEntity);
					map.put(role_code, menuList);
				}
			}
		}
		//处理数据
		if(!map.isEmpty()){
			Set<Entry<String, List<MenuEntity>>> set = map.entrySet();
			for(Entry<String, List<MenuEntity>> entry : set){
				//角色信息
				String role_code = entry.getKey();
				System.out.println(role_code);
				RoleEntity role = roleDao.getRoleByRoleCode(role_code);
				//菜单信息
				List<MenuEntity> menuList = entry.getValue();
				for(MenuEntity menu : menuList){
					System.out.println(role_code+"      "+menu);
					//UserEntity tmp = (UserEntity) roleDao.get(UserEntity.class, user.getUserid());
					MenuEntity tmp = (MenuEntity) roleDao.get(MenuEntity.class, menu.getId());
					//菜单新增操作
					if(tmp == null){
						/*menu.setUserid(String.valueOf(sysConfigUtil.getPrimaryId()));
						menu.setLoginid(user.getLoginid());
						menu.setType("0");
						menu.setStatus("0");
						menu.setPassword(MD5Util.encryption("000000"));*/
						roleDao.save(menu);
						//删除角色菜单关联关系
						roleDao.deleteRoleMenuByMenuId(menu.getId());
						//维护角色菜单关系信息
						RoleMenuEntity role_menu = new RoleMenuEntity();
						role_menu.setRoleid(role.getId());
						role_menu.setMenuid(menu.getId());
						roleDao.save(role_menu);
					}
					//菜单更新操作
					else{
						tmp.setName(menu.getName());
						tmp.setPid(menu.getPid());
						tmp.setUrl(menu.getUrl());
						roleDao.update(tmp);
						//删除角色菜单关联关系
						roleDao.deleteRoleMenuByMenuId(menu.getId());
						//维护角色菜单关系信息
						RoleMenuEntity role_menu = new RoleMenuEntity();
						role_menu.setRoleid(role.getId());
						role_menu.setMenuid(menu.getId());
						roleDao.save(role_menu);
					}
				}
			}
			//清空角色用户信息临时表
			roleDao.deleteTmpRoleMenu();
			
			System.out.println("数据处理成功。");
		}else{
			System.out.println("拼装数据为空，停止处理。");
			return transData;
		}
		return transData;
	}
	
	/**
	 * 临时表机构信息处理
	 */
	public TransData handOrganzitionInfo(TransData transData){
		List<TmpOrganizationEntity> tmpOrgList = roleDao.getTmpOrganizationList();
		//拼装数据：role_code - List<UserEntity>
		Map<String,List<OrganizationEntity>> map = new HashMap<String,List<OrganizationEntity>>();
		if(tmpOrgList.size() == 0){
			System.out.println("机构信息临时表暂无数据，停止处理。");
			return transData;
		}else{
			for(TmpOrganizationEntity organization : tmpOrgList){
				String banch_no = organization.getBanch_no();
				//存在role_code
				if(map.containsKey(banch_no)){
					List<OrganizationEntity> orgList = map.get(banch_no);
					/*UserEntity userEntity = new UserEntity();
					userEntity.setLoginid(role_user.getUser_id());
					userEntity.setName(role_user.getUser_name());
					userEntity.setOrganizationid(role_user.getBanch_no());
					userList.add(userEntity);*/
					OrganizationEntity organizationEntity = new OrganizationEntity();
					organizationEntity.setId(organization.getBanch_no());
					organizationEntity.setOrgid(organization.getBanch_p_no());
					organizationEntity.setName(organization.getBanch_name());
					orgList.add(organizationEntity);
				}
				//不存在role_code
				else{
					List<OrganizationEntity> orgList = new ArrayList<OrganizationEntity>();
					OrganizationEntity organizationEntity = new OrganizationEntity();
					organizationEntity.setId(organization.getBanch_no());
					organizationEntity.setOrgid(organization.getBanch_p_no());
					organizationEntity.setName(organization.getBanch_name());
					orgList.add(organizationEntity);
					map.put(banch_no, orgList);
				}
			}
		}
		//处理数据
		if(!map.isEmpty()){
			Set<Entry<String, List<OrganizationEntity>>> set = map.entrySet();
			for(Entry<String, List<OrganizationEntity>> entry : set){
				//角色信息
				String banch_no = entry.getKey();
				OrganizationEntity organizationEntity = (OrganizationEntity) roleDao.get(OrganizationEntity.class, banch_no);
				//用户信息
				List<OrganizationEntity> orgList = entry.getValue();
				for(OrganizationEntity org : orgList){
					OrganizationEntity tmp = (OrganizationEntity) roleDao.get(OrganizationEntity.class, org.getId());
					//新增操作
					if(tmp == null){
						roleDao.save(org);
					}
					//更新操作
					else{
						roleDao.update(tmp);
					}
				}
			}
			//清空临时表
			roleDao.deleteTmpOrganization();
			
			System.out.println("数据处理成功。");
		}else{
			System.out.println("拼装数据为空，停止处理。");
			return transData;
		}
		return transData;
	}
}
