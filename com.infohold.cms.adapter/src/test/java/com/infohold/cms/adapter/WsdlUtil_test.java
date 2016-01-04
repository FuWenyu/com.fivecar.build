package com.infohold.cms.adapter;

import org.apache.cxf.tools.java2ws.JavaToWS;
import org.apache.cxf.tools.wsdlto.WSDLToJava;

/**
 * 
 * 描述：WS工具类
 * 
 * @author yangyantao
 */
public class WsdlUtil_test {

	/**
	 * 根据JAVA接口，生成WSDL文件
	 * 
	 * @param className
	 */
	public static void javaToWsdl(Class<?> className) {
		String[] args = new String[] {
				"-o",
				className.toString().substring(
						className.toString().lastIndexOf(".") + 1,
						className.toString().length())
						+ ".wsdl", "-wsdl", "-d", "./wsdl_server",
				className.getName() };
		JavaToWS javaToWS = new JavaToWS(args);
		try {
			javaToWS.run();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("sucess!");
	}

	/**
	 * 根据WSDL文件，生成java接口代码
	 * 
	 * @param packageName
	 * @param wsFilePath
	 * @param wsFileName
	 */
	public static void wsdlToJava(String packageName, String wsFilePath,
			String wsFileName) {
		WSDLToJava.main(new String[] { "-impl", "-client", "-d",
				"src\\main\\java", "-p", packageName,
				wsFilePath + "\\" + wsFileName });
		System.out.println("sucess!");
	}

	public static void main(String[] args) {
		//JAVA生成wsdl
		//WsdlUtil.javaToWsdl(IAsycCallBackService.class);
		
		//WSDL生成java
		//生成代码存放的包路径
/*		String packageName ="com.infohold.tfsp.adapter.ifap.XfaceAccountCharge";
		//wsdl文件名称
		String wsFileName ="XfaceAccountCharge.wsdl";
		WsdlUtil.wsdlToJava(packageName,"wsdl_ifap",wsFileName);*/
		
	//	String packageName ="com.infohold.tfsp.adapter.portal.XfaceFinancingProjectAbort";
		
		String packageName ="com.infohold.cms.adapter.ecif.DoRegisterCustomerWebService";
		//wsdl文件名称
		String wsFileName ="DoRegisterCustomerWebService.wsdl";
		WsdlUtil_test.wsdlToJava(packageName,"wsdl",wsFileName);
	}
	
	
}
