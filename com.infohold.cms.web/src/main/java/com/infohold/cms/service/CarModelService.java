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
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.CarModelDao;
import com.infohold.cms.entity.CarModelEntity;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("modelService")
public class CarModelService implements IBusinessService {

	@Autowired
	private CarModelDao modeldao;

	@Autowired
	private SysConfigUtil sysConfigUtil;

	private DateUtil dateutil = new DateUtil();
	
	private Logger logger = Logger.getLogger(CarModelService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T26001")) {
			return this.findmodelList(transData);
		} else if (tradCode.equals("T26002")) {
			return this.querybrand(transData);
		} else if (tradCode.equals("T26003")) {
			return this.savemodel(transData);
		} else if (tradCode.equals("T26004")) {
			return this.deletemodel(transData);
		} else if (tradCode.equals("T26005")) {
			return this.modelEdit(transData);
		} else if (tradCode.equals("T26006")) {
			return this.modelEditSave(transData);
		} else if (tradCode.equals("T26007")) {
			return this.modelQuery(transData);
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
	public TransData findmodelList(TransData transData)
			throws BusinessException {
		UserSession session = transData.getUserSession();
		String orgid = session.getBranchNo();
		List<Map<String, Object>> orgList = modeldao
				.querymodelList(transData.getPageInfo(),orgid);
		transData.setObj(orgList);
		return transData;
	}

	/**
	 * 品牌列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData querybrand(TransData transData) throws BusinessException {
		UserSession session = transData.getUserSession();
		String orgid = session.getBranchNo();
		List<Map<String, Object>> orgList = modeldao.queryVehicleList(transData
				.getPageInfo(),orgid);
		transData.setObj(orgList);
		return transData;
	}

	public TransData savemodel(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String modelName = (String) map.get("modelName");
		String originalprice = (String) map.get("originalprice");
		String discountprice = (String) map.get("discountprice");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String vehicle = (String) map.get("vehicle");
		String Carabstract = (String) map.get("Carabstract");
		String createName = session.getUserName();
		String orgid = session.getBranchNo();
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray = vehicle.split("-");
		String vehicleid = strarray[0];
		String vehicleName = strarray[1];
		String carbrandid = strarray[2];
		String carbrandname = strarray[3];

		StringBuffer urlreal = new StringBuffer("http://");
		urlreal.append(sysConfigUtil.getCfgInfo("service_ip"));
		urlreal.append("/");
		urlreal.append(sysConfigUtil.getCfgInfo("service_name"));
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("http://");
		url.append(sysConfigUtil.getCfgInfo("service_ip"));
		url.append("/");
		url.append(sysConfigUtil.getCfgInfo("service_name"));
		url.append("/upload/image/");
		url.append(imageName);

		CarModelEntity carmodelentity = new CarModelEntity();
		carmodelentity.setOrgid(orgid);
		carmodelentity.setCarbrand(carbrandname);
		carmodelentity.setCarbrandid(carbrandid);
		carmodelentity.setModelName(modelName);
		carmodelentity.setOriginalprice(originalprice);
		carmodelentity.setDiscountprice(discountprice);
		carmodelentity.setVehicleid(vehicleid);
		carmodelentity.setVehicle(vehicleName);
		carmodelentity.setImageName(imageName);
		carmodelentity.setUrl(url.toString());
		carmodelentity.setUrlreal(urlreal.toString());
		carmodelentity.setDescription(description);
		carmodelentity.setCreateName(createName);
		carmodelentity.setCreateDate(createDate);
		carmodelentity.setCarabstract(Carabstract);
		if (modeldao.savemodelEntity(carmodelentity)) {
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
	public TransData deletemodel(TransData transData)
			throws BusinessException {
		String id = (String) transData.getViewMap().get("id");
		modeldao.deletemodelEntity(id);
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
	public TransData modelEdit(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		String id = map.get("id") + "";
		CarModelEntity entity = modeldao.getmodelEntity(id);
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
	public TransData modelEditSave(TransData transData)
			throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String id = (String) map.get("model_id");
		String modelName = (String) map.get("modelName");
		String originalprice = (String) map.get("originalprice");
		String discountprice = (String) map.get("discountprice");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String vehicle = (String) map.get("vehicle");
		String Carabstract = (String) map.get("Carabstract");
		String createName = session.getUserName();
		String orgid = session.getBranchNo();
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray = vehicle.split("-");
		String vehicleid = strarray[0];
		String vehicleName = strarray[1];
		String carbrandid = strarray[2];
		String carbrandname = strarray[3];

		StringBuffer urlreal = new StringBuffer("http://");
		urlreal.append(sysConfigUtil.getCfgInfo("service_ip"));
		urlreal.append("/");
		urlreal.append(sysConfigUtil.getCfgInfo("service_name"));
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("http://");
		url.append(sysConfigUtil.getCfgInfo("service_ip"));
		url.append("/");
		url.append(sysConfigUtil.getCfgInfo("service_name"));
		url.append("/upload/image/");
		url.append(imageName);

		CarModelEntity carmodelentity = new CarModelEntity();
		carmodelentity.setId(id);
		carmodelentity.setOrgid(orgid);
		carmodelentity.setCarbrand(carbrandname);
		carmodelentity.setCarbrandid(carbrandid);
		carmodelentity.setModelName(modelName);
		carmodelentity.setOriginalprice(originalprice);
		carmodelentity.setDiscountprice(discountprice);
		carmodelentity.setVehicleid(vehicleid);
		carmodelentity.setVehicle(vehicleName);
		carmodelentity.setImageName(imageName);
		carmodelentity.setUrl(url.toString());
		carmodelentity.setUrlreal(urlreal.toString());
		carmodelentity.setDescription(description);
		carmodelentity.setCreateName(createName);
		carmodelentity.setCreateDate(createDate);
		carmodelentity.setCarabstract(Carabstract);
		if (modeldao.model_update(carmodelentity)) {
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
	public TransData modelQuery(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("modelQuery-request:"+map);
		String carbrand = (String) map.get("carbrand");
		List<Map<String, Object>> modellist = modeldao.querymodelList1(
				carbrand, transData.getPageInfo());
		if (modellist == null) {
			transData.setExpCode("-1");
			transData.setExpMsg("fail");
		} else {
			transData.setObj(modellist);
			transData.setExpCode("1");
			transData.setExpMsg("success");
		}
		return transData;
	}

}
