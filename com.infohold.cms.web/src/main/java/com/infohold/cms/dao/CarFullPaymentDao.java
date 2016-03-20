package com.infohold.cms.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.CarFullPaymentEntity;

/**
 * 4s店全款购车
 * @author fwy
 *
 */
@SuppressWarnings("unchecked")
@Repository("fullpayDao")
public class CarFullPaymentDao extends BaseDao<BaseEntity> {
	
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryFullPaymentList(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select mdl.id,");
		sql.append("mdl.FullPaymentName,");
		sql.append("mdl.imageName,");
		sql.append("mdl.carbrandid,");
		sql.append("mdl.carbrand,");
		sql.append("mdl.vehicleid,");
		sql.append("mdl.vehicle,");
		sql.append("mdl.originalprice,");
		sql.append("mdl.discountprice,");
		sql.append("mdl.url,");
		sql.append("mdl.urlreal,");
		sql.append("mdl.description,");
		sql.append("mdl.createDate,");
		sql.append("mdl.createName ");
		sql.append("from fc_ssss_FullPayment mdl ");
		sql.append(" order by mdl.createDate desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店汽车品牌列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryVehicleList(Page page){
		page.setPageSize(999);
		StringBuffer sql = new StringBuffer();
		sql.append("select vcl.id,");
		sql.append("vcl.vehicleName,");
		sql.append("vcl.carbrandid,");
		sql.append("vcl.carbrand ");
		sql.append("from fc_ssss_vehicle vcl ");
		sql.append(" order by vcl.createDate desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryFullPayList(String modelid,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select mdl.modelid,");
		sql.append("ful.modelName,");
		sql.append("ful.tax,");
		sql.append("ful.CompulsoryInsurance,");
		sql.append("ful.LicensePlate,");
		sql.append("ful.CDW,");
		sql.append("ful.ThirdParityLiability,");
		sql.append("ful.OtherInsurance ");
		sql.append("from fc_ssss_fullpay ful ");
		sql.append(" where ful.modelid=");
		sql.append("'");
		sql.append(modelid);
		sql.append("'");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存4s店车辆信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean saveFullPaymentEntity(CarFullPaymentEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 4s店车辆信息删除
	 * @param id
	 * @return
	 */
	public boolean deleteFullPaymentEntity(String id) {
		String deleteUser_HQL = "delete from CarFullPaymentEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询4s店车辆信息信息
	 * @return
	 */

	public CarFullPaymentEntity getFullPaymentEntity(String id) {
		CarFullPaymentEntity entity = new CarFullPaymentEntity();
		entity = (CarFullPaymentEntity) super.get(CarFullPaymentEntity.class, id);
		return entity;
	}
	
	/**
	 * 4s店车辆信息更新
	 * @param id，用户主键
	 * @return
	 */
	public boolean FullPayment_update(CarFullPaymentEntity entity) {
		super.update(entity);
		return true;
	}
	
}
