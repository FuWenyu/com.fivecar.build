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
import com.infohold.cms.entity.CarModelEntity;;

/**
 * 车辆信息管理模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class CarModelController extends CentreController{

	/**
	 * 车型列表
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/model.do")
	public ModelAndView modelIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		TransData transData = new TransData();
		transData.setServiceName("modelService");
		transData.setTradeCode("T26001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> modelList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("modelList", modelList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/sssscarmodel/model_getListInfo");
		}else{
			mav.setViewName("/sssscarmodel/model_getList");
		}
		return mav;
	}

	/**
	 * 4s店车型-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/model_add.do")
	public ModelAndView picture_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("modelService");
		transData.setTradeCode("T26002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> vehicleList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("vehicleList", vehicleList);
		mav.setViewName("/sssscarmodel/model_add");
		return mav;
	}

	/**
	 * 4s店车型-新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/model_save.do")
	@ResponseBody
	public Map<String,Object> pictureadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("modelService");
		transData.setTradeCode("T26003");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	
	/**
	 * 4s店车型-删除
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/model_delete.do")
	@ResponseBody
	public Map<String,Object> version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("modelService");
		transData.setTradeCode("T26004");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 4s店车型-修改界面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/model_edit.do")
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("modelService");
		transData.setTradeCode("T26005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		CarModelEntity model = (CarModelEntity) transData.getObj();
		mav.addObject("model",model);
		mav.addObject("page",transData.getPageInfo());
		mav.setViewName("/sssscarmodel/model_update");
		return mav;
	}
	
	/**
	 * 4s店车型-修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/model_editSave.do")
	@ResponseBody
	public Map<String,Object> picture_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("modelService");
		transData.setTradeCode("T26006");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
}
