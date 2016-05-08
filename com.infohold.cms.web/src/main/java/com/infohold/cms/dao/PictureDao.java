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
import com.infohold.cms.entity.ParallelSalesEntity;
import com.infohold.cms.entity.ResourcesEntity;

/**
 * 图片Dao
 * @author wag
 *
 */
@SuppressWarnings("unchecked")
@Repository("pictureDao")
public class PictureDao extends BaseDao<BaseEntity> {
	
	/**
	 * 广告图片列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryOmsPictureList(Map<String,Object> map,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select pm.id,");
		sql.append("pm.title,");
		sql.append("pm.imageName,");
		sql.append("pm.imageHref,");
		sql.append("pm.imageHrefReal,");
		sql.append("pm.anchorid,");
		sql.append("pm.anchor,");
		sql.append("pm.createDate,");
		sql.append("pm.createName,");
		sql.append("pm.usefo,");
		sql.append("pm.usefoName,");
		sql.append("pm.imageid ");
		sql.append("from fc_cms_ad pm ");
		sql.append("where pm.usefo like '%1'");		
		sql.append(" order by pm.id desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 广告图片列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryEntryList(String usefo,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select pm.id,");
		sql.append("pm.title,");
		sql.append("pm.imageName,");
		sql.append("pm.imageHref,");
		sql.append("pm.imageHrefReal,");
		sql.append("pm.anchorid,");
		sql.append("pm.anchor,");
		sql.append("pm.createDate,");
		sql.append("pm.createName,");
		sql.append("pm.usefo,");
		sql.append("pm.usefoName,");
		sql.append("pm.imageid ");
		sql.append("from fc_cms_ad pm ");
		sql.append("where pm.usefo = ");
		sql.append(usefo);
		sql.append(" order by pm.id desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存图片信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean savePictureEntity(AdEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 图片删除
	 * @param id
	 * @return
	 */
	public boolean deletePictureEntity(String id) {
		String deleteUser_HQL = "delete from AdEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询图片
	 * @return
	 */
	public AdEntity getPictureByid(String id) {
		/*StringBuffer sql = new StringBuffer();
		sql.append("select pm.id,");
		sql.append("pm.title,");
		sql.append("pm.imageName,");
		sql.append("pm.imageHref,");
		sql.append("pm.imageHrefReal,");
		sql.append("pm.anchor,");
		sql.append("pm.createDate,");
		sql.append("pm.usefo,");
		sql.append("pm.imageid,");
		sql.append("pm.anchorid ");
		sql.append("from fc_cms_ad pm where pm.id = ?");
		
		List<Object[]> objectsList = super.findBySQL(sql.toString(), id);
		for (Object[] objects : objectsList) {
			AdEntity adentity = new AdEntity();
		    adentity.setId((String) objects[0]);
			adentity.setTitle((String) objects[1]);
			adentity.setImageName((String) objects[2]);
			adentity.setImageHref((String) objects[3]);
			adentity.setImageHrefReal((String) objects[4]);
			adentity.setAnchor((String) objects[5]);
			adentity.setCreateDate(Timestamp.valueOf(objects[6].toString()));
			adentity.setUsefo((String) objects[7]);
			adentity.setImageid((String) objects[8]);
			adentity.setAnchorid((String) objects[9]);
			return adentity;
		}*/
		AdEntity entity = new AdEntity();
		entity = (AdEntity) super.get(AdEntity.class, id);
		return entity;
	}
	/**
	 * 图片更新
	 * @param id，用户主键
	 * @return
	 */
	public void picture_update(AdEntity entity) {
		super.update(entity);
	}
	
	/**
	 * 广告图片按用途查询
	 * @return
	 */
	public ResourcesEntity getResource(String id) {
		StringBuffer sql = new StringBuffer();
		sql.append("select pm.title,");
		sql.append("pm.resourceName,");
		sql.append("pm.createName,");
		sql.append("pm.resource,");
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
			resources.setCreateDate((Timestamp) objects[4]);
			return resources;
		}
		return null;
	}
	/**
	 * 广告图片按用途查询
	 * @return
	 */
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
		sql.append(" order by pm.createDate desc");
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
		sql.append("homepage");
		sql.append("'");
		sql.append(" order by pm.id desc ");
		return super.queryForList(sql.toString());
	}
}
