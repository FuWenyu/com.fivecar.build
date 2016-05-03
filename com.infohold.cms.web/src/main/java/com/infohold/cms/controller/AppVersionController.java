package com.infohold.cms.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.VersionEntity;
import com.infohold.cms.service.VersionService;

/**
 * 版本模块
 * 
 * @author Administrator
 *
 */
@Controller
public class AppVersionController extends CentreController {

	/**
	 * 版本管理-版本号查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */

	@Autowired
	VersionService versionService;

	@RequestMapping("/app/VersionQuery.do")
	@ResponseBody
	public Map<String, Object> VersionQuery(HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws Exception {

		TransData transData = new TransData();
		transData.setServiceName("versionService");
		transData.setTradeCode("T30007");
		transData = super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map1 = (Map<String, Object>) transData.getObj();
		if (!"".equals(transData.getExpCode())) {
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			map.put("version_no", map1.get("version_no"));
			map.put("version_flag", map1.get("version_flag"));
			map.put("version_desc", map1.get("version_desc"));
			map.put("version_url", map1.get("version_url"));

			return map;
		}
		System.out.println(map);
		return map;
	}
}