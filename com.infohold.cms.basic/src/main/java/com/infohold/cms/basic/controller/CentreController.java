package com.infohold.cms.basic.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.common.ServiceManager;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.constant.TradeCodeDef;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.DateFormatUtil;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ApplicationObjectSupport;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 描述:顶层抽象控制器
 * @author yangyantao
 */
@Controller
public abstract class CentreController extends ApplicationObjectSupport{

	/**
	 * 日志对象
	 */
	private Logger logger = Logger.getLogger(CentreController.class);
	
	@Autowired
	public ServiceManager serviceManager;
	
	/**
	 * 设置页面跳转
	 * @param transData
	 * @param mav
	 * @return
	 */
	public ModelAndView forwardView(TransData transData,ModelAndView mav){
		String expCode=transData.getExpCode();
		if(null != expCode && !"".equals(expCode)){
			mav.addObject("expCode", expCode);
			mav.addObject("expMsg", transData.getExpMsg());
		}else{
			String successView=mav.getViewName();
			mav.addObject("successView", successView);
		}
		mav.setViewName("/pages/commons/showResult");
		return mav;
	}
	
	/**
	 * 设置操作提示信息
	 * @param transData
	 * @param mav
	 * @return
	 */
	public Map<String,Object> setRsAltInfo(TransData transData){
		Map<String,Object> map = new HashMap<String,Object>();
		String expCode=transData.getExpCode();
		if(null != expCode && !"".equals(expCode)){
			map.put("reCode", "failed");
			map.put("expMsg",expCode+":"+ transData.getExpMsg());
		}else{
			map.put("reCode", "success");
		}
		return map;
	}
	
	/**
	 * 获取页面请求数据
	 * @return
	 */
	private Map<String,Object> getReqParameter(HttpServletRequest httpServletRequest,TransData transData) {
		Map<String,Object> map =transData.getViewMap();
		if(httpServletRequest == null){
			return map;
		}
		if(map == null){
			map = new HashMap<String,Object>();
		}
		Enumeration<String> pNames=httpServletRequest.getParameterNames();
		while(pNames.hasMoreElements()){  
			String name=(String)pNames.nextElement(); 
			String value=httpServletRequest.getParameter(name); 
			map.put(name, value);
		}
		return map;
	}
	
	/**
	 * 获取页面请求数据
	 * @return
	 */
	protected Map<String,Object> getReqParameter(HttpServletRequest httpServletRequest) {
		Map<String,Object> map = new HashMap<String,Object>();;
		if(httpServletRequest == null){
			return map;
		}
		Enumeration<String> pNames=httpServletRequest.getParameterNames();
		while(pNames.hasMoreElements()){  
			String name=(String)pNames.nextElement(); 
			String value=httpServletRequest.getParameter(name); 
			map.put(name, value);
		}
		return map;
	}
	
	/**
	 * 初始化分页信息
	 * @param transData
	 */
	private void initPageInfo(TransData transData){
		Page page = transData.getPageInfo();
		Map<String,Object> viewMap=transData.getViewMap();
		if(null == viewMap.get("pageNo") || "".equals(viewMap.get("pageNo")) || "0".equals(viewMap.get("pageNo"))){
			page.setPageNo(1);	
		}else{
			page.setPageNo(Integer.parseInt(viewMap.get("pageNo")+""));
		}
		if(null == viewMap.get("pageSize") || "".equals(viewMap.get("pageSize")) || "0".equals(viewMap.get("pageSize"))){
		}else{
			page.setPageSize(Integer.parseInt(viewMap.get("pageSize")+""));
		}
/*		if(null == viewMap.get("pageNo_") || "".equals(viewMap.get("pageNo_")) || "0".equals(viewMap.get("pageNo_"))){
			if(null == viewMap.get("pageNo") || "".equals(viewMap.get("pageNo")) || "0".equals(viewMap.get("pageNo"))){
				page.setPageNo(1);	
			}
		}else{
			page.setPageNo(Integer.parseInt(viewMap.get("pageNo_")+""));
		}*/	
	}
	
	/**
	 * 设置分页总页数
	 * @param page
	 * @return
	 */
	public Page setTotalPages(Page page){
		if(null != page){
			int n=(int)page.getTotalCount() / page.getPageSize();
			float f=page.getTotalCount() % page.getPageSize();
			if(f > 0){
				page.setTotalPages((n+1));
			}else{
				page.setTotalPages((n));
			}
		}
		return page;
	}
	
	/**
	 * 调用services
	 * @param httpServletRequest
	 * @param transData
	 * @return
	 */
	public TransData doService(HttpServletRequest httpServletRequest,TransData transData) {
		Map<String,Object> viewPar=this.getReqParameter(httpServletRequest,transData);
		transData.setViewMap(viewPar);
		if(httpServletRequest !=null){
			UserSession userSession=(UserSession) httpServletRequest.getSession().getAttribute("userSession");
			transData.setUserSession(userSession);
		}
		String tradCode=transData.getTradeCode();
		if(null == tradCode ||"".equals(tradCode)){
			transData.setTradeCode((String)viewPar.get("tradeCode"));
		}
		Page page = transData.getPageInfo();
		if(null != page){
			this.initPageInfo(transData);
		}
		String branchNo="";
		String userId="";
	/*	if("T80001".equals(transData.getTradeCode())){
			branchNo=viewPar.get("branch_no")+"";
			userId=viewPar.get("user_id")+"";
		}else{
			branchNo=transData.getUserSession().getBranchNo();
			userId=transData.getUserSession().getUserId();
		}*/
		String tradeName=TradeCodeDef.valueOf(transData.getTradeCode()).cnname();
		StringBuffer buf= new StringBuffer();
		buf.append("trade start:"+DateFormatUtil.getCurrDate()+";");
		buf.append("trade code:"+transData.getTradeCode()+";");
		buf.append("trade name:"+tradeName+";");
		buf.append("trade branch:"+branchNo+";");
		buf.append("teller:"+userId+";");
		logger.info(buf.toString());
		IBusinessService service=(IBusinessService) super.getApplicationContext().getBean(transData.getServiceName());
		transData=serviceManager.invoke(transData,service);
		buf= new StringBuffer();
		buf.append("trade end  :"+DateFormatUtil.getCurrDate()+";");
		buf.append("trade code:"+transData.getTradeCode()+";");
		buf.append("trade name:"+tradeName+";");
		buf.append("trade branch:"+branchNo+";");
		buf.append("teller:"+userId+";");
		logger.info(buf.toString());
		//设置分页结果
		this.setTotalPages(page);
		return transData;
	}
	
}
