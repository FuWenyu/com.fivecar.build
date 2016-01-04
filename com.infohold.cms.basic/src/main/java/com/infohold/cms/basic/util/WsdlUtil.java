package com.infohold.cms.basic.util;

import org.apache.cxf.tools.java2ws.JavaToWS;
import org.apache.cxf.tools.wsdlto.WSDLToJava;

/**
 * 
 * 描述：JAVA接口转换成WSDL文件
 * 
 * @author yangyantao
 */
public class WsdlUtil {

	/**
	 * 根据JAVA接口，生成WSDL文件
	 * 
	 * @param className
	 */
	public static void javaToWsdl(Class<?> className) {
		String[] args = new String[] { "-wsdl", "-d", "./wsdl",
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
	 * @param wsFileName
	 */
	public static void wsdlToJava(String packageName, String wsFileName) {
		WSDLToJava.main(new String[] { "-impl", "-client", "-d",
				"src\\main\\java", "-p", packageName, "wsdl\\" + wsFileName });
		System.out.println("sucess!");
	}
}
