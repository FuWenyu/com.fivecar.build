package com.infohold.cms.basic.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import com.infohold.cms.basic.exception.BusinessException;

/**
 * 文件处理工具
 * 文件处理已更改为存数据库Blob，该类暂无用处。
 * @author wanglei
 *
 */
public class FileUtil {

	// 附件存放根目录 D:/files
	//public static final String ATTACHMENT_ROOT_PATH = "/home/nmqb/att_platform";
	public static final String ATTACHMENT_ROOT_PATH = "D:/files";
	public static final int FILEBUFFER = 1024;
	public static final long PHOTOCACHETIME = 300 * 1000;
	// 未知附件类型
	public static final String ATTACH_UNKNOW_TYPE = ".unknow";

	// 附件上传大小(K)
	public static final long ATTACH_SIZE = 10240000;

	// 附件上传类型
	public static final String[] ATTACH_TYPE = new String[] { ".exe", ".bat",
			".dat" };		
		
	public static final String SEPERATOR = "/";// 转义字符
	public static final String SN_PATTERN = "yyyyMMdd";// 流水日期
	/**
	 * 将数据写入文件
	 * @param data
	 * @param fileDir 文件生成目录
	 * @param fileName 文件名称
	 * @throws IOException
	 */
	public static void writeFile(List<Map<String,Object>> data,String fileDir,String fileName) throws IOException{
		File file = new File(fileDir);
		if(!file.exists() && !file.isDirectory()){
			file.mkdir();//创建文件目录
		}
		file = new File(fileDir+"/"+fileName);
		if(file.exists()){
			file.delete();
		}
		FileWriter fw= new FileWriter(file);
		BufferedWriter bw= new BufferedWriter(fw);
		for(Map<String, Object> map: data){
			Iterator<String> it=map.keySet().iterator();
			StringBuffer buf= new StringBuffer();
			while(it.hasNext()){
				String key=(String)it.next();
				String value=map.get(key)+"".trim();
				if(null == value || "".equals(value) || "null".equals(value)){
					buf.append("|");
				}else{
					buf.append(value+"|");
				}
			}
			String str=buf.substring(0,buf.length()-1);
			bw.write(str);
			bw.write("\n");
		}
		bw.flush();
		bw.close();
		fw.close();
	}
	
	/**
	 * 生成OK文件
	 * @param fileDir
	 * @param fileName
	 * @throws IOException
	 */
	public static void createOkFile(String fileDir,String fileName) throws IOException{
		File file = new File(fileDir);
		if(!file.exists() && !file.isDirectory()){
			file.mkdir();//创建文件目录
		}
		file = new File(fileDir+"/"+fileName);
		if(file.exists()){
			file.delete();
			file.createNewFile();
		}else{
			file.createNewFile();
		}
	}
	
	/**
	 * 文件上传
	 * 
	 * @throws BusinessException
	 * */
	public static String upload(InputStream in, String fileName) throws BusinessException {
		StringBuffer filePath = new StringBuffer(ATTACHMENT_ROOT_PATH
				+ SEPERATOR);
		//wanglei
		filePath.append(DateFormatUtil.getCurrentDate() + SEPERATOR);
		String ext = getExtName(fileName);
		String storage = System.currentTimeMillis() + ext;
		File file = new File(filePath.toString(), storage);
		try {
			FileUtils.copyInputStreamToFile(in, file);
			return filePath.append(storage).toString();
		} catch (IOException e) {
			//LogUtil.error("【W00002】文件上传失败,文件名称:" + fileName);
			throw new BusinessException("E013", e);
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 文件下载
	 * 
	 * @throws BusinessException
	 * @throws IOException
	 * */
	public static byte[] download(String path) throws BusinessException {
		File file = new File(path);
		try {
			return FileUtils.readFileToByteArray(file);
		} catch (IOException e) {
			//LogUtil.error("【W00004】文件读取失败,文件名称:" + path);
			throw new BusinessException("E012", e);
		}
	}

	/**
	 * 文件删除
	 * 
	 * @throws BusinessException
	 * */
	public static boolean remove(String path) throws BusinessException {
		File file = new File(path);
		if (!file.exists()) {
			//LogUtil.error("【W00004】文件不存在,文件名称:" + path);
			throw new BusinessException("E011");
		}
		return file.delete();
	}

	/**
	 * 获取文件拓展名
	 * */
	public static String getExtName(String fileName) {
		if (fileName.indexOf(".") == -1) {
			return ATTACH_UNKNOW_TYPE;
		}
		String ext = fileName.substring(fileName.lastIndexOf("."),
				fileName.length());
		return ext.toLowerCase();
	}

	/**
	 * 文件校验
	 * */
	public static boolean fileCheck(MultipartFile file) {
		if (file.isEmpty()) {
			throw new BusinessException("E009");
		} else if (file.getSize() > ATTACH_SIZE) {
			//LogUtil.error("【W00006】文件大小超过限制:" + file.getOriginalFilename());
			throw new BusinessException("E006");
		} else if (Arrays.asList(ATTACH_TYPE).contains(
				FileUtil.getExtName(file.getOriginalFilename()))) {
			//LogUtil.error("【W00007】文件格式非法:" + file.getOriginalFilename());
			throw new BusinessException("E010");
		}
		return true;
	}

	/**
	 * 移动文件到新的文件夹
	 * @param oldPath D:\\tfspFile\\pay\\rs.txt
	 * @param newPath D:\\tfspFile\\pay\\bak\\rs.txt_bak
	 * @throws Exception
	 */
	public static void remove(String oldPath, String newPath) throws IOException{
		int byteread = 0;
		File oldfile = new File(oldPath);
		if (oldfile.exists()) { // 文件存在时
			InputStream inStream = new FileInputStream(oldPath); // 读入原文件
			FileOutputStream fs = new FileOutputStream(newPath);
			byte[] buffer = new byte[1444];
			while ((byteread = inStream.read(buffer)) != -1) {
				fs.write(buffer, 0, byteread);
			}
			fs.close();
			inStream.close();
		}
	} 
	
	/**
	 * 文件删除
	 * @param path
	 * @return
	 * @throws BusinessException
	 */
	public static boolean delete(String path) throws BusinessException {
		File file = new File(path);
		if (!file.exists()) {
			throw new BusinessException("E011");
		}
		return file.delete();
	}
	
	public static void main(String args[]){
		try {
			FileUtil.remove("D:\\tfspFile\\pay\\rs.txt", "D:\\tfspFile\\pay\\bak\\rs.txt_bak");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
