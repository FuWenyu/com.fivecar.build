package com.infohold.cms.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.ThirdPartyDealerEntity;

/**
 * 4s店品牌Dao
 * @author fwy
 *
 */
@SuppressWarnings("unchecked")
@Repository("tddealerDao")
public class ThirdPartyDealerDao extends BaseDao<BaseEntity> {
	
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
		sql.append("dle.privileges,");
		sql.append("dle.privilegesurl,");
		sql.append("dle.privilegestile,");
		sql.append("dle.telephone,");
		sql.append("dle.addr,");
		sql.append("dle.position,");
		sql.append("dle.description,");
		sql.append("dle.createDate,");
		sql.append("dle.createName ");
		sql.append("from fc_thirdparty_dealer dle ");
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
		sql.append("from fc_thirdparty_brand brd ");
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
		sql.append("dle.privileges,");
		sql.append("dle.privilegesurl,");
		sql.append("dle.privilegestile,");
		sql.append("dle.dealerName,");
		sql.append("dle.telephone,");
		sql.append("dle.addr,");
		sql.append("dle.position,");
		sql.append("dle.description ");
		sql.append("from fc_thirdparty_dealer dle ");

		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存4s店车辆信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean savedealerEntity(ThirdPartyDealerEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 4s店车辆信息删除
	 * @param id
	 * @return
	 */
	public boolean deletedealerEntity(String id) {
		String deleteUser_HQL = "delete from ThirdPartyDealerEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询4s店车辆信息信息
	 * @return
	 */

	public ThirdPartyDealerEntity getdealerEntity(String id) {
		ThirdPartyDealerEntity entity = new ThirdPartyDealerEntity();
		entity = (ThirdPartyDealerEntity) super.get(ThirdPartyDealerEntity.class, id);
		return entity;
	}
	
	/**
	 * 4s店车辆信息更新
	 * @param id，用户主键
	 * @return
	 */
	public boolean dealer_update(ThirdPartyDealerEntity entity) {
		super.update(entity);
		return true;
	}
	/**
	 * 4s店信息查询for页面
	 * @param id，用户主键
	 * @return
	 */
	public List<Map<String, Object>> querydealerListPage(String cardbrandid,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select dle.id,");
		sql.append("dle.dealerName,");
		sql.append("dle.carbrand,");
		sql.append("dle.privileges,");
		sql.append("dle.resourceid,");
		sql.append("dle.privilegesurl,");
		sql.append("dle.privilegestile,");
		sql.append("dle.telephone,");
		sql.append("dle.addr,");
		sql.append("dle.position,");
		sql.append("dle.description,");
		sql.append("dle.createDate,");
		sql.append("dle.createName ");
		sql.append("from fc_thirdparty_dealer dle ");
		sql.append("where dle.carbrandid = ");
		sql.append("'");
		sql.append(cardbrandid);
		sql.append("'");
		sql.append(" order by dle.createDate desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 图文信息查询
	 * @return
	 */
	public List<Map<String, Object>> getResources() {
		StringBuffer sql = new StringBuffer();
		sql.append("select pm.id,");
		sql.append("pm.title,");
		sql.append("pm.resourceName ");
		sql.append("from fc_app_resources pm ");
		sql.append(" where pm.purpose = ");
		sql.append("'");
		sql.append("thirdparty");
		sql.append("'");
		sql.append(" order by pm.id desc ");
		return super.queryForList(sql.toString());
	}
}
