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
import com.infohold.cms.dao.ParallelBrandDao;
import com.infohold.cms.entity.ParallelBrandEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;

/**
 * 汽车品牌Service
 * 
 * @author fwy
 * 
 */
@SuppressWarnings("unchecked")
@Service("pabrandService")
public class ParallelBrandService implements IBusinessService {

	@Autowired
	private ParallelBrandDao branddao;

	private static String service_name = CustomPropertyUtil
			.getProperties("service_name");
	
	private DateUtil dateutil = new DateUtil();
	
	private Logger logger = Logger.getLogger(ParallelBrandService.class);

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T31001")) {
			return this.findBrandList(transData);
		}  else if (tradCode.equals("T31003")) {
			return this.saveBrand(transData);
		} else if (tradCode.equals("T31004")) {
			return this.deleteBrand(transData);
		} else if (tradCode.equals("T31005")) {
			return this.brandEdit(transData);
		} else if (tradCode.equals("T31006")) {
			return this.updatePictureEntity(transData);
		} else if (tradCode.equals("T31007")) {
			return this.brandQuery(transData);
		}	else if (tradCode.equals("T31008")) {
			return this.priceQuery(transData);
		}	else if (tradCode.equals("T31009")) {
			return this.versionQuery(transData);
		}	
		return transData;
	}

	/**
	 * 品牌列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData findBrandList(TransData transData) throws BusinessException {
		List<Map<String, Object>> orgList = branddao.queryBrandList(
				transData.getPageInfo());
		transData.setObj(orgList);
		return transData;

	}

	public TransData saveBrand(TransData transData) throws BusinessException {
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String initial = (String) map.get("initial");
		String brandNamecn = (String) map.get("brandNamecn");
		String brandNameen = (String) map.get("brandNameen");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		Timestamp createDate = dateutil.getTimestamp();

		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);
		
		ParallelBrandEntity parallelbrandentity = new ParallelBrandEntity();
		parallelbrandentity.setInitial(initial);
		parallelbrandentity.setBrandNamecn(brandNamecn);
		parallelbrandentity.setBrandNameen(brandNameen);
		parallelbrandentity.setImageName(imageName);
		parallelbrandentity.setUrl(url.toString());
		parallelbrandentity.setUrlreal(urlreal.toString());
		parallelbrandentity.setDescription(description);
		parallelbrandentity.setCreateName(createName);
		parallelbrandentity.setCreateDate(createDate);
		
		if (branddao.saveBrandEntity(parallelbrandentity)) {
			transData.setExpMsg("success");
		}
		return transData;

	}

	/**
	 * 品牌删除
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData deleteBrand(TransData transData)
			throws BusinessException {
		String id = (String) transData.getViewMap().get("id");
		branddao.deleteBrandEntity(id);
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
	public TransData brandEdit(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		String id = map.get("id") + "";
		ParallelBrandEntity entity = branddao.getBrandEntity(id);
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
		// 保存数据库
		Map<String, Object> map = transData.getViewMap();
		UserSession session = transData.getUserSession();
		String id = (String) map.get("cardbrand_id");
		String initial = (String) map.get("initial");
		String brandNamecn = (String) map.get("brandNamecn");
		String brandNameen = (String) map.get("brandNameen");
		String description = (String) map.get("description");
		String imageName = (String) map.get("imageName");
		String createName = session.getUserName();
		Timestamp createDate = dateutil.getTimestamp();

		StringBuffer urlreal = new StringBuffer("");
		urlreal.append(service_name);
		urlreal.append("/upload/imagereal/");
		urlreal.append(imageName);

		StringBuffer url = new StringBuffer("");
		url.append(service_name);
		url.append("/upload/image/");
		url.append(imageName);
		
		ParallelBrandEntity parallelbrandentity = new ParallelBrandEntity();
		parallelbrandentity.setId(id);
		parallelbrandentity.setInitial(initial);
		parallelbrandentity.setBrandNamecn(brandNamecn);
		parallelbrandentity.setBrandNameen(brandNameen);
		parallelbrandentity.setImageName(imageName);
		parallelbrandentity.setUrl(url.toString());
		parallelbrandentity.setUrlreal(urlreal.toString());
		parallelbrandentity.setDescription(description);
		parallelbrandentity.setCreateName(createName);
		parallelbrandentity.setCreateDate(createDate);
		
		if (branddao.brand_update(parallelbrandentity)) {
			transData.setExpMsg("success");
		}
		return transData;

	}

	/**
	 * http请求查询品牌列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData brandQuery(TransData transData)
			throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("brandQuery-request:"+map);
		String fivecar = (String) map.get("fivecar");
		if (fivecar.equals("fivecar")) {
			List<Map<String, Object>> brandlist=branddao.queryBrandList1(transData.getPageInfo());
			if (brandlist==null) {
				transData.setExpCode("-1");
				transData.setExpMsg("fail");
			}else {
				transData.setObj(brandlist);
				transData.setExpCode("1");
				transData.setExpMsg("success");
			}
		}
		return transData;
	}
	/**
	 * http请求查询价格区间列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData priceQuery(TransData transData)
			throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("priceQuery-request:"+map);
		String fivecar = (String) map.get("fivecar");
		if (fivecar.equals("fivecar")) {
			List<Map<String, Object>> pricelist=branddao.queryPriceList(transData.getPageInfo());
			if (pricelist==null) {
				transData.setExpCode("-1");
				transData.setExpMsg("fail");
			}else {
				transData.setObj(pricelist);
				transData.setExpCode("1");
				transData.setExpMsg("success");
			}
		}
		return transData;
	}
	/**
	 * http请求查询车辆版本列表
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData versionQuery(TransData transData)
			throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("versionQuery-request:"+map);
		String fivecar = (String) map.get("fivecar");
		if (fivecar.equals("fivecar")) {
			List<Map<String, Object>> versionlist=branddao.queryVersionList(transData.getPageInfo());
			if (versionlist==null) {
				transData.setExpCode("-1");
				transData.setExpMsg("fail");
			}else {
				transData.setObj(versionlist);
				transData.setExpCode("1");
				transData.setExpMsg("success");
			}
		}
		return transData;
	}

}
