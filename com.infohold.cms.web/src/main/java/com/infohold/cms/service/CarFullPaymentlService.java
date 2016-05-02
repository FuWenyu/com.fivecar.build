package com.infohold.cms.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.CarFullPaymentDao;
import com.infohold.cms.entity.CarFullPaymentEntity;
import com.infohold.cms.util.DateUtil;
import com.infohold.cms.util.MathUtils;

/**
 * 全款购车service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("fullpayService")
public class CarFullPaymentlService implements IBusinessService {

	@Autowired
	private CarFullPaymentDao FullPaymentdao;

	private DateUtil dateutil = new DateUtil();
	
	private Logger logger = Logger.getLogger(CarFullPaymentlService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T27001")) {
			return this.FullPaymentEdit(transData);
		} else if (tradCode.equals("T27002")) {
			return this.FullPaymentEditSave(transData);
		}else if (tradCode.equals("T27003")) {
			return this.FullPaymentQuery(transData);
		} 
		return transData;
	}



	/**
	 * 编辑查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData FullPaymentEdit(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		String model = map.get("model") + "";
		String[] strarray = model.split("-");
		String modelid = strarray[0];
		List<Map<String, Object>> modellist = FullPaymentdao.queryModelName(modelid, transData.getPageInfo());
		Map<String,Object> map1 = new HashMap<String, Object>();
		map1.put("modelName", modellist.get(0).get("modelName"));
		CarFullPaymentEntity entity = FullPaymentdao.getFullPaymentEntity(modelid);
		map1.put("fullpay", entity);
		transData.setObj(map1);
		return transData;
	}

	/**
	 * 编辑保存
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData FullPaymentEditSave(TransData transData)
			throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String modelid = (String) map.get("modelid");
		String modelName = (String) map.get("modelName");
		
		Object  tax1 = map.get("tax");
		BigDecimal tax = MathUtils.getBigDecimal(tax1);
		
		Object  CompulsoryInsurance1 = map.get("CompulsoryInsurance");
		BigDecimal CompulsoryInsurance = MathUtils.getBigDecimal(CompulsoryInsurance1);
		
		Object  LicensePlate1 = map.get("LicensePlate");
		BigDecimal LicensePlate = MathUtils.getBigDecimal(LicensePlate1);
		
		Object  CDW1 = map.get("CDW");
		BigDecimal CDW = MathUtils.getBigDecimal(CDW1);
		
		Object  ThirdParityLiability1 = map.get("ThirdParityLiability");
		BigDecimal ThirdParityLiability = MathUtils.getBigDecimal(ThirdParityLiability1);
		
		Object  OtherInsurance1 = map.get("OtherInsurance");
		BigDecimal OtherInsurance = MathUtils.getBigDecimal(OtherInsurance1);
		
		Object  price1 = map.get("price");
		BigDecimal price = MathUtils.getBigDecimal(price1);
		
		String createName = session.getUserName();
		Timestamp createDate = dateutil.getTimestamp();

//		CarFullPaymentEntity carFullPaymententity = new CarFullPaymentEntity();
		CarFullPaymentEntity carFullPaymententity = (CarFullPaymentEntity) FullPaymentdao.get(CarFullPaymentEntity.class, modelid);
		if (carFullPaymententity==null) {
			CarFullPaymentEntity carFullPaymententitynew = new CarFullPaymentEntity();
			carFullPaymententitynew.setModelid(modelid);
			carFullPaymententitynew.setModelName(modelName);
			carFullPaymententitynew.setPrice(price);
			carFullPaymententitynew.setTax(tax);
			carFullPaymententitynew.setCompulsoryInsurance(CompulsoryInsurance);
			carFullPaymententitynew.setLicensePlate(LicensePlate);
			carFullPaymententitynew.setCDW(CDW);
			carFullPaymententitynew.setThirdParityLiability(ThirdParityLiability);
			carFullPaymententitynew.setOtherInsurance(OtherInsurance);
			carFullPaymententitynew.setCreateName(createName);
			carFullPaymententitynew.setCreateDate(createDate);
			if (FullPaymentdao.saveFullPaymentEntity(carFullPaymententitynew)) {
				transData.setExpMsg("success");
			}
		}else {
//			carFullPaymententity.setModelid(modelid);
			carFullPaymententity.setModelName(modelName);
			carFullPaymententity.setPrice(price);
			carFullPaymententity.setTax(tax);
			carFullPaymententity.setCompulsoryInsurance(CompulsoryInsurance);
			carFullPaymententity.setLicensePlate(LicensePlate);
			carFullPaymententity.setCDW(CDW);
			carFullPaymententity.setThirdParityLiability(ThirdParityLiability);
			carFullPaymententity.setOtherInsurance(OtherInsurance);
			carFullPaymententity.setCreateName(createName);
			carFullPaymententity.setCreateDate(createDate);
			if (FullPaymentdao.FullPayment_update(carFullPaymententity)) {
				transData.setExpMsg("success");
			}
		}
		return transData;
	}

	/**
	 * http请求根据车型id查询全款购车信息
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData FullPaymentQuery(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("FullPaymentQuery-request:"+map);
		String modelid = (String) map.get("modelid");
		CarFullPaymentEntity FullPayment = FullPaymentdao.getFullPaymentEntity(
				modelid);
		if (FullPayment == null) {
			transData.setExpCode("-1");
			transData.setExpMsg("fail");
		} else {
			transData.setObj(FullPayment);
			transData.setExpCode("1");
			transData.setExpMsg("success");
		}
		return transData;
	}

}
