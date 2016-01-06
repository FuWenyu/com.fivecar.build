package com.infohold.cms.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.CarDealerEntity;

/**
 * 4s店品牌Dao
 * @author fwy
 *
 */
@SuppressWarnings("unchecked")
@Repository("dealerDao")
public class DealerDao extends BaseDao<BaseEntity> {
	
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> querydealerList(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select dle.id,");
		sql.append("dle.dealerName,");
		sql.append("dle.carbrand,");
		sql.append("dle.telephone,");
		sql.append("dle.addr,");
		sql.append("dle.position,");
		sql.append("dle.description,");
		sql.append("dle.createDate,");
		sql.append("dle.createName ");
		sql.append("from fc_ssss_dealer dle ");
		sql.append(" order by dle.createDate desc");
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
	public List<Map<String, Object>> querydealerList1(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select dle.id,");
		sql.append("dle.carbrand,");
		sql.append("dle.dealerName,");
		sql.append("dle.telephone,");
		sql.append("dle.addr,");
		sql.append("dle.position,");
		sql.append("dle.description ");
		sql.append("from fc_ssss_dealer dle ");

		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存4s店车辆信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean savedealerEntity(CarDealerEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 4s店车辆信息删除
	 * @param id
	 * @return
	 */
	public boolean deletedealerEntity(String id) {
		String deleteUser_HQL = "delete from CarDealerEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询4s店车辆信息信息
	 * @return
	 */

	public CarDealerEntity getdealerEntity(String id) {
		CarDealerEntity entity = new CarDealerEntity();
		entity = (CarDealerEntity) super.get(CarDealerEntity.class, id);
		return entity;
	}
	
	/**
	 * 4s店车辆信息更新
	 * @param id，用户主键
	 * @return
	 */
	public boolean dealer_update(CarDealerEntity entity) {
		super.update(entity);
		return true;
	}
	
}
