package com.infohold.cms.service.ecif;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.DateFormatUtil;
import com.infohold.cms.bean.ecif.QueryPerCustInfoBean;
import com.infohold.cms.service.BaseService;
import com.infohold.cms.util.ConstantUtil;

import ecif.QueryPerCustInfoWebService.QueryPerCustInfoWebService;
import ecif.QueryPerCustInfoWebService.QueryPerCustRequestDTO;
import ecif.QueryPerCustInfoWebService.QueryPerCustResponseDTO;
import ecif.QueryPerCustInfoWebService.SessionContext;
import ecif.QueryPerCustInfoWebService.TransactionStatus;

@Service(value = "queryPerCustInfoService")
public class QueryPerCustInfoService extends BaseService implements
		IBusinessService {

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		// TODO Auto-generated method stub
		if ("ECIF1005".equals(transData.getTradeCode())) {
			return queryPerCustInfo(transData);
		}
		return transData;
	}

	private TransData queryPerCustInfo(TransData transData) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		QueryPerCustInfoBean requestData = (QueryPerCustInfoBean) transData
				.getObj();

		// 安全问题认证接口
		String TradeCode = "ECIF1005";
		QueryPerCustInfoWebService service = (QueryPerCustInfoWebService) getClient(TradeCode);
		QueryPerCustRequestDTO requestDTO = new QueryPerCustRequestDTO();
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
		requestDTO.setCertNo(requestData.getCertNo());
		requestDTO.setCertType(requestData.getCertType());
		requestDTO.setCustId(requestData.getCustId());
		requestDTO.setCustName(requestData.getCustName());
		requestDTO.setLoginEmail(requestData.getLoginEmail());
		requestDTO.setLoginId(requestData.getLoginId());
		requestDTO.setLoginPhone(requestData.getLoginPhone());

		// 与ECIF通信
		QueryPerCustResponseDTO responseDTO = service.queryPerCustInfo(requestDTO);

		TransactionStatus transactionStatus = responseDTO
				.getTransactionStatus();
		transData.setExpCode(String.valueOf(transactionStatus
				.getReplyCode()));
		transData.setExpMsg(transactionStatus.getReplyText());
		if (ConstantUtil.WEBSERVICE_RETURN_SUCCESS.equals(transactionStatus
				.getReplyCode())) {
			returnMap.put("responseDTO", responseDTO);
			if(responseDTO.getList()==null||responseDTO.getList().isEmpty()){
				transData.setExpCode("0");
				transData.setExpMsg("客户不存在");	
			}else{
				transData.setExpCode("1");
				transData.setExpMsg("成功");
			}
			transData.setObj(responseDTO);
		} else {
			transData.setExpCode("0");
			transData.setExpMsg(transactionStatus.getReplyText());
		}
		return transData;
	}
}
