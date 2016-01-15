package com.infohold.cms.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.OrganizationEntity;
import com.infohold.cms.entity.VersionEntity;
import com.infohold.cms.service.BaseService;
import com.infohold.cms.service.VersionService;
import com.infohold.cms.util.Send;
import com.infohold.cms.util.VercodeUtil;

/**
 * 版本模块
 * @author Administrator
 *
 */
@Controller
public class VehicleViewController extends CentreController{

	/**
	 * 版本管理-版本号查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */

	@RequestMapping("/vehicleWebview.do")
	public ModelAndView organization_getList(HttpServletRequest httpServletRequest,Page page) {
		TransData transData = new TransData();
		transData.setServiceName("vehicleService");
		transData.setTradeCode("T23005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> vehicle = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("vehicle", vehicle);
		mav.addObject("page",transData.getPageInfo());
/*		if(qry_type!=null){
			mav.setViewName("/sssscarbrand/carbrand_getListInfo");
		}else{
			mav.setViewName("/sssscarbrand/carbrand_getList");
		}
		return mav;*/
		mav.setViewName("/webview/vehicle");
		return mav;
	}
	
}
