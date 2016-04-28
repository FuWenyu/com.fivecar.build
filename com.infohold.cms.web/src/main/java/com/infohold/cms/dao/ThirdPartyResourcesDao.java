package com.infohold.cms.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.ResolverUtil.IsA;
import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Label;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.ThirdPartyResourcesEntity;

/**
 * 图片Dao
 * @author wag
 *
 */
@SuppressWarnings("unchecked")
@Repository("tpresourcesDao")
public class ThirdPartyResourcesDao extends BaseDao<BaseEntity> {
	
	/**
	 * 广告图片列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryOmsResourceList(Map<String,Object> map,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select rs.id,");
		sql.append("rs.title,");
		sql.append("rs.thirdparty_type,");
		sql.append("rs.resourceName,");
		sql.append("rs.createDate,");
		sql.append("rs.createName ");
		sql.append("from fc_thirdparty_resources rs ");
		sql.append(" order by rs.id desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	
	/**
	 * 保存图片信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean saveResourceEntity(ThirdPartyResourcesEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 图片删除
	 * @param id
	 * @return
	 */
	public boolean deleteResourceEntity(String id) {
		String deleteUser_HQL = "delete from ThirdPartyResourcesEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 图片更新前查询
	 * @param id，用户主键
	 * @return
	 */
	public ThirdPartyResourcesEntity getResourceEntity(String id) {
		ThirdPartyResourcesEntity entity = new ThirdPartyResourcesEntity();
		entity = (ThirdPartyResourcesEntity) super.get(ThirdPartyResourcesEntity.class, id);
		return entity;
	}
	/**
	 * 图片更新
	 * @param id，用户主键
	 * @return
	 */
	public boolean Resource_update(ThirdPartyResourcesEntity entity) {
		super.update(entity);
		return true;
	}
	
	/**
	 * 第三方机构查询
	 * @param id，用户主键
	 * @return
	 */
	public List<Map<String, Object>> querydealerList(){
		StringBuffer sql = new StringBuffer();
		sql.append("select dle.id,");
		sql.append("dle.dealerName,");
		sql.append("dle.dealerName,");
		sql.append("dle.thirdparty_type ");
		sql.append("from fc_thirdparty_dealer dle ");
		sql.append(" order by dle.createDate desc");
		return super.queryForList(sql.toString());
	}
	/**
	 * 第三方机构查询
	 * @param id，用户主键
	 * @return
	 */
	public List<Map<String, Object>> queryresourceList(String dealerid){
		StringBuffer sql = new StringBuffer();
		sql.append("select rs.id,");
		sql.append("rs.title,");
		sql.append("rs.thirdparty_type,");
		sql.append("rs.resourceName,");
		sql.append("rs.createDate,");
		sql.append("rs.createName ");
		sql.append("from fc_thirdparty_resources rs ");
		sql.append("where rs.purpose = ");
		sql.append("'");
		sql.append(dealerid);
		sql.append("'");
		return super.queryForList(sql.toString());
	}
	/**
	 * 图文信息查询
	 * @return
	 */
	public List<Map<String, Object>> getResources(String title,Page page) {
		StringBuffer sql = new StringBuffer();
		sql.append("select pm.id,");
		sql.append("pm.title,");
		sql.append("pm.resourceName ");
		sql.append("from fc_app_resources pm ");
		sql.append(" where pm.title like ");
		sql.append("'%");
		sql.append(title);
		sql.append("%'");
		return super.excutePageQuery(sql.toString(),page);
	}
}
