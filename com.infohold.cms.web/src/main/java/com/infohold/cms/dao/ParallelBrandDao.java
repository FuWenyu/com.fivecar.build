package com.infohold.cms.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.ParallelBrandEntity;

/**
 * 经销商品牌Dao
 * @author wag
 *
 */
@SuppressWarnings("unchecked")
@Repository("pabrandDao")
public class ParallelBrandDao extends BaseDao<BaseEntity> {
	
	/**
	 * 经销商汽车品牌列表查询
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
		sql.append("from fc_parallel_brand brd ");
		sql.append(" order by brd.initial");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 经销商汽车品牌列表查询
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
		sql.append("from fc_parallel_brand brd ");
		sql.append(" order by brd.initial");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存经销商汽车品牌
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean saveBrandEntity(ParallelBrandEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 经销商汽车品牌删除
	 * @param id
	 * @return
	 */
	public boolean deleteBrandEntity(String id) {
		String deleteUser_HQL = "delete from ParallelBrandEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询经销商汽车品牌信息
	 * @return
	 */

	public ParallelBrandEntity getBrandEntity(String id) {
		ParallelBrandEntity entity = new ParallelBrandEntity();
		entity = (ParallelBrandEntity) super.get(ParallelBrandEntity.class, id);
		return entity;
	}
	
	/**
	 * 经销商汽车品牌更新
	 * @param id，用户主键
	 * @return
	 */
	public boolean brand_update(ParallelBrandEntity entity) {
		super.update(entity);
		return true;
	}
	/**
	 * 经销商汽车价格区间列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryPriceList(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select prc.id,");
		sql.append("prc.pricekey,");
		sql.append("prc.pricetagevalue ");
		sql.append("from fc_parallel_pricelist prc ");
		sql.append(" order by prc.id");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 经销商车辆版本列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryVersionList(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select vsn.id,");
		sql.append("vsn.versionkey,");
		sql.append("vsn.versionvalue ");
		sql.append("from fc_parallel_versionlist vsn ");
		sql.append(" order by vsn.id");
		return super.excutePageQuery(sql.toString(),page);
	}
}
