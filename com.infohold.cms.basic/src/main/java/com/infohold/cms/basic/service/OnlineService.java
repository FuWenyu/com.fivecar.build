package com.infohold.cms.basic.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.cxf.interceptor.LoggingInInterceptor;
import org.apache.cxf.interceptor.LoggingOutInterceptor;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 联机服务抽象类
 * @author Administrator
 */
public abstract class OnlineService  {

	private static Map wsCache = new HashMap();
	
	@Autowired
	private JaxWsProxyFactoryBean webServiceFactory;
	
	@Autowired
	private LoggingInInterceptor logIn;
	
	@Autowired
	private LoggingOutInterceptor logOut;
	
	/**
	 * 获取webservice接口对象
	 * @param className
	 * @return
	 */
	protected Object getClient(Class className,String url){
		Object wsClient=wsCache.get(className);
		if(null == wsClient || "".equals(wsClient)){
			synchronized(webServiceFactory){
				webServiceFactory.setServiceClass(className);
				webServiceFactory.setAddress(url);
				webServiceFactory.getInInterceptors().add(logIn);
				webServiceFactory.getOutInterceptors().add(logOut);
				wsClient= webServiceFactory.create();
				wsCache.put(className, wsClient);
			}
		}
		return wsClient;
	}
	
}
