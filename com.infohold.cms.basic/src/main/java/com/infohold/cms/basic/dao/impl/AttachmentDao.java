package com.infohold.cms.basic.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.AttachmentEntity;
import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 附件Dao
 * @author wanglei
 *
 */
@SuppressWarnings("unchecked")
@Repository(value = "attDao")
public class AttachmentDao extends BaseDao<BaseEntity>{

	/**
	 * 获取附件信息
	 * */

	public AttachmentEntity get(String att_id) {
		return (AttachmentEntity) super.get(AttachmentEntity.class, att_id);
	}
	
	public void remove(AttachmentEntity attach){
		super.remove(attach);
	}
	
	public void update(AttachmentEntity attach){
		super.update(attach);
	}
	
	/**
	 * 通过att_id返回多
	 * @param att_id
	 * @return
	 */
	public List<AttachmentEntity>loanAttInfo(String biz_id) {
		String queryString = "from AttachmentEntity where biz_id = ? ";
		List<AttachmentEntity> list = (List<AttachmentEntity>) super.find(
				queryString, new Object[] { Integer.valueOf(biz_id)});
		return list;
	}
}
