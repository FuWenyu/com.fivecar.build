package com.infohold.cms.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.FileUtil;
import com.infohold.cms.basic.util.ImageCompressUtil;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.PictureDao;
import com.infohold.cms.dao.ThirdPartyResourcesDao;
import com.infohold.cms.entity.AdEntity;
import com.infohold.cms.entity.ResourcesEntity;
import com.infohold.cms.entity.ThirdPartyResourcesEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;

/**
 * 用户管理Service
 * 
 * @author wag
 * 
 */
@SuppressWarnings("unchecked")
@Service("pictureService")
public class PictureService implements IBusinessService {

	@Autowired
	private PictureDao pictureDao;
	@Autowired
	private ThirdPartyResourcesDao resourcesdao;
	@Autowired
	private SysConfigUtil sysConfigUtil;

	private static String service_name = CustomPropertyUtil.getProperties("service_name");

	private static String resource_request = CustomPropertyUtil.getProperties("resource_request");

	private DateUtil dateutil = new DateUtil();

	private Logger logger = Logger.getLogger(PictureService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T20001")) {
			return this.findPicture(transData);
		} else if (tradCode.equals("T20002")) {
			return this.savePicture(transData);
		} else if (tradCode.equals("T20003")) {
			return this.deletePicture(transData);
		} else if (tradCode.equals("T20004")) {
			return this.updatePictureEntity(transData);
		} else if (tradCode.equals("T20005")) {
			return this.Picture_edit(transData);
		} else if (tradCode.equals("T20006")) {
			return this.uploadPicture(transData);
		} else if (tradCode.equals("T20007")) {
			return this.resourcesQuery(transData);
		} else if (tradCode.equals("T20008")) {
			return this.entry_query(transData);
		} else if (tradCode.equals("T20009")) {
			return this.findEntry(transData);
		} else if (tradCode.equals("T20010")) {
			return this.getResources(transData);
		} else if (tradCode.equals("T20011")) {
			return this.picture_query(transData);
		}
		return transData;
	}

	/**
	 * 广告图片列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData findPicture(TransData transData) throws BusinessException {
		List<Map<String, Object>> orgList = pictureDao.queryOmsPictureList(transData.getViewMap(),
				transData.getPageInfo());
		transData.setObj(orgList);
		return transData;

	}

	/**
	 * 条目列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData findEntry(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		String usefo = (String) map.get("usefo");
		List<Map<String, Object>> orgList = pictureDao.queryEntryList(usefo, transData.getPageInfo());
		transData.setObj(orgList);
		return transData;

	}

	/**
	 * 图片上传
	 * 
	 * @param transData
	 * @return
	 */
	public TransData uploadPicture(TransData transData) throws BusinessException {
		// Map<String,Object> checked_map = (Map<String, Object>)
		// transData.getObj();

		// Map<String,Object> map= transData.getViewMap();

		// MultipartFile file = (MultipartFile)map.get("fileInput");

		Map<String, Object> map = new HashMap<String, Object>();

		MultipartFile file = (MultipartFile) transData.getObj();
		String fileName = file.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		int id = sysConfigUtil.getPrimaryId();
		// 文件检查
		FileUtil.fileCheck(file);
		// 保存到本地
		String path = getClass().getResource("/").getPath();
		// String filePath = path.substring(0, path.indexOf("/WEB-INF/")) +
		// sysConfigUtil.getCfgInfo("picture_ip") + "/" + id;
		// String filePath = path.substring(0, path.indexOf("/WEB-INF/")) +
		// "/upload/goodsimg" + "/" + id;
		String filePath = path.substring(0, path.indexOf("/WEB-INF/")) + "/upload/image";
		String filePathreal = path.substring(0, path.indexOf("/WEB-INF/")) + "/upload/imagereal";
		// String filePath1 = path.substring(1, path.indexOf("/WEB-INF/")) +
		// "/upload/image";
		// String filePathreal1 = path.substring(1, path.indexOf("/WEB-INF/")) +
		// "/upload/imagereal";
		// File file1 = new File(filePathreal, String.valueOf(id) + ext);
		File file2 = new File(filePath, String.valueOf(id) + ext);
		InputStream in = null;
		try {
			in = file.getInputStream();
			// FileUtils.copyInputStreamToFile(in, file1);
			FileUtils.copyInputStreamToFile(in, file2);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// String realpath =
		// "/var/tomcat/tomcat-7/webapps/com.fivecar.cms.web/upload/imagereal"+"/"+String.valueOf(id)
		// + ext;
		// String zippath =
		// "/var/tomcat/tomcat-7/webapps/com.fivecar.cms.web/upload/image"+"/"+String.valueOf(id)
		// + ext;
		// System.out.println(realpath);
		// System.out.println(zippath);
		/*
		 * try { imgcompress.saveMinPhoto(realpath, zippath, 556, 0.9d); } catch
		 * (Exception e) { e.printStackTrace(); } System.out.println(zippath);
		 */
		map.put("imageName", String.valueOf(id) + ext);
		map.put("filePath", filePath);
		map.put("filePathreal", filePathreal);
		map.put("imageid", String.valueOf(id));
		/*
		 * // ftp上传 if (portal_ftpIp == null) { portal_ftpIp =
		 * sysConfigUtil.getCfgInfo("portal_ftpIp"); portal_username =
		 * sysConfigUtil.getCfgInfo("portal_username"); portal_password =
		 * sysConfigUtil.getCfgInfo("portal_password"); // /* // *
		 * portal_ftpIp="10.172.91.105"; portal_username="tfsp"; //
		 * portal_password="tfsp"; // } FTPUtil ftpUtil = new FTPUtil(); try {
		 * logger.info("登陆FTP开始"); ftpUtil.login(portal_ftpIp, portal_username,
		 * portal_password); logger.info("登陆FTP成功");
		 * ftpUtil.upLoadImg(portalPath, file1.getName(), file1);
		 * logger.info("成功上传" + file1.getName()); attDao.save(attach); } catch
		 * (IOException e) { logger.info("上传文件异常", e); FileUtil.delete(filePath
		 * + "/" + String.valueOf(id) + ext); try { throw e; } catch
		 * (IOException e1) { e1.printStackTrace(); } } finally { try {
		 * ftpUtil.closeFtp(); } catch (IOException e) { e.printStackTrace(); }
		 * } // 组装返回数据 FileVO vo = new FileVO();
		 * vo.setAttId(attach.getAtt_id()); vo.setAttName(fileName);
		 * transData.setObj(vo);
		 */

		transData.setViewMap(map);
		return transData;

	}

	public TransData savePicture(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String imageName = (String) map.get("imageName");
		String title = (String) map.get("title");
		String usefoall = (String) map.get("usefo");
		String anchor = (String) map.get("anchor");
		String description = (String) map.get("description");
		String imageHref = (String) map.get("imageHref");
		String imageHrefReal = (String) map.get("imageHrefReal");
		String imageid = (String) map.get("imageid");
		Timestamp createDate = dateutil.getTimestamp();

		// String urlreal = "http://"+sysConfigUtil.getCfgInfo("service_ip")+
		// "/+"+sysConfigUtil.getCfgInfo("service_name")+"/upload/imagereal/"+imageName;

		/*
		 * String realpath =
		 * "/var/tomcat/tomcat-7/webapps/com.fivecar.cms.web/upload/imagereal" +
		 * "/" + imageName; String zippath =
		 * "/var/tomcat/tomcat-7/webapps/com.fivecar.cms.web/upload/image" + "/"
		 * + imageName;
		 */
		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);

		String[] strarray2 = usefoall.split("-");
		String usefo = strarray2[0];
		String usefoName = strarray2[1];

		StringBuffer anchor1 = new StringBuffer("");
		anchor1.append(resource_request);
		anchor1.append(anchor);

		AdEntity adentity = new AdEntity();
		adentity.setImageName(imageName);
		adentity.setTitle(title);
		adentity.setUsefo(usefo);
		adentity.setUsefoName(usefoName);
		adentity.setAnchorid(anchor);
		adentity.setAnchor(anchor1.toString());
		adentity.setDescription(description);
		adentity.setImageHref(imageHref);
		adentity.setImageHrefReal(imageHrefReal);
		adentity.setCreateDate(createDate);
		adentity.setImageid(imageid);
		adentity.setUrl(url.toString());
		adentity.setUrlreal(urlreal.toString());
		adentity.setCreateName(session.getUserName());

		if (pictureDao.savePictureEntity(adentity)) {
			transData.setExpMsg("success");
		}
		/*
		 * try { imgcompress.saveMinPhoto(realpath, zippath, 556, 0.9d); } catch
		 * (Exception e) { e.printStackTrace(); } System.out.println(zippath);
		 */
		return transData;

	}

	/**
	 * 图片删除
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData deletePicture(TransData transData) throws BusinessException {
		String pictureid = (String) transData.getViewMap().get("pictureid");
		pictureDao.deletePictureEntity(pictureid);
		transData.setObj(true);
		return transData;
	}

	/**
	 * 版本详细信息
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData Picture_edit(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		String id = map.get("id") + "";
		AdEntity adentity = pictureDao.getPictureByid(id);
		transData.setObj(adentity);
		return transData;
	}

	/**
	 * 图片编辑
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData updatePictureEntity(TransData transData) throws BusinessException {
		// 页面数据
		UserSession session = transData.getUserSession();
		Map<String, Object> map = transData.getViewMap();
		String id = (String) map.get("picture_id");
		String imageName = (String) map.get("imageName");
		String title = (String) map.get("title");
		String usefoall = (String) map.get("usefo");
		String anchor = (String) map.get("anchor");
		String description = (String) map.get("description");
		String imageHref = (String) map.get("imageHref");
		String imageHrefReal = (String) map.get("imageHrefReal");
		String imageid = (String) map.get("imageid");
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray2 = usefoall.split("-");
		String usefo = strarray2[0];
		String usefoName = strarray2[1];

		AdEntity adentity = new AdEntity();
		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);

		StringBuffer anchor1 = new StringBuffer("");
		anchor1.append(sysConfigUtil.getCfgInfo("resource_request"));
		anchor1.append(anchor);

		adentity.setId(id);
		adentity.setImageName(imageName);
		adentity.setTitle(title);
		adentity.setUsefo(usefo);
		adentity.setUsefoName(usefoName);
		adentity.setAnchorid(anchor);
		adentity.setAnchor(anchor1.toString());
		adentity.setDescription(description);
		adentity.setImageHref(imageHref);
		adentity.setImageHrefReal(imageHrefReal);
		adentity.setCreateDate(createDate);
		adentity.setImageid(imageid);
		adentity.setUrl(url.toString());
		adentity.setUrlreal(urlreal.toString());
		adentity.setCreateName(session.getUserName());
		pictureDao.picture_update(adentity);
		transData.setExpMsg("success");
		return transData;
	}

	/**
	 * 图文信息查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData resourcesQuery(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("resourcesQuery-request:" + map);
		String anchor = (String) map.get("anchor");
		String resource_type = (String) map.get("resource_type");
		if (resource_type.equals("thirdparty")) {
			ThirdPartyResourcesEntity resources = resourcesdao.getResourceEntity(anchor);
			if (resources == null) {
				transData.setExpCode("-1");
				transData.setExpMsg("fail");
			} else {
				transData.setObj(resources);
				transData.setExpCode("1");
				transData.setExpMsg("success");
			}
		} else {
			ResourcesEntity resources = pictureDao.getResource(anchor);
			if (resources == null) {
				transData.setExpCode("-1");
				transData.setExpMsg("fail");
			} else {
				transData.setObj(resources);
				transData.setExpCode("1");
				transData.setExpMsg("success");
			}
		}
		return transData;
	}

	/**
	 * 广告图片查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData picture_query(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("picture_query-request:" + map);
		String usefo = (String) map.get("usefo");
		List<Map<String, Object>> orgList = pictureDao.getEntry(usefo, transData.getPageInfo());
		if (orgList.isEmpty()) {
			transData.setExpCode("-1");
			transData.setExpMsg("fail");
		} else {
			transData.setObj(orgList);
			transData.setExpCode("1");
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * 首页条目查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData entry_query(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("entry_query-request:" + map);
		String usefo = (String) map.get("usefo");
		List<Map<String, Object>> orgList = pictureDao.getEntry(usefo, transData.getPageInfo());
		if (orgList.isEmpty()) {
			transData.setExpCode("-1");
			transData.setExpMsg("fail");
		} else {
			transData.setObj(orgList);
			transData.setExpCode("1");
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * 首页图片新增图文资源查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData getResources(TransData transData) throws BusinessException {
		List<Map<String, Object>> orgList = pictureDao.getResources();
		transData.setObj(orgList);
		transData.setExpMsg("success");
		return transData;
	}
}
