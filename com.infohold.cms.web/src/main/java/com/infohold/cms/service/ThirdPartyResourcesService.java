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
import com.infohold.cms.dao.ThirdPartyResourcesDao;
import com.infohold.cms.entity.AdEntity;
import com.infohold.cms.entity.ThirdPartyResourcesEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;

/**
 * 资源管理Service
 * 
 * @author wag
 * 
 */
@SuppressWarnings("unchecked")
@Service("tpresourcesService")
public class ThirdPartyResourcesService implements IBusinessService {

	@Autowired
	private ThirdPartyResourcesDao resourcesdao;

	private DateUtil dateutil = new DateUtil();

	private Logger logger = Logger.getLogger(ThirdPartyResourcesService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T38001")) {
			return this.findResources(transData);
		} else if (tradCode.equals("T38002")) {
			return this.saveResources(transData);
		} else if (tradCode.equals("T38003")) {
			return this.deletePicture(transData);
		} else if (tradCode.equals("T38004")) {
			return this.Picture_edit(transData);
		} else if (tradCode.equals("T38005")) {
			return this.updateResourceEntity(transData);
		}else if (tradCode.equals("T38006")) {
			return this.getTpDealerList(transData);
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
	 * 资源列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData getTpDealerList(TransData transData) throws BusinessException {
		List<Map<String, Object>> orgList = resourcesdao.querydealerList();
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
		String thirdparty_type = (String) map.get("thirdparty_type");
		String[] strarray2 = purposeall.split("-");
		String purpose = strarray2[0];
		String purposeName = strarray2[1];
		UserSession session = transData.getUserSession();
		Timestamp createDate = dateutil.getTimestamp();
		ThirdPartyResourcesEntity resources = new ThirdPartyResourcesEntity();
		resources.setResource(key);
		resources.setTitle(title);
		resources.setPurpose(purpose);
		resources.setPurposeName(purposeName);
		resources.setThirdparty_type(thirdparty_type);
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
		ThirdPartyResourcesEntity resourceentity = resourcesdao.getResourceEntity(id);
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
		String thirdparty_type = (String) map.get("thirdparty_type");
		UserSession session = transData.getUserSession();
		Timestamp createDate = dateutil.getTimestamp();
		ThirdPartyResourcesEntity resources = resourcesdao.getResourceEntity(id);
		resources.setResource(key);
		resources.setTitle(title);
		resources.setPurpose(purpose);
		resources.setThirdparty_type(thirdparty_type);
		resources.setResourceName(resourceName);
		resources.setCreateDate(createDate);
		resources.setCreateName(session.getUserName());
		if (resourcesdao.Resource_update(resources)) {
			transData.setExpMsg("success");
		}
		return transData;
	}

	

}
