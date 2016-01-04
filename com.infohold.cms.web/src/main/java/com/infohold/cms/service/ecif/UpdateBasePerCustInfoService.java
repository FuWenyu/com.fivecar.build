package com.infohold.cms.service.ecif;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.DateFormatUtil;
import com.infohold.cms.bean.ecif.UpdateBasePerCustInfoBean;
import com.infohold.cms.service.BaseService;
import com.infohold.cms.util.ConstantUtil;

import ecif.DoUpdatePerCustWebService.DoUpdatePerCustRequestDTO;
import ecif.DoUpdatePerCustWebService.DoUpdatePerCustResponseDTO;
import ecif.DoUpdatePerCustWebService.DoUpdatePerCustWebService;
import ecif.DoUpdatePerCustWebService.SessionContext;
import ecif.DoUpdatePerCustWebService.TransactionStatus;

@Service(value = "updateBasePerCustInfoService")
public class UpdateBasePerCustInfoService extends BaseService implements
		IBusinessService {

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		// TODO Auto-generated method stub
		if ("ECIF1007".equals(transData.getTradeCode())) {
			return doUpdateBasePerCustInfo(transData);
		}
		return transData;
	}

	private TransData doUpdateBasePerCustInfo(TransData transData) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		UpdateBasePerCustInfoBean requestData = (UpdateBasePerCustInfoBean) transData
				.getObj();

		// 安全问题认证接口
		String TradeCode = "ECIF1007";
		DoUpdatePerCustWebService service = (DoUpdatePerCustWebService) getClient(TradeCode);
		DoUpdatePerCustRequestDTO requestDTO = new DoUpdatePerCustRequestDTO();
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
		requestDTO.setCertDuedate(requestData.getCertDuedate());
		requestDTO.setCertNo(requestData.getCertNo());
		requestDTO.setCertPlace(requestData.getCertPlace());
		requestDTO.setCertPlaceName(requestData.getCertPlaceName());
		requestDTO.setCertType(requestData.getCertType());
		requestDTO.setConnAddress(requestData.getConnAddress());
		requestDTO.setConnPostcode(requestData.getConnPostcode());
		requestDTO.setCustBirthdate(requestData.getCustBirthdate());
		requestDTO.setCustFaxno(requestData.getCustFaxno());
		requestDTO.setCustHomePhone(requestData.getCustHomePhone());
		requestDTO.setCustId(requestData.getCustId());
		requestDTO.setCustName(requestData.getCustName());
		requestDTO.setCustNation(requestData.getCustNation());
		requestDTO.setCustOfficePhone(requestData.getCustOfficePhone());
		requestDTO.setCustQq(requestData.getCustQq());
		requestDTO.setCustRegisterAddress(requestData.getCustRegisterAddress());
		requestDTO.setCustSex(requestData.getCustSex());
		requestDTO.setCustTaobao(requestData.getCustTaobao());
		requestDTO.setCustWechat(requestData.getCustWechat());
		requestDTO.setEmerName(requestData.getEmerName());
		requestDTO.setEmerPhone(requestData.getEmerPhone());
		requestDTO.setLoginEmail(requestData.getLoginEmail());
		requestDTO.setLoginId(requestData.getLoginId());
		requestDTO.setLoginPhone(requestData.getLoginPhone());
		
		requestDTO.setCustLiveAddress(requestData.getCustLiveAddress());
		requestDTO.setCustCountry(requestData.getCustCountry());
		requestDTO.setCustProvince(requestData.getCustProvince());
		requestDTO.setCustCity(requestData.getCustCity());
		// 与ECIF通信
		DoUpdatePerCustResponseDTO responseDTO = service.doUpdatePerCustInfo(requestDTO);

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
