package com.infohold.cms.service.ecif;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.DateFormatUtil;
import com.infohold.cms.bean.ecif.SetSecurityQuestionrBean;
import com.infohold.cms.service.BaseService;
import com.infohold.cms.util.ConstantUtil;

import ecif.SetSecurityQuestionWebService.SessionContext;
import ecif.SetSecurityQuestionWebService.SetSecurityQuestionRequestDTO;
import ecif.SetSecurityQuestionWebService.SetSecurityQuestionResponseDTO;
import ecif.SetSecurityQuestionWebService.SetSecurityQuestionWebService;
import ecif.SetSecurityQuestionWebService.TransactionStatus;

@Service(value = "setSecurityQuestionService")
public class SetSecurityQuestionService extends BaseService implements
		IBusinessService {

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		// TODO Auto-generated method stub
		if ("ECIF1002".equals(transData.getTradeCode())) {
			return SetSecurityQuestion(transData);
		}
		return transData;
	}

	private TransData SetSecurityQuestion(TransData transData) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		SetSecurityQuestionrBean requestData = (SetSecurityQuestionrBean) transData
				.getObj();

		// 安全问题认证接口
		String TradeCode = "ECIF1002";
		SetSecurityQuestionWebService service = (SetSecurityQuestionWebService) getClient(TradeCode);
		SetSecurityQuestionRequestDTO requestDTO = new SetSecurityQuestionRequestDTO();
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
		requestDTO.setQuestion1(requestData.getQuestion1());
		requestDTO.setQuestion2(requestData.getQuestion2());
		requestDTO.setQuestion3(requestData.getQuestion3());
		requestDTO.setSessionContext(sessionContext);

		// 与ECIF通信
		SetSecurityQuestionResponseDTO responseDTO = service.setSecurityQuestion(requestDTO);

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
