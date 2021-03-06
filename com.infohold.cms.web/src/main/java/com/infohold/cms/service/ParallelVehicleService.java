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
import com.infohold.cms.dao.ParallelDealerDao;
import com.infohold.cms.dao.ParallelModelDao;
import com.infohold.cms.dao.ParallelSalesDao;
import com.infohold.cms.dao.ParallelVehicleDao;
import com.infohold.cms.entity.CarDealerEntity;
import com.infohold.cms.entity.ParallelDealerEntity;
import com.infohold.cms.entity.ParallelVehicleEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("pavehicleService")
public class ParallelVehicleService implements IBusinessService {

	@Autowired
	private ParallelVehicleDao vehicledao;
	@Autowired
	private ParallelDealerDao dealerdao;
	@Autowired
	private ParallelSalesDao salesdao;
	@Autowired
	private ParallelModelDao modeldao;

	private static String service_name = CustomPropertyUtil.getProperties("service_name");
	private static String pavehicle_request = CustomPropertyUtil.getProperties("pavehicle_request");
	private static String service_addr = CustomPropertyUtil.getProperties("service_addr");

	private DateUtil dateutil = new DateUtil();

	private Logger logger = Logger.getLogger(ParallelVehicleService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T32001")) {
			return this.findvehicleList(transData);
		} else if (tradCode.equals("T32002")) {
			return this.querybrand1(transData);
		} else if (tradCode.equals("T32003")) {
			return this.savevehicle(transData);
		} else if (tradCode.equals("T32004")) {
			return this.deletevehicle(transData);
		} else if (tradCode.equals("T32005")) {
			return this.vehicleEdit(transData);
		} else if (tradCode.equals("T32006")) {
			return this.updatePictureEntity(transData);
		} else if (tradCode.equals("T32007")) {
			return this.vehicleQueryBrand(transData);
		} else if (tradCode.equals("T32008")) {
			return this.vehicleWebview(transData);
		} else if (tradCode.equals("T32009")) {
			return this.queryprice(transData);
		} else if (tradCode.equals("T32010")) {
			return this.queryversion(transData);
		} else if (tradCode.equals("T32011")) {
			return this.querydealer(transData);
		} else if (tradCode.equals("T32012")) {
			return this.vehicleQueryPrice(transData);
		} else if (tradCode.equals("T32013")) {
			return this.vehicleQueryVersion(transData);
		} else if (tradCode.equals("T32014")) {
			return this.vehicleQuery(transData);
		} else if (tradCode.equals("T32015")) {
			return this.vehicleQueryDealer(transData);
		} else if (tradCode.equals("T32016")) {
			return this.vehicleQueryLikes(transData);
		} else if (tradCode.equals("T32017")) {
			return this.vehicleWebview(transData);
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
		List<Map<String, Object>> orgList = vehicledao.queryvehicleList(transData.getPageInfo(), orgid);
		transData.setObj(orgList);
		return transData;
	}

