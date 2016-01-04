package com.infohold.cms.basic.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.basic.entity.BizExceptionEntity;

/**
 * 
 * 描述: 数据传送对象
 * @author yangyantao
 */
public class TransData {
	
	/**
	 * 对应spring配置的bean id;
	 */
	private String serviceName;
	
	/**
	 * Service交易是否受事物控制，默认为"是";
	 */
	private boolean transaction=true;
	
	/**
	 * 用户session
	 */
	private UserSession userSession;
	
	/**
	 * 异常码
	 */
	private String expCode;
	
	/**
	 * 异常信息
	 */
	private String expMsg;
	
	/**
	 * 交易码
	 */
	private String tradeCode;
	
	/**
	 * OBJ对象
	 */
	private Object obj;
	
	/**
	 * 存储页面上传值数据
	 */
	private Map<String,Object> viewMap =new HashMap<String,Object>();
	
	/**
	 * 分页信息
	 */
	private Page pageInfo;
	
	/**
	 * 异常信息对象，如果业务逻辑处理层需要保存异常信息，则该对象不能为空
	 */
	private BizExceptionEntity bizExceptionEntity ;
	
	/**
	 * 接口通信数据回传数据
	 */
	private List<BaseEntity> bizSendEntityList = new ArrayList<BaseEntity>();

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public UserSession getUserSession() {
		return userSession;
	}

	public void setUserSession(UserSession userSession) {
		this.userSession = userSession;
	}

	public String getExpCode() {
		return expCode;
	}

	public void setExpCode(String expCode) {
		this.expCode = expCode;
	}

	public String getExpMsg() {
		return expMsg;
	}

	public void setExpMsg(String expMsg) {
		this.expMsg = expMsg;
	}

	public String getTradeCode() {
		return tradeCode;
	}

	public void setTradeCode(String tradeCode) {
		this.tradeCode = tradeCode;
	}


	public Map<String, Object> getViewMap() {
		return viewMap;
	}

	public void setViewMap(Map<String, Object> viewMap) {
		this.viewMap = viewMap;
	}

	public Page getPageInfo() {
		if(pageInfo == null){
			pageInfo=new Page();
		}
		return pageInfo;
	}

	public void setPageInfo(Page pageInfo) {
		this.pageInfo = pageInfo;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public BizExceptionEntity getBizExceptionEntity() {
		return bizExceptionEntity;
	}

	public void setBizExceptionEntity(BizExceptionEntity bizExceptionEntity) {
		this.bizExceptionEntity = bizExceptionEntity;
	}

	public boolean isTransaction() {
		return transaction;
	}

	public void setTransaction(boolean transaction) {
		this.transaction = transaction;
	}

	public List<BaseEntity> getBizSendEntityList() {
		return bizSendEntityList;
	}

	public void setBizSendEntityList(List<BaseEntity> bizSendEntityList) {
		this.bizSendEntityList = bizSendEntityList;
	}

}
