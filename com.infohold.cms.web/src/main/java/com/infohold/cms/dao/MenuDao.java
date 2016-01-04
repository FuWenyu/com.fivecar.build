package com.infohold.cms.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Label;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.MenuEntity;

@Repository("menuDao")
public class MenuDao extends BaseDao<BaseEntity>{

	public List<MenuEntity> findAll() {
		String queryString = "from MenuEntity order by id";
		return (List<MenuEntity>) super.find(queryString);
	}

	public List<MenuEntity> findByUserId(String userId) {
		List<MenuEntity> menuList = new ArrayList<MenuEntity>();
		String queryString = "select t3.ID,t3.NAME,t3.PID,t3.URL"
				+ " from auth_user a,auth_user_role t1,auth_role_menu t2,auth_menu t3 where a.loginid=? and t1.ROLEID=t2.ROLEID and t2.MENUID=t3.ID "
				+ " AND a.userid=t1.USERID"
				+ " group by t3.ID";
		List<Object[]> objectsList = super.findBySQL(queryString, userId);
		for (Object[] objects : objectsList) {
			MenuEntity menuEntity = new MenuEntity();
			menuEntity.setId((String) objects[0]);
			menuEntity.setName((String) objects[1]);
			menuEntity.setPid((String) objects[2]);
			menuEntity.setUrl((String) objects[3]);
			menuList.add(menuEntity);
		}
		return menuList;
	}

	/**
	 * 查找MenuTree，用于树形显示
	 */
	public List<String[]> findByTree() {
		String queryString = "select id,name,id,pid,(select count(1) from auth_menu b where b.id <> a.id and b.id like concat(a.id,'%')) subct from auth_menu a order by length(id),id";
		List<Object[]> listObj = super.findBySQL(queryString);
		List<String[]> listStr = new ArrayList<String[]>();
		String[] Item = null;
		for (Object[] obj : listObj) {
			Item = new String[6];
			// id
			Item[0] = (String) obj[0];
			// name
			Item[1] = (String) obj[1];
			// menuId
			Item[2] = (String) obj[2];
			// pId
			Item[3] = (String) obj[3];
			// subct 下级菜单数
			Item[4] = String.valueOf(obj[4]);
			if (Integer.valueOf(Item[4]) > 0) {
				Item[4] = "";
			} else {
				Item[4] = "ISEND";
			}
			String parentMenuId = Item[2].substring(0, Item[2].length() - 3);
			if (null == parentMenuId || "".equals(parentMenuId)) {
				parentMenuId = "-1";
			}
			// 上级menuId
			Item[5] = parentMenuId;
			listStr.add(Item);
		}
		return listStr;
	}

	public List<MenuEntity> findByPid(final String pid) {
		String queryString = "from MenuEntity me where me.pid=?";
		List<MenuEntity> menuList = super.find(queryString, pid);
		return menuList;
	}

	public List<Label> getSelectList() {
		String queryString = "select ID,NAME from auth_menu where URL = '#' order by ID";
		List<Object[]> objectsList = super.findBySQL(queryString);
		List<Label> list = new ArrayList<Label>();
		list.add(new Label("0", "根菜单"));
		for (Object[] objects : objectsList) {
			list.add(new Label((String) objects[0], (String) objects[1]));
		}
		return list;
	}

}
