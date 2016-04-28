package com.infohold.cms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.ThirdPartyDealerEntity;

/**
 * APP品牌查询画面
 * @author Administrator
 * 
 */
@Controller
public class AppThirdPartyController extends CentreController{

	/**
	 * APP-品牌列表查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */

	@RequestMapping("/app/tpdealerlist.do")
	@ResponseBody
	public Map<String, Object> CarBrand(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("tpdealerService");
		transData.setTradeCode("T36007");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			List<Map<String, Object>> tpdealerList = (List<Map<String, Object>>)transData.getObj();
			map.put("tpdealerList", tpdealerList);
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

	@RequestMapping("/tpwebview.do")
	@ResponseBody
	public ModelAndView CarVehicle(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("tpdealerService");
		transData.setTradeCode("T36009");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map=(Map<String,Object>)transData.getObj();
		mav.addObject("server",(String) map.get("server"));
		mav.addObject("url",(String) map.get("url"));
		mav.addObject("dealer", (ThirdPartyDealerEntity)map.get("dealer"));
		mav.addObject("tpsaleslist", (List<Map<String, Object>>)map.get("tpsaleslist"));
		mav.addObject("resourcelist", (List<Map<String, Object>>)map.get("resourcelist"));
		mav.setViewName("/webview/shop");
		return mav;
	}
	
}
