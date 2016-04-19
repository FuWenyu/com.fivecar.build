package com.infohold.cms.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.CarDealerDao;
import com.infohold.cms.dao.CarModelDao;
import com.infohold.cms.dao.CarSalesDao;
import com.infohold.cms.dao.CarVehicleDao;
import com.infohold.cms.entity.CarDealerEntity;
import com.infohold.cms.entity.CarSalesEntity;
import com.infohold.cms.entity.CarVehicleEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("vehicleService")
public class CarVehicleService implements IBusinessService {

	@Autowired
	private CarVehicleDao vehicledao;
	@Autowired
	private CarDealerDao dealerdao;
	@Autowired
	private CarSalesDao salesdao;
	@Autowired
	private CarModelDao modeldao;

	private static String service_name = CustomPropertyUtil
			.getProperties("service_name");
	
	private static String service_addr = CustomPropertyUtil
			.getProperties("service_addr");
	
	private static String system_webview = CustomPropertyUtil
			.getProperties("system_webview");
	
	private DateUtil dateutil = new DateUtil();

	private Logger logger = Logger.getLogger(CarVehicleService.class);

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
		}else if (tradCode.equals("T23008")) {
			return this.vechicleWebview(transData);
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
	public TransData findvehicleList(TransData transData) throws BusinessException {
		UserSession session = transData.getUserSession();
		String orgid = session.getBranchNo();
		List<Map<String, Object>> orgList = vehicledao.queryvehicleList(transData.getPageInfo(),orgid);
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
		Page page = new Page();
		page.setPageSize(999);
		List<Map<String, Object>> brandList = vehicledao.queryBrandList(page);
		UserSession session = transData.getUserSession();
		String orgid = session.getBranchNo();
		List<Map<String, Object>> dealerList = salesdao.queryDealerList(transData
				.getPageInfo(),orgid);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("brandList", brandList);
		map.put("dealerList", dealerList);
		transData.setObj(map);
		return transData;
	}

	public TransData savevehicle(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String vehicleName = (String) map.get("vehicleName");
		String carbrandall = (String) map.get("carbrand");
		String dealer = (String) map.get("dealer");
		String price = (String) map.get("price");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		String orgid = session.getBranchNo();
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray = carbrandall.split("-");
		String carbrandid = strarray[0];
		String carbrandname = strarray[1];
		
		String[] strarray1 = dealer.split("-");
		String belong = strarray1[0];
		String belongName = strarray1[1];

		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);

		CarVehicleEntity carvehicleentity = new CarVehicleEntity();
		carvehicleentity.setOrgid(orgid);
		carvehicleentity.setBelong(belong);
		carvehicleentity.setBelongName(belongName);
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
	public TransData deletevehicle(TransData transData) throws BusinessException {
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
	public TransData updatePictureEntity(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String id = (String) map.get("vehicle_id");
		String vehicleName = (String) map.get("vehicleName");
		String carbrandall = (String) map.get("carbrand");
		String dealer = (String) map.get("dealer");
		String price = (String) map.get("price");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		String orgid = session.getBranchNo();
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray = carbrandall.split("-");
		String carbrandid = strarray[0];
		String carbrandname = strarray[1];

		String[] strarray1 = dealer.split("-");
		String belong = strarray1[0];
		String belongName = strarray1[1];
		
		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);

		CarVehicleEntity carvehicleentity = new CarVehicleEntity();
		carvehicleentity.setId(id);
		carvehicleentity.setOrgid(orgid);
		carvehicleentity.setBelong(belong);
		carvehicleentity.setBelongName(belongName);
		carvehicleentity.setCarbrand(carbrandname);
		carvehicleentity.setCarbrandid(carbrandid);
		carvehicleentity.setVehicleName(vehicleName);
		carvehicleentity.setPrice(price);
		carvehicleentity.setImageName(imageName);
		carvehicleentity.setUrl(url.toString());
		carvehicleentity.setUrlreal(urlreal.toString());
		carvehicleentity.setDescription(description);
		// carvehicleentity.setAnchor(anchor+carvehicleentity.getId());
		carvehicleentity.setCreateName(createName);
		carvehicleentity.setCreateDate(createDate);
		if (vehicledao.vehicle_update(carvehicleentity)) {
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
	public TransData vehicleQuery(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("vehicleQuery-request:" + map);
		String carbrand = (String) map.get("carbrand");
		List<Map<String, Object>> vehiclelist = new ArrayList<>();
		if (carbrand.equals("all")) {
			vehiclelist = vehicledao.queryvehicleList2(carbrand, transData.getPageInfo());
		} else {
			vehiclelist = vehicledao.queryvehicleList1(carbrand, transData.getPageInfo());
		}
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
	/**
	 * 车辆webview
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData vechicleWebview(TransData transData) throws BusinessException {
		Map<String, Object> map1 = transData.getViewMap();
		String vehicleid = (String) map1.get("vehicleid");
		String delrid = (String) map1.get("dealerid");
		Page page = new Page();
		page.setPageSize(999);
		Map<String,Object> map = new HashMap<String, Object>();
		//获取车辆信息
		CarVehicleEntity vehicle = vehicledao.getvehicleEntity(vehicleid);
		map.put("vehicle", vehicle);
		//获取4s店和销售员信息
		if (delrid == null || delrid.equals(" ")||delrid.equals("") ) {
			CarDealerEntity dealer = dealerdao.getdealerEntity(vehicle.getBelong());
			map.put("dealer", dealer);
			List<Map<String, Object>> saleslist = salesdao.querysalesList1(dealer.getId(), transData.getPageInfo());
			map.put("saleslist", saleslist);
		} else {
			CarDealerEntity dealer = dealerdao.getdealerEntity(delrid);
			map.put("dealer", dealer);
			List<Map<String, Object>> saleslist = salesdao.querysalesList1(dealer.getId(), transData.getPageInfo());
			map.put("saleslist", saleslist);
		}
		//获取4s店列表
		List<Map<String, Object>> dealerlist = dealerdao.querydealerListPage(vehicle.getCarbrandid(), page);
		map.put("dealerlist", dealerlist);
		//获取车辆对应的车型信息
		List<Map<String, Object>> modellist = modeldao.querymodelList1(vehicleid, page);
		map.put("modellist", modellist);
		//获取
		StringBuffer url = new StringBuffer(system_webview);
		url.append("dealerid=");
		map.put("url", url.toString());
		map.put("server", service_addr);
		transData.setObj(map);
		return transData;
	}
	
	
	/**
	 * 页面查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public CarVehicleEntity VehicleQueryPage(String id) throws BusinessException {
		CarVehicleEntity entity = vehicledao.getvehicleEntity(id);
		return entity;
	}

	public List<Map<String, Object>> querydealerListPage(String id, Page page) throws BusinessException {
		page.setPageSize(999);
		List<Map<String, Object>> orglist = dealerdao.querydealerListPage(id, page);
		return orglist;
	}

	public CarDealerEntity querydealerPage(String id) throws BusinessException {
		CarDealerEntity entity = dealerdao.getdealerEntity(id);
		return entity;
	}

	public List<Map<String, Object>> querymodelPage(String id, Page page) throws BusinessException {
		page.setPageSize(999);
		List<Map<String, Object>> modellist = modeldao.querymodelList1(id, page);
		return modellist;
	}

	public TransData salesQueryPage(String dealer, Page page, TransData transData) throws BusinessException {
		page.setPageSize(2);
		transData.setPageInfo(page);
		List<Map<String, Object>> saleslist = salesdao.querysalesList1(dealer, transData.getPageInfo());
		if (saleslist == null) {
			transData.setExpCode("-1");
			transData.setExpMsg("fail");
		} else {
			transData.setObj(saleslist);
			transData.setExpCode("1");
			transData.setExpMsg("success");
		}
		return transData;
	}
}
