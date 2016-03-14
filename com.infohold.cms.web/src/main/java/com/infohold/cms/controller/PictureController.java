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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.infohold.cms.basic.common.FileVO;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.AdEntity;
import com.infohold.cms.entity.VersionEntity;
import com.infohold.cms.service.VersionService;

/**
 * 首页模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class PictureController extends CentreController{

	/**
	 * 广告图片查询
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/picture.do")
	public ModelAndView pictureIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> pictureList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("pictureList", pictureList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/picture/picture_getListInfo");
		}else{
			mav.setViewName("/picture/picture_getList");
		}
		return mav;
	}

	/**
	 * 条目查询
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/entry.do")
	public ModelAndView entryIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		String usefo = httpServletRequest.getParameter("usefo");
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20009");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> pictureList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("pictureList", pictureList);
		mav.addObject("usfo", usefo);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/entry/picture_getListInfo");
		}else{
			mav.setViewName("/entry/picture_getList");
		}
		return mav;
	}
	/**
	 * 图片-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/picture_add.do")
	public ModelAndView picture_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20010");
		transData=super.doService(httpServletRequest, transData);
		mav.addObject("resourcesList",transData.getObj());
		mav.setViewName("/picture/picture_add");
		return mav;
	}
	
	/**
	 * 图片-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/entry_add.do")
	public ModelAndView entry_add(HttpServletRequest httpServletRequest) {
		String usfo = (String)httpServletRequest.getParameter("usefo");
		String usfo1 = (String)httpServletRequest.getParameter("usefo");
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20010");
		transData=super.doService(httpServletRequest, transData);
		mav.addObject("resourcesList",transData.getObj());
		switch (usfo) {
		case "12":
			usfo = usfo+"-行业资讯";
			break;
		case "22":
			usfo = usfo+"-优惠信息";
			break;
		case "32":
			usfo = usfo+"-汽车生活";
			break;
		default:
			break;
		}
		mav.addObject("usfo", usfo);
		mav.addObject("usfo1", usfo1);
		mav.setViewName("/entry/picture_add");
		return mav;
	}

	/**
	 * 图片新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/pictureAddSave.do")
	@ResponseBody
	public Map<String,Object> pictureadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20002");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	
	
	/**
	 * 图片上传
	 * 
	 * @param request
	 * @param myfile
	 * @return
	 */
	@RequestMapping("/mvc/pictureUpLoad.do")
	@ResponseBody
	public Map<String,Object> fileUpLoad(HttpServletRequest request, MultipartFile myfile) {
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20006");
		transData.setObj(myfile);
		transData=super.doService(request, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		String expCode=transData.getExpCode();
		if(null != expCode && !"".equals(expCode)){
			map.put("reCode", "failed");
			map.put("expMsg",expCode+":"+ transData.getExpMsg());
		}else{
//			FileVO fileVo = (FileVO) transData.getObj();
//			map.put("fileVo", fileVo);
			Map<String,Object> fileMap = transData.getViewMap();
			map.put("imageName", fileMap.get("imageName"));
			map.put("filePath", fileMap.get("filePath"));
			map.put("filePathreal", fileMap.get("filePathreal"));
			map.put("imageid", fileMap.get("imageid"));
			map.put("reCode", "success");
		}
		return map;

	}
	
	
	
	/**
	 * 图片-删除
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/picture_delete.do")
	@ResponseBody
	public Map<String,Object> version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20003");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 图片修改界面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/picture_edit.do")
	public ModelAndView picture_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		AdEntity picture = (AdEntity) transData.getObj();
		mav.addObject("picture",picture);
		mav.addObject("page",transData.getPageInfo());
		transData.setTradeCode("T20010");
		transData=super.doService(httpServletRequest, transData);
		mav.addObject("resourcesList",transData.getObj());
		mav.setViewName("/picture/picture_update");
		return mav;
	}

	/**
	 * entry修改界面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/entry_edit.do")
	public ModelAndView entry_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		AdEntity picture = (AdEntity) transData.getObj();
		mav.addObject("picture",picture);
		mav.addObject("page",transData.getPageInfo());
		transData.setTradeCode("T20010");
		transData=super.doService(httpServletRequest, transData);
		mav.addObject("resourcesList",transData.getObj());
		mav.setViewName("/entry/picture_update");
		return mav;
	}
	
	/**
	 * 图片修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/picture_editSave.do")
	@ResponseBody
	public Map<String,Object> picture_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("pictureService");
		transData.setTradeCode("T20004");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
}
