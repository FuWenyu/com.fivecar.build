package com.infohold.cms.basic.service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;

/**
 * 描述:业务逻辑顶层接口
 * @author yangyantao
 */
public interface IBusinessService {
	
	/**
	 * 业务逻辑处理
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData execute(TransData transData) throws BusinessException;
}
