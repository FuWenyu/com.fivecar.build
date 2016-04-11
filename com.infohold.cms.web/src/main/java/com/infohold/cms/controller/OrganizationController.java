package com.infohold.cms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.infohold.cms.basic.common.Label;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.OrganizationEntity;
import com.infohold.cms.service.OrganizationService;


/**
 * 机构Controller
 * @author zhanghongchao
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class OrganizationController extends CentreController{
	
	@Autowired
	private OrganizationService organizationService;
	
	/**
	 * 机构-机构列表
	 * 
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping("/mvc/organization_getList.do")
	public ModelAndView organization_getList(HttpServletRequest httpServletRequest,Page page) {
		TransData transData = new TransData();
		transData.setServiceName("organizationService");
		transData.setTradeCode("T50021");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<OrganizationEntity> organizationList = (List<OrganizationEntity>) transData.getObj();
		String organizationTree=organizationService.findByTree();
		mav.addObject("organizationTree", organizationTree);
		mav.addObject("organizationList",organizationList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null)
			mav.setViewName("/authority/organization/organization_getListInfo");
		else
			mav.setViewName("/authority/organization/organization_getList");
		return mav;
	}
	
	/**
	 * 机构-新增页面
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping("/mvc/organization_add.do")
	public ModelAndView organization_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("organizationService");
		transData.setTradeCode("T50022");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map=(Map<String,Object>)transData.getObj();
		mav.addObject("orgid",(String)map.get("orgid"));
		mav.addObject("orgtypeList",(List<Label>)map.get("orgtypeList"));
		mav.addObject("pOrgtypeList",(List<Map<String,Object>>)map.get("pOrgtypeList"));
		mav.setViewName("/authority/organization/organization_add");
		return mav;
	}
	
	/**
	 * 机构-新增保存 
	 * 
	 * @param organizationEntity
	 * @return JSON
	 */
	@RequestMapping("/mvc/organization_addSave.do")
	@ResponseBody
	public Map<String,Object> organization_addSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("organizationService");
		transData.setTradeCode("T50023");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	
	
	/**
	 * 机构-编辑/查看页面
	 * 
	 * @param id
	 * @return ModelAndView
	 */
	@RequestMapping("/mvc/organization_view.do")
	public ModelAndView organization_view(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("organizationService");
		transData.setTradeCode("T50024");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = (Map<String,Object>) transData.getObj();
		mav.addObject("orgtypeList",(List<Label>)map.get("orgtypeList"));
		mav.addObject("organizationEntity",(Map<String,Object>)map.get("organizationEntity"));
		//mav.addObject("page",transData.getPageInfo());
		String view=transData.getViewMap().get("view")+"";
		if("view".equals(view)){
			mav.setViewName("/authority/organization/organization_view");
		}else{
			mav.setViewName("/authority/organization/organization_edit");
		}
		return mav;
	}
	
	/**
	 * 机构-编辑保存
	 * 
	 * @param organizationEntity
	 * @return JSON
	 */
	@RequestMapping("/mvc/organization_editSave.do")
	public ModelAndView organization_editSave(OrganizationEntity organizationEntity,Page page) {
		ModelAndView mav = new ModelAndView();
//		organizationService.update(organizationEntity);
//		mav = organization_getList(page);
		return mav;
	}
	
	/**
	 * 机构-删除
	 * 
	 * @param organizationEntity
	 * @return JSON
	 */
	@RequestMapping("/mvc/organization_delete.do")
	@ResponseBody
    public Map<String,Object> organization_delete(HttpServletRequest httpServletRequest){
		TransData transData = new TransData();
		transData.setServiceName("organizationService");
		transData.setTradeCode("T50024");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 机构-批量删除
	 * 
	 * @param organizationEntity
	 * @return JSON
	 */
	@RequestMapping("/mvc/organization_deleteMore.do")
	@ResponseBody
	public void organization_deleteMore(String[] ids) {
		List<OrganizationEntity> organizationList = new ArrayList<OrganizationEntity>();
		for (String id : ids) {
			OrganizationEntity organizationEntity = new OrganizationEntity();
			organizationEntity.setId(id);
			organizationList.add(organizationEntity);
		}
		//organizationService.remove(organizationList);
	}
}
