package com.infohold.cms.basic.util;

import java.io.IOException;
import java.util.Map;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.exception.BusinessException;

/**
 * Http操作工具类
 * @author Administrator
 *
 */
@Repository(value = "httpUtil")
public class HttpUtil {
	
	private Logger logger = Logger.getLogger(HttpUtil.class);
	
	@Autowired
	private SysConfigUtil sysConfigUtil;
	
	/**
	 * post方式提交
	 * @param params
	 * @throws Exception
	 * @return Map<String, Object>
	 */
	public Map<String,Object> submit_Post(String add_params) throws Exception {
		String auth_service_address = sysConfigUtil.getCfgInfo("auth_service_address");
		long timestamp=System.currentTimeMillis();
		String str=timestamp+"";
		str=str.substring(0, str.length()-3);
		System.out.println(str);
		String params = "api_version=1&"
				+ "appkey=610131&"
				+ "channel_id=10004&"
				+ "serverkey=610131&"
				+ "sign=209vcEaHkmb/QwHqsRU3HRPvlqw=&"
				+ "nonce=y2FrX7Muouma5vxWTKngEb7uHkRu4P5u&"
				+ "timestamp="+str+"&";
		String url = auth_service_address + params + add_params;
		HttpClient httpClient = new HttpClient();
		httpClient.getHttpConnectionManager().getParams()
				.setConnectionTimeout(5000);
		
		logger.info("***url:" + url + "***");
		PostMethod postMethod = new PostMethod(url);
		postMethod.getParams().setParameter(HttpMethodParams.SO_TIMEOUT, 5000);
		postMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
				new DefaultHttpMethodRetryHandler());
		String response = "";
		try {
			int statusCode = httpClient.executeMethod(postMethod);
			if (statusCode != HttpStatus.SC_OK) {
				logger.info("请求出错: " + postMethod.getStatusLine());
				throw new BusinessException("E999","请求出错: " + postMethod.getStatusLine());
			}
			byte[] responseBody = postMethod.getResponseBody();// 读取为字节数组
			response = new String(responseBody, "utf-8");
			Map<String, Object> map = StrUtil.parseJSON2Map(response);
			logger.info("***return map :" + map + "***");
			return map;
		} catch (HttpException e) {
			logger.info(e);
			throw e;
		} catch (IOException e) {
			logger.info(e);
			throw e;
		} finally {
			postMethod.releaseConnection();
		}
	}
	
	/**
	 * get方式提交
	 * @param params
	 * @throws Exception
	 * @return Map<String, Object>
	 */
	public Map<String, Object> submit_Get(String add_params) throws Exception {
		String auth_service_address = sysConfigUtil.getCfgInfo("auth_service_address");
		String params = "api_version=1&"
				+ "appkey=610132&"
				+ "channelCode=SWP&"
				+ "channel_id=10005&"
				+ "nonce=gBjU3VOUlmMOyV2zOVOjumJK0h5lhOs3&"
				+ "serverkey=610132&"
				+ "sign=%2bPPiSJD/o8bS%2bNaxnHBcpcdApKc=&";
		String url = auth_service_address + params + add_params;
		HttpClient httpClient = new HttpClient();
		httpClient.getHttpConnectionManager().getParams()
				.setConnectionTimeout(5000);
		GetMethod getMethod = new GetMethod(url);
		getMethod.getParams().setParameter(HttpMethodParams.SO_TIMEOUT, 5000);
		getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
				new DefaultHttpMethodRetryHandler());
		String response = "";
		try {
			int statusCode = httpClient.executeMethod(getMethod);
			if (statusCode != HttpStatus.SC_OK) {
				throw new BusinessException("E999","请求出错: " + getMethod.getStatusLine());
			}
			byte[] responseBody = getMethod.getResponseBody();// 读取为字节数组
			response = new String(responseBody, "utf-8");
			Map<String, Object> map = StrUtil.parseJSON2Map(response);
			return map;
		} catch (HttpException e) {
			logger.info(e);
			throw e;
		} catch (IOException e) {
			logger.info(e);
			throw e;
		} finally {
			getMethod.releaseConnection();
		}
	}
}
