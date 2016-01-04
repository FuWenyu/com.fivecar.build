package com.infohold.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.Label;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.dao.MenuDao;
import com.infohold.cms.entity.MenuEntity;

@Service("menuService")
public class MenuService implements IBusinessService {
	
	@Autowired
	private MenuDao menuDao;
	
	/**
	 * 默认执行的方法
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	@Override
	public TransData execute(TransData transData) throws BusinessException {
		return null;
	}

	/**
	 * 生成页面所需的tree_data json对象
	 */
	public String findByTree() {
		// 根节点
		StringBuilder treeStr = new StringBuilder(
				"var tree_data = {'-1' : {name: '菜单树', type:'folder', 'icon-class':'blue', id: '0'}};");
		List<String[]> menuTree = menuDao.findByTree();
		String prePID = "";
		for (int i = 0; i < menuTree.size(); i++) {
			String[] Item = (String[]) menuTree.get(i);
			String PID = Item[3];
			String name = Item[1];
			String title = "";

			if (i == 0) {
				treeStr.append("tree_data['-1']['additionalParameters']");

				if (!"-1".equals(Item[5])) {
					for (int j = 0; j < Item[5].length() / 3; j++) {
						treeStr.append("['children']['"
								+ Item[5].substring(0, (j + 1) * 3)
								+ "']['additionalParameters']");
					}
				}

				treeStr.append(" = {'children' : {");

				if (Item[4].equals("ISEND")) {
					treeStr.append("'" + Item[2] + "' : {name: ' " + name
							+ "', type: 'item', id: '" + Item[0]
							+ "', title: '" + title + "'}");
				} else {
					treeStr.append("'" + Item[2] + "' : {name: '" + name
							+ "', type: 'folder', 'icon-class':'blue', id: '"
							+ Item[0] + "', title: '" + title + "'}");
				}
			} else {
				if (!prePID.equals(PID)) {
					treeStr.append("}" + "};");

					treeStr.append("tree_data['-1']['additionalParameters']");

					if (!"-1".equals(Item[5])) {
						for (int j = 0; j < Item[5].length() / 3; j++) {
							treeStr.append("['children']['"
									+ Item[5].substring(0, (j + 1) * 3)
									+ "']['additionalParameters']");
						}
					}

					treeStr.append(" = {'children' : {");

					if (Item[4].equals("ISEND")) {
						treeStr.append("'" + Item[2] + "' : {name: ' " + name
								+ "', type: 'item', id: '" + Item[0]
								+ "', title: '" + title + "'}");
					} else {
						treeStr.append("'"
								+ Item[2]
								+ "' : {name: '"
								+ name
								+ "', type: 'folder', 'icon-class':'blue', id: '"
								+ Item[0] + "', title: '" + title + "'}");
					}
				} else {
					if (Item[4].equals("ISEND")) {
						treeStr.append(",'" + Item[2] + "' : {name: ' " + name
								+ "', type: 'item', id: '" + Item[0]
								+ "', title: '" + title + "'}");
					} else {
						treeStr.append(",'"
								+ Item[2]
								+ "' : {name: '"
								+ name
								+ "', type: 'folder', 'icon-class':'blue', id: '"
								+ Item[0] + "', title: '" + title + "'}");
					}
				}
			}

			prePID = PID;
		}

		if (menuTree.size() > 0) {
			treeStr.append("}" + "};");
		}
		return treeStr.toString();
	}

	public List<MenuEntity> findByPid(String pid) {
		return menuDao.findByPid(pid);
	}
	
	public List<MenuEntity> findByUserId(String userId){
		return menuDao.findByUserId(userId);
	}

	public List<Label> getSelectList() {
		return menuDao.getSelectList();
	}
}
