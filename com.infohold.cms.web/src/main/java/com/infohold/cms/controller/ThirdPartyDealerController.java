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
import com.infohold.cms.entity.ThirdPartyDealerEntity;

/**
 * 4s店信息管理模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class ThirdPartyDealerController extends CentreController{

	/**
	 * 品牌列表
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/tpdealer.do")
	public ModelAndView tpdealerIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		TransData transData = new TransData();
		transData.setServiceName("tpdealerService");
		transData.setTradeCode("T36001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> tpdealerList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("tpdealerList", tpdealerList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/thirdpartydealer/dealer_getListInfo");
		}else{
			mav.setViewName("/thirdpartydealer/dealer_getList");
		}
		return mav;
	}

	/**
	 * 4s店信息-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/tpdealer_add.do")
	public ModelAndView picture_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("tpdealerService");
		transData.setTradeCode("T36008");
		transData=super.doService(httpServletRequest, transData);
		mav.addObject("resourcesList",transData.getObj());
		mav.setViewName("/thirdpartydealer/dealer_add");
		return mav;
	}

	/**
	 * 4s店信息-新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/tpdealer_save.do")
	@ResponseBody
	public Map<String,Object> pictureadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
//		String g =httpServletRequest.getParameter("thirdparty_type");
		transData.setServiceName("tpdealerService");
		transData.setTradeCode("T36003");
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
	@RequestMapping("/mvc/tpdealer_delete.do")
	@ResponseBody
	public Map<String,Object> version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("tpdealerService");
		transData.setTradeCode("T36004");
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
	@RequestMapping("/tpdealer_edit.do")
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("tpdealerService");
		transData.setTradeCode("T36005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		ThirdPartyDealerEntity tpdealer = (ThirdPartyDealerEntity) transData.getObj();
		mav.addObject("tpdealer",tpdealer);
		transData.setTradeCode("T36008");
		transData=super.doService(httpServletRequest, transData);
		mav.addObject("resourcesList",transData.getObj());
		mav.setViewName("/thirdpartydealer/dealer_update");
		return mav;
	}
	
	/**
	 * 4s店信息-修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/tpdealer_editSave.do")
	@ResponseBody
	public Map<String,Object> picture_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("tpdealerService");
		transData.setTradeCode("T36006");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
}
