package com.infohold.cms.controller.ecif;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.bean.ecif.SetSecurityQuestionrBean;

import ecif.SetSecurityQuestionWebService.SetSecurityQuestionResponseDTO;
@Controller
public class SetSecurityQuestionController extends CentreController {
	/**
	 * 用户注册
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/app/ecif/set_securityQuestion.do")
	@ResponseBody
	public Map<String, Object> set_securityQuestion(HttpServletRequest request,
			String requestData) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		JSONObject jsonObject = JSONObject.fromObject(requestData);
		SetSecurityQuestionrBean bean = (SetSecurityQuestionrBean) jsonObject.toBean(
				jsonObject, SetSecurityQuestionrBean.class);
		// CommonBean commondata = super.getRegUserSessionApp(request,
		// bean.getCommondata());
		TransData transData = new TransData();
		transData.setServiceName("setSecurityQuestionService");
		transData.setTransaction(false);
		transData.setTradeCode("ECIF1002");
		transData.setObj(bean);
		transData = super.doService(request, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		if("1".equals(transData.getExpCode())){
			SetSecurityQuestionResponseDTO responseDTO = (SetSecurityQuestionResponseDTO) transData.getObj();
			map.put("reCode", "1");
			map.put("reMsg", transData.getExpMsg());
		}else{
			map.put("reCode", "0");
			map.put("reMsg", transData.getExpMsg());
		}
		return map;
	}

	public static void main(String[] args) {
	}
}
