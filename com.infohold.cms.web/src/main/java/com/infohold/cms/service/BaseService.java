package com.infohold.cms.service;

import org.apache.cxf.interceptor.LoggingInInterceptor;
import org.apache.cxf.interceptor.LoggingOutInterceptor;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.apache.log4j.Logger;

import com.infohold.cms.util.CustomPropertyUtil;

import ecif.DoRegisterCustomerWebService.DoRegisterCustomerWebService;
import ecif.DoSecurityQuestionWebService.DoSecurityQuestionWebService;
import ecif.DoUpdateCustomerPwdWebService.DoUpdateCustomerPwdWebService;
import ecif.DoUpdatePerCustWebService.DoUpdatePerCustWebService;
import ecif.QueryPerCustInfoWebService.QueryPerCustInfoWebService;
import ecif.SetSecurityQuestionWebService.SetSecurityQuestionWebService;

/**
 * 描述":顶层抽象类
 */
@SuppressWarnings("rawtypes")
public abstract class BaseService {

	// 开发环境
	// private static String url = "http://10.172.67.142:8080/ifap/xface/";
	// 测试环境
	private static String url = CustomPropertyUtil
			.getProperties("ecifService");

	/**
	 * 日志对象
	 */
	protected static Logger logger = Logger.getLogger(BaseService.class);

	/**
	 * 获取webservice接口对象
	 * 
	 * @param className
	 * @return
	 */
	protected Object getClient(String tradeCode) {
		JaxWsProxyFactoryBean webServiceFactory = new JaxWsProxyFactoryBean();
		webServiceFactory.setServiceClass(getTradeClass(tradeCode));
		webServiceFactory
				.setAddress(url + getTradeAddress(tradeCode) + "?wsdl");
		webServiceFactory.getInInterceptors().add(new LoggingInInterceptor());
		webServiceFactory.getOutInterceptors().add(new LoggingOutInterceptor());
		return webServiceFactory.create();
	}

	/**
	 * 返回webservice服务接口类
	 * 
	 * @return
	 */
	private static Class getTradeClass(String tradeCode) {
		if (tradeCode.equals("ECIF1001")) {
			return DoRegisterCustomerWebService.class;
		} else if (tradeCode.equals("ECIF1002")) {
			return SetSecurityQuestionWebService.class;
		} else if (tradeCode.equals("ECIF1003")) {
			return DoSecurityQuestionWebService.class;
		} else if (tradeCode.equals("ECIF1004")) {
			return DoUpdateCustomerPwdWebService.class;
		} else if (tradeCode.equals("ECIF1005")) {
			return QueryPerCustInfoWebService.class;
		} else if (tradeCode.equals("ECIF1007")) {
			return DoUpdatePerCustWebService.class;
		}else {
			logger.error("获取webservice服务接口类异常！交易码：" + tradeCode);
			return null;
		}
	}

	/**
	 * 返回webservice服务地址
	 * 
	 * @return
	 */
	private static String getTradeAddress(String tradeCode) {
		if (tradeCode.equals("ECIF1001")) {
			return "DoRegisterCustomerWebService";
		} else if (tradeCode.equals("ECIF1002")) {
			return "SetSecurityQuestionWebService";
		} else if (tradeCode.equals("ECIF1003")) {
			return "DoSecurityQuestionWebService";
		} else if (tradeCode.equals("ECIF1004")) {
			return "DoUpdateCustomerPwdWebService";
		} else if (tradeCode.equals("ECIF1005")) {
			return "QueryPerCustInfoWebService";
		} else if (tradeCode.equals("ECIF1007")) {
			return "DoUpdatePerCustWebService";
		}else {
			logger.error("获取webservice服务地址异常！交易码：" + tradeCode);
			return null;
		}
	}

	/**
	 * 返回webservice服务交易码
	 * 
	 * @return
	 */
	protected String getServiceCode(String tradeCode) {
		if (tradeCode.equals("T60001")) {
			return "009";
		} else if (tradeCode.equals("T60002")) {
			return "044";
		}else {
			logger.error("获取webservice服务地址异常！交易码：" + tradeCode);
			return null;
		}
	}
}
