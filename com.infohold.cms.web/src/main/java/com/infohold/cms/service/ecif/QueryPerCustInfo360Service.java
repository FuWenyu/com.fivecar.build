package com.infohold.cms.service.ecif;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.DateFormatUtil;
import com.infohold.cms.bean.ecif.UpdateCustomerPwdBean;
import com.infohold.cms.service.BaseService;
import com.infohold.cms.util.ConstantUtil;

import ecif.DoUpdateCustomerPwdWebService.DoUpdateCustomerPwdWebService;
import ecif.DoUpdateCustomerPwdWebService.SessionContext;
import ecif.DoUpdateCustomerPwdWebService.TransactionStatus;
import ecif.DoUpdateCustomerPwdWebService.UpdateCustomerPwdRequestDTO;
import ecif.DoUpdateCustomerPwdWebService.UpdateCustomerPwdResponseDTO;

@Service(value = "queryPerCustInfo360Service")
public class QueryPerCustInfo360Service extends BaseService implements
		IBusinessService {

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		// TODO Auto-generated method stub
		if ("ECIF1004".equals(transData.getTradeCode())) {
			return queryPerCustInfo360(transData);
		}
		return transData;
	}

	private TransData queryPerCustInfo360(TransData transData) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		UpdateCustomerPwdBean requestData = (UpdateCustomerPwdBean) transData
				.getObj();

		// 安全问题认证接口
		String TradeCode = "ECIF1004";
		DoUpdateCustomerPwdWebService service = (DoUpdateCustomerPwdWebService) getClient(TradeCode);
		UpdateCustomerPwdRequestDTO requestDTO = new UpdateCustomerPwdRequestDTO();
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
		requestDTO.setLoginId(requestData.getLoginId());
		requestDTO.setNewPwd(requestData.getNewPwd());
		requestDTO.setOldPwd(requestData.getOldPwd());
		requestDTO.setType(requestData.getType());

		// 与ECIF通信
		UpdateCustomerPwdResponseDTO responseDTO = service.doUpdateCustomerPwd(requestDTO);

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
