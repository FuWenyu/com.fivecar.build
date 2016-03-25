package com.infohold.cms.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
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
import com.infohold.cms.dao.CarLoanDao;
import com.infohold.cms.entity.CarLoanEntity;
import com.infohold.cms.util.DateUtil;
import com.infohold.cms.util.MathUtils;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("loanService")
public class CarLoanService implements IBusinessService {

	@Autowired
	private CarLoanDao loandao;

	private DateUtil dateutil = new DateUtil();

	private Logger logger = Logger.getLogger(CarLoanService.class);
	
	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T28001")) {
			return this.findloanList(transData);
		} else if (tradCode.equals("T28002")) {
			return this.querybrand(transData);
		} else if (tradCode.equals("T28003")) {
			return this.saveloan(transData);
		} else if (tradCode.equals("T28004")) {
			return this.deleteloan(transData);
		} else if (tradCode.equals("T28005")) {
			return this.loanEdit(transData);
		} else if (tradCode.equals("T28006")) {
			return this.updatePictureEntity(transData);
		} else if (tradCode.equals("T28007")) {
			return this.loanQuery(transData);
		} else if (tradCode.equals("T28008")) {
			return this.getResources(transData);
	}
		return transData;
	}

	/**
	 * 贷款信息列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData findloanList(TransData transData)
			throws BusinessException {
		String model = (String) transData.getViewMap().get("model");
		String[] strarray = model.split("-");
		String modelid = strarray[0];
		List<Map<String, Object>> orgList = loandao.queryloanList(modelid,transData.getPageInfo());
		transData.setObj(orgList);
		return transData;
	}

	/**
	 * 贷款信息列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData querybrand(TransData transData) throws BusinessException {
		List<Map<String, Object>> orgList = loandao.querylenderList(transData
				.getPageInfo());
		transData.setObj(orgList);
		return transData;
	}

	public TransData saveloan(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String modelid = (String) map.get("modelid");
		String modelName = (String) map.get("modelName");
		
		Object  CarPrice1 = map.get("carprice");
		BigDecimal CarPrice = MathUtils.getBigDecimal(CarPrice1);
		
		Object  downpayment1 = map.get("downpayment");
		BigDecimal downpayment = MathUtils.getBigDecimal(downpayment1);
		String downPaymentPercent = (String) map.get("downPaymentPercent");
		
		
		String lender1 = (String) map.get("lender");
		String[] strarray = lender1.split("-");
		String lenderId = strarray[0];
		String lender = strarray[1];
		String lenderLogo = strarray[2];
		
		String description = (String) map.get("description");
		Object  premium1 = map.get("premium");
		BigDecimal premium = MathUtils.getBigDecimal(premium1);
		Object  loan121 = map.get("loan12");
		BigDecimal loan12 = MathUtils.getBigDecimal(loan121);
		Object  loan241 = map.get("loan24");
		BigDecimal loan24 = MathUtils.getBigDecimal(loan241);
		Object  loan361 = map.get("loan36");
		BigDecimal loan36 = MathUtils.getBigDecimal(loan361);
		Object  loan481 = map.get("loan48");
		BigDecimal loan48 = MathUtils.getBigDecimal(loan481);
		String createName = session.getUserName();
		Timestamp createDate = dateutil.getTimestamp();

		CarLoanEntity CarloanEntity = new CarLoanEntity();
		CarloanEntity.setModelid(modelid);
		CarloanEntity.setModelName(modelName);
		CarloanEntity.setCarprice(CarPrice);
		CarloanEntity.setDownpayment(downpayment);
		CarloanEntity.setDownPaymentPercent(downPaymentPercent);
		CarloanEntity.setPremium(premium);
		CarloanEntity.setlenderId(lenderId);
		CarloanEntity.setlender(lender);
		CarloanEntity.setlenderLogo(lenderLogo);
		CarloanEntity.setLoan12(loan12);
		CarloanEntity.setLoan24(loan24);
		CarloanEntity.setLoan36(loan36);
		CarloanEntity.setLoan48(loan48);
		CarloanEntity.setCreateDate(createDate);
		CarloanEntity.setCreateName(createName);
		CarloanEntity.setDescription(description);
		if (loandao.saveloanEntity(CarloanEntity)) {
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * 车辆删除
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData deleteloan(TransData transData)
			throws BusinessException {
		String model = (String) transData.getViewMap().get("model");
		String[] strarray = model.split("-");
		String id = strarray[2];
		loandao.deleteloanEntity(id);
		transData.setObj(true);
		return transData;
	}

	/**
	 * 编辑查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData loanEdit(TransData transData) throws BusinessException {
		String model = (String) transData.getViewMap().get("model");
		String[] strarray = model.split("-");
		String id = strarray[2];
		CarLoanEntity entity = loandao.getloanEntity(id);
		transData.setObj(entity);
		return transData;
	}

	/**
	 * 编辑保存
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData updatePictureEntity(TransData transData)
			throws BusinessException {
		// 页面数据
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String id = (String) map.get("loan_id");
		String modelid = (String) map.get("modelid");
		String modelName = (String) map.get("modelName");
		Object  CarPrice1 = map.get("carprice");
		BigDecimal CarPrice = MathUtils.getBigDecimal(CarPrice1);
		Object  downpayment1 = map.get("downpayment");
		BigDecimal downpayment = MathUtils.getBigDecimal(downpayment1);
		String downPaymentPercent = (String) map.get("downPaymentPercent");
		String lender1 = (String) map.get("lender");
		String[] strarray = lender1.split("-");
		String lenderId = strarray[0];
		String lender = strarray[1];
		String lenderLogo = strarray[2];		
		Object  premium1 = map.get("premium");
		BigDecimal premium = MathUtils.getBigDecimal(premium1);
		String description = (String) map.get("description");
		Object  loan121 = map.get("loan12");
		BigDecimal loan12 = MathUtils.getBigDecimal(loan121);
		Object  loan241 = map.get("loan24");
		BigDecimal loan24 = MathUtils.getBigDecimal(loan241);
		Object  loan361 = map.get("loan36");
		BigDecimal loan36 = MathUtils.getBigDecimal(loan361);
		Object  loan481 = map.get("loan48");
		BigDecimal loan48 = MathUtils.getBigDecimal(loan481);
		String createName = session.getUserName();
		Timestamp createDate = dateutil.getTimestamp();

		CarLoanEntity CarloanEntity = new CarLoanEntity();
		CarloanEntity.setId(id);
		CarloanEntity.setModelid(modelid);
		CarloanEntity.setModelName(modelName);
		CarloanEntity.setCarprice(CarPrice);
		CarloanEntity.setDownpayment(downpayment);
		CarloanEntity.setDownPaymentPercent(downPaymentPercent);
		CarloanEntity.setPremium(premium);
		CarloanEntity.setlenderId(lenderId);
		CarloanEntity.setlender(lender);
		CarloanEntity.setlenderLogo(lenderLogo);
		CarloanEntity.setLoan12(loan12);
		CarloanEntity.setLoan24(loan24);
		CarloanEntity.setLoan36(loan36);
		CarloanEntity.setLoan48(loan48);
		CarloanEntity.setCreateDate(createDate);
		CarloanEntity.setCreateName(createName);
		CarloanEntity.setDescription(description);
		if (loandao.loan_update(CarloanEntity)) {
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * http请求查询贷款信息列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData loanQuery(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("loanQuery-request:"+map);
		String loan = (String) map.get("loan");
		if (loan.equals("loan")) {
			List<Map<String, Object>> loanlist = loandao.queryloanList1(transData.getPageInfo());
			if (loanlist == null) {
				transData.setExpCode("-1");
				transData.setExpMsg("fail");
			} else {
				transData.setObj(loanlist);
				transData.setExpCode("1");
				transData.setExpMsg("success");
			}
		}
		return transData;
	}
	/**
	 * 首页图片新增图文资源查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData getResources(TransData transData)
			throws BusinessException {
		List<Map<String, Object>> orgList = loandao.getResources();
		transData.setObj(orgList);
		transData.setExpMsg("success");
		return transData;
	}
}
