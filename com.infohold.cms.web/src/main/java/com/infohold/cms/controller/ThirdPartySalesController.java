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
import com.infohold.cms.entity.ThirdPartySalesEntity;

/**
 * 车辆信息管理模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class ThirdPartySalesController extends CentreController{

	/**
	 * 销售列表
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/tpsales.do")
	public ModelAndView tpsalesIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		TransData transData = new TransData();
		transData.setServiceName("tpsalesService");
		transData.setTradeCode("T37001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> tpsalesList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("tpsalesList", tpsalesList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/thirdpartysales/sales_getListInfo");
		}else{
			mav.setViewName("/thirdpartysales/sales_getList");
		}
		return mav;
	}

	/**
	 * 4s店品牌-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/tpsales_add.do")
	public ModelAndView picture_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("tpsalesService");
		transData.setTradeCode("T37002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> tpdealerList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("tpdealerList", tpdealerList);
		mav.setViewName("/thirdpartysales/sales_add");
		return mav;
	}

	/**
	 * 4s店品牌-新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/tpsales_save.do")
	@ResponseBody
	public Map<String,Object> pictureadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("tpsalesService");
		transData.setTradeCode("T37003");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	
	/**
	 * 4s店品牌-删除
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/tpsales_delete.do")
	@ResponseBody
	public Map<String,Object> version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("tpsalesService");
		transData.setTradeCode("T37004");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 4s店品牌-修改界面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/tpsales_edit.do")
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("tpsalesService");
		transData.setTradeCode("T37005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		ThirdPartySalesEntity tpsales = (ThirdPartySalesEntity) transData.getObj();
		mav.addObject("tpsales",tpsales);
		transData.setServiceName("tpsalesService");
		transData.setTradeCode("T37002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> dealerList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("dealerList", dealerList);
		mav.setViewName("/thirdpartysales/sales_update");
		return mav;
	}
	
	/**
	 * 4s店品牌-修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/tpsales_editSave.do")
	@ResponseBody
	public Map<String,Object> picture_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("tpsalesService");
		transData.setTradeCode("T37006");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
}
