package com.infohold.cms.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.constant.SysErrorCodeDef;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.MenuEntity;
import com.infohold.cms.service.MenuService;

/**
 * 登录模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class LoginController extends CentreController{

	@Autowired
	private MenuService menuService;

	/**
	 * 登录
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/mvc/login.do")
	@ResponseBody
	public Map<String,Object> login(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		Map<String,Object> map = new  HashMap<String,Object>();
		//查询用户信息
		transData.setServiceName("loginService");
		transData=super.doService(httpServletRequest, transData);
		if("E002".equals(transData.getExpCode())){
			map.put("expMsg", SysErrorCodeDef.valueOf("E002").cnname());
			return map;
		}
		//用户已登录错误信息
		else if("E017".equals(transData.getExpCode())){
			map.put("expMsg", SysErrorCodeDef.valueOf("E017").cnname());
			return map;
		}
		//用户已停用信息
		else if("E018".equals(transData.getExpCode())){
			map.put("expMsg", SysErrorCodeDef.valueOf("E018").cnname());
			return map;
		}
		UserSession userSession= transData.getUserSession();
		httpServletRequest.getSession().setAttribute("userSession",userSession);
		return map;
	}
	
	/**
	 * 跳转到主页面
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/forwardIndex.do")
	public ModelAndView forwardIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView();
		UserSession userSession=(UserSession) httpServletRequest.getSession().getAttribute("userSession");
		List<MenuEntity> menuList = menuService.findByUserId(userSession.getLoginId());
		//将menuList转成JSON字符串
		ObjectMapper mapper = new ObjectMapper();
		mav.addObject("menuList", mapper.writeValueAsString(menuList));
		mav.setViewName("/common/index");
		return mav;
	}
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("/mvc/homePage.do")
	public ModelAndView homePage(HttpServletRequest request) {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		List<MenuEntity> menuList = menuService.findByUserId(userSession.getLoginId());
		ModelAndView mav = new ModelAndView();
		mav.addObject("shortCut", menuList);
		
		TransData transData = new TransData();
		transData.setServiceName("loginService");
		transData.setTradeCode("T50011");
		transData=super.doService(request, transData);
		Map<String,Object> statistics =(Map<String, Object>) transData.getObj();
		mav.addObject("statistics", statistics);
		/*Page page = new Page();
		page.setPageNo(1);
		page.setPageSize(5);
		Map<String,Object>	map = new HashMap<String,Object>();
		//公告列表(固定5条)
		List<PublishMessageEntity> messageList = publishMessageService.findMess(page);
		mav.addObject("Messagelist", messageList);
		//待领取列表(固定5条)
		UserEntity user = (UserEntity) request.getSession().getAttribute("user");
		Set<RoleEntity> roleList = user.getRoleSet();
		StringBuffer sb = new StringBuffer();
		for (RoleEntity r : roleList){
			if(sb.length() == 0){
				sb.append("'"+r.getRole_id()+"'");
			}else{
				sb.append(",'"+r.getRole_id()+"'");
			}
		}
		String roleId = sb.toString();
		List<Map<String,Object>> toDoList = actProcessDaoImpl.queryRoleTaskInfo(map,roleId, user.getArea_code(), page);
		int toDoListLength = 5-toDoList.size();
		if(toDoList.size() < 5){
			for(int i =0; i < toDoListLength ;i++){
				toDoList.add(map);
			}
		}
		mav.addObject("toDoList", toDoList);
		//带执行任务列表(固定5条)
		List<Map<String,Object>> staf_exe_taskList = actProcessDaoImpl.queryUserTaskInfo(map,user.getUser_id(), page);
		int staf_exe_taskListLength = 5-staf_exe_taskList.size();
		if(staf_exe_taskList.size() < 5){
			for(int i =0; i < staf_exe_taskListLength ;i++){
				staf_exe_taskList.add(map);
			}
		}
		mav.addObject("staf_exe_taskList", staf_exe_taskList);
		//首页饼状图
		  
		
		List<Map<String, Object>> overduelist = loanOverdueService.overdue(page);
		mav.addObject("overduelist", overduelist);
		
		Map<String,Object> statistics = loginService.statistics(user);
		mav.addObject("statistics", statistics);*/
		mav.setViewName("/homepage/homepage");
		return mav;
	}
	
	/**
	 * 公告
	 * @return
	 */
	@RequestMapping("/mvc/homePage_notice.do")
	public ModelAndView homePage_notice(HttpServletRequest httpServletRequest,Page page) {
		TransData transData = new TransData();
		transData.setServiceName("loginService");
		transData.setTradeCode("T50012");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		List<Map<String,Object>> list =(List<Map<String, Object>>) transData.getObj();
		mav.addObject("noticelist", list);
		mav.addObject("page",transData.getPageInfo());
		mav.setViewName("/homepage/notice");
		return mav;
	}
	
	@RequestMapping("/mvc/homePage_getNotice.do")
	@ResponseBody
	public Map<String,Object> homePage_getNotice(HttpServletRequest httpServletRequest){
		TransData transData = new TransData();
		transData.setServiceName("loginService");
		transData.setTradeCode("T50013");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = (Map<String, Object>) transData.getObj();
		return map;
	}
	
	/**
	 * 贷款催收提醒【逾期贷款】
	 * @return
	 */
	@RequestMapping("/mvc/remind_collection.do")
	public ModelAndView remind_collection(HttpServletRequest httpServletRequest,Page page) {
		TransData transData = new TransData();
		transData.setServiceName("loginService");
		transData.setTradeCode("T50007");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String,Object>> list =(List<Map<String, Object>>) transData.getObj();
		mav.addObject("list", list);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null)
			mav.setViewName("/homepage/remind_collectionInfo");
		else
			mav.setViewName("/homepage/remind_collection");
		return mav;
	}
	
	/**
	 * 代偿提醒【贷款逾期超90天】
	 * @return
	 */
	@RequestMapping("/mvc/remind_quid.do")
	public ModelAndView remind_quid(HttpServletRequest httpServletRequest,Page page) {
		TransData transData = new TransData();
		transData.setServiceName("loginService");
		transData.setTradeCode("T50009");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String,Object>> list =(List<Map<String, Object>>) transData.getObj();
		mav.addObject("list", list);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null)
			mav.setViewName("/homepage/remind_quidInfo");
		else
			mav.setViewName("/homepage/remind_quid");
		return mav;
	}
	
	/**
	 * 生日提醒【个人客户】
	 * @return
	 */
	@RequestMapping("/mvc/remind_birthday.do")
	public ModelAndView remind_birthday(HttpServletRequest httpServletRequest,Page page) {
		TransData transData = new TransData();
		transData.setServiceName("loginService");
		transData.setTradeCode("T50010");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String,Object>> list =(List<Map<String, Object>>) transData.getObj();
		mav.addObject("list", list);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null)
			mav.setViewName("/homepage/remind_birthdayInfo");
		else
			mav.setViewName("/homepage/remind_birthday");
		return mav;
	}
	
	/**
	 * 处理iframe高度
	 * 
	 * @return
	 */
	@RequestMapping("/mvc/handleIfame.do")
	public ModelAndView handleIfame() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/common/handleIfame");
		return mav;
	}
	

	/**
	 * 退出
	 * @param httpServletRequest
	 * @throws IOException 
	 */
	@RequestMapping("/mvc/logOut.do")
	@ResponseBody
	public Map<String,Object> logOut(HttpServletRequest httpServletRequest){
		TransData transData = new TransData();
		Map<String,Object> map = new  HashMap<String,Object>();
		transData.setServiceName("loginService");
		transData.setTradeCode("T99997");
		transData=super.doService(httpServletRequest, transData);
		if(!"".equals(transData.getExpCode())){
			map.put("expMsg", transData.getExpMsg());
			return map;
		}
		httpServletRequest.getSession().removeAttribute("userSession");
		return map;
	}
}
