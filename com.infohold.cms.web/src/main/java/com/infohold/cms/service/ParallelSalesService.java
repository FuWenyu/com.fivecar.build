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
import com.infohold.cms.dao.ParallelSalesDao;
import com.infohold.cms.entity.ParallelSalesEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车车辆Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("pasalesService")
public class ParallelSalesService implements IBusinessService {

	@Autowired
	private ParallelSalesDao salesdao;

	private static String service_name = CustomPropertyUtil
			.getProperties("service_name");
	
	private DateUtil dateutil = new DateUtil();
	
	private Logger logger = Logger.getLogger(ParallelSalesService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T34001")) {
			return this.findsalesList(transData);
		} else if (tradCode.equals("T34002")) {
			return this.querydealer(transData);
		} else if (tradCode.equals("T34003")) {
			return this.savesales(transData);
		} else if (tradCode.equals("T34004")) {
			return this.deletesales(transData);
		} else if (tradCode.equals("T34005")) {
			return this.salesEdit(transData);
		} else if (tradCode.equals("T34006")) {
			return this.salesEditSave(transData);
		} else if (tradCode.equals("T34007")) {
			return this.salesQuery(transData);
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
	public TransData findsalesList(TransData transData)
			throws BusinessException {
		UserSession session = transData.getUserSession();
		String orgid = session.getBranchNo();
		List<Map<String, Object>> orgList = salesdao
				.querysalesList(transData.getPageInfo(),orgid);
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
		UserSession session = transData.getUserSession();
		String orgid = session.getBranchNo();
		List<Map<String, Object>> orgList = salesdao.queryDealerList(transData
				.getPageInfo(),orgid);
		transData.setObj(orgList);
		return transData;
	}

	public TransData savesales(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String salesName = (String) map.get("salesName");
		String phone = (String) map.get("phone");
		String wxQQ = (String) map.get("wxQQ");
		String dealer = (String) map.get("dealer");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		String orgid = session.getBranchNo();
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

		ParallelSalesEntity parallelsalesentity = new ParallelSalesEntity();
		parallelsalesentity.setOrgid(orgid);
		parallelsalesentity.setSalesName(salesName);
		parallelsalesentity.setPhone(phone);
		parallelsalesentity.setWxQQ(wxQQ);
		parallelsalesentity.setBelong(belong);
		parallelsalesentity.setBelongName(belongName);
		parallelsalesentity.setImageName(imageName);
		parallelsalesentity.setUrl(url.toString());
		parallelsalesentity.setUrlreal(urlreal.toString());
		parallelsalesentity.setDescription(description);
		parallelsalesentity.setCreateName(createName);
		parallelsalesentity.setCreateDate(createDate);
		if (salesdao.savesalesEntity(parallelsalesentity)) {
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
	public TransData deletesales(TransData transData)
			throws BusinessException {
		String id = (String) transData.getViewMap().get("id");
		salesdao.deletesalesEntity(id);
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
	public TransData salesEdit(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		String id = map.get("id") + "";
		ParallelSalesEntity entity = salesdao.getsalesEntity(id);
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
	public TransData salesEditSave(TransData transData)
			throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String id = (String) map.get("sales_id");
		String salesName = (String) map.get("salesName");
		String phone = (String) map.get("phone");
		String wxQQ = (String) map.get("wxQQ");
		String dealer = (String) map.get("dealer");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		String orgid = session.getBranchNo();
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

		ParallelSalesEntity parallelsalesentity = new ParallelSalesEntity();
		parallelsalesentity.setId(id);
		parallelsalesentity.setOrgid(orgid);
		parallelsalesentity.setSalesName(salesName);
		parallelsalesentity.setPhone(phone);
		parallelsalesentity.setWxQQ(wxQQ);
		parallelsalesentity.setBelong(belong);
		parallelsalesentity.setBelongName(belongName);
		parallelsalesentity.setImageName(imageName);
		parallelsalesentity.setUrl(url.toString());
		parallelsalesentity.setUrlreal(urlreal.toString());
		parallelsalesentity.setDescription(description);
		parallelsalesentity.setCreateName(createName);
		parallelsalesentity.setCreateDate(createDate);
		if (salesdao.sales_update(parallelsalesentity)) {
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
	public TransData salesQuery(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("salesQuery-request:"+map);
		String carbrand = (String) map.get("carbrand");
		List<Map<String, Object>> saleslist = salesdao.querysalesList1(
				carbrand, transData.getPageInfo());
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
