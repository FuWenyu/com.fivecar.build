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
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.VersionEntity;
import com.infohold.cms.service.VersionService;

/**
 * 版本模块
 * @author Administrator
 *
 */
@Controller
public class VersionHttpController extends CentreController{

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
	public Map<String, Object> VersionQuery(HttpServletRequest httpServletRequest,
			HttpServletResponse response) throws Exception {

		String version_no = (String) httpServletRequest.getParameter("version_no");
		String version_flag = (String) httpServletRequest.getParameter("version_flag");
		Map<String, String> mapr = new HashMap<String, String>();
		Map<String, Object> map = new HashMap<String, Object>();
		List list = new ArrayList();
		VersionEntity version = versionService.Version_query("Y",version_flag);
		if (version.getVersion_no().equals(version_no)) {
			mapr.put("reCode", "2");
			mapr.put("reText", "无新版本");
			mapr.put("version_no", "");
			mapr.put("version_flag", "");
			mapr.put("version_desc", "");
		}else {
			mapr.put("reCode", "1");
			mapr.put("reText", "发现新版本");
			mapr.put("version_no", version.getVersion_no());
			mapr.put("version_flag", version.getVersion_flag());
			mapr.put("version_desc", version.getVersion_desc());
		}
		list.add(mapr);
		map.put("@type", "table");
		map.put("rows", list);
		System.out.println(map);
		return map;
	}
	
}
