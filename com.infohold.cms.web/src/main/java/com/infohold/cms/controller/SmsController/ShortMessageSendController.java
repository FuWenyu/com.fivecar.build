package com.infohold.cms.controller.SmsController;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.infohold.api.InfoholdAPI;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.MenuEntity;
import com.infohold.cms.service.BaseService;
import com.infohold.cms.util.Send;
import com.infohold.cms.util.VercodeUtil;

@Controller
public class ShortMessageSendController extends CentreController {
	/**
	 * 手机短信验证码生成及发送
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	public static Logger logger = Logger.getLogger(BaseService.class);
	public static InfoholdAPI infoholdAPI = new InfoholdAPI("172.18.10.165",
			1235, 1500000, "CM");
	public Send send = new Send();

	@RequestMapping("/app/VCSends.do")
	@ResponseBody
	public Map<String, Object> sendShortMessage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		JSONObject params = JSONObject.fromObject(request
				.getParameter("params"));
		String phone_no = (String) params.get("phone_no");
		Map<String, String> mapr = new HashMap<String, String>();
		List list = new ArrayList();
		VercodeUtil vc = new VercodeUtil();
		@SuppressWarnings("rawtypes")
		String SMSCode = infoholdAPI.infoholdGenSMSCodeBytime(phone_no, 6, 2, 30);
		mapr.put("VCode", SMSCode);
		logger.info("VCode:"+SMSCode);
		String sname = "dlhbbmcs";
		String spwd = "hb123456";
		String scode = "1012818";

/*		String PostData = "sname="
				+ sname
				+ "&spwd="
				+ spwd
				+ "&scorpid=&sprdid="
				+ scode
				+ "&sdst="
				+ phone_no
				+ "&smsg="
				+ java.net.URLEncoder.encode("【智控金服】您的验证码是：" + SMSCode
						+ ",请妥善保管。", "utf-8");
		*/
		StringBuffer PostData = new StringBuffer();
		PostData.append("sname=");
		PostData.append(sname);
		PostData.append("&spwd=");
		PostData.append(spwd);
		PostData.append("&scorpid=&sprdid=");
		PostData.append(scode);
		PostData.append("&sdst=");
		PostData.append(phone_no);
		PostData.append("&smsg=");
		PostData.append(java.net.URLEncoder.encode("【智控金服】您的验证码是：" + SMSCode
				+ ",请妥善保管。", "utf-8"));
		
		logger.info(PostData);
		System.out.println(PostData);
		String postUrl = "http://cf.51welink.com/submitdata/Service.asmx/g_Submit";
		String ret = send.SMS(PostData.toString(), postUrl);
		logger.info("ret:"+ret);
		System.out.println("ret:"+ret);
		if (ret.isEmpty()) {
			mapr.put("reCode", "2");
			mapr.put("reText", "发送失败");
		}else {
			mapr.put("reCode", "1");
			mapr.put("reText", "发送成功");
		}
		
		list.add(mapr);
		map.put("@type", "table");
		map.put("rows", list);
		return map;
	}
	
	/**
	 * 手机短信验证码验证
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/VCCheck.do")
	@ResponseBody
	public Map<String, Object> checkVerfCode(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		JSONObject params = JSONObject.fromObject(request
				.getParameter("params"));
		String Vcode = (String) params.get("Vcode");
		String phone_no = (String) params.get("phone_no");
//		String phone_no = request.getParameter("phone_no").toString();
		Map<String, String> mapr = new HashMap<String, String>();
		List list = new ArrayList();
		
		boolean ret =  infoholdAPI.infoholdVerSMSCodeBytime(phone_no, Vcode, 6, 2, 30);
		if (ret) {
			mapr.put("reCode", "1");
			mapr.put("reText", "验证成功");
		}else {
			mapr.put("reCode", "2");
			mapr.put("reText", "验证失败");
		}

		list.add(mapr);
		map.put("@type", "table");
		map.put("rows", list);
		System.out.println(map);
		return map;
	}
}
