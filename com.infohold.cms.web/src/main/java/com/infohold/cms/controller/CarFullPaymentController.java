package com.infohold.cms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.CarFullPaymentEntity;

/**
 * 车辆贷款信息管理模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class CarFullPaymentController extends CentreController{
	/**
	 * 4s店全款购车-修改界面
	 * @param httpServletRequest
	 * @return
	 */

	@RequestMapping("/mvc/fullpay_edit.do")
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		ModelAndView mav = new ModelAndView();
		String model =httpServletRequest.getParameter("model");
		String[] strarray = model.split("-");
		String modelid = strarray[0];
		String modelName = strarray[1];
		mav.addObject("modelid", modelid);
		mav.addObject("modelName", modelName);
		
		transData.setServiceName("fullpayService");
		transData.setTradeCode("T27001");
		transData=super.doService(httpServletRequest, transData);
		CarFullPaymentEntity fullpay = (CarFullPaymentEntity) transData.getObj();
		mav.addObject("FullPay",fullpay);
		mav.setViewName("/sssscarfullpay/fullpay_update");
		return mav;
	}
	
	/**
	 * 4s店全款购车-修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/fullpay_editSave.do")
	@ResponseBody
	public Map<String,Object> picture_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("fullpayService");
		transData.setTradeCode("T27002");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
}