	/**
	 * 新增查询列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData querybrand1(TransData transData) throws BusinessException {
		Page page = new Page();
		page.setPageSize(999);
		List<Map<String, Object>> brandList = vehicledao.queryBrandList(page);
		UserSession session = transData.getUserSession();
		String orgid = session.getBranchNo();
		List<Map<String, Object>> dealerList = vehicledao.queryDealerList(transData.getPageInfo(), orgid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("brandList", brandList);
		map.put("dealerList", dealerList);
		transData.setObj(map);
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
		List<Map<String, Object>> orgList = vehicledao.queryBrandList(page);
		transData.setObj(orgList);
		return transData;
	}

	/**
	 * 价格区间列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData queryprice(TransData transData) throws BusinessException {
		Page page = new Page();
		page.setPageSize(999);
		List<Map<String, Object>> orgList = vehicledao.queryPriceList(page);
		transData.setObj(orgList);
		return transData;
	}

	/**
	 * 版本列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData queryversion(TransData transData) throws BusinessException {
		Page page = new Page();
		page.setPageSize(999);
		List<Map<String, Object>> orgList = vehicledao.queryVersionList(page);
		transData.setObj(orgList);
		return transData;
	}

	/**
	 * 经销商列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData querydealer(TransData transData) throws BusinessException {
		Page page = new Page();
		page.setPageSize(999);
		UserSession session = transData.getUserSession();
		String orgid = session.getBranchNo();
		List<Map<String, Object>> orgList = vehicledao.queryDealerList(page, orgid);
		transData.setObj(orgList);
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

		String pricearea = (String) map.get("pricearea");
		String vehicleinfo = (String) map.get("vehicleinfo");
		String vehicleversion = (String) map.get("vehicleversion");
		String whereis = (String) map.get("whereis");
		String salesarea = (String) map.get("salesarea");
		String color = (String) map.get("color");
		String epstandard = (String) map.get("epstandard");
		String wherelook = (String) map.get("wherelook");

		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		String orgid = session.getBranchNo();
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray = carbrandall.split("-");
		String carbrandid = strarray[0];
		String carbrandname = strarray[1];

		String[] strarray1 = pricearea.split("_");
		String pricekey = strarray1[0];
		String pricetagevalue = strarray1[1];

		String[] strarray2 = vehicleversion.split("-");
		String vehicleversionkey = strarray2[0];
		String vehicleversionvalue = strarray2[1];

		String[] strarray3 = dealer.split("-");
		String dealerid = strarray3[0];
		String dealerName = strarray3[1];

		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);

		ParallelVehicleEntity parallelvehicleentity = new ParallelVehicleEntity();
		parallelvehicleentity.setOrgid(orgid);
		parallelvehicleentity.setCarbrand(carbrandname);
		parallelvehicleentity.setCarbrandid(carbrandid);
		parallelvehicleentity.setVehicleName(vehicleName);
		parallelvehicleentity.setPrice(price);

		parallelvehicleentity.setPricekey(pricekey);
		parallelvehicleentity.setPricetagevalue(pricetagevalue);
		parallelvehicleentity.setVehicleinfo(vehicleinfo);
		parallelvehicleentity.setVehicleversionkey(vehicleversionkey);
		parallelvehicleentity.setVehicleversionvalue(vehicleversionvalue);
		parallelvehicleentity.setDealerid(dealerid);
		parallelvehicleentity.setDealerName(dealerName);
		parallelvehicleentity.setWhereis(whereis);
		parallelvehicleentity.setSalesarea(salesarea);
		parallelvehicleentity.setColor(color);
		parallelvehicleentity.setEpstandard(epstandard);
		parallelvehicleentity.setWherelook(wherelook);

		parallelvehicleentity.setImageName(imageName);
		parallelvehicleentity.setUrl(url.toString());
		parallelvehicleentity.setUrlreal(urlreal.toString());
		parallelvehicleentity.setDescription(description);
		// carvehicleentity.setAnchor(anchor+carvehicleentity.getId());
		parallelvehicleentity.setCreateName(createName);
		parallelvehicleentity.setCreateDate(createDate);
		if (vehicledao.savevehicleEntity(parallelvehicleentity)) {
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
		ParallelVehicleEntity entity = vehicledao.getvehicleEntity(id);
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

		String pricearea = (String) map.get("pricearea");
		String vehicleinfo = (String) map.get("vehicleinfo");
		String vehicleversion = (String) map.get("vehicleversion");
		String whereis = (String) map.get("whereis");
		String salesarea = (String) map.get("salesarea");
		String color = (String) map.get("color");
		String epstandard = (String) map.get("epstandard");
		String wherelook = (String) map.get("wherelook");

		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		String orgid = session.getBranchNo();
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray = carbrandall.split("-");
		String carbrandid = strarray[0];
		String carbrandname = strarray[1];

		String[] strarray1 = pricearea.split("_");
		String pricekey = strarray1[0];
		String pricetagevalue = strarray1[1];

		String[] strarray2 = vehicleversion.split("-");
		String vehicleversionkey = strarray2[0];
		String vehicleversionvalue = strarray2[1];

		String[] strarray3 = dealer.split("-");
		String dealerid = strarray3[0];
		String dealerName = strarray3[1];

		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);

		ParallelVehicleEntity parallelvehicleentity = new ParallelVehicleEntity();
		parallelvehicleentity.setId(id);
		parallelvehicleentity.setOrgid(orgid);
		parallelvehicleentity.setCarbrand(carbrandname);
		parallelvehicleentity.setCarbrandid(carbrandid);
		parallelvehicleentity.setVehicleName(vehicleName);
		parallelvehicleentity.setPrice(price);

		parallelvehicleentity.setPricekey(pricekey);
		parallelvehicleentity.setPricetagevalue(pricetagevalue);
		parallelvehicleentity.setVehicleinfo(vehicleinfo);
		parallelvehicleentity.setVehicleversionkey(vehicleversionkey);
		parallelvehicleentity.setVehicleversionvalue(vehicleversionvalue);
		parallelvehicleentity.setDealerid(dealerid);
		parallelvehicleentity.setDealerName(dealerName);
		parallelvehicleentity.setWhereis(whereis);
		parallelvehicleentity.setSalesarea(salesarea);
		parallelvehicleentity.setColor(color);
		parallelvehicleentity.setEpstandard(epstandard);
		parallelvehicleentity.setWherelook(wherelook);

		parallelvehicleentity.setImageName(imageName);
		parallelvehicleentity.setUrl(url.toString());
		parallelvehicleentity.setUrlreal(urlreal.toString());
		parallelvehicleentity.setDescription(description);
		// carvehicleentity.setAnchor(anchor+carvehicleentity.getId());
		parallelvehicleentity.setCreateName(createName);
		parallelvehicleentity.setCreateDate(createDate);
		if (vehicledao.vehicle_update(parallelvehicleentity)) {
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
	public TransData vehicleQueryBrand(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("vehicleQuery-request:" + map);
		String carbrand = (String) map.get("carbrand");
		List<Map<String, Object>> vehiclelist = vehicledao.queryvehicleList1(carbrand, transData.getPageInfo());
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
	 * http请求根据价格区间查询车辆列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData vehicleQueryPrice(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("vehicleQuery-request:" + map);
		String pricekey = (String) map.get("pricekey");
		List<Map<String, Object>> vehiclelist = vehicledao.queryvehicleList2(pricekey, transData.getPageInfo());
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
	 * http请求根据车辆版本查询车辆列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData vehicleQueryVersion(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("vehicleQuery-request:" + map);
		String versionkey = (String) map.get("versionkey");
		List<Map<String, Object>> vehiclelist = vehicledao.queryvehicleList3(versionkey, transData.getPageInfo());
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
	 * http请求根据车辆版本查询车辆列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData vehicleQuery(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("vehicleQuery-request:" + map);

		String carbrand = (String) map.get("carbrand");
		String pricekey = (String) map.get("pricekey");
		String versionkey = (String) map.get("versionkey");
		String userId = (String) map.get("userId");
		try {
			if (userId.equals("null")||userId.equals(" ")||userId==null) {
				userId = "";
			}
		} catch (NullPointerException e) {
			userId = "";
		}
		List<Map<String, Object>> vehiclelist = null;
		int index = 0;
		if (carbrand.equals("all") && pricekey.equals("all") && versionkey.equals("all")) {
			index = 1;
		} else if (!carbrand.equals("all") && pricekey.equals("all") && versionkey.equals("all")) {
			index = 2;
		} else if (carbrand.equals("all") && !pricekey.equals("all") && versionkey.equals("all")) {
			index = 3;
		} else if (carbrand.equals("all") && pricekey.equals("all") && !versionkey.equals("all")) {
			index = 4;
		} else if (!carbrand.equals("all") && !pricekey.equals("all") && versionkey.equals("all")) {
			index = 5;
		} else if (!carbrand.equals("all") && pricekey.equals("all") && !versionkey.equals("all")) {
			index = 6;
		} else if (carbrand.equals("all") && !pricekey.equals("all") && !versionkey.equals("all")) {
			index = 7;
		} else if (!carbrand.equals("all") && !pricekey.equals("all") && !versionkey.equals("all")) {
			index = 8;
		}
		vehiclelist = vehicledao.queryvehicleList4(index, carbrand, pricekey, versionkey,userId, transData.getPageInfo());

		if (vehiclelist == null) {
			transData.setExpCode("1");
			transData.setExpMsg("暂时没有这样的车型哦！");
		} else {
			transData.setObj(vehiclelist);
			transData.setExpCode("1");
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * http请求根据车辆经销商查询车辆列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData vehicleQueryDealer(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("vehicleQueryDealer-request:" + map);
		String dealerid = (String) map.get("dealerid");
		String userId = (String) map.get("userId");
		try {
			if (userId.equals("null")||userId.equals(" ")||userId==null) {
				userId = "";
			}
		} catch (NullPointerException e) {
			userId = "";
		}
		List<Map<String, Object>> vehiclelist = null;
		vehiclelist = vehicledao.queryvehicleList5(dealerid, userId,transData.getPageInfo());
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
	 * http请求模糊查询车辆列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData vehicleQueryLikes(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("vehicleQueryDealer-request:" + map);
		String like = (String) map.get("like");
		List<Map<String, Object>> vehiclelist = null;
		vehiclelist = vehicledao.queryvehicleList6(like, transData.getPageInfo());
		if (vehiclelist == null) {
			transData.setExpCode("1");
			transData.setExpMsg("null");
		} else {
			transData.setObj(vehiclelist);
			transData.setExpCode("1");
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * http请求模糊查询车辆列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData vehicleWebview(TransData transData) throws BusinessException {
		Map<String, Object> map1 = transData.getViewMap();
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("vehicleQueryDealer-request:" + map1);
		String vehicleid = (String) map1.get("vehicleid");
		ParallelVehicleEntity pavehicle = vehicledao.getvehicleEntity(vehicleid);
		map.put("vehicle", pavehicle);
		Page page = new Page();
		page.setPageSize(999);
		transData.setPageInfo(page);
		/*
		 * if (delrid == null || delrid.equals(" ") || delrid.equals("")) {
		 * ParallelDealerEntity dealer =
		 * dealerdao.getdealerEntity(pavehicle.getDealerid()); map.put("dealer",
		 * dealer); List<Map<String, Object>> saleslist =
		 * salesdao.querysalesList1(dealer.getId(), transData.getPageInfo());
		 * map.put("saleslist", saleslist); } else {
		 */
		ParallelDealerEntity dealer = dealerdao.getdealerEntity(pavehicle.getDealerid());
		map.put("dealer", dealer);
		List<Map<String, Object>> saleslist = salesdao.querysalesList1(dealer.getId(), transData.getPageInfo());
		map.put("saleslist", saleslist);
		// }
		StringBuffer url = new StringBuffer(pavehicle_request);
		url.append("dealerid=");
		map.put("url", url.toString());
		map.put("server", service_addr);
		logger.info("vehicleQueryDealer-request:" + map);
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
	public ParallelVehicleEntity VehicleQueryPage(String id) throws BusinessException {
		ParallelVehicleEntity entity = vehicledao.getvehicleEntity(id);
		return entity;
	}

	public List<Map<String, Object>> querydealerListPage(String id, Page page) throws BusinessException {
		page.setPageSize(999);
		List<Map<String, Object>> orglist = dealerdao.querydealerListPage(id, page);
		return orglist;
	}

	public ParallelDealerEntity querydealerPage(String id) throws BusinessException {
		ParallelDealerEntity entity = dealerdao.getdealerEntity(id);
		return entity;
	}

	public List<Map<String, Object>> querymodelPage(String id, Page page) throws BusinessException {
		page.setPageSize(999);
		List<Map<String, Object>> modellist = modeldao.querymodelList1(id, page);
		return modellist;
	}

	public List<Map<String, Object>> salesQueryPage(String dealer, Page page, TransData transData)
			throws BusinessException {
		page.setPageSize(999);
		transData.setPageInfo(page);
		List<Map<String, Object>> saleslist = salesdao.querysalesList1(dealer, transData.getPageInfo());
		return saleslist;
	}
}
