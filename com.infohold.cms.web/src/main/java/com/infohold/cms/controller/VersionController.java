package com.infohold.cms.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.VersionEntity;
import com.infohold.cms.service.VersionService;

/**
 * 版本模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class VersionController extends CentreController{

	/**
	 * 跳转到主页面
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/version.do")
	public ModelAndView versionIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		TransData transData = new TransData();
		transData.setServiceName("versionService");
		transData.setTradeCode("T30001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> versionList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("versionList", versionList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/version/version_getListInfo");
		}else{
			mav.setViewName("/version/version_getList");
		}
		return mav;
	}
	/**
	 * 版本-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/version_add.do")
	public ModelAndView version_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/version/version_add");
		return mav;
	}

	/**
	 * 版本新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/version_addSave.do")
	@ResponseBody
	public Map<String,Object> versionadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("versionService");
		transData.setTradeCode("T30002");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	/**
	 * 版本-删除
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/version_delete.do")
	@ResponseBody
	public Map<String,Object> version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("versionService");
		transData.setTradeCode("T30003");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 版本修改界面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/version_edit.do")
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("versionService");
		transData.setTradeCode("T30005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		VersionEntity version = (VersionEntity) transData.getObj();
		mav.addObject("version",version);
		mav.addObject("page",transData.getPageInfo());
		mav.setViewName("/version/version_update");
		return mav;
	}
	
	/**
	 * 版本修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/version_editSave.do")
	@ResponseBody
	public Map<String,Object> version_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("versionService");
		transData.setTradeCode("T30004");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
/*	@RequestMapping("/app/PictureQuery.do")
	@ResponseBody
	public Map<String, Object> PictureQuery(HttpServletRequest httpServletRequest,
			HttpServletResponse response) throws Exception {

		JSONObject params = JSONObject.fromObject(httpServletRequest
				.getParameter("params"));
		String picture_type = (String) params.get("picture_type");
		String picture_num = (String) params.get("picture_num");
		Map<String, Object> mapr = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> listr = new ArrayList<Map<String,Object>>();
		List<Object[]> listarray = pictureService.Picture_query(picture_type,picture_num);
		
		mapr.put("reCode", "1");
		mapr.put("reText", "success");
		for(Object[] picture : listarray){
			Map<String, Object> mapList = new HashMap<String, Object>();
			String path = "http://"+sysConfigUtil.getCfgInfo("picture_ip")+":"+sysConfigUtil.getCfgInfo("picture_port")
					+"/com.infohold.cms.web/upload/goodsimg/"
					+picture[3]+"/"
					+picture[0];
			
			mapList.put("path",path);
			mapList.put("picture_url", (String)picture[1]);
			listr.add(mapList);
		}
		
		mapr.put("picList", listr);
		list.add(mapr);
		map.put("@type", "table");
		map.put("rows", list);
		System.out.println(map);
		return map;
	}*/
}
