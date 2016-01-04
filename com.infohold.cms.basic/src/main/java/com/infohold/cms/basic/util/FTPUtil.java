package com.infohold.cms.basic.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

/**
 * FTP操作工具类
 * @author Administrator
 *
 */
public class FTPUtil {
	
	FTPClient ftp = new FTPClient();
	
	/**
	 * FTP登录
	 * @param ftpUrl
	 * @param username
	 * @param password
	 * @throws SocketException
	 * @throws IOException
	 */
	public void login(String ftpUrl,String username,String password) throws SocketException, IOException{
		ftp.connect(ftpUrl);
		ftp.login(username, password);
		int replyCode=ftp.getReplyCode();
		if(!FTPReply.isPositiveCompletion(replyCode)){
			this.closeFtp();
			throw new SocketException("ftp login error");
		}
	}

	/**
	 * 文件上传
	 * @param dirPath
	 * @param dirFileName
	 * @param file
	 * @throws SocketException
	 * @throws IOException
	 */
	public void upLoadFile(String dirPath,String dirFileName,File file) throws SocketException, IOException{
		//设置FTP上传目录
		if(null != dirPath && !"".equals(dirPath.trim())){
			ftp.changeWorkingDirectory(dirPath);
		}
		ftp.setBufferSize(2048);
		ftp.setControlEncoding("UTF-8");
		//上传开始
		FileInputStream fis = new FileInputStream(file);
		ftp.storeFile(dirFileName, fis);
		fis.close();
		
	}
	/**
	 * 文件下载
	 * @param dirPath 目标服务器路径
	 * @param dirFileName 目标服务器文件名
	 * @param file
	 * @throws SocketException
	 * @throws IOException
	 */
	public void downFile(String dirPath,String dirFileName,File file) throws SocketException, IOException{
		//设置FTP下载目录
		if(null != dirPath && !"".equals(dirPath.trim())){
			ftp.changeWorkingDirectory(dirPath);
		}
		ftp.setBufferSize(2048);
		ftp.setControlEncoding("UTF-8");
		//ftp.enterLocalPassiveMode();//设置被动模式
		//下载开始
		FileOutputStream fos = new FileOutputStream(file);
		ftp.setFileType(FTP.BINARY_FILE_TYPE);
		boolean a = ftp.retrieveFile(dirFileName, fos);
		System.out.println(a);
		fos.close();
		
	}
	
	
	/**
	 * 关闭FTP连接
	 * @param ftp
	 * @throws IOException
	 */
	public void closeFtp() throws IOException{
		if(ftp.isConnected()){
			ftp.logout();
			ftp.disconnect();
		}
	}
	
}
