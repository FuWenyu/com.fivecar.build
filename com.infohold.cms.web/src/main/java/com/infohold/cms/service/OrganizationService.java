package com.infohold.cms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.basic.common.Label;
import com.infohold.cms.dao.OrganizationDao;
import com.infohold.cms.entity.OrganizationEntity;
import com.infohold.cms.entity.RoleEntity;

@Service("organizationService")
public class OrganizationService implements IBusinessService{

	@Autowired
	private OrganizationDao organizationDao;
	
	@Autowired
	private SysConfigUtil sysConfigUtil;

	/**
	 * 默认执行的方法
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode=transData.getTradeCode();
		if(tradCode.equals("T50021")){
			return this.findAll(transData);
		}
		else if(tradCode.equals("T50022")){
			return this.organization_add(transData);
		}
		else if(tradCode.equals("T50023")){
			return this.organization_addSave(transData);
		}
		else if(tradCode.equals("T50024")){
			return this.organization_view(transData);
		}
//		else if(tradCode.equals("T50025")){
//			return this.role_addSave(transData);
//		}
//		else if(tradCode.equals("T50026")){
//			return this.role_edit(transData);
//		}
//		else if(tradCode.equals("T50027")){
//			return this.role_editSave(transData);
//		}
//		else if(tradCode.equals("T50028")){
//			return this.role_delete(transData);
//		}
		return transData;	
	}
	
	/**
	 * 机构列表
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData findAll(TransData transData) throws BusinessException{
		List<Map<String,Object>> organizationList = organizationDao.queryOrganizationList(transData.getViewMap(),transData.getPageInfo());
		transData.setObj(organizationList);
		return transData;
	}
	
	public String findByTree() {
		// 根节点
		StringBuilder treeStr = new StringBuilder(
				"var tree_data = {'-1' : {name: '机构树', type:'folder', 'icon-class':'blue', id: '0'}};");
		List<String[]> menuTree = organizationDao.findByTree();
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

	public List<Label> getSelectList() {
		return organizationDao.getSelectList();
	}
	
	/**
	 * 机构新增生成编号
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData organization_add(TransData transData) throws BusinessException{
		String orgid = String.valueOf(sysConfigUtil.getPrimaryId());
		List<Label> orgtypeList=organizationDao.getTypeByKey("orgtype");
		List<Map<String,Object>> pOrgtypeList=(List<Map<String,Object>>)organizationDao.getOrgType_p();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("orgid", orgid);
		map.put("orgtypeList", orgtypeList);
		map.put("pOrgtypeList", pOrgtypeList);
		transData.setObj(map);
		return transData;
	}
	
	/**
	 * 角色新增保存
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData organization_addSave(TransData transData) throws BusinessException{
		Map<String,Object> map= transData.getViewMap();
		String orgid=map.get("orgid")+"";
		String name=map.get("name")+"";
		String orgtype=map.get("orgtype")+"";
		String pid=map.get("pid")+"";
		OrganizationEntity organizationEntity= new OrganizationEntity();
		String id=organizationDao.getNewId(pid);
		organizationEntity.setId(id);
		organizationEntity.setName(name);
		organizationEntity.setOrgid(orgid);
		organizationEntity.setOrgtype(orgtype);
		if("null".equals(pid) || "".equals(pid) || null==pid){
			organizationEntity.setPid("#");
		}else{
			organizationEntity.setPid(pid);
		}
		organizationDao.save(organizationEntity);
		transData.setExpMsg("success");
		return transData;
	}
	
	/**
	 * 机构信息查询
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData organization_view(TransData transData) throws BusinessException{
		Map<String,Object> map = transData.getViewMap();
		String id=map.get("id")+"";
		List<Label> orgtypeList=organizationDao.getTypeByKey("orgtype");
		Map<String,Object> orgmap=new HashMap<String, Object>();
		if(null!=id && !"0".equals(id) && !"".equals(id) ){
			orgmap.put("organizationEntity", organizationDao.getOrgByid(id));
		}
		orgmap.put("orgtypeList", orgtypeList);
		transData.setObj(orgmap);
		return transData;
	}
	
}
