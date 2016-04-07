package com.infohold.cms.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.AppUserEntity;
import com.infohold.cms.entity.CarBrandEntity;
import com.infohold.cms.entity.VersionEntity;

/**
 * 版本Dao
 * @author wag
 *
 */
@SuppressWarnings("unchecked")
@Repository("appuserdao")
public class AppUserDao extends BaseDao<BaseEntity> {
	
	
	/**
	 * 保存版本信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean saveAppUserEntity(AppUserEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 更新userEntity
	 * @param id，用户主键
	 * @return
	 */
	public boolean user_update(AppUserEntity entity) {
		super.update(entity);
		return true;
	}
	/**
	 * 通过注册电话号查询
	 * @return
	 */
	public boolean getbyphone(String phone) {
		StringBuffer sql = new StringBuffer();
		sql.append("select v.id ");
		sql.append("from fc_app_user v where v.phone = ? ");
		
		List<Object[]> objectsList = super.findBySQL(sql.toString(), phone);
		if (objectsList.isEmpty()) {
			return false;
		}
		return true;
	}
	/**
	 * 通过注册电话号查询
	 * @return
	 */
	public String getuserbyphone(String phone) {
		StringBuffer sql = new StringBuffer();
		sql.append("select v.id ");
		sql.append("from fc_app_user v where v.phone =  "+phone);
		
		Map<String, Object> map = super.queryForMap(sql.toString());
		if (map.isEmpty()) {
			return null;
		}else {
			return (String) map.get("id");
		}
	}
	/**
	 * 登录检查
	 * @return
	 */
	public AppUserEntity loginCheck(String login_name,String password) {
		StringBuffer sql = new StringBuffer();
		sql.append("select v.id,");
		sql.append("v.user_no,");
		sql.append("v.user_name,");
		sql.append("v.email,");
		sql.append("v.phone,");
		sql.append("v.create_date,");
		sql.append("v.id_no,");
		sql.append("v.sex,");
		sql.append("v.profile_images ");
		sql.append("from fc_app_user v where v.phone = ? ");
		sql.append("and v.password = ? ");
		
		List<Object[]> objectsList = super.findBySQL(sql.toString(), login_name,password);
		for (Object[] objects : objectsList) {
			AppUserEntity user = new AppUserEntity();
			user.setId((String) objects[0]);
			user.setUser_no((String) objects[1]);
			user.setUser_name((String) objects[2]);
			user.setEmail((String) objects[3]);
			user.setPhone((String) objects[4]);
			user.setCreate_date((Timestamp)objects[5]);
			user.setId_no((String) objects[6]);
			user.setSex((String) objects[7]);
			user.setProfile_images((String) objects[8]);
			return user;
		}
			return null;
	}
	public AppUserEntity getuserEntity(String id) {
		AppUserEntity entity = new AppUserEntity();
		entity = (AppUserEntity) super.get(AppUserEntity.class, id);
		return entity;
	}
}
