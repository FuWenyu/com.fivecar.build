package com.infohold.cms.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.DealerDao;
import com.infohold.cms.entity.CarDealerEntity;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("dealerService")
public class DealerService implements IBusinessService {

	@Autowired
	private DealerDao dealerdao;

	@Autowired
	private SysConfigUtil sysConfigUtil;

	private DateUtil dateutil = new DateUtil();

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
	public TransData finddealerList(TransData transData)
			throws BusinessException {
		List<Map<String, Object>> orgList = dealerdao
				.querydealerList(transData.getPageInfo());
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
		List<Map<String, Object>> orgList = dealerdao.queryBrandList(transData
				.getPageInfo());
		transData.setObj(orgList);
		return transData;
	}

	public TransData savedealer(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String dealerName = (String) map.get("dealerName");
		String carbrandall = (String) map.get("carbrand");
		String telephone = (String) map.get("telephone");
		String addr = (String) map.get("addr");
		String position = (String) map.get("position");
		String description = (String) map.get("description");
		String createName = session.getUserName();
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray = carbrandall.split("-");
		String carbrandid = strarray[0];
		String carbrandname = strarray[1];
		
		CarDealerEntity CarDealerEntity = new CarDealerEntity();
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
	public TransData dealerQuery(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		String cardbrand = (String) map.get("cardbrand");
		List<Map<String, Object>> dealerlist = dealerdao.querydealerList1(
				cardbrand, transData.getPageInfo());
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

}
