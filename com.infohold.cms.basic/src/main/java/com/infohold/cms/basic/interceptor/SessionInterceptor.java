package com.infohold.cms.basic.interceptor;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.infohold.cms.basic.common.UserRole;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.dao.impl.BizFlowDao;
import com.infohold.cms.basic.util.HttpUtil;
import com.infohold.cms.basic.util.SysConfigUtil;

/**
 * 应用拦截器
 * @author Administrator
 *
 */
public class SessionInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = Logger.getLogger(SessionInterceptor.class);
	
	@Autowired
	private SysConfigUtil sysConfigUtil;
	
	@Autowired
	private HttpUtil httpUtil;
	
	@Autowired
	private BizFlowDao bizFlowDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) {
		boolean rs=false;
		//子门户标志，所有从子门户菜单跳转过来的请求，都进行身份认证
		String sp_flag=request.getParameter("sp_flag");
		if("".equals(sp_flag) || null == sp_flag || "null".equals(sp_flag)){
			String sp_flag_=(String)request.getSession().getAttribute("sp_flag");
			if("".equals(sp_flag_) || null == sp_flag_ || "null".equals(sp_flag_)){
				rs= false;				
			}else{
				sp_flag=sp_flag_;
			}
		}
		if("100".equals(sp_flag)){
			String auth_flag=sysConfigUtil.getCfgInfo("auth_flag");
			if(!"1".equals(auth_flag)){
				return true;
			}
			String userid=request.getParameter("userid");
			String username=request.getParameter("username");
			//子门户请求时，传送统一认证系统生成的sessionId
			String sessionid=request.getParameter("sessionid");
			if("".equals(userid) || userid == null || userid.equals("null")){
				userid=(String)request.getSession().getAttribute("cms_userid");
			}
			if("".equals(username) || username == null || username.equals("null")){
				username=(String)request.getSession().getAttribute("cms_username");
			}
			if("".equals(sessionid) || sessionid == null || sessionid.equals("null")){
				sessionid=(String)request.getSession().getAttribute("cms_sessionid");
			}
			try{
				if("".equals(sessionid) || sessionid == null || sessionid.equals("null")){
					rs= false;
				}else{
					//进行登录状态验证
					String add_params = "method=ih.euc.staff.auth.validate&"
							+ "sessionid=" + sessionid;
					Map<String, Object> map = httpUtil.submit_Post(add_params);
					String reurn_code=map.get("return_code")+"";
					if("0".equals(reurn_code)){
						//状态验证成功
						rs= true;
					}else{
						rs= false;
					}
				}
				request.getSession().setAttribute("sp_flag", sp_flag);
				request.getSession().setAttribute("cms_userid", userid);
				request.getSession().setAttribute("cms_username", username);
				request.getSession().setAttribute("cms_sessionid", sessionid);
				if(request.getSession().getAttribute("userSession")==null){
					UserSession userSession = new UserSession();
					List<Map<String,Object>> list=bizFlowDao.queryUserInfo(userid);
					Map<String,Object> m_user=(Map<String,Object>)list.get(0);
					String sysDate = sysConfigUtil.getAccDate();
					userSession.setBranchNo(m_user.get("organizationid")+"");
					userSession.setBranchName(m_user.get("branch_name")+"");
					userSession.setUserId(m_user.get("userid")+"");
					userSession.setLoginId(m_user.get("loginid")+"");
					userSession.setUserName(m_user.get("name")+"");
					userSession.setAccDate(sysDate);
					//	loginDao.logIn(m_user.get("userid")+"");
					//查询用户角色信息
					List<Map<String,Object>> roleList=bizFlowDao.queryUserRoleInfo(userid);
					List<UserRole> userRoleList = new ArrayList<UserRole>() ;
					for(Map<String,Object> roleMap : roleList){
						UserRole userRole = new UserRole();
						userRole.setRole_code(roleMap.get("role_code")+"");
						userRole.setRole_id(roleMap.get("role_id")+"");
						userRole.setRole_name(roleMap.get("role_name")+"");
						userRoleList.add(userRole);
					}
					userSession.setUserRoleList(userRoleList);	
					request.getSession().setAttribute("userSession", userSession);
				}
			} catch (Exception e) {
				logger.info(e);
				e.printStackTrace();
			}
			if(!rs){
				//直转到统一认证系统登录页
				try {
					this.sendRedirect(request, response);
				} catch (IOException e) {
					logger.info(e);
					e.printStackTrace();
				}
			}
			return rs;
		}else{
			String[] noFilters = new String[] { "login.do" };
			String uri = request.getRequestURI();
			boolean beFilter = true;
			for (String str : noFilters) {
				if (uri.indexOf(str) != -1)
					beFilter = false;
			}
			if (beFilter && request.getSession().getAttribute("userSession") == null) {
				ServletOutputStream out;
				try {
					out = response.getOutputStream();
					out.println("<script>parent.window.location.href='"
							+ request.getContextPath()
							+ "/login.jsp'</script>");
				} catch (IOException e) {
					logger.info(e);
					e.printStackTrace();
				}
				return false;
			}
			return true;
		}
	}
	
	/**
	 * 跳转到统一认证系统登录页
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void sendRedirect(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String sub_portal_url=sysConfigUtil.getCfgInfo("sub_portal_url");
		ServletOutputStream out = response.getOutputStream();
		out.println("<script>parent.window.location.href='"
				+ request.getContextPath()
				+ "/subPortal.jsp?sub_portal_url="+sub_portal_url+"'</script>");
	}
}
