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
import com.infohold.cms.bean.ecif.QueryPerCustInfoBean;

import ecif.QueryPerCustInfoWebService.QueryPerCustResponseDTO;
@Controller
public class QueryPerCustInfoController extends CentreController {
	/**
	 * 个人客户详细信息查询
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/app/ecif/query_perCustInfo.do")
	@ResponseBody
	public Map<String, Object> query_perCustInfo(HttpServletRequest request,
			String requestData) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		JSONObject jsonObject = JSONObject.fromObject(requestData);
		QueryPerCustInfoBean bean = (QueryPerCustInfoBean) jsonObject.toBean(
				jsonObject, QueryPerCustInfoBean.class);
		// CommonBean commondata = super.getRegUserSessionApp(request,
		// bean.getCommondata());
		TransData transData = new TransData();
		transData.setServiceName("queryPerCustInfoService");
		transData.setTransaction(false);
		transData.setTradeCode("ECIF1005");
		transData.setObj(bean);
		transData = super.doService(request, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		if("1".equals(transData.getExpCode())){
			QueryPerCustResponseDTO responseDTO = (QueryPerCustResponseDTO) transData.getObj();
			/*JSONObject returnObj = JSONObject.fromObject(responseDTO);
			returnObj.*/
			map.put("reCode", "1");
			map.put("reMsg", transData.getExpMsg());
			map.put("rows", responseDTO.getList());
		}else{
			map.put("reCode", "0");
			map.put("reMsg", transData.getExpMsg());
		}
		return map;
	}

	public static void main(String[] args) {
		/*QueryPerCustResponseDTO responseDTO = new QueryPerCustResponseDTO();
		responseDTO.getList();
		JSONObject returnObj = JSONObject.fromObject(responseDTO);
		returnObj.*/
	}
}
