package com.infohold.cms.basic.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.constant.TradeCodeDef;
import com.infohold.cms.basic.dao.impl.BizExceptionDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.basic.entity.BizExceptionEntity;
import com.infohold.cms.basic.service.IBizExptionService;
import com.infohold.cms.basic.util.DateFormatUtil;
import com.infohold.cms.basic.util.SysConfigUtil;

/**
 * 异常处理服务
 */
@Service(value = "bizExptionService")
public class BizExptionService implements IBizExptionService{

	@Autowired
	private SysConfigUtil sysConfigUtil;
	
	@Autowired
	private BizExceptionDao bizExceptionDao;
	
	/**
	 * 保存异常信息
	 * @param entity
	 */
	public void saveErrorMsg(BaseEntity entity) {
		bizExceptionDao.save(entity);
	}

	/**
	 * 保存异常信息
	 * @param transData
	 * @throws BusinessException
	 */
	public void saveErrorMsg(TransData transData,String errMsg) {
		Date curDate=DateFormatUtil.getDateByFormat(DateFormatUtil.getCurrentDateTime(), "yyyy-MM-dd HH:mm:ss");
		BizExceptionEntity entity = new BizExceptionEntity();
		entity.setExp_id(sysConfigUtil.getPrimaryId());
		entity.setCreate_date(curDate);
		entity.setCreate_time(curDate);
		entity.setExp_msg(errMsg);
		entity.setStatus("0");
		entity.setTrade_code(transData.getTradeCode());
		entity.setTrade_name(TradeCodeDef.valueOf(transData.getTradeCode()).cnname());
		bizExceptionDao.save(entity);
	}


}
