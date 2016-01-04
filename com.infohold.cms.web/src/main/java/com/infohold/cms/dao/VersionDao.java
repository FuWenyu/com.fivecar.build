package com.infohold.cms.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Label;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.basic.util.StrUtil;
import com.infohold.cms.entity.MenuEntity;
import com.infohold.cms.entity.RoleEntity;
import com.infohold.cms.entity.UserEntity;
import com.infohold.cms.entity.UserRoleEntity;
import com.infohold.cms.entity.VersionEntity;

/**
 * 版本Dao
 * @author wag
 *
 */
@SuppressWarnings("unchecked")
@Repository("versionDao")
public class VersionDao extends BaseDao<BaseEntity> {
	
	/**
	 * 版本列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryOmsVersionList(Map<String,Object> map,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select v.version_id,");
		sql.append("v.version_no,");
		sql.append("v.version_online,");
		sql.append("v.version_desc,");
		sql.append("v.version_url,");
		sql.append("v.version_date,");
		sql.append("v.version_flag ");
		sql.append("from auth_version v order by v.version_date desc");
		
		return super.excutePageQuery(sql.toString(),page);
		
	}
	/**
	 * 保存版本信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean saveVersionEntity(VersionEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 用户删除
	 * @param id
	 * @return
	 */
	public boolean deleteVersionEntity(String id) {
		String deleteUser_HQL = "delete from VersionEntity v where v.version_id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询版本
	 * @return
	 */
	public VersionEntity getVersionByid(String id) {
		StringBuffer sql = new StringBuffer();
		sql.append("select v.version_id,");
		sql.append("v.version_no,");
		sql.append("v.version_desc,");
		sql.append("v.version_url,");
		sql.append("v.version_date,");
		sql.append("v.version_flag,");
		sql.append("v.version_online ");
		sql.append("from auth_version v where v.version_id = ?");
		
		List<Object[]> objectsList = super.findBySQL(sql.toString(), id);
		for (Object[] objects : objectsList) {
			VersionEntity version = new VersionEntity();
			version.setVersion_id((String) objects[0]);
			version.setVersion_no((String) objects[1]);
			version.setVersion_desc((String) objects[2]);
			version.setVersion_url((String)objects[3]);
			version.setVersion_date(Timestamp.valueOf(objects[4].toString()));
			version.setVersion_flag((String) objects[5]);
			version.setVersion_online((String) objects[6]);
			return version;
		}
		return null;
	}
	/**
	 * 用户签退
	 * @param id，用户主键
	 * @return
	 */
	public void version_update(VersionEntity entity) {
		VersionEntity oldentity = new VersionEntity();
//		oldentity = (VersionEntity) super.get(entity.getClass(), entity.getVersion_id());
		super.update(entity);
	}
	
	/**
	 * 通过启用标志查询最新版本
	 * @return
	 */
	public VersionEntity getVersionByonline(String version_online,String version_flag) {
		StringBuffer sql = new StringBuffer();
		sql.append("select v.version_id,");
		sql.append("v.version_no,");
		sql.append("v.version_desc,");
		sql.append("v.version_url,");
		sql.append("v.version_date,");
		sql.append("v.version_flag,");
		sql.append("v.version_online ");
		sql.append("from auth_version v where v.version_online = ? ");
		sql.append("and v.version_flag = ? order by v.version_date desc");
		
		List<Object[]> objectsList = super.findBySQL(sql.toString(), version_online,version_flag);
		for (Object[] objects : objectsList) {
			VersionEntity version = new VersionEntity();
			version.setVersion_id((String) objects[0]);
			version.setVersion_no((String) objects[1]);
			version.setVersion_desc((String) objects[2]);
			version.setVersion_url((String)objects[3]);
			version.setVersion_date(Timestamp.valueOf(objects[4].toString()));
			version.setVersion_flag((String) objects[5]);
			version.setVersion_online((String) objects[6]);
			return version;
		}
		return null;
	}
}
