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
 * APP-广告图片查询
 * @author fwy
 *
 */
@Controller
public class PictureAppController extends CentreController{

	/**
	 * APP-广告图片查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */

	@RequestMapping("/app/Advertisement.do")
	@ResponseBody
	public Map<String, Object> Advertisement(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20011");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			List<Map<String, Object>> pictureList = (List<Map<String, Object>>)transData.getObj();
			map.put("pictureList", pictureList);
//			map.put("page",transData.getPageInfo());
			return map;
		}
		System.out.println(map);
		return map;
	}
	/**
	 * APP-广告图片查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	
	@RequestMapping(value="/app/Resources.do",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView Resources(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20007");
		transData=super.doService(httpServletRequest, transData);
		if(!"".equals(transData.getExpCode())){
			Map<String,Object> map=(Map<String,Object>)transData.getObj();
			mav.addObject("resources", map.get("resources"));
			mav.setViewName("/view");
			return mav;
		}
		return mav;
//		httpServletresponse.setContentType("type=text/html;charset=UTF-8");
//		httpServletresponse.getWriter().write(response); 
	}

	@RequestMapping("/app/Homentry.do")
	@ResponseBody
	public Map<String, Object> Homentry(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20008");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			List<Map<String, Object>> pictureList = (List<Map<String, Object>>)transData.getObj();
			map.put("pictureList", pictureList);
			map.put("page",transData.getPageInfo());
			return map;
		}
		System.out.println(map);
		return map;
	}
}
