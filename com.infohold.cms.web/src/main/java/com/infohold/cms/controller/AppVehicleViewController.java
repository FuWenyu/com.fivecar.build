package com.infohold.cms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.entity.CarDealerEntity;
import com.infohold.cms.entity.CarVehicleEntity;
import com.infohold.cms.entity.ParallelDealerEntity;
import com.infohold.cms.entity.ParallelVehicleEntity;
import com.infohold.cms.service.CarVehicleService;
import com.infohold.cms.service.ParallelVehicleService;

/**
 * 版本模块
 * 
 * @author Administrator
 *
 */
@Controller
public class AppVehicleViewController extends CentreController {

	/**
	 * 版本管理-版本号查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@Autowired
	private CarVehicleService vehicleService;
	
	@Autowired
	private ParallelVehicleService pavehicleService;
	@Autowired
	private SysConfigUtil sysConfigUtil;

	@RequestMapping("/vehicleWebview.do")
	public ModelAndView ssssvehicleWebview(HttpServletRequest httpServletRequest) {
		String share = (String)httpServletRequest.getParameter("share");
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		Page page = new Page();
		transData.setServiceName("vehicleService");
		transData.setTradeCode("T23008");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map=(Map<String,Object>)transData.getObj();
		page = transData.getPageInfo();
		mav.addObject("page", page);
		mav.addObject("server",(String) map.get("server"));
		mav.addObject("url",(String) map.get("url"));
		mav.addObject("vehicle", (CarVehicleEntity)map.get("vehicle"));
		mav.addObject("dealer", (CarDealerEntity)map.get("dealer"));
		mav.addObject("saleslist", (List<Map<String, Object>>)map.get("saleslist"));
		mav.addObject("dealerlist", (List<Map<String, Object>>)map.get("dealerlist"));
		mav.addObject("modellist", (List<Map<String, Object>>)map.get("modellist"));
		try {
			if (share.equals("1")) {
				mav.setViewName("/webview/vehiclenewad");
			}else {
				mav.setViewName("/webview/vehiclenew");
			}
		} catch (Exception e) {
			mav.setViewName("/webview/vehiclenew");
		}
		return mav;
	}
/*
	@RequestMapping("/vehicleWebview1.do")
	public ModelAndView vehicleWebview(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		String vehicleid = httpServletRequest.getParameter("vehicleid");
		String delrid = httpServletRequest.getParameter("dealerid");
//		List<Map<String, Object>> saleslist = new ArrayList<>();
		Map<String, Object> dealer = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		CarVehicleEntity vehicle = new CarVehicleEntity();
		Page page = new Page();
		vehicle = vehicleService.VehicleQueryPage(vehicleid);
		List<Map<String, Object>> modellist=vehicleService.querymodelPage(vehicleid, page);
		List<Map<String, Object>> dealerlist = vehicleService.querydealerListPage(vehicle.getCarbrandid(), new Page());
		if (delrid == null || delrid.equals(" ")||delrid.equals("") ) {
			dealer = dealerlist.get(0);
			String dealerid = dealerlist.get(0).get("id").toString();
			transData = vehicleService.salesQueryPage(dealerid, page, transData);
			mav.addObject("dealer", dealer);
		} else {
			CarDealerEntity dealer1 = vehicleService.querydealerPage(delrid);
			transData = vehicleService.salesQueryPage(delrid, page, transData);
			mav.addObject("dealer", dealer1);
		}
		
		StringBuffer url = new StringBuffer(sysConfigUtil.getCfgInfo("system_webview"));
		url.append("dealerid=");
		page = transData.getPageInfo();
		mav.addObject("page", page);
		mav.addObject("url", url.toString());
		mav.addObject("vehicle", vehicle);
		mav.addObject("saleslist", transData.getObj());
		mav.addObject("dealerlist", dealerlist);
		mav.addObject("modellist", modellist);
		mav.setViewName("/webview/vehicle");
		return mav;
	}*/
	@RequestMapping("/pavehicleWebview.do")
	public ModelAndView parallelvehicleWebview(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		String share = (String)httpServletRequest.getParameter("share");
		Page page = new Page();
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32008");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map=(Map<String,Object>)transData.getObj();
		page = transData.getPageInfo();
		mav.addObject("page", page);
		mav.addObject("server",(String) map.get("server"));
		mav.addObject("url",(String) map.get("url"));
		mav.addObject("vehicle", (ParallelVehicleEntity)map.get("vehicle"));
		mav.addObject("dealer", (ParallelDealerEntity)map.get("dealer"));
		mav.addObject("saleslist", (List<Map<String, Object>>)map.get("saleslist"));
		try {
			if (share.equals("1")) {
				mav.setViewName("/webview/pavehiclenewad");
			}else {
				mav.setViewName("/webview/pavehiclenew");
			}
		} catch (Exception e) {
			mav.setViewName("/webview/pavehiclenew");
		}
		return mav;
	}
	/*@RequestMapping("/pavehicleWebview.do1")
	public ModelAndView parallelvehicleWebview1(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		String vehicleid = httpServletRequest.getParameter("vehicleid");
//		List<Map<String, Object>> saleslist = new ArrayList<>();
		ModelAndView mav = new ModelAndView();
		ParallelVehicleEntity pavehicle = new ParallelVehicleEntity();
		Page page = new Page();
		pavehicle = pavehicleService.VehicleQueryPage(vehicleid);
		List<Map<String, Object>> saleslist = pavehicleService.salesQueryPage(pavehicle.getDealerid(), page, transData);
		ParallelDealerEntity dealer = pavehicleService.querydealerPage(pavehicle.getDealerid());
		mav.addObject("vehicle", pavehicle);
		mav.addObject("dealer", dealer);
		mav.addObject("saleslist",saleslist);
		mav.setViewName("/webview/pavehiclenew");
		return mav;
	}*/
}
