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
import com.infohold.cms.dao.VehicleDao;
import com.infohold.cms.entity.CarVehicleEntity;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("vehicleService")
public class VehicleService implements IBusinessService {

	@Autowired
	private VehicleDao vehicledao;

	@Autowired
	private SysConfigUtil sysConfigUtil;

	private DateUtil dateutil = new DateUtil();
	
	private Logger logger = Logger.getLogger(VehicleService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T23001")) {
			return this.findvehicleList(transData);
		} else if (tradCode.equals("T23002")) {
			return this.querybrand(transData);
		} else if (tradCode.equals("T23003")) {
			return this.savevehicle(transData);
		} else if (tradCode.equals("T23004")) {
			return this.deletevehicle(transData);
		} else if (tradCode.equals("T23005")) {
			return this.vehicleEdit(transData);
		} else if (tradCode.equals("T23006")) {
			return this.updatePictureEntity(transData);
		} else if (tradCode.equals("T23007")) {
			return this.vehicleQuery(transData);
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
	public TransData findvehicleList(TransData transData)
			throws BusinessException {
		List<Map<String, Object>> orgList = vehicledao
				.queryvehicleList(transData.getPageInfo());
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
		List<Map<String, Object>> orgList = vehicledao.queryBrandList(transData
				.getPageInfo());
		transData.setObj(orgList);
		return transData;
	}

	public TransData savevehicle(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String vehicleName = (String) map.get("vehicleName");
		String carbrandall = (String) map.get("carbrand");
		String price = (String) map.get("price");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray = carbrandall.split("-");
		String carbrandid = strarray[0];
		String carbrandname = strarray[1];

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

		CarVehicleEntity carvehicleentity = new CarVehicleEntity();
		carvehicleentity.setCarbrand(carbrandname);
		carvehicleentity.setCarbrandid(carbrandid);
		carvehicleentity.setVehicleName(vehicleName);
		carvehicleentity.setPrice(price);
		carvehicleentity.setImageName(imageName);
		carvehicleentity.setUrl(url.toString());
		carvehicleentity.setUrlreal(urlreal.toString());
		carvehicleentity.setDescription(description);
		carvehicleentity.setCreateName(createName);
		carvehicleentity.setCreateDate(createDate);
		if (vehicledao.savevehicleEntity(carvehicleentity)) {
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
	public TransData deletevehicle(TransData transData)
			throws BusinessException {
		String id = (String) transData.getViewMap().get("id");
		vehicledao.deletevehicleEntity(id);
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
	public TransData vehicleEdit(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		String id = map.get("id") + "";
		CarVehicleEntity entity = vehicledao.getvehicleEntity(id);
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
	public TransData updatePictureEntity(TransData transData)
			throws BusinessException {
		// 页面数据
		transData.setExpMsg("success");
		return transData;
	}

	/**
	 * http请求根据品牌查询车辆列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData vehicleQuery(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("vehicleQuery-request:"+map);
		String carbrand = (String) map.get("carbrand");
		List<Map<String, Object>> vehiclelist = vehicledao.queryvehicleList1(
				carbrand, transData.getPageInfo());
		if (vehiclelist == null) {
			transData.setExpCode("-1");
			transData.setExpMsg("fail");
		} else {
			transData.setObj(vehiclelist);
			transData.setExpCode("1");
			transData.setExpMsg("success");
		}
		return transData;
	}

}
