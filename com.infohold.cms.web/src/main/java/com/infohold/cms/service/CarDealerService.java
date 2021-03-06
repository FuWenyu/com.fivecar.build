package com.infohold.cms.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.CarDealerDao;
import com.infohold.cms.dao.OrganizationDao;
import com.infohold.cms.entity.CarDealerEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("dealerService")
public class CarDealerService implements IBusinessService {

	@Autowired
	private CarDealerDao dealerdao;
	@Autowired
	private OrganizationDao orgdao;

	private DateUtil dateutil = new DateUtil();
	
	private static String resource_request = CustomPropertyUtil
			.getProperties("resource_request");

	private Logger logger = Logger.getLogger(CarDealerService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T24001")) {
			return this.finddealerList(transData);
		} else if (tradCode.equals("T24002")) {
			return this.querybrand(transData);
		} else if (tradCode.equals("T24003")) {
			return this.savedealer(transData);
		} else if (tradCode.equals("T24004")) {
			return this.deletedealer(transData);
		} else if (tradCode.equals("T24005")) {
			return this.dealerEdit(transData);
		} else if (tradCode.equals("T24006")) {
			return this.updatePictureEntity(transData);
		} else if (tradCode.equals("T24007")) {
			return this.dealerQuery(transData);
		} else if (tradCode.equals("T24008")) {
			return this.getResources(transData);
		}
		return transData;
	}

	/**
	 * 4s店列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData finddealerList(TransData transData) throws BusinessException {
		UserSession session = transData.getUserSession();
		String orgid = session.getBranchNo();
		List<Map<String, Object>> orgList = dealerdao.querydealerList(transData.getPageInfo(), orgid);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("orgList", orgList);
		map.put("orgid", orgid);
		transData.setObj(map);
		return transData;
	}

	/**
	 * 新增查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData querybrand(TransData transData) throws BusinessException {
		List<Map<String, Object>> brandList = dealerdao.queryBrandList(transData.getPageInfo());
		List<Map<String, Object>> orgList = orgdao.queryOrgn("2", transData.getPageInfo());
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("brandList", brandList);
		map.put("orgList", orgList);
		transData.setObj(map);
		return transData;
	}

	public TransData savedealer(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String dealerName = (String) map.get("dealerName");
		String carbrandall = (String) map.get("carbrand");
		String anchor = (String) map.get("anchor");
		String telephone = (String) map.get("telephone");
		String addr = (String) map.get("addr");
		String position = (String) map.get("position");
		String description = (String) map.get("description");
		String createName = session.getUserName();
		String orgid = (String) map.get("orgid");
		Timestamp createDate = dateutil.getTimestamp();
		if (null == position || "".equals(position) || "null".equals(position)) {
			position = "<iframe class=\"ueditor_baidumap\" src=\"./ueditor/dialogs/map/show.html#center=121.807603,39.058436&zoom=13&width=420&height=340&markers=121.805375,39.05796&markerStyles=l,A\" frameborder=\"0\" width=\"100%\" height=\"344\"></iframe>";
		}else {
			position=position.replace("<p>", "");
			position=position.replace("</p>", "");
			position=position.replace("530", "420");
			position=position.replace("534", "100%");
		}
		String[] strarray = carbrandall.split("-");
		String carbrandid = strarray[0];
		String carbrandname = strarray[1];

		String[] strarray1 = anchor.split("-");
		String resourceId = strarray1[0];
		String resourceTitle = strarray1[1];
		String resourceName = strarray1[2];
		StringBuffer anchor1 = new StringBuffer("");
		anchor1.append(resource_request);
		anchor1.append(resourceId);

		CarDealerEntity CarDealerEntity = new CarDealerEntity();
		CarDealerEntity.setResourceid(resourceId);
		CarDealerEntity.setOrgid(orgid);
		CarDealerEntity.setPrivileges(resourceName);
		CarDealerEntity.setPrivilegestile(resourceTitle);
		CarDealerEntity.setPrivilegesurl(anchor1.toString());
		CarDealerEntity.setDealerName(dealerName);
		CarDealerEntity.setCarbrandid(carbrandid);
		CarDealerEntity.setCarbrand(carbrandname);
		CarDealerEntity.setTelephone(telephone);
		CarDealerEntity.setAddr(addr);
		CarDealerEntity.setPosition(position);
		CarDealerEntity.setCreateDate(createDate);
		CarDealerEntity.setCreateName(createName);
		CarDealerEntity.setDescription(description);
		if (dealerdao.savedealerEntity(CarDealerEntity)) {
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
	public TransData deletedealer(TransData transData) throws BusinessException {
		String id = (String) transData.getViewMap().get("id");
		dealerdao.deletedealerEntity(id);
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
	public TransData dealerEdit(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		String id = map.get("id") + "";
		CarDealerEntity entity = dealerdao.getdealerEntity(id);
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
		// 页面数据
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String id = (String) map.get("dealer_id");
		String anchor = (String) map.get("anchor");
		String dealerName = (String) map.get("dealerName");
		String carbrandall = (String) map.get("carbrand");
		String telephone = (String) map.get("telephone");
		String addr = (String) map.get("addr");
		String position = (String) map.get("position");
		String description = (String) map.get("description");
		String createName = session.getUserName();
		String orgid = (String) map.get("orgid");
		Timestamp createDate = dateutil.getTimestamp();
		if (null == position || "".equals(position) || "null".equals(position)) {
		}else {
			position=position.replace("<p>", "");
			position=position.replace("</p>", "");
			position=position.replace("530", "420");
			position=position.replace("534", "100%");
		}
		String[] strarray = carbrandall.split("-");
		String carbrandid = strarray[0];
		String carbrandname = strarray[1];

		String[] strarray1 = anchor.split("-");
		String resourceId = strarray1[0];
		String resourceTitle = strarray1[1];
		String resourceName = strarray1[2];
		StringBuffer anchor1 = new StringBuffer("");
		anchor1.append(resource_request);
		anchor1.append(resourceId);

		CarDealerEntity CarDealerEntity = new CarDealerEntity();
		CarDealerEntity.setOrgid(orgid);
		CarDealerEntity.setPrivileges(resourceName);
		CarDealerEntity.setResourceid(resourceId);
		CarDealerEntity.setPrivilegestile(resourceTitle);
		CarDealerEntity.setPrivilegesurl(anchor1.toString());
		CarDealerEntity.setId(id);
		CarDealerEntity.setDealerName(dealerName);
		CarDealerEntity.setCarbrandid(carbrandid);
		CarDealerEntity.setCarbrand(carbrandname);
		CarDealerEntity.setTelephone(telephone);
		CarDealerEntity.setAddr(addr);
		CarDealerEntity.setPosition(position);
		CarDealerEntity.setCreateDate(createDate);
		CarDealerEntity.setCreateName(createName);
		CarDealerEntity.setDescription(description);
		if (dealerdao.dealer_update(CarDealerEntity)) {
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * http请求查询4s店信息列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData dealerQuery(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("dealerQuery-request:" + map);
		String dealer = (String) map.get("dealer");
		if (dealer.equals("dealer")) {
			List<Map<String, Object>> dealerlist = dealerdao.querydealerList1(transData.getPageInfo());
			if (dealerlist == null) {
				transData.setExpCode("-1");
				transData.setExpMsg("fail");
			} else {
				transData.setObj(dealerlist);
				transData.setExpCode("1");
				transData.setExpMsg("success");
			}
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
		List<Map<String, Object>> orgList = dealerdao.getResources();
		transData.setObj(orgList);
		transData.setExpMsg("success");
		return transData;
	}
}
