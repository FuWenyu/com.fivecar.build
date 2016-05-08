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
import com.infohold.cms.dao.CarLoanDao;
import com.infohold.cms.entity.CarFullPaymentEntity;
import com.infohold.cms.entity.CarLoanEntity;
import com.infohold.cms.entity.CarLoanInfoEntity;
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
	@Autowired
	private CarFullPaymentDao FullPaymentdao;

	private DateUtil dateutil = new DateUtil();

	private Logger logger = Logger.getLogger(CarLoanService.class);
	
	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T28001")) {
			return this.findloanList(transData);
		} else if (tradCode.equals("T28002")) {
			return this.querylender(transData);
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
		}else if (tradCode.equals("T28009")) {
			return this.loanInfo(transData);
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
		Map<String,Object> map1 = new HashMap<String, Object>();
		List<Map<String, Object>> modellist = FullPaymentdao.queryModelName(modelid, transData.getPageInfo());
		map1.put("modelid", modelid);
		map1.put("modelName", modellist.get(0).get("modelName"));
		map1.put("loanList", orgList);
		transData.setObj(map1);
		return transData;
	}

	/**
	 * 贷款信息列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData querylender(TransData transData) throws BusinessException {
		UserSession session = transData.getUserSession();
		String orgid = session.getBranchNo();
		String model = (String) transData.getViewMap().get("model");
		String[] strarray = model.split("-");
		String modelid = strarray[0];
		Map<String,Object> map1 = new HashMap<String, Object>();
		List<Map<String, Object>> modellist = FullPaymentdao.queryModelName(modelid, transData.getPageInfo());
		map1.put("modelid", modelid);
		map1.put("modelName", modellist.get(0).get("modelName"));
		List<Map<String, Object>> orgList = loandao.querylenderList(transData
				.getPageInfo(),orgid);
		map1.put("lenderList", orgList);
		transData.setObj(map1);
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
		String modelid = (String) map.get("modelid");
			List<Map<String, Object>> loanlist = loandao.queryloanList1(modelid,transData.getPageInfo());
			if (loanlist == null) {
				transData.setExpCode("-1");
				transData.setExpMsg("fail");
			} else {
				transData.setObj(loanlist);
				transData.setExpCode("1");
				transData.setExpMsg("success");
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
	
	public TransData loanInfo(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		String user_name = (String) map.get("user_name");
		String telephone = (String) map.get("telephone");
		String model_id = (String) map.get("model_id");
		String model_name = (String) map.get("model_name");
		String downpayment = (String) map.get("downpayment");
		String periods = (String) map.get("periods");
		
		CarLoanInfoEntity carLoanInfoEntity = new CarLoanInfoEntity();
		carLoanInfoEntity.setDownpayment(downpayment);
		carLoanInfoEntity.setModel_id(model_id);
		carLoanInfoEntity.setModel_name(model_name);
		carLoanInfoEntity.setPeriods(periods);
		carLoanInfoEntity.setTelephone(telephone);
		carLoanInfoEntity.setUser_name(user_name);
		if (loandao.saveloanInfoEntity(carLoanInfoEntity)) {
			transData.setExpCode("1");
			transData.setExpMsg("保存成功");
		}else {
			transData.setExpCode("-1");
			transData.setExpMsg("出错啦！~");
		}
		return transData;
	}
}
