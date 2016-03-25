package com.infohold.cms.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.CarLenderEntity;

/**
 * 4s店品牌Dao
 * @author fwy
 *
 */
@SuppressWarnings("unchecked")
@Repository("lenderDao")
public class CarLenderDao extends BaseDao<BaseEntity> {
	
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> querylenderList(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select mdl.id,");
		sql.append("mdl.lenderName,");
		sql.append("mdl.telephone,");
		sql.append("mdl.imageName,");
		sql.append("mdl.resourceid,");
		sql.append("mdl.privileges,");
		sql.append("mdl.privilegesurl,");
		sql.append("mdl.privilegestile,");
		sql.append("mdl.url,");
		sql.append("mdl.urlreal,");
		sql.append("mdl.description,");
		sql.append("mdl.createDate,");
		sql.append("mdl.createName ");
		sql.append("from fc_ssss_lender mdl ");
		sql.append(" order by mdl.createDate desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 4s店车辆信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> querylenderList1(Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select mdl.id,");
		sql.append("mdl.lenderName,");
		sql.append("mdl.telephone,");
		sql.append("mdl.imageName,");
		sql.append("mdl.privileges,");
		sql.append("mdl.privilegesurl,");
		sql.append("mdl.privilegestile,");
		sql.append("mdl.url,");
		sql.append("mdl.urlreal,");
		sql.append("mdl.description,");
		sql.append("from fc_ssss_lender mdl ");
		sql.append(" order by mdl.createDate desc");
	
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存4s店车辆信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean savelenderEntity(CarLenderEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 4s店车辆信息删除
	 * @param id
	 * @return
	 */
	public boolean deletelenderEntity(String id) {
		String deleteUser_HQL = "delete from CarLenderEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询4s店车辆信息信息
	 * @return
	 */

	public CarLenderEntity getlenderEntity(String id) {
		CarLenderEntity entity = new CarLenderEntity();
		entity = (CarLenderEntity) super.get(CarLenderEntity.class, id);
		return entity;
	}
	
	/**
	 * 4s店车辆信息更新
	 * @param id，用户主键
	 * @return
	 */
	public boolean lender_update(CarLenderEntity entity) {
		super.update(entity);
		return true;
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
		sql.append("lender");
		sql.append("'");
		sql.append(" order by pm.id desc ");
		return super.queryForList(sql.toString());
	}
}
