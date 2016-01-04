package com.infohold.cms.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.CarBrandEntity;

/**
 * 4s店品牌Dao
 * @author wag
 *
 */
@SuppressWarnings("unchecked")
@Repository("brandDao")
public class BrandDao extends BaseDao<BaseEntity> {
	
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
		sql.append("brd.brandNamecn,");
		sql.append("brd.brandNameen,");
		sql.append("brd.imageName,");
		sql.append("brd.url,");
		sql.append("brd.urlreal,");
		sql.append("brd.createDate,");
		sql.append("brd.createName ");
		sql.append("from fc_ssss_brand brd ");
		sql.append(" order by brd.initial");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店汽车品牌列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryBrandList1(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select brd.id,");
		sql.append("brd.initial,");
		sql.append("brd.brandNamecn,");
		sql.append("brd.brandNameen,");
		sql.append("brd.url,");
		sql.append("brd.urlreal ");
		sql.append("from fc_ssss_brand brd ");
		sql.append(" order by brd.initial");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存4s店汽车品牌
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean saveBrandEntity(CarBrandEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 4s店汽车品牌删除
	 * @param id
	 * @return
	 */
	public boolean deleteBrandEntity(String id) {
		String deleteUser_HQL = "delete from CarBrandEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询4s店汽车品牌信息
	 * @return
	 */

	public CarBrandEntity getBrandEntity(String id) {
		CarBrandEntity entity = new CarBrandEntity();
		entity = (CarBrandEntity) super.get(CarBrandEntity.class, id);
		return entity;
	}
	
	/**
	 * 4s店汽车品牌更新
	 * @param id，用户主键
	 * @return
	 */
	public void brand_update(CarBrandEntity entity) {
		super.update(entity);
	}
	
}
