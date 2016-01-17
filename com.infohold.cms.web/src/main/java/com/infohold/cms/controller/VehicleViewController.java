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
import com.infohold.cms.entity.CarDealerEntity;
import com.infohold.cms.entity.CarSalesEntity;
import com.infohold.cms.entity.CarVehicleEntity;
import com.infohold.cms.entity.OrganizationEntity;
import com.infohold.cms.entity.VersionEntity;
import com.infohold.cms.service.BaseService;
import com.infohold.cms.service.VehicleService;
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
	@Autowired
	private VehicleService vehicleService;

	@RequestMapping("/vehicleWebview.do")
	public ModelAndView organization_getList(HttpServletRequest httpServletRequest) {
		String id = httpServletRequest.getParameter("id");
		
		ModelAndView mav = new ModelAndView();
		 CarVehicleEntity vehicle = new CarVehicleEntity();
		 
		 vehicle = vehicleService.VehicleQueryPage(id);
		 List<Map<String, Object>> dealerlist = vehicleService.querydealerListPage(vehicle.getCarbrandid(), new Page());
		String dealerid = dealerlist.get(0).get("id").toString();
		
		Map<String, Object> dealer =  dealerlist.get(0);
		 List<Map<String, Object>> saleslist = vehicleService.salesQueryPage(dealerid, new Page());
		 
		mav.addObject("vehicle", vehicle);
		mav.addObject("saleslist", saleslist);
		mav.addObject("dealer", dealer);
		mav.addObject("dealerlist", dealerlist);
		mav.setViewName("/webview/vehicle");
		return mav;
	}
	
}
