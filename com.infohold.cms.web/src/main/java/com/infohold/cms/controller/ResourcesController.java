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
import com.infohold.cms.entity.ResourcesEntity;
import com.infohold.cms.entity.UserEntity;
import com.infohold.cms.entity.VersionEntity;
import com.infohold.cms.service.VersionService;

/**
 * 图文资源管理模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class ResourcesController extends CentreController{

	/**
	 * 跳转到主页面
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/resources.do")
	@ResponseBody
	public ModelAndView versionIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		TransData transData = new TransData();
		transData.setServiceName("resourcesService");
		transData.setTradeCode("T21001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> resourcesList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("resourcesList", resourcesList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/resources/resources_getListInfo");
		}else{
			mav.setViewName("/resources/resources_getList");
		}
		return mav;
	}
	/**
	 * 资源-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/resources_add.do")
	@ResponseBody
	public ModelAndView version_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/resources_add");
		return mav;
	}

	/**
	 * 资源新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/resources_addSave.do")
	@ResponseBody
	public Map<String,Object> versionadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("resourcesService");
		transData.setTradeCode("T21002");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	/**
	 * 资源-删除
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/resources_delete.do")
	@ResponseBody
	public Map<String,Object> version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("resourcesService");
		transData.setTradeCode("T21003");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 资源修改界面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/resources_edit.do")
	@ResponseBody
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("resourcesService");
		transData.setTradeCode("T21004");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		ResourcesEntity resource = (ResourcesEntity) transData.getObj();
		mav.addObject("resource",resource);
		mav.setViewName("/resources/resources_update");
		return mav;
	}
	
	/**
	 * 资源修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/resources_editSave.do")
	@ResponseBody
	public Map<String,Object> version_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("resourcesService");
		transData.setTradeCode("T21005");
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
