package com.infohold.cms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.CarFullPaymentEntity;
import com.infohold.cms.entity.ResourcesEntity;
import com.infohold.cms.entity.VersionEntity;
import com.infohold.cms.service.BaseService;
import com.infohold.cms.service.AppUserService;
import com.infohold.cms.service.VersionService;

/**
 * APP品牌查询画面
 * @author Administrator
 * 
 */
@Controller
public class AppCarBrandController extends CentreController{

	/**
	 * APP-品牌列表查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */

	@RequestMapping("/app/carbrand.do")
	@ResponseBody
	public Map<String, Object> CarBrand(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("brandService");
		transData.setTradeCode("T22007");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			List<Map<String, Object>> carbrandList = (List<Map<String, Object>>)transData.getObj();
			map.put("carbrandList", carbrandList);
			map.put("page",transData.getPageInfo());
			return map;
		}
		System.out.println(map);
		return map;
	}
	/**
	 * APP-品牌列表查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */

	@RequestMapping("/app/carvehicle.do")
	@ResponseBody
	public Map<String, Object> CarVehicle(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("vehicleService");
		transData.setTradeCode("T23007");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			List<Map<String, Object>> carvehicleList = (List<Map<String, Object>>)transData.getObj();
			map.put("carvehicleList", carvehicleList);
			map.put("page",transData.getPageInfo());
			return map;
		}
		System.out.println(map);
		return map;
	}
	
	/**
	 * APP-4s店信息列表查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	
	@RequestMapping("/app/cardealer.do")
	@ResponseBody
	public Map<String, Object> CarDealer(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("dealerService");
		transData.setTradeCode("T24007");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			List<Map<String, Object>> cardealerList = (List<Map<String, Object>>)transData.getObj();
			map.put("cardealerList", cardealerList);
			map.put("page",transData.getPageInfo());
			return map;
		}
		System.out.println(map);
		return map;
	}
	
	/**
	 * APP-全款购车查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	
	@RequestMapping("/app/carfullpay.do")
	@ResponseBody
	public Map<String, Object> Carfullpay(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("fullpayService");
		transData.setTradeCode("T27003");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			CarFullPaymentEntity fullpay = (CarFullPaymentEntity)transData.getObj();
			map.put("fullpay", fullpay);
			return map;
		}
		System.out.println(map);
		return map;
	}
	
	
	/**
	 * APP-贷款购车查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	
	@RequestMapping("/app/carloan.do")
	@ResponseBody
	public Map<String, Object> Carloan(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("loanService");
		transData.setTradeCode("T28007");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			List<Map<String, Object>> loanlist = (List<Map<String, Object>>)transData.getObj();
			map.put("loanlist", loanlist);
			return map;
		}
		System.out.println(map);
		return map;
	}
}
