package com.infohold.cms.basic.service;

import java.util.List;

/**
 * 序列号生成服务
 * @author Administrator
 *
 */
public interface ISequenceService {
	
	/**
	 * 生成系统主键
	 * @return
	 */
	public List<Integer> getPrimaryId();
	
	/**
	 * 生成系统流水号
	 * @return
	 */
	public List<String> getTermSeq() ;
	
}
