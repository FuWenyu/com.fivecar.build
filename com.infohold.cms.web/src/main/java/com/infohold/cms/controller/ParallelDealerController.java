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
import com.infohold.cms.entity.CarDealerEntity;
import com.infohold.cms.entity.ParallelDealerEntity;;

/**
 * 4s店信息管理模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class ParallelDealerController extends CentreController{

	/**
	 * 品牌列表
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/padealer.do")
	public ModelAndView dealerIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("padealerService");
		transData.setTradeCode("T33001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		Map<String,Object> map=(Map<String,Object>)transData.getObj();
		String orgid = (String)map.get("orgid");
		List<Map<String, Object>> dealerList = (List<Map<String, Object>>)map.get("dealerList");
		mav.addObject("orgid", orgid);
		mav.addObject("dealerList", dealerList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/parallelcardealer/dealer_getListInfo");
		}else{
			mav.setViewName("/parallelcardealer/dealer_getList");
		}
		return mav;
	}

	/**
	 * 4s店信息-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/padealer_add.do")
	public ModelAndView picture_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("padealerService");
		transData.setTradeCode("T33002");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map=(Map<String,Object>)transData.getObj();
		List<Map<String, Object>> brandList = (List<Map<String, Object>>)map.get("brandList");
		List<Map<String, Object>> orgList = (List<Map<String, Object>>)map.get("orgList");
		transData.setTradeCode("T33008");
		transData=super.doService(httpServletRequest, transData);
		mav.addObject("resourcesList",transData.getObj());
		mav.addObject("brandList", brandList);
		mav.addObject("orgList", orgList);
		mav.setViewName("/parallelcardealer/dealer_add");
		return mav;
	}

	/**
	 * 4s店信息-新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/padealer_save.do")
	@ResponseBody
	public Map<String,Object> pictureadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("padealerService");
		transData.setTradeCode("T33003");
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
	@RequestMapping("/mvc/padealer_delete.do")
	@ResponseBody
	public Map<String,Object> version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("padealerService");
		transData.setTradeCode("T33004");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 4s店信息-修改界面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/padealer_edit.do")
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("padealerService");
		transData.setTradeCode("T33005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		ParallelDealerEntity dealer = (ParallelDealerEntity) transData.getObj();
		mav.addObject("dealer",dealer);
		transData.setTradeCode("T33002");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map=(Map<String,Object>)transData.getObj();
		List<Map<String, Object>> brandList = (List<Map<String, Object>>)map.get("brandList");
		mav.addObject("brandList", brandList);
		transData.setTradeCode("T33008");
		transData=super.doService(httpServletRequest, transData);
		mav.addObject("resourcesList",transData.getObj());
		mav.setViewName("/parallelcardealer/dealer_update");
		return mav;
	}
	
	/**
	 * 4s店信息-修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/padealer_editSave.do")
	@ResponseBody
	public Map<String,Object> picture_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("padealerService");
		transData.setTradeCode("T33006");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
}
