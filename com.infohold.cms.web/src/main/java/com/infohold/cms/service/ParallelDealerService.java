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
import com.infohold.cms.dao.OrganizationDao;
import com.infohold.cms.dao.ParallelDealerDao;
import com.infohold.cms.entity.ParallelDealerEntity;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("padealerService")
public class ParallelDealerService implements IBusinessService {

	@Autowired
	private ParallelDealerDao dealerdao;
	@Autowired
	private OrganizationDao orgdao;

	@Autowired
	private SysConfigUtil sysConfigUtil;

	private DateUtil dateutil = new DateUtil();

	private Logger logger = Logger.getLogger(ParallelDealerService.class);
	
	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T33001")) {
			return this.finddealerList(transData);
		} else if (tradCode.equals("T33002")) {
			return this.querybrand(transData);
		} else if (tradCode.equals("T33003")) {
			return this.savedealer(transData);
		} else if (tradCode.equals("T33004")) {
			return this.deletedealer(transData);
		} else if (tradCode.equals("T33005")) {
			return this.dealerEdit(transData);
		} else if (tradCode.equals("T33006")) {
			return this.updatePictureEntity(transData);
		} else if (tradCode.equals("T33007")) {
			return this.dealerQuery(transData);
		} else if (tradCode.equals("T33008")) {
			return this.getResources(transData);
	}
		return transData;
	}

	/**
	 * 进口车经销商列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData finddealerList(TransData transData)
			throws BusinessException {
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
	 * 平行进口车经销商列表
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
			position = "<iframe class=\"ueditor_baidumap\" src=\"./ueditor/dialogs/map/show.html#center=121.807603,39.058436&zoom=13&width=530&height=340&markers=121.805375,39.05796&markerStyles=l,A\" frameborder=\"0\" width=\"534\" height=\"344\"></iframe>";
		}
		String[] strarray = carbrandall.split("-");
		String carbrandid = strarray[0];
		String carbrandname = strarray[1];
		
		String[] strarray1 = anchor.split("-");
		String resourceId = strarray1[0];
		String resourceTitle = strarray1[1];
		String resourceName = strarray1[2];
		StringBuffer anchor1 = new StringBuffer("");
		anchor1.append(sysConfigUtil.getCfgInfo("resource_request"));
		anchor1.append(resourceId);
		
		ParallelDealerEntity ParallelDealerEntity = new ParallelDealerEntity();
		ParallelDealerEntity.setResourceid(resourceId);
		ParallelDealerEntity.setOrgid(orgid);
		ParallelDealerEntity.setPrivileges(resourceName);
		ParallelDealerEntity.setPrivilegestile(resourceTitle);
		ParallelDealerEntity.setPrivilegesurl(anchor1.toString());
		ParallelDealerEntity.setDealerName(dealerName);
		ParallelDealerEntity.setCarbrandid(carbrandid);
		ParallelDealerEntity.setCarbrand(carbrandname);
		ParallelDealerEntity.setTelephone(telephone);
		ParallelDealerEntity.setAddr(addr);
		ParallelDealerEntity.setPosition(position);
		ParallelDealerEntity.setCreateDate(createDate);
		ParallelDealerEntity.setCreateName(createName);
		ParallelDealerEntity.setDescription(description);
		if (dealerdao.savedealerEntity(ParallelDealerEntity)) {
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
	public TransData deletedealer(TransData transData)
			throws BusinessException {
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
		ParallelDealerEntity entity = dealerdao.getdealerEntity(id);
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
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String id = (String)  map.get("dealer_id");
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
			position = "<iframe class=\"ueditor_baidumap\" src=\"./ueditor/dialogs/map/show.html#center=121.807603,39.058436&zoom=13&width=530&height=340&markers=121.805375,39.05796&markerStyles=l,A\" frameborder=\"0\" width=\"534\" height=\"344\"></iframe>";
		}
		String[] strarray = carbrandall.split("-");
		String carbrandid = strarray[0];
		String carbrandname = strarray[1];
		
		String[] strarray1 = anchor.split("-");
		String resourceId = strarray1[0];
		String resourceTitle = strarray1[1];
		String resourceName = strarray1[2];
		StringBuffer anchor1 = new StringBuffer("");
		anchor1.append(sysConfigUtil.getCfgInfo("resource_request"));
		anchor1.append(resourceId);
		
		ParallelDealerEntity ParallelDealerEntity = new ParallelDealerEntity();
		ParallelDealerEntity.setPrivileges(resourceName);
		ParallelDealerEntity.setResourceid(resourceId);
		ParallelDealerEntity.setOrgid(orgid);
		ParallelDealerEntity.setPrivilegestile(resourceTitle);
		ParallelDealerEntity.setPrivilegesurl(anchor1.toString());
		ParallelDealerEntity.setId(id);
		ParallelDealerEntity.setDealerName(dealerName);
		ParallelDealerEntity.setCarbrandid(carbrandid);
		ParallelDealerEntity.setCarbrand(carbrandname);
		ParallelDealerEntity.setTelephone(telephone);
		ParallelDealerEntity.setAddr(addr);
		ParallelDealerEntity.setPosition(position);
		ParallelDealerEntity.setCreateDate(createDate);
		ParallelDealerEntity.setCreateName(createName);
		ParallelDealerEntity.setDescription(description);
		if (dealerdao.dealer_update(ParallelDealerEntity)) {
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
		logger.info("dealerQuery-request:"+map);
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
	public TransData getResources(TransData transData)
			throws BusinessException {
		List<Map<String, Object>> orgList = dealerdao.getResources();
		transData.setObj(orgList);
		transData.setExpMsg("success");
		return transData;
	}
}
