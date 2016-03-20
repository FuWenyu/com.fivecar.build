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
import com.infohold.cms.dao.ResourcesDao;
import com.infohold.cms.entity.AdEntity;
import com.infohold.cms.entity.ResourcesEntity;
import com.infohold.cms.util.DateUtil;

/**
 * 资源管理Service
 * 
 * @author wag
 * 
 */
@SuppressWarnings("unchecked")
@Service("resourcesService")
public class ResourcesService implements IBusinessService {

	@Autowired
	private ResourcesDao resourcesdao;

	@Autowired
	private SysConfigUtil sysConfigUtil;

	private DateUtil dateutil = new DateUtil();

	private Logger logger = Logger.getLogger(ResourcesService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T21001")) {
			return this.findResources(transData);
		} else if (tradCode.equals("T21002")) {
			return this.saveResources(transData);
		} else if (tradCode.equals("T21003")) {
			return this.deletePicture(transData);
		} else if (tradCode.equals("T21004")) {
			return this.Picture_edit(transData);
		} else if (tradCode.equals("T21005")) {
			return this.updateResourceEntity(transData);
		} else if (tradCode.equals("T21006")) {
			return this.entry_query(transData);
		} else if (tradCode.equals("T21007")) {
			return this.picture_query(transData);
		} else if (tradCode.equals("T21008")) {
			return this.entry_query(transData);
		} else if (tradCode.equals("T21009")) {
			return this.entry_query(transData);
		} else if (tradCode.equals("T21010")) {
			return this.entry_query(transData);
		}
		return transData;
	}

	/**
	 * 资源列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData findResources(TransData transData) throws BusinessException {
		List<Map<String, Object>> orgList = resourcesdao.queryOmsResourceList(transData.getViewMap(),
				transData.getPageInfo());
		transData.setObj(orgList);
		return transData;

	}

	/**
	 * 资源保存
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */

	public TransData saveResources(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		String resourceName = (String) map.get("resourceName");
		String key = (String) map.get("key");
		String title = (String) map.get("title");
		String purposeall = (String) map.get("purpose");
		String[] strarray2 = purposeall.split("-");
		String purpose = strarray2[0];
		String purposeName = strarray2[1];
		UserSession session = transData.getUserSession();
		Timestamp createDate = dateutil.getTimestamp();
		ResourcesEntity resources = new ResourcesEntity();
		resources.setResource(key);
		resources.setTitle(title);
		resources.setPurpose(purpose);
		resources.setPurposeName(purposeName);
		resources.setResourceName(resourceName);
		resources.setCreateDate(createDate);
		resources.setCreateName(session.getUserName());
		if (resourcesdao.saveResourceEntity(resources)) {
			transData.setExpMsg("success");
		}
		return transData;

	}

	/**
	 * 资源删除
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData deletePicture(TransData transData) throws BusinessException {
		String id = (String) transData.getViewMap().get("id");
		resourcesdao.deleteResourceEntity(id);
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
		ResourcesEntity resourceentity = resourcesdao.getResourceEntity(id);
		transData.setObj(resourceentity);
		return transData;
	}

	/**
	 * 图片编辑
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData updateResourceEntity(TransData transData) throws BusinessException {
		// 页面数据
		Map<String, Object> map = transData.getViewMap();
		String id = (String) map.get("id");
		String resourceName = (String) map.get("resourceName");
		String key = (String) map.get("key");
		String title = (String) map.get("title");
		String purpose = (String) map.get("purpose");
		UserSession session = transData.getUserSession();
		Timestamp createDate = dateutil.getTimestamp();
		ResourcesEntity resources = resourcesdao.getResourceEntity(id);

		resources.setResource(key);
		resources.setTitle(title);
		resources.setPurpose(purpose);
		resources.setResourceName(resourceName);
		resources.setCreateDate(createDate);
		resources.setCreateName(session.getUserName());
		if (resourcesdao.Resource_update(resources)) {
			transData.setExpMsg("success");
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
		logger.info("picture_query-request" + map);
		String usefo = (String) map.get("usefo");
		List<Map<String, Object>> orgList = resourcesdao.getResource(usefo, transData.getPageInfo());
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
		logger.info("entry_query-request" + map);
		String usefo = (String) map.get("usefo");
		List<Map<String, Object>> orgList = resourcesdao.getEntry(usefo, transData.getPageInfo());
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
}
