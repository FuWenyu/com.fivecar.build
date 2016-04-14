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
import com.infohold.cms.dao.ThirdPartySalesDao;
import com.infohold.cms.entity.ThirdPartySalesEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("tpsalesService")
public class ThirdPartySalesService implements IBusinessService {

	@Autowired
	private ThirdPartySalesDao tpsalesdao;

	private static String service_name = CustomPropertyUtil
			.getProperties("service_name");
	
	private DateUtil dateutil = new DateUtil();
	
	private Logger logger = Logger.getLogger(ThirdPartySalesService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T37001")) {
			return this.findtpsalesList(transData);
		} else if (tradCode.equals("T37002")) {
			return this.querydealer(transData);
		} else if (tradCode.equals("T37003")) {
			return this.savetpsales(transData);
		} else if (tradCode.equals("T37004")) {
			return this.deletetpsales(transData);
		} else if (tradCode.equals("T37005")) {
			return this.tpsalesEdit(transData);
		} else if (tradCode.equals("T37006")) {
			return this.tpsalesEditSave(transData);
		} else if (tradCode.equals("T37007")) {
			return this.tpsalesQuery(transData);
		}
		return transData;
	}

	/**
	 * 4s店销售员列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData findtpsalesList(TransData transData)
			throws BusinessException {
		List<Map<String, Object>> orgList = tpsalesdao
				.querytpsalesList(transData.getPageInfo());
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
	public TransData querydealer(TransData transData) throws BusinessException {
		List<Map<String, Object>> orgList = tpsalesdao.queryDealerList(transData
				.getPageInfo());
		transData.setObj(orgList);
		return transData;
	}

	public TransData savetpsales(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String tpsalesName = (String) map.get("tpsalesName");
		String phone = (String) map.get("phone");
		String wxQQ = (String) map.get("wxQQ");
		String dealer = (String) map.get("dealer");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray = dealer.split("-");
		String belong = strarray[0];
		String belongName = strarray[1];
		
		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);

		ThirdPartySalesEntity ThirdPartySalesEntity = new ThirdPartySalesEntity();
		ThirdPartySalesEntity.setSalesName(tpsalesName);
		ThirdPartySalesEntity.setPhone(phone);
		ThirdPartySalesEntity.setWxQQ(wxQQ);
		ThirdPartySalesEntity.setBelong(belong);
		ThirdPartySalesEntity.setBelongName(belongName);
		ThirdPartySalesEntity.setImageName(imageName);
		ThirdPartySalesEntity.setUrl(url.toString());
		ThirdPartySalesEntity.setUrlreal(urlreal.toString());
		ThirdPartySalesEntity.setDescription(description);
		ThirdPartySalesEntity.setCreateName(createName);
		ThirdPartySalesEntity.setCreateDate(createDate);
		if (tpsalesdao.savetpsalesEntity(ThirdPartySalesEntity)) {
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * 4s店销售员删除
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData deletetpsales(TransData transData)
			throws BusinessException {
		String id = (String) transData.getViewMap().get("id");
		tpsalesdao.deletetpsalesEntity(id);
		transData.setObj(true);
		return transData;
	}

	/**
	 * 4s店销售员编辑查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData tpsalesEdit(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		String id = map.get("id") + "";
		ThirdPartySalesEntity entity = tpsalesdao.gettpsalesEntity(id);
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
	public TransData tpsalesEditSave(TransData transData)
			throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String id = (String) map.get("tpsales_id");
		String tpsalesName = (String) map.get("tpsalesName");
		String phone = (String) map.get("phone");
		String wxQQ = (String) map.get("wxQQ");
		String dealer = (String) map.get("dealer");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		Timestamp createDate = dateutil.getTimestamp();

		String[] strarray = dealer.split("-");
		String belong = strarray[0];
		String belongName = strarray[1];
		
		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);

		ThirdPartySalesEntity ThirdPartySalesEntity = new ThirdPartySalesEntity();
		ThirdPartySalesEntity.setId(id);
		ThirdPartySalesEntity.setSalesName(tpsalesName);
		ThirdPartySalesEntity.setPhone(phone);
		ThirdPartySalesEntity.setWxQQ(wxQQ);
		ThirdPartySalesEntity.setBelong(belong);
		ThirdPartySalesEntity.setBelongName(belongName);
		ThirdPartySalesEntity.setImageName(imageName);
		ThirdPartySalesEntity.setUrl(url.toString());
		ThirdPartySalesEntity.setUrlreal(urlreal.toString());
		ThirdPartySalesEntity.setDescription(description);
		ThirdPartySalesEntity.setCreateName(createName);
		ThirdPartySalesEntity.setCreateDate(createDate);
		if (tpsalesdao.tpsales_update(ThirdPartySalesEntity)) {
			transData.setExpMsg("success");
		}
		return transData;
	}

	/**
	 * http请求根据4s店查询销售员列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData tpsalesQuery(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("tpsalesQuery-request:"+map);
		String carbrand = (String) map.get("carbrand");
		List<Map<String, Object>> tpsaleslist = tpsalesdao.querytpsalesList1(
				carbrand, transData.getPageInfo());
		if (tpsaleslist == null) {
			transData.setExpCode("-1");
			transData.setExpMsg("fail");
		} else {
			transData.setObj(tpsaleslist);
			transData.setExpCode("1");
			transData.setExpMsg("success");
		}
		return transData;
	}

}
