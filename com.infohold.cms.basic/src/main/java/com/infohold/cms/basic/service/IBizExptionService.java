package com.infohold.cms.basic.service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 异常处理服务
 *
 */
public interface IBizExptionService {
	
	/**
	 * 报错异常信息
	 * @param entity
	 */
	public void saveErrorMsg(BaseEntity entity) ;
	
	/**
	 * 报错异常信息
	 * @param transData
	 * @param errMsg
	 */
	public void saveErrorMsg(TransData transData,String errMsg) ;
}
