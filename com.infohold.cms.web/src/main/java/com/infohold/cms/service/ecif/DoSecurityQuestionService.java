package com.infohold.cms.service.ecif;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.DateFormatUtil;
import com.infohold.cms.bean.ecif.DoSecurityQuestionrBean;
import com.infohold.cms.service.BaseService;
import com.infohold.cms.util.ConstantUtil;

import ecif.DoRegisterCustomerWebService.RegCustResponseDTO;
import ecif.DoSecurityQuestionWebService.DoSecurityQuestionRequestDTO;
import ecif.DoSecurityQuestionWebService.DoSecurityQuestionResponseDTO;
import ecif.DoSecurityQuestionWebService.DoSecurityQuestionWebService;
import ecif.DoSecurityQuestionWebService.SessionContext;
import ecif.DoSecurityQuestionWebService.TransactionStatus;

@Service(value = "doSecurityQuestionService")
public class DoSecurityQuestionService extends BaseService implements
		IBusinessService {

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		// TODO Auto-generated method stub
		if ("ECIF1003".equals(transData.getTradeCode())) {
			return DoSecurityQuestion(transData);
		}
		return transData;
	}

	private TransData DoSecurityQuestion(TransData transData) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		DoSecurityQuestionrBean requestData = (DoSecurityQuestionrBean) transData
				.getObj();

		// 安全问题认证接口
		String TradeCode = "ECIF1003";
		DoSecurityQuestionWebService service = (DoSecurityQuestionWebService) getClient(TradeCode);
		DoSecurityQuestionRequestDTO requestDTO = new DoSecurityQuestionRequestDTO();
		// 设置公共报文信息
		// String TermSeq = channel + sysConfigUtil.getTermSeq();

		// String TermSeq = transData.getReference_no();

		// String AccDate = sysConfigUtil.getAccDate().replaceAll("-", "");
		SessionContext sessionContext = new SessionContext();
		sessionContext.setExtCode("TFSP");
		sessionContext.setTransactionNo("TFSP2015081000000001");
		sessionContext.setTransactionTime(DateFormatUtil.getCurrentDateTime());
		requestDTO.setSessionContext(sessionContext);

		// 设置具体请求业务信息
		requestDTO.setAnswer1(requestData.getAnswer1());
		requestDTO.setAnswer2(requestData.getAnswer2());
		requestDTO.setAnswer3(requestData.getAnswer3());
		requestDTO.setLoginId(requestData.getLoginId());
		requestDTO.setSessionContext(sessionContext);

		// 与ECIF通信
		DoSecurityQuestionResponseDTO responseDTO = service.doSecurityQuestion(requestDTO);

		TransactionStatus transactionStatus = responseDTO
				.getTransactionStatus();
		transData.setExpCode(String.valueOf(transactionStatus
				.getReplyCode()));
		transData.setExpMsg(transactionStatus.getReplyText());
		if (ConstantUtil.WEBSERVICE_RETURN_SUCCESS.equals(transactionStatus
				.getReplyCode())) {
			returnMap.put("responseDTO", responseDTO);
			transData.setExpCode("1");
			transData.setExpMsg("成功");
			transData.setObj(responseDTO);
		} else {
			transData.setExpCode("0");
			transData.setExpMsg(transactionStatus.getReplyText());
		}
		return transData;
	}
}
