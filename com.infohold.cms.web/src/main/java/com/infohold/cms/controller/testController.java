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
public class testController extends CentreController{

	/**
	 * 跳转到主页面
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/test.do")
	public ModelAndView versionIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
//		TransData transData = new TransData();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/test");
		return mav;
	}
}
