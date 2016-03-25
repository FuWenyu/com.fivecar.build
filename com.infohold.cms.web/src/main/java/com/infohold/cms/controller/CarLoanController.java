package com.infohold.cms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.CarLoanEntity;

/**
 * 4s店信息管理模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class CarLoanController extends CentreController{

	/**
	 * 品牌列表
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/loan.do")
	public ModelAndView loanIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		
		TransData transData = new TransData();
		transData.setServiceName("loanService");
		transData.setTradeCode("T28001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> loanList = (List<Map<String, Object>>)transData.getObj();
		String model =httpServletRequest.getParameter("model");
		String[] strarray = model.split("-");
		String modelid = strarray[0];
		String modelName = strarray[1];
		mav.addObject("modelid", modelid);
		mav.addObject("modelName", modelName);
		mav.addObject("loanList", loanList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/sssscarloan/loan_getListInfo");
		}else{
			mav.setViewName("/sssscarloan/loan_getList");
		}
		return mav;
	}

	/**
	 * 4s店信息-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/loan_add.do")
	public ModelAndView picture_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("loanService");
		transData.setTradeCode("T28002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> lenderList = (List<Map<String, Object>>)transData.getObj();
		String model =httpServletRequest.getParameter("model");
		String[] strarray = model.split("-");
		String modelid = strarray[0];
		String modelName = strarray[1];
		mav.addObject("modelid", modelid);
		mav.addObject("modelName", modelName);
		mav.addObject("lenderList", lenderList);
		mav.setViewName("/sssscarloan/loan_add");
		return mav;
	}

	/**
	 * 4s店信息-新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/loan_save.do")
	@ResponseBody
	public Map<String,Object> pictureadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("loanService");
		transData.setTradeCode("T28003");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	
	/**
	 * 4s店信息-删除
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/loan_delete.do")
	@ResponseBody
	public ModelAndView version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("loanService");
		transData.setTradeCode("T28004");
		transData=super.doService(httpServletRequest, transData);

		transData.setTradeCode("T28001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> loanList = (List<Map<String, Object>>)transData.getObj();
		String model =httpServletRequest.getParameter("model");
		String[] strarray = model.split("-");
		String modelid = strarray[0];
		String modelName = strarray[1];
		mav.addObject("modelid", modelid);
		mav.addObject("modelName", modelName);
		mav.addObject("loanList", loanList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/sssscarloan/loan_getListInfo");
		}else{
			mav.setViewName("/sssscarloan/loan_getList");
		}
		return mav;
	}
	
	/**
	 * 4s店信息-修改界面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/loan_edit.do")
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("loanService");
		transData.setTradeCode("T28005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		CarLoanEntity loan = (CarLoanEntity) transData.getObj();
		mav.addObject("loan",loan);
		transData.setTradeCode("T28002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> lenderList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("lenderList", lenderList);
		String model =httpServletRequest.getParameter("model");
		String[] strarray = model.split("-");
		String modelid = strarray[0];
		String modelName = strarray[1];
		mav.addObject("modelid", modelid);
		mav.addObject("modelName", modelName);
		mav.setViewName("/sssscarloan/loan_update");
		return mav;
	}
	
	/**
	 * 4s店信息-修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/loan_editSave.do")
	@ResponseBody
	public Map<String,Object> picture_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("loanService");
		transData.setTradeCode("T28006");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
}
