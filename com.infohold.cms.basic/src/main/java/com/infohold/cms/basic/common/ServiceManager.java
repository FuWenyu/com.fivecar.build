package com.infohold.cms.basic.common;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ApplicationObjectSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.infohold.cms.basic.constant.SysErrorCodeDef;
import com.infohold.cms.basic.constant.TradeCodeDef;
import com.infohold.cms.basic.entity.BizExceptionEntity;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBizExptionService;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.service.impl.BizFlowService;

/**
 * 
 * 描述：负责后台逻辑处理类的调用
 * @author yangyantao
 */
@Service(value = "serviceManager")
public class ServiceManager extends ApplicationObjectSupport{

	/**
	 * 日志对象
	 */
	private Logger logger = Logger.getLogger(ServiceManager.class);
	
	@Autowired
	private TransactionTemplate transactionTemplate;
	
	@Autowired
	private IBizExptionService bizExptionService;
	
	@Autowired
	private BizFlowService bizFlowService;
	
	/**
	 * 调用service
	 * @param transData
	 * @param service
	 * @return
	 */
	public TransData invoke(TransData transData,IBusinessService service) {
		String tradeCode=transData.getTradeCode();
		if(null ==tradeCode || "".equals(tradeCode.trim()) ){
			throw new BusinessException("E001");
		}
		String tradeName=TradeCodeDef.valueOf(tradeCode).cnname();
		if(null ==tradeName || "".equals(tradeName.trim()) ){
			throw new BusinessException("E001");
		}
		try {
			//transData = this.invokeService(transData,service);
			//交易受事物控制
			if(transData.isTransaction()){
				transData = this.invokeService(transData,service);
			}else{
				transData =service.execute(transData);
			}
		} catch (Exception e) {
			logger.info("交易失败,"+tradeCode+":"+tradeName);
			if (e instanceof BusinessException){
				String expCode=((BusinessException) e).getExpCode();
				String expMsg=((BusinessException) e).getExpMsg();
				if("".equals(expCode) || null == expCode){
					expCode="E999";
				}
				transData.setExpCode(expCode);
				transData.setExpMsg(SysErrorCodeDef.valueOf(transData.getExpCode()).cnname()+","+expMsg);
				logger.info("校验异常,expCode:"+transData.getExpCode()+",expMsg:"+transData.getExpMsg(),e);
				this.saveSysExcep(transData,getExpTrace(e));
			}else {
				transData.setExpCode("999999");
				transData.setExpMsg("系统内部异常");
				logger.info("系统内部异常,expCode:"+transData.getExpCode()+",expMsg:"+transData.getExpMsg(),e);
				this.saveSysExcep(transData,getExpTrace(e));
			}
		}finally{
			this.saveExtData(transData);
		}
		return transData;
	}
	
	/**
	 * 调用service
	 * @param transData
	 * @param service
	 * @return
	 */
	public TransData invoke(TransData transData) {
		String tradeCode=transData.getTradeCode();
		if(null ==tradeCode || "".equals(tradeCode.trim()) ){
			throw new BusinessException("E001");
		}
		String tradeName=TradeCodeDef.valueOf(tradeCode).cnname();
		if(null ==tradeName || "".equals(tradeName.trim()) ){
			throw new BusinessException("E001");
		}
		logger.info("交易开始，"+tradeCode+":"+tradeName);
		try {
			IBusinessService service=(IBusinessService) super.getApplicationContext().getBean(transData.getServiceName());
			//transData = this.invokeService(transData,service);
			//交易受事物控制
			if(transData.isTransaction()){
				transData = this.invokeService(transData,service);
			}else{
				transData =service.execute(transData);
			}
		} catch (Exception e) {
			logger.info("交易失败,"+tradeCode+":"+tradeName);
			if (e instanceof BusinessException){
				String expCode=((BusinessException) e).getExpCode();
				String expMsg=((BusinessException) e).getExpMsg();
				if("".equals(expCode) || null == expCode){
					expCode="E999";
				}
				transData.setExpCode(expCode);
				transData.setExpMsg(SysErrorCodeDef.valueOf(transData.getExpCode()).cnname()+","+expMsg);
				logger.info("校验异常,expCode:"+transData.getExpCode()+",expMsg:"+transData.getExpMsg(),e);
				this.saveSysExcep(transData,getExpTrace(e));
			}else {
				transData.setExpCode("999999");
				transData.setExpMsg("系统内部异常");
				logger.info("系统内部异常,expCode:"+transData.getExpCode()+",expMsg:"+transData.getExpMsg(),e);
				this.saveSysExcep(transData,getExpTrace(e));
			}
		}finally{
			this.saveExtData(transData);
		}
		logger.info("交易结束，"+tradeCode+":"+tradeName);
		return transData;
	}
	
	/**
	 * 调用service，受事物控制
	 * @param transData
	 * @param service
	 * @return
	 */
	private TransData invokeService(final TransData transData,
			final IBusinessService service) {
		this.transactionTemplate.execute(new TransactionCallback<Boolean>() {
			boolean flag;
			@Override
			public Boolean doInTransaction(TransactionStatus status)throws BusinessException {
				try {
					service.execute(transData);
					flag = Boolean.TRUE;
				} catch (BusinessException e) {
					status.setRollbackOnly();
					flag = Boolean.FALSE;
					throw e;
				} catch (Exception e) {
					status.setRollbackOnly();
					flag = Boolean.FALSE;
					throw new BusinessException("E999", e);
				}
				return flag;
			}
		});
		return transData;
	}
	
	/**
	 * 转换堆栈信息
	 * @param e
	 * @return
	 */
	private String getExpTrace(Throwable e){
		StringWriter sw = new StringWriter();
		PrintWriter pw=new PrintWriter(sw);
		e.printStackTrace(pw);
		String str=sw.toString();
		if(str.length()>10240){
			return str.substring(0,10200);
		}else{
			return str.substring(0,str.length()-1);
		}
	}
	
	/**
	 * 保存扩展的信息
	 * @param transData
	 * @return
	 */
	private void saveExtData(TransData transData){
		BizExceptionEntity bizExceptionEntity=transData.getBizExceptionEntity();
		if(null != bizExceptionEntity){
			//保存异常信息,主动抓捕的异常在这里保存
			bizExptionService.saveErrorMsg(bizExceptionEntity);
		}
		try{
			//保存接口调用记录
			bizFlowService.saveSendMsg(transData);
		}catch(Exception e) {
			transData.setExpCode("999999");
			transData.setExpMsg("系统内部异常");
			logger.info("系统内部异常,expCode:"+transData.getExpCode()+",expMsg:"+transData.getExpMsg(),e);
		}
	}
	
	/**
	 * 保存系统抛出的异常
	 * @param transData
	 * @param errMsg
	 * @return
	 */
	private void saveSysExcep(TransData transData,String errMsg){
	//	bizExptionService.saveErrorMsg(transData, errMsg);
	}
	
}
