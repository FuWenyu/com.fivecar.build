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
import com.infohold.cms.basic.util.StrUtil;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.ThirdPartyDealerDao;
import com.infohold.cms.entity.ThirdPartyDealerEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("tpdealerService")
public class ThirdPartyDealerService implements IBusinessService {

	@Autowired
	private ThirdPartyDealerDao tpdealerdao;

	private static String resource_request = CustomPropertyUtil
			.getProperties("resource_request");

	private DateUtil dateutil = new DateUtil();

	private Logger logger = Logger.getLogger(ThirdPartyDealerService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T36001")) {
			return this.finddealerList(transData);
		} else if (tradCode.equals("T36002")) {
			return this.querybrand(transData);
		} else if (tradCode.equals("T36003")) {
			return this.savedealer(transData);
		} else if (tradCode.equals("T36004")) {
			return this.deletedealer(transData);
		} else if (tradCode.equals("T36005")) {
			return this.dealerEdit(transData);
		} else if (tradCode.equals("T36006")) {
			return this.updatePictureEntity(transData);
		} else if (tradCode.equals("T36007")) {
			return this.dealerQuery(transData);
		} else if (tradCode.equals("T36008")) {
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
		List<Map<String, Object>> orgList = tpdealerdao.querydealerList(transData.getPageInfo());
		transData.setObj(orgList);
		return transData;
	}

