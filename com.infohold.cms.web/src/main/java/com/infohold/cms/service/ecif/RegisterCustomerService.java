package com.infohold.cms.service.ecif;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.DateFormatUtil;
import com.infohold.cms.bean.ecif.RegisterCustomerBean;
import com.infohold.cms.service.BaseService;
import com.infohold.cms.util.ConstantUtil;

import ecif.DoRegisterCustomerWebService.DoRegisterCustomerWebService;
import ecif.DoRegisterCustomerWebService.RegCustRequestDTO;
import ecif.DoRegisterCustomerWebService.RegCustResponseDTO;
import ecif.DoRegisterCustomerWebService.SessionContext;
import ecif.DoRegisterCustomerWebService.TransactionStatus;

@Service(value = "registerCustomerService")
public class RegisterCustomerService extends BaseService implements
		IBusinessService {

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		// TODO Auto-generated method stub
		if ("ECIF1001".equals(transData.getTradeCode())) {
			return doRegisterCustomer(transData);
		}
		return transData;
	}

	private TransData doRegisterCustomer(TransData transData) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		RegisterCustomerBean requestData = (RegisterCustomerBean) transData
				.getObj();

		// 账户充值接口
		String TradeCode = "ECIF1001";
		DoRegisterCustomerWebService service = (DoRegisterCustomerWebService) getClient(TradeCode);
		RegCustRequestDTO requestDTO = new RegCustRequestDTO();
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
//		requestDTO.setCertNo(requestData.getCertNo());
//		requestDTO.setCertType(requestData.getCertType());
//		requestDTO.setCustName(requestData.getCustName());
//		requestDTO.setLoginEmail(requestData.getLoginEmail());
//		requestDTO.setLoginId(requestData.getLoginId());
		requestDTO.setLoginPhone(requestData.getLoginPhone());
		requestDTO.setLoginPwd(requestData.getLoginPwd());
		requestDTO.setCustType("2"); //手机端发起均为企业客户

		// 与ECIF通信
		RegCustResponseDTO responseDTO = service.registerCustomer(requestDTO);

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
