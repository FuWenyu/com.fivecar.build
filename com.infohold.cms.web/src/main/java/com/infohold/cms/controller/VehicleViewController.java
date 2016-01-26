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

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.entity.CarDealerEntity;
import com.infohold.cms.entity.CarVehicleEntity;
import com.infohold.cms.service.CarVehicleService;

/**
 * 版本模块
 * 
 * @author Administrator
 *
 */
@Controller
public class VehicleViewController extends CentreController {

	/**
	 * 版本管理-版本号查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@Autowired
	private CarVehicleService vehicleService;

	@Autowired
	private SysConfigUtil sysConfigUtil;

	@RequestMapping("/vehicleWebview.do")
	public ModelAndView organization_getList(HttpServletRequest httpServletRequest) {
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
	}

}