	/**
	 * 4s店列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData querybrand(TransData transData) throws BusinessException {
		List<Map<String, Object>> orgList = tpdealerdao.queryBrandList(transData.getPageInfo());
		transData.setObj(orgList);
		return transData;
	}

	public TransData savedealer(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String tpdealerName = (String) map.get("tpdealerName");
		String thirdparty_type = (String) map.get("thirdparty_type");
		String anchor = (String) map.get("anchor");
		String telephone = (String) map.get("telephone");
		String addr = (String) map.get("addr");
		String position = (String) map.get("position");
		String description = (String) map.get("description");
		String createName = session.getUserName();
		Timestamp createDate = dateutil.getTimestamp();
		if (null == position || "".equals(position) || "null".equals(position)) {
			position = "<iframe class=\"ueditor_baidumap\" src=\"./ueditor/dialogs/map/show.html#center=121.807603,39.058436&zoom=13&width=530&height=340&markers=121.805375,39.05796&markerStyles=l,A\" frameborder=\"0\" width=\"534\" height=\"344\"></iframe>";
		}
		boolean maintain = false;
		boolean repair = false;
		boolean parts = false;

		StringBuffer thirdparty_type1 = new StringBuffer();
		String[] params = thirdparty_type.split("&");
		for (int i = 0; i < params.length; i++) {
			String[] p = params[i].split("=");
			if (p.length == 2) {
				thirdparty_type1.append(p[1]);
			}
			if ((params.length - i) > 1) {
				thirdparty_type1.append(",");
			}
			if ("1".equals(p[1])) {
				maintain = true;
			}
			if ("2".equals(p[1])) {
				repair = true;
			}
			if ("3".equals(p[1])) {
				parts = true;
			}
		}
		String[] strarray1 = anchor.split("-");
		String resourceId = strarray1[0];
		String resourceTitle = strarray1[1];
		String resourceName = strarray1[2];
		StringBuffer anchor1 = new StringBuffer("");
		anchor1.append(resource_request);
		anchor1.append(resourceId);

		ThirdPartyDealerEntity ThirdPartyDealerEntity = new ThirdPartyDealerEntity();
		ThirdPartyDealerEntity.setResourceid(resourceId);
		ThirdPartyDealerEntity.setPrivileges(resourceName);
		ThirdPartyDealerEntity.setPrivilegestile(resourceTitle);
		ThirdPartyDealerEntity.setPrivilegesurl(anchor1.toString());
		ThirdPartyDealerEntity.setDealerName(tpdealerName);
		ThirdPartyDealerEntity.setThirdparty_type(thirdparty_type1.toString());
		ThirdPartyDealerEntity.setMaintain(maintain);
		ThirdPartyDealerEntity.setRepair(repair);
		ThirdPartyDealerEntity.setParts(parts);
		ThirdPartyDealerEntity.setTelephone(telephone);
		ThirdPartyDealerEntity.setAddr(addr);
		ThirdPartyDealerEntity.setPosition(position);
		ThirdPartyDealerEntity.setCreateDate(createDate);
		ThirdPartyDealerEntity.setCreateName(createName);
		ThirdPartyDealerEntity.setDescription(description);
		if (tpdealerdao.savedealerEntity(ThirdPartyDealerEntity)) {
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
		tpdealerdao.deletedealerEntity(id);
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
		ThirdPartyDealerEntity entity = tpdealerdao.getdealerEntity(id);
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
		String id = (String) map.get("tpdealer_id");
		String tpdealerName = (String) map.get("tpdealerName");
		String thirdparty_type = (String) map.get("thirdparty_type");
		String anchor = (String) map.get("anchor");
		String telephone = (String) map.get("telephone");
		String addr = (String) map.get("addr");
		String position = (String) map.get("position");
		String description = (String) map.get("description");
		String createName = session.getUserName();
		Timestamp createDate = dateutil.getTimestamp();
		if (null == position || "".equals(position) || "null".equals(position)) {
			position = "<iframe class=\"ueditor_baidumap\" src=\"./ueditor/dialogs/map/show.html#center=121.807603,39.058436&zoom=13&width=530&height=340&markers=121.805375,39.05796&markerStyles=l,A\" frameborder=\"0\" width=\"534\" height=\"344\"></iframe>";
		}
		boolean maintain = false;
		boolean repair = false;
		boolean parts = false;

		StringBuffer thirdparty_type1 = new StringBuffer();
		String[] params = thirdparty_type.split("&");
		for (int i = 0; i < params.length; i++) {
			String[] p = params[i].split("=");
			if (p.length == 2) {
				thirdparty_type1.append(p[1]);
			}
			if ((params.length - i) > 1) {
				thirdparty_type1.append(",");
			}
			if ("1".equals(p[1])) {
				maintain = true;
			}
			if ("2".equals(p[1])) {
				repair = true;
			}
			if ("3".equals(p[1])) {
				parts = true;
			}
		}
		String[] strarray1 = anchor.split("-");
		String resourceId = strarray1[0];
		String resourceTitle = strarray1[1];
		String resourceName = strarray1[2];
		StringBuffer anchor1 = new StringBuffer("");
		anchor1.append(resource_request);
		anchor1.append(resourceId);

		ThirdPartyDealerEntity ThirdPartyDealerEntity = new ThirdPartyDealerEntity();
		ThirdPartyDealerEntity.setId(id);
		ThirdPartyDealerEntity.setResourceid(resourceId);
		ThirdPartyDealerEntity.setPrivileges(resourceName);
		ThirdPartyDealerEntity.setPrivilegestile(resourceTitle);
		ThirdPartyDealerEntity.setPrivilegesurl(anchor1.toString());
		ThirdPartyDealerEntity.setDealerName(tpdealerName);
		ThirdPartyDealerEntity.setThirdparty_type(thirdparty_type1.toString());
		ThirdPartyDealerEntity.setMaintain(maintain);
		ThirdPartyDealerEntity.setRepair(repair);
		ThirdPartyDealerEntity.setParts(parts);
		ThirdPartyDealerEntity.setTelephone(telephone);
		ThirdPartyDealerEntity.setAddr(addr);
		ThirdPartyDealerEntity.setPosition(position);
		ThirdPartyDealerEntity.setCreateDate(createDate);
		ThirdPartyDealerEntity.setCreateName(createName);
		ThirdPartyDealerEntity.setDescription(description);
		if (tpdealerdao.dealer_update(ThirdPartyDealerEntity)) {
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
		String thirdparty_type = (String) map.get("thirdparty_type");
		List<Map<String, Object>> dealerlist = tpdealerdao.querydealerList1(transData.getPageInfo(), thirdparty_type);
		if (dealerlist == null) {
			transData.setExpCode("-1");
			transData.setExpMsg("fail");
		} else {
			transData.setObj(dealerlist);
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
		List<Map<String, Object>> orgList = tpdealerdao.getResources();
		transData.setObj(orgList);
		transData.setExpMsg("success");
		return transData;
	}
	
}
