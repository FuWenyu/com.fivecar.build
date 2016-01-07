package com.infohold.cms.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.CarModelEntity;

/**
 * 4s店品牌Dao
 * @author fwy
 *
 */
@SuppressWarnings("unchecked")
@Repository("modelDao")
public class ModelDao extends BaseDao<BaseEntity> {
	
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> querymodelList(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select mdl.id,");
		sql.append("mdl.modelName,");
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
		sql.append("from fc_ssss_model mdl ");
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
	public List<Map<String, Object>> querymodelList1(String carvehicle,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select mdl.id,");
		sql.append("mdl.carbrandid,");
		sql.append("mdl.carbrand,");
		sql.append("mdl.vechicleid,");
		sql.append("mdl.vechicle,");
		sql.append("mdl.modelName,");
		sql.append("mdl.originalprice,");
		sql.append("mdl.discountprice,");
		sql.append("mdl.url,");
		sql.append("mdl.urlreal ");
		sql.append("from fc_ssss_model mdl ");
		sql.append(" where mdl.carbrandid=");
		sql.append("'");
		sql.append(carvehicle);
		sql.append("'");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存4s店车辆信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean savemodelEntity(CarModelEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 4s店车辆信息删除
	 * @param id
	 * @return
	 */
	public boolean deletemodelEntity(String id) {
		String deleteUser_HQL = "delete from CarModelEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询4s店车辆信息信息
	 * @return
	 */

	public CarModelEntity getmodelEntity(String id) {
		CarModelEntity entity = new CarModelEntity();
		entity = (CarModelEntity) super.get(CarModelEntity.class, id);
		return entity;
	}
	
	/**
	 * 4s店车辆信息更新
	 * @param id，用户主键
	 * @return
	 */
	public void model_update(CarModelEntity entity) {
		super.update(entity);
	}
	
}
