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
import com.infohold.cms.basic.util.StrUtil;
import com.infohold.cms.entity.AdEntity;
import com.infohold.cms.entity.ResourcesEntity;

/**
 * 图片Dao
 * @author wag
 *
 */
@SuppressWarnings("unchecked")
@Repository("resourcesDao")
public class ResourcesDao extends BaseDao<BaseEntity> {
	
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
		sql.append("rs.resourceName,");
		sql.append("rs.createDate,");
		sql.append("rs.createName ");
		sql.append("from fc_app_resources rs ");
//		sql.append("where rs.usefo like '%1'");
		sql.append(" order by rs.id desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 广告图片列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryEntryList(Map<String,Object> map,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select pm.id,");
		sql.append("pm.title,");
		sql.append("pm.imageName,");
		sql.append("pm.imageHref,");
		sql.append("pm.imageHrefReal,");
		sql.append("pm.anchor,");
		sql.append("pm.createDate,");
		sql.append("pm.usefo,");
		sql.append("pm.imageid ");
		sql.append("from fc_cms_ad pm ");
//		sql.append("where pm.usefo like '%2'");		
		sql.append(" order by pm.id desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存图片信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean saveResourceEntity(ResourcesEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 图片删除
	 * @param id
	 * @return
	 */
	public boolean deleteResourceEntity(String id) {
		String deleteUser_HQL = "delete from ResourcesEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询图片
	 * @return
	 */
	public ResourcesEntity getResourceByid(String id) {
		StringBuffer sql = new StringBuffer();
		sql.append("select pm.title,");
		sql.append("pm.resourceName,");
		sql.append("pm.createName,");
		sql.append("pm.resource,");
		sql.append("pm.id,");
		sql.append("pm.createDate ");
		sql.append("from fc_app_resources pm where pm.id= ");
		sql.append("'");
		sql.append(id);
		sql.append("'");
		List<Object[]> objectsList = super.findBySQL(sql.toString());
		for (Object[] objects : objectsList) {
			ResourcesEntity resources = new ResourcesEntity();
			resources.setTitle((String) objects[0]);
			resources.setResourceName((String) objects[1]);
			resources.setCreateName((String) objects[2]);
			resources.setResource((String) objects[3]);
			resources.setId((String) objects[4]);
			resources.setCreateDate((Timestamp) objects[5]);
			return resources;
		}
		return null;
	}
	/**
	 * 图片更新前查询
	 * @param id，用户主键
	 * @return
	 */
	public ResourcesEntity getResourceEntity(String id) {
		ResourcesEntity entity = new ResourcesEntity();
		entity = (ResourcesEntity) super.get(ResourcesEntity.class, id);
		return entity;
	}
	/**
	 * 图片更新
	 * @param id，用户主键
	 * @return
	 */
	public boolean Resource_update(ResourcesEntity entity) {
		super.update(entity);
		return true;
	}
	
	
	/**
	 * 广告图片查询
	 * @return
	 */
	public List<Map<String, Object>> getResource(String usefo,Page page) {
		StringBuffer sql = new StringBuffer();
		sql.append("select pm.title,");
		sql.append("pm.url,");
		sql.append("pm.urlreal,");
		sql.append("pm.anchor ");
		sql.append("from fc_cms_ad pm where pm.usefo= ");
		sql.append(usefo);
		return super.excutePageQuery(sql.toString(),page);
	}
	public List<Map<String, Object>> getEntry(String usefo,Page page) {
		StringBuffer sql = new StringBuffer();
		sql.append("select pm.title,");
		sql.append("pm.url,");
		sql.append("pm.urlreal,");
		sql.append("pm.anchor,");
		sql.append("pm.createName,");
		sql.append("pm.createDate ");
		sql.append("from fc_cms_ad pm where pm.usefo= ");
		sql.append(usefo);
		return super.excutePageQuery(sql.toString(),page);
	}
}
