package com.infohold.cms.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class VercodeCheck {
	DateUtil du = new DateUtil();
	public Map<String, String> setvercode(String code){
		Map<String, String> codemap = new HashMap<String, String>();
		codemap.put("time", du.parseDate("HHmmss"));
		codemap.put("code", code);
		return codemap;
	}
	public String checkvercode(HttpServletRequest request,String code){
		String errmsg = "";
		Map<String, String> map = new HashMap<String, String>();
		if(request.getSession().getAttribute("vercode")==null){
			return "验证码失效，请重新获取!";
		}
		map = (HashMap)request.getSession().getAttribute("vercode");
		
		int starttime = Integer.parseInt(map.get("time"));
		int endtime = Integer.parseInt(du.parseDate("HHmmss"));
		if((endtime-starttime)>300){
			errmsg = "验证码失效，请重新获取!";//失效
		}else{
			if(map.get("code").equals(code)){
				errmsg = "0";//正确
			}else{
				errmsg = "验证码错误!";//错误
			}
		}
		return errmsg;
	}
}
