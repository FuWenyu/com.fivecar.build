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
import com.infohold.cms.dao.ParallelModelDao;
import com.infohold.cms.entity.ParallelVehicleCfgEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("pamodelService")
public class ParallelVehicleCfgService implements IBusinessService {

	@Autowired
	private ParallelModelDao modeldao;

	private static String service_name = CustomPropertyUtil
			.getProperties("service_name");
	
	private DateUtil dateutil = new DateUtil();
	
	private Logger logger = Logger.getLogger(ParallelVehicleCfgService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T35001")) {
			return this.findmodelList(transData);
		} else if (tradCode.equals("T35002")) {
			return this.querybrand(transData);
		} else if (tradCode.equals("T35003")) {
			return this.savemodel(transData);
		} else if (tradCode.equals("T35004")) {
			return this.deletemodel(transData);
		} else if (tradCode.equals("T35005")) {
			return this.modelEdit(transData);
		} else if (tradCode.equals("T35006")) {
			return this.modelEditSave(transData);
		} else if (tradCode.equals("T35007")) {
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
		List<Map<String, Object>> orgList = modeldao
				.querymodelList(transData.getPageInfo());
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
		List<Map<String, Object>> orgList = modeldao.queryVehicleList(transData
				.getPageInfo());
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
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray = vehicle.split("-");
		String vehicleid = strarray[0];
		String vehicleName = strarray[1];
		String carbrandid = strarray[2];
		String carbrandname = strarray[3];

		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);

		ParallelVehicleCfgEntity ParallelVehicleCfgEntity = new ParallelVehicleCfgEntity();
		ParallelVehicleCfgEntity.setCarbrand(carbrandname);
		ParallelVehicleCfgEntity.setCarbrandid(carbrandid);
		ParallelVehicleCfgEntity.setModelName(modelName);
		ParallelVehicleCfgEntity.setOriginalprice(originalprice);
		ParallelVehicleCfgEntity.setDiscountprice(discountprice);
		ParallelVehicleCfgEntity.setVehicleid(vehicleid);
		ParallelVehicleCfgEntity.setVehicle(vehicleName);
		ParallelVehicleCfgEntity.setImageName(imageName);
		ParallelVehicleCfgEntity.setUrl(url.toString());
		ParallelVehicleCfgEntity.setUrlreal(urlreal.toString());
		ParallelVehicleCfgEntity.setDescription(description);
		ParallelVehicleCfgEntity.setCreateName(createName);
		ParallelVehicleCfgEntity.setCreateDate(createDate);
		ParallelVehicleCfgEntity.setCarabstract(Carabstract);
		if (modeldao.savemodelEntity(ParallelVehicleCfgEntity)) {
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
		ParallelVehicleCfgEntity entity = modeldao.getmodelEntity(id);
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
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray = vehicle.split("-");
		String vehicleid = strarray[0];
		String vehicleName = strarray[1];
		String carbrandid = strarray[2];
		String carbrandname = strarray[3];

		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);

		ParallelVehicleCfgEntity ParallelVehicleCfgEntity = new ParallelVehicleCfgEntity();
		ParallelVehicleCfgEntity.setId(id);
		ParallelVehicleCfgEntity.setCarbrand(carbrandname);
		ParallelVehicleCfgEntity.setCarbrandid(carbrandid);
		ParallelVehicleCfgEntity.setModelName(modelName);
		ParallelVehicleCfgEntity.setOriginalprice(originalprice);
		ParallelVehicleCfgEntity.setDiscountprice(discountprice);
		ParallelVehicleCfgEntity.setVehicleid(vehicleid);
		ParallelVehicleCfgEntity.setVehicle(vehicleName);
		ParallelVehicleCfgEntity.setImageName(imageName);
		ParallelVehicleCfgEntity.setUrl(url.toString());
		ParallelVehicleCfgEntity.setUrlreal(urlreal.toString());
		ParallelVehicleCfgEntity.setDescription(description);
		ParallelVehicleCfgEntity.setCreateName(createName);
		ParallelVehicleCfgEntity.setCreateDate(createDate);
		ParallelVehicleCfgEntity.setCarabstract(Carabstract);
		if (modeldao.model_update(ParallelVehicleCfgEntity)) {
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
