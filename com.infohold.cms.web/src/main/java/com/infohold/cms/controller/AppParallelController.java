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
public class AppParallelController extends CentreController{

	/**
	 * APP-品牌列表查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */

	@RequestMapping("/app/parallelbrand.do")
	@ResponseBody
	public Map<String, Object> ParallelBrand(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("pabrandService");
		transData.setTradeCode("T31007");
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
	 * APP-车辆价格区间列表查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	
	@RequestMapping("/app/parallelprice.do")
	@ResponseBody
	public Map<String, Object> ParallelPrice(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("pabrandService");
		transData.setTradeCode("T31008");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			List<Map<String, Object>> pricelist = (List<Map<String, Object>>)transData.getObj();
			map.put("pricelist", pricelist);
			map.put("page",transData.getPageInfo());
			return map;
		}
		System.out.println(map);
		return map;
	}
	/**
	 * APP-车辆版本列表查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	
	@RequestMapping("/app/parallelversion.do")
	@ResponseBody
	public Map<String, Object> ParallelVersion(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("pabrandService");
		transData.setTradeCode("T31009");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			List<Map<String, Object>> versionlist = (List<Map<String, Object>>)transData.getObj();
			map.put("versionlist", versionlist);
			map.put("page",transData.getPageInfo());
			return map;
		}
		System.out.println(map);
		return map;
	}
	/**
	 * APP-根据品牌查询平行进口车辆列表
	 * 
	 * @param httpServletRequest
	 * @return map
	 */

	@RequestMapping("/app/pavehiclebrand.do")
	@ResponseBody
	public Map<String, Object> ParallelVehicleBrand(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32007");
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
	 * APP-根据价格区间查询平行进口车辆列表
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	
	@RequestMapping("/app/pavehicleprice.do")
	@ResponseBody
	public Map<String, Object> ParallelVehiclePrice(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32012");
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
	 *  APP-根据车辆版本查询平行进口车辆列表
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	
	@RequestMapping("/app/pavehicleversion.do")
	@ResponseBody
	public Map<String, Object> ParallelVehicleVersion(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32013");
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
	 *  APP-默认车辆版本查询平行进口车辆列表
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	
	@RequestMapping("/app/pavehicle.do")
	@ResponseBody
	public Map<String, Object> ParallelVehicle(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32014");
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
	 * APP-经销商信息列表查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	
	@RequestMapping("/app/pacardealer.do")
	@ResponseBody
	public Map<String, Object> CarDealer(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("padealerService");
		transData.setTradeCode("T33007");
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
	 * APP-经销商信息列表查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	
	@RequestMapping("/app/padealervehicle.do")
	@ResponseBody
	public Map<String, Object> ParaDealerVehicle(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32015");
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
	
}
