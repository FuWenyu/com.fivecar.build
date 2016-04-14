package com.infohold.cms.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.dao.CarLenderDao;
import com.infohold.cms.entity.CarLenderEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("lenderService")
public class CarLenderService implements IBusinessService {

	@Autowired
	private CarLenderDao lenderdao;

	private DateUtil dateutil = new DateUtil();
	
	private static String service_name = CustomPropertyUtil
			.getProperties("service_name");
	
	private static String resource_request = CustomPropertyUtil
			.getProperties("resource_request");
	
	private Logger logger = Logger.getLogger(CarLenderService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T29001")) {
			return this.findlenderList(transData);
		} else if (tradCode.equals("T29002")) {
			return this.getResources(transData);
		} else if (tradCode.equals("T29003")) {
			return this.savelender(transData);
		} else if (tradCode.equals("T29004")) {
			return this.deletelender(transData);
		} else if (tradCode.equals("T29005")) {
			return this.lenderEdit(transData);
		} else if (tradCode.equals("T29006")) {
			return this.lenderEditSave(transData);
		} else if (tradCode.equals("T29007")) {
			return this.lenderQuery(transData);
		}
		return transData;
	}

	/**
	 * 车辆列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData findlenderList(TransData transData)
			throws BusinessException {
		UserSession session = transData.getUserSession();
		String orgid = session.getBranchNo();
		List<Map<String, Object>> orgList = lenderdao
				.querylenderList(transData.getPageInfo(),orgid);
		transData.setObj(orgList);
		return transData;
	}

	public TransData savelender(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String lenderName = (String) map.get("lenderName");
		String anchor = (String) map.get("anchor");
		String telephone = (String) map.get("telephone");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		String orgid = (String) map.get("orgid");
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray1 = anchor.split("-");
		String resourceId = strarray1[0];
		String resourceTitle = strarray1[1];
		String resourceName = strarray1[2];
		StringBuffer anchor1 = new StringBuffer("");
		anchor1.append(resource_request);
		anchor1.append(resourceId);
		
		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);

		CarLenderEntity carlenderentity = new CarLenderEntity();
		carlenderentity.setOrgid(orgid);
		carlenderentity.setLenderName(lenderName);
		carlenderentity.setTelephone(telephone);
		carlenderentity.setResourceid(resourceId);
		carlenderentity.setPrivileges(resourceName);
		carlenderentity.setPrivilegestile(resourceTitle);
		carlenderentity.setPrivilegesurl(anchor1.toString());
		carlenderentity.setImageName(imageName);
		carlenderentity.setUrl(url.toString());
		carlenderentity.setUrlreal(urlreal.toString());
		carlenderentity.setDescription(description);
		carlenderentity.setCreateName(createName);
		carlenderentity.setCreateDate(createDate);
		if (lenderdao.savelenderEntity(carlenderentity)) {
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * 车辆删除
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData deletelender(TransData transData)
			throws BusinessException {
		String id = (String) transData.getViewMap().get("id");
		lenderdao.deletelenderEntity(id);
		transData.setObj(true);
		return transData;
	}

	/**
	 * 编辑查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData lenderEdit(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		String id = map.get("id") + "";
		CarLenderEntity entity = lenderdao.getlenderEntity(id);
		transData.setObj(entity);
		return transData;
	}

	/**
	 * 编辑保存
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData lenderEditSave(TransData transData)
			throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String id = (String) map.get("lender_id");
		String lenderName = (String) map.get("lenderName");
		String anchor = (String) map.get("anchor");
		String telephone = (String) map.get("telephone");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		String orgid = (String) map.get("orgid");
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray1 = anchor.split("-");
		String resourceId = strarray1[0];
		String resourceTitle = strarray1[1];
		String resourceName = strarray1[2];
		StringBuffer anchor1 = new StringBuffer("");
		anchor1.append(resource_request);
		anchor1.append(resourceId);

		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);

		CarLenderEntity carlenderentity = new CarLenderEntity();
		carlenderentity.setId(id);
		carlenderentity.setOrgid(orgid);
		carlenderentity.setLenderName(lenderName);
		carlenderentity.setResourceid(resourceId);
		carlenderentity.setPrivileges(resourceName);
		carlenderentity.setPrivilegestile(resourceTitle);
		carlenderentity.setPrivilegesurl(anchor1.toString());
		carlenderentity.setImageName(imageName);
		carlenderentity.setTelephone(telephone);
		carlenderentity.setUrl(url.toString());
		carlenderentity.setUrlreal(urlreal.toString());
		carlenderentity.setDescription(description);
		carlenderentity.setCreateName(createName);
		carlenderentity.setCreateDate(createDate);
		if (lenderdao.lender_update(carlenderentity)) {
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * http请求根据品牌查询车辆列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData lenderQuery(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("lenderQuery-request:"+map);
		List<Map<String, Object>> lenderlist = lenderdao.querylenderList1(transData.getPageInfo());
		if (lenderlist == null) {
			transData.setExpCode("-1");
			transData.setExpMsg("fail");
		} else {
			transData.setObj(lenderlist);
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
	public TransData getResources(TransData transData)
			throws BusinessException {
		List<Map<String, Object>> orgList = lenderdao.getResources();
		transData.setObj(orgList);
		transData.setExpMsg("success");
		return transData;
	}
}
