package com.infohold.cms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.Label;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.MD5Util;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.UserDao;
import com.infohold.cms.entity.UserEntity;
import com.infohold.cms.entity.UserRoleEntity;

/**
 * 用户管理Service
 * @author wanglei
 *
 */
@SuppressWarnings("unchecked")
@Service("userService")
public class UserService implements IBusinessService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private SysConfigUtil sysConfigUtil;
	
	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode=transData.getTradeCode();
		if(tradCode.equals("T50011")){
			return this.findAll(transData);
		}
		else if(tradCode.equals("T50012")){
			return this.getOrganization_GuaranteeOrg(transData);
		}
		else if(tradCode.equals("T50013")){
			return this.saveUserEntity(transData);
		}
		else if(tradCode.equals("T50014")){
			return this.deleteUserEntity(transData);
		}
		else if(tradCode.equals("T50015")){
			return this.getUser_Role_Org(transData);
		}
		else if(tradCode.equals("T50017")){
			return this.updateUserEntity(transData);
		}
		else if(tradCode.equals("T50018")){
			return this.resetPwd(transData);
		}
		else if(tradCode.equals("T50019")){
			return this.setOffline(transData);
		}
		else if(tradCode.equals("T50020")){
			return this.updatePwd(transData);
		}
		return transData;	
	}
	
	/**
	 * 修改密码
	 * @param transData
	 * @return
	 */
	private TransData updatePwd(TransData transData) {
		String userid = (String) transData.getUserSession().getUserId();
		UserEntity user = (UserEntity) userDao.get(UserEntity.class,userid);
		String password = (String) transData.getViewMap().get("password");
		String password_new = (String) transData.getViewMap().get("password_new");
		if(!user.getPassword().equalsIgnoreCase(MD5Util.encryption(password))){
			transData.setExpMsg("原密码不正确，请重新输入！");
		}else{
			user.setPassword(MD5Util.encryption(password_new));
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * 置离线状态
	 * @param transData
	 * @return
	 */
	private TransData setOffline(TransData transData) {
		String userid = (String) transData.getViewMap().get("userid");
		UserEntity user = (UserEntity) userDao.get(UserEntity.class,userid);
		user.setStatus("0");
		userDao.update(user);
		return transData;
	}
	
	/**
	 * 密码重置
	 * @param transData
	 * @return
	 */
	private TransData resetPwd(TransData transData) {
		String userid = (String) transData.getViewMap().get("userid");
		UserEntity user = (UserEntity) userDao.get(UserEntity.class,userid);
		user.setPassword(MD5Util.encryption("000000"));
		userDao.update(user);
		return transData;
	}

	/**
	 * 更新用户
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData updateUserEntity(TransData transData) throws BusinessException{
		//页面数据
		Map<String,Object> checked_map = (Map<String, Object>) transData.getObj();
		String userid = (String) transData.getViewMap().get("userid");
		String loginid = (String) transData.getViewMap().get("loginid");
		String name = (String) transData.getViewMap().get("name");
		String organizationid = (String) transData.getViewMap().get("organizationid");
		String[] cms_roleid = (String[]) checked_map.get("cms_roleid");//担保公司角色id(暂时保留，运营中仅维护超级管理员(id:2))
		//获取并更新UserEntity对象
		UserEntity user = (UserEntity) userDao.get(UserEntity.class,userid);
		user.setUserid(userid);
		user.setLoginid(loginid);
		user.setName(name);
		user.setOrganizationid(organizationid);
		user.setType("0");
		//维护用户角色关联关系（通删通插）
		userDao.deleteUserRoleEntity(userid);//删除关联关系
		UserRoleEntity  user_role;//拼装用户角色关联关系对象，重新关联关系
		//拼装运营中心角色id
		if(cms_roleid != null && cms_roleid.length > 0){
			for(String roleid:cms_roleid){
				user_role = new UserRoleEntity();
				user_role.setUserid(user.getUserid());
				user_role.setRoleid(roleid);
				userDao.saveUser_Role(user_role);
			}
		}
		userDao.update(user);
		return transData;
	}

	/**
	 * 获取用户、角色、机构信息
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData getUser_Role_Org(TransData transData) throws BusinessException{
		Map<String,Object> map = new HashMap<String,Object>();
		String id = (String) transData.getViewMap().get("id");
		UserEntity user = (UserEntity) userDao.get(UserEntity.class,id);
		map.put("userEntity", user);
		List<UserRoleEntity> user_roleList = userDao.findUserRoleById(id);
		map.put("user_roleList", user_roleList);
		List<Label> cmsRoleList = userDao.getRoleList("2");//担保公司角色
		map.put("cmsRoleList", cmsRoleList);
		List<Label> guaranteeList = userDao.getOrganizationList();
		map.put("guaranteeList", guaranteeList);
		transData.setObj(map);
		return transData;
	}
	
	/**
	 * 删除用户
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData deleteUserEntity(TransData transData) throws BusinessException{
		String userid = (String) transData.getViewMap().get("userid");
		userDao.deleteUserEntity(userid);
		userDao.deleteUserRoleEntity(userid);
		transData.setObj(true);
		return transData;
	}
	
	/**
	 * 保存用户
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData saveUserEntity(TransData transData) throws BusinessException{
		Map<String,Object> checked_map = (Map<String, Object>) transData.getObj();
		String userid = String.valueOf(sysConfigUtil.getPrimaryId());
		String loginid = (String) transData.getViewMap().get("loginid");
		String name = (String) transData.getViewMap().get("name");
		String password = (String) transData.getViewMap().get("password");
		String organizationid = (String) transData.getViewMap().get("organizationid");
		String[] cms_roleid = (String[]) checked_map.get("cms_roleid");//担保公司角色id(暂时保留，运营中仅维护超级管理员(id:2))
	
		//验证登录名是否重复
		List<UserEntity> userList = userDao.findUserByLoginName(loginid);
		if(userList.size() > 0){
			//throw new BusinessException("登录名重复");
			transData.setExpMsg("登录名重复");
		}else{
			//拼装用户对象
			UserEntity user = new UserEntity();
			user.setUserid(userid);
			user.setLoginid(loginid);
			user.setName(name);
			user.setPassword(MD5Util.encryption(password));
			user.setOrganizationid(organizationid);
			user.setStatus("0");//默认为离线状态
			user.setType("0");
			
			//拼装用户角色关联关系对象
			UserRoleEntity  user_role;
			//拼装运营中心角色id
			for(String roleid:cms_roleid){
				user_role = new UserRoleEntity();
				user_role.setUserid(user.getUserid());
				user_role.setRoleid(roleid);
				userDao.saveUser_Role(user_role);
			}
			userDao.saveUserEntity(user);
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * 获取机构信息、担保公司信息
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData getOrganization_GuaranteeOrg(TransData transData) throws BusinessException{
		Map<String,List<Label>> map = new HashMap<String,List<Label>>();
		List<Label> guaranteeList = userDao.getOrganizationList();
		List<Label> cmsRoleList = userDao.getRoleList("2");
		map.put("guaranteeList", guaranteeList);
		map.put("cmsRoleList", cmsRoleList);
		transData.setObj(map);
		return transData;
	}
	
	/**
	 * 用户列表
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData findAll(TransData transData) throws BusinessException{
		List<Map<String,Object>> orgList = userDao.queryCmsUserList(transData.getViewMap(),transData.getPageInfo());
		transData.setObj(orgList);
		return transData;
	}
	
	/**
	 * 根据角色id查询所有用户信息
	 * @param roleId
	 * @return
	 */
	public List<Label> getUserListByRoleId(String roleId) {
		return userDao.getUserListByRoleId(roleId);
	}
	
}
