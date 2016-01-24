package com.infohold.cms.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.ParallelVehicleEntity;

/**
 * 4s店品牌Dao
 * @author fwy
 *
 */
@SuppressWarnings("unchecked")
@Repository("pavehicleDao")
public class ParallelVehicleDao extends BaseDao<BaseEntity> {
	
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryvehicleList(Page page){
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
		sql.append("from fc_parallel_vehicle vcl ");
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
		sql.append("from fc_parallel_brand brd ");
		sql.append(" order by brd.initial");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店汽车品牌列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryPriceList(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select brd.id,");
		sql.append("brd.pricekey,");
		sql.append("brd.pricetagevalue ");
		sql.append("from fc_parallel_pricelist brd ");
		sql.append(" order by brd.id");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店汽车品牌列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryDealerList(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select brd.id,");
		sql.append("brd.dealerName ");
		sql.append("from fc_parallel_dealer brd ");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店汽车品牌列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryVersionList(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select brd.id,");
		sql.append("brd.versionkey,");
		sql.append("brd.versionvalue ");
		sql.append("from fc_parallel_versionlist brd ");
		sql.append(" order by brd.id");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryvehicleList1(String cardbrand,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select vcl.id,");
		sql.append("vcl.carbrand,");
		sql.append("vcl.vehicleName,");
		sql.append("vcl.url,");
		sql.append("vcl.urlreal ");
		sql.append("from fc_parallel_vehicle vcl ");
		sql.append(" where vcl.carbrandid=");
		sql.append("'");
		sql.append(cardbrand);
		sql.append("'");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存4s店车辆信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean savevehicleEntity(ParallelVehicleEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 4s店车辆信息删除
	 * @param id
	 * @return
	 */
	public boolean deletevehicleEntity(String id) {
		String deleteUser_HQL = "delete from ParallelVehicleEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询4s店车辆信息信息
	 * @return
	 */

	public ParallelVehicleEntity getvehicleEntity(String id) {
		ParallelVehicleEntity entity = new ParallelVehicleEntity();
		entity = (ParallelVehicleEntity) super.get(ParallelVehicleEntity.class, id);
		return entity;
	}
	
	/**
	 * 4s店车辆信息更新
	 * @param id，用户主键
	 * @return
	 */
	public boolean vehicle_update(ParallelVehicleEntity entity) {
		super.update(entity);
		return true;
	}
	
}
