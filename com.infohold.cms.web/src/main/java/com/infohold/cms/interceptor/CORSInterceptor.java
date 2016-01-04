package com.infohold.cms.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CORSInterceptor extends HandlerInterceptorAdapter {

	/**
	 * 日志对象
	 */
	protected static Logger logger = Logger.getLogger(CORSInterceptor.class);

	private List<String> defaultAccessAllowedFrom;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// Enumeration<String> enumers = request.getHeaderNames();
		//
		// while (enumers.hasMoreElements()) {
		// String key = enumers.nextElement();
		// System.out.println(key + " : " + request.getHeader(key));
		// }
		String origin = request.getHeader("origin");
		System.out.println("Access-Control-Allow-Origin"+origin);
		// for (String s : defaultAccessAllowedFrom) {
		// if (s.equals(origin)) {
		response.setHeader("Access-Control-Allow-Origin", origin);
		response.setHeader("Access-Control-Allow-Methods", "POST, GET");
		response.setHeader("Access-Control-Max-Age", "3600");
		// break;
		// }
		// }

		return true;
	}

	public List<String> getDefaultAccessAllowedFrom() {
		return defaultAccessAllowedFrom;
	}

	public void setDefaultAccessAllowedFrom(
			List<String> defaultAccessAllowedFrom) {
		this.defaultAccessAllowedFrom = defaultAccessAllowedFrom;
	}
}
