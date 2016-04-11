package com.infohold.cms.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Label;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.basic.util.StrUtil;
import com.infohold.cms.entity.OrganizationEntity;

@Repository("organizationDao")
public class OrganizationDao extends BaseDao<BaseEntity>{

	/**
	 * 查找OrgTree，用于树形显示
	 */

	public List<String[]> findByTree() {
		String queryString = "SELECT "
				+"	id, "
				+"	name, "
				+"	id, "
				+"	pid, "
				+"	( "
				+"		SELECT "
				+"			count(1) "
				+"		FROM "
				+"			auth_organization b "
				+"		WHERE "
				+"			b.id <> a.id "
				+"		AND b.id LIKE concat(a.id, '%') "
				+"	) subct "
				+"FROM "
				+"	auth_organization a "
				+"ORDER BY "
				+"	length(id), "
				+"	id";
		List<Object[]> listObj = super.findBySQL(queryString);
		List<String[]> listStr=new ArrayList<String[]>();
		String[] Item = null;
		for(Object[] obj:listObj){
			Item = new String[6];
			//id
			Item[0]=(String) obj[0];
			//name
			Item[1]=(String) obj[1];
			//orgId
			Item[2]=(String) obj[2];
			//pId
			Item[3]=(String) obj[3];
			//subct 下级菜单数
			Item[4]=String.valueOf(obj[4]);
			if(Integer.valueOf(Item[4]) >0){
				Item[4]="";
			}else{
				Item[4]="ISEND";
			}
			String parentMenuId = Item[2].substring(0, Item[2].length()-3);
			if(null == parentMenuId || "".equals(parentMenuId)) {
				parentMenuId = "-1";
			}
			//上级orgId
			Item[5] = parentMenuId;
			listStr.add(Item);
		}
		return listStr;
	}
	
	public List<Label> getSelectList() {
		String queryString = "select id,name from auth_organization order by id";
		List<Object[]> listObj = super.findBySQL(queryString);
		List<Label> list = new ArrayList<Label>();
		list.add(new Label("0", "根机构 | 0"));
		for(Object[] obj:listObj){
			list.add(new Label((String)obj[0], (String)(obj[1])+" | "+obj[0]));
		}
		return list;
	}
	
	/**
	 * 机构列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String,Object>> queryOrganizationList(Map<String,Object> map,Page page) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT "
					+" r.id, "
					+" r.name, "
					+" r.orgid, "
					+" r.orgtype, "
					+" r.pid, "
					+"	( "
					+"		SELECT "
					+"			b.orgid "
					+"		FROM "
					+"			auth_organization b "
					+"		WHERE "
					+"			b.id = r.pid "
					+"	) porgid "
					+" FROM "
					+" auth_organization r"
					+" WHERE 1=1"
					+ " AND r.orgid !=999"
				);
		if(!map.isEmpty()){
			if(!StrUtil.isNullOrEmpty(map.get("name"))){
				sql.append(" AND r.name like '%"+map.get("name")+"%'");
			}
			if(!StrUtil.isNullOrEmpty(map.get("orgid"))){
				sql.append(" AND r.orgid = '"+map.get("orgid")+"'");
			}
		}
		sql.append(" order by r.id desc ");
		return super.excutePageQuery(sql.toString(),page);
	}
	
	/**
	 * 获取机构等级
	 * @param key
	 * @param value
	 * @return
	 */
	public List<Label> getTypeByKey(String key) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT *  FROM  pub_static_def where 1=1 ");
		sql.append(" and key_ = '"+key+"'");
		
		List<Label> list = new ArrayList<Label>();
		List<Map<String,Object>> userList = queryForList(sql.toString());
		for(Map<String,Object> map:userList){
			Label label = new Label((String)map.get("value_"),(String)map.get("name_"));
			list.add(label);
		}
		return list;
	}
	
	/**
	 * 获取机构等级
	 * @param key
	 * @param value
	 * @return
	 */
	public List<Map<String,Object>> getOrgType_p() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT w.id,w.pid,w.name,w.orgid,w.orgtype  FROM  auth_organization w where 1=1 ");
		sql.append(" and w.orgtype in (1,2)  ");
		sql.append(" order by w.orgtype desc  ");
		return super.queryForList(sql.toString());
	}
	
	/**
	 * 获取机构id
	 * @param key
	 * @param value
	 * @return
	 */
	public List<Map<String,Object>> getid(int length) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT MAX(w.id) AS id  FROM  auth_organization w WHERE 1=1 AND LENGTH(w.ID)= "+length);
		return super.queryForList(sql.toString());
	}
	
	/**
	 * 格式化机构id
	 * @param key
	 * @param value
	 * @return
	 */
	public String getNewId(String pid) {
		if("null".equals(pid) || "".equals(pid) || null==pid){
			List<Map<String,Object>> list = getid(3);
			if(list.get(0)==null ){
				return "001";
			}else{
				String oldid=list.get(0).get("id")+"";
				String newid =String.valueOf((Integer.parseInt(oldid)+1));
				for(int i=3;newid.length()<i; ){
					newid="0"+newid;
				}
				return  newid;
			}
		}
		else{
			int length=pid.length()+3;
			List<Map<String,Object>> list = getid(length);
			String pid1=list.get(0).get("id")+"";
			if(null==pid1 || "".equals(pid1)||"null".equals(pid1)){
				return pid+"001";
			}else{
				String oldid=list.get(0).get("id")+"";
				String a=oldid.substring(oldid.length()-3);
				String newid =String.valueOf((Integer.parseInt(a)+1));
				for(int i=3;newid.length()<i; ){
					newid="0"+newid;
				}
				return pid+newid;
			}
		}
	}
	/**
	 * 通过ID查询机构信息
	 * @return
	 */
	public Map<String, Object> getOrgByid(String id) {
		String sql = "SELECT "
				+" r.id, "
				+" r.name, "
				+" r.orgid, "
				+" r.orgtype, "
				+" r.pid, "
				+"	( "
				+"		SELECT "
				+"			b.orgid "
				+"		FROM "
				+"			auth_organization b "
				+"		WHERE "
				+"			b.id = r.pid "
				+"	) porgid, "
				+"	( "
				+"		SELECT "
				+"			c.name "
				+"		FROM "
				+"			auth_organization c "
				+"		WHERE "
				+"			c.id = r.pid "
				+"	) pname "
				+" FROM "
				+" auth_organization r "
				+" WHERE 1=1 "
				+" and r.id = "+id
				;
		return super.queryForMap(sql);
	}
	public OrganizationEntity getOrgnByid(String id) {
			OrganizationEntity entity = new OrganizationEntity();
			entity = (OrganizationEntity) super.get(OrganizationEntity.class, id);
			return entity;
		}
}
