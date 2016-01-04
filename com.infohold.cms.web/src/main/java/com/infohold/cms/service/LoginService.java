package com.infohold.cms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.common.UserRole;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.DateFormatUtil;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.LoginDao;

/**
 * 
 * 描述:登录模块service
 * @author yangyantao
 */
@Service(value = "loginService")
public class LoginService implements IBusinessService{

	@Autowired
	private LoginDao loginDao;

	@Autowired
	private SysConfigUtil sysConfigUtil;
	
	/**
	 * 默认执行的方法
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode=transData.getTradeCode();
		if(tradCode.equals("T99999")){
			return this.userLogin(transData);
		}
		if(tradCode.equals("T99997")){
			return this.logOut(transData);
		}
		return transData;
	}
	
	
	/**
	 * 用户登录，并获取用户基本信息
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData userLogin(TransData transData) throws BusinessException{
		Map<String,Object> map= transData.getViewMap();
		List<Map<String,Object>> list=loginDao.queryUserInfo(map);
		if (list.isEmpty()) {//用户名或密码错误
			throw new BusinessException("E002");
		}
		Map<String,Object> m_user=(Map<String,Object>)list.get(0);
		if(!"admin".equals(m_user.get("loginid"))){
			if("1".equals(m_user.get("status"))){
				//throw new BusinessException("E017");
			}
			if("2".equals(m_user.get("status"))){
				throw new BusinessException("E018");
			}
		}
		UserSession userSession = new UserSession();
		String sysDate = sysConfigUtil.getAccDate();
		userSession.setBranchNo(m_user.get("organizationid")+"");
		userSession.setBranchName(m_user.get("branch_name")+"");
		userSession.setUserId(m_user.get("userid")+"");
		userSession.setLoginId(m_user.get("loginid")+"");
		userSession.setUserName(m_user.get("name")+"");
		userSession.setAccDate(sysDate);
		loginDao.logIn(m_user.get("userid")+"");
		//查询用户角色信息
		List<Map<String,Object>> roleList=loginDao.queryUserRoleInfo(map);
		List<UserRole> userRoleList = new ArrayList<UserRole>() ;
		for(Map<String,Object> roleMap : roleList){
			UserRole userRole = new UserRole();
			userRole.setRole_code(roleMap.get("role_code")+"");
			userRole.setRole_id(roleMap.get("role_id")+"");
			userRole.setRole_name(roleMap.get("role_name")+"");
			userRoleList.add(userRole);
		}
		userSession.setUserRoleList(userRoleList);	
		transData.setUserSession(userSession);
		return transData;
	}
	
	
	/**
	 * 用户签退
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData logOut(TransData transData) throws BusinessException{
		String userId=transData.getUserSession().getUserId();
		loginDao.logOut(userId);
		return transData;
	}
	
	/**
	 * 获取首页公告详细信息
	 * @param transData
	 * @return
	 */
	private TransData getNotice(TransData transData) {
		String id_ = (String) transData.getViewMap().get("id_");
		Map<String,Object> notice = loginDao.getNoticeById(id_);
		transData.setObj(notice);
		return transData;
	}

	/**
	 * 首页公告信息
	 * @param transData
	 * @return
	 */
	private TransData notice(TransData transData) {
		Page page = transData.getPageInfo();
		page.setPageSize(5);
		List<Map<String,Object>> noticeList = loginDao.getNoticeList(transData.getPageInfo());
		transData.setObj(noticeList);
		return transData;
	}

	/**
	 * 统计信息（已生效业务数、已放款业务总金额、已结清业务数、已结清业务总金额）
	 * @param transData
	 * @return
	 */
	public TransData statistics(TransData transData) {
		Map<String,Object> efficient_businessCount = loginDao.getEfficient_businessCount();//已生效业务数、已放款业务总金额
		Map<String,Object> settlement_businessCount = loginDao.getSettlement_businessCount();//已结清业务数、业务总金额
		Map<String,Object> map = new HashMap<String,Object>();
		map.putAll(efficient_businessCount);
		map.putAll(settlement_businessCount);
		transData.setObj(map);
		return transData;
	}

	/**
	 * 立项提醒列表
	 * @param transData
	 * @return
	 */
	public TransData remind_approve(TransData transData) throws BusinessException {
		List<Map<String,Object>> list=loginDao.remind_approve();
		transData.setObj(list);
		return transData;
	}

	/**
	 * 放款提醒列表
	 * @param transData
	 * @return
	 */
	public TransData remind_credit(TransData transData) throws BusinessException {
		List<Map<String,Object>> list=loginDao.remind_credit();
		transData.setObj(list);
		return transData;
	}

	/**
	 * 代偿提醒列表
	 * @param transData
	 * @return
	 */
	public TransData remind_quid(TransData transData) throws BusinessException {
		List<Map<String,Object>> list=loginDao.remind_quid();
		transData.setObj(list);
		return transData;
	}
}
