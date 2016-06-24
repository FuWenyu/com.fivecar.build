package com.infohold.cms.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.CarVehicleEntity;

/**
 * 4s店品牌Dao
 * @author fwy
 *
 */
@SuppressWarnings("unchecked")
@Repository("vehicleDao")
public class CarVehicleDao extends BaseDao<BaseEntity> {
	
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryvehicleList(Page page,String orgid){
		StringBuffer sql = new StringBuffer();
		sql.append("select vcl.id,");
		sql.append("vcl.vehicleName,");
		sql.append("vcl.imageName,");
		sql.append("vcl.carbrand,");
		sql.append("vcl.price,");
		sql.append("vcl.url,");
		sql.append("vcl.urlreal,");
		sql.append("vcl.description,");
		sql.append("vcl.createDate,");
		sql.append("vcl.createName ");
		sql.append("from fc_ssss_vehicle vcl ");
		sql.append(" where vcl.orgid=");
		sql.append("'");
		sql.append(orgid);
		sql.append("'");
		sql.append(" order by vcl.createDate desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店汽车品牌列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryBrandList(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select brd.id,");
		sql.append("brd.initial,");
		sql.append("brd.brandNamecn ");
		sql.append("from fc_ssss_brand brd ");
		sql.append(" order by brd.initial");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryvehicleList1(String cardbrand,String userId, Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select vcl.id,");
		sql.append("vcl.carbrand,");
		sql.append("vcl.vehicleName,");
		sql.append("vcl.price,");
		sql.append("vcl.url,");
		sql.append("vcl.urlreal,");
		sql.append("c.resource_id,");
		sql.append("c.user_id ");
		sql.append("from fc_ssss_vehicle vcl LEFT JOIN ");
		sql.append("(select * from fc_user_collection where user_id= '"+userId+"' ) c");
		sql.append(" ON (vcl.id=c.resource_id)");
		sql.append(" where vcl.carbrandid=");
		sql.append("'");
		sql.append(cardbrand);
		sql.append("'");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryvehicleList2(String cardbrand,String userId,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select vcl.id,");
		sql.append("vcl.carbrand,");
		sql.append("vcl.vehicleName,");
		sql.append("vcl.price,");
		sql.append("vcl.url,");
		sql.append("vcl.urlreal,");
		sql.append("c.resource_id,");
		sql.append("c.user_id ");
		sql.append("from fc_ssss_vehicle vcl LEFT JOIN ");
		sql.append("(select * from fc_user_collection where user_id= '"+userId+"' ) c");
		sql.append(" ON (vcl.id=c.resource_id)");
		sql.append(" order by vcl.carbrand");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店车辆信息列表模糊查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryvehicleList3(String like,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select vcl.id,");
		sql.append("vcl.carbrand,");
		sql.append("vcl.vehicleName,");
		sql.append("vcl.price,");
		sql.append("vcl.url,");
		sql.append("vcl.urlreal ");
		sql.append("from fc_ssss_vehicle vcl ");
		sql.append(" where vcl.vehicleName like ");
		sql.append("'%");
		sql.append(like);
		sql.append("%'");
		sql.append(" order by vcl.carbrand");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存4s店车辆信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean savevehicleEntity(CarVehicleEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 4s店车辆信息删除
	 * @param id
	 * @return
	 */
	public boolean deletevehicleEntity(String id) {
		String deleteUser_HQL = "delete from CarVehicleEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询4s店车辆信息信息
	 * @return
	 */

	public CarVehicleEntity getvehicleEntity(String id) {
		CarVehicleEntity entity = new CarVehicleEntity();
		entity = (CarVehicleEntity) super.get(CarVehicleEntity.class, id);
		return entity;
	}
	
	/**
	 * 4s店车辆信息更新
	 * @param id，用户主键
	 * @return
	 */
	public boolean vehicle_update(CarVehicleEntity entity) {
		super.update(entity);
		return true;
	}
	
}
