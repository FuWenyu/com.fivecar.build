package com.infohold.cms.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.Label;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.MD5Util;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.VersionDao;
import com.infohold.cms.entity.OrganizationEntity;
import com.infohold.cms.entity.VersionEntity;
import com.infohold.cms.util.DateUtil;

/**
 * 用户管理Service
 * @author wag
 *
 */
@SuppressWarnings("unchecked")
@Service("versionService")
public class VersionService implements IBusinessService {
	
	@Autowired
	private VersionDao versionDao;
	
	@Autowired
	private SysConfigUtil sysConfigUtil;
	
//	private DateUtil dateutil = new DateUtil();
	private DateUtil dateutil = new DateUtil();
	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode=transData.getTradeCode();
		if(tradCode.equals("T30001")){
			return this.findAll(transData);
		}
		else if(tradCode.equals("T30002")){
			return this.saveVersion(transData);
		}
		else if(tradCode.equals("T30003")){
			return this.deleteVersion(transData);
		}
		else if(tradCode.equals("T30004")){
			return this.updateVersionEntity(transData);
		}
		else if(tradCode.equals("T30005")){
			return this.Version_edit(transData);
		}
		return transData;	
	}
	
	/**
	 * 版本列表
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData findAll(TransData transData) throws BusinessException{
		List<Map<String, Object>> orgList = versionDao.queryOmsVersionList(transData.getViewMap(),transData.getPageInfo());
		transData.setObj(orgList);
		return transData;
		
	}
	
	/**
	 * 版本新增保存
	 * @param transData
	 * @return
	 */
	public TransData saveVersion(TransData transData) throws BusinessException{
//		Map<String,Object> checked_map = (Map<String, Object>) transData.getObj();
		Map<String,Object> map= transData.getViewMap();
		String version_id = String.valueOf(sysConfigUtil.getPrimaryId());
		String version_no = (String)map.get("version_no");
		String version_online = (String)map.get("version_online");
		String version_desc = (String)map.get("version_desc");
		String version_url = (String)map.get("version_url");
		String version_flag = (String)map.get("version_flag");
		Timestamp version_date = dateutil.getTimestamp();

		VersionEntity version= new VersionEntity();
		version.setVersion_no(version_no);
		version.setVersion_online(version_online);
		version.setVersion_desc(version_desc);
		version.setVersion_url(version_url);
		version.setVersion_flag(version_flag);
		version.setVersion_date(version_date);
		
		if("null".equals(version_id) || "".equals(version_id) || null==version_id){
			version.setVersion_id("#");
		}else{
			version.setVersion_id(version_id);
		}
		versionDao.saveVersionEntity(version);
		transData.setExpMsg("success");
		return transData;
		
	}
	
	/**
	 * 删除版本
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData deleteVersion(TransData transData) throws BusinessException{
		String id = (String) transData.getViewMap().get("version_id");
		versionDao.deleteVersionEntity(id);
		transData.setObj(true);
		return transData;
	}
	

	/**
	 * 版本详细信息
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData Version_edit(TransData transData) throws BusinessException{
		Map<String,Object> map= transData.getViewMap();
		String id = map.get("id")+"";
		VersionEntity version=versionDao.getVersionByid(id);
		transData.setObj(version);
		return transData;
	}
	/**
	 * 更新版本
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData updateVersionEntity(TransData transData) throws BusinessException{
		//页面数据
		Map<String,Object> map= transData.getViewMap();
		String version_id = (String)map.get("version_id");
		String version_no = (String)map.get("version_no");
		String version_desc = (String)map.get("version_desc");
		String version_url = (String)map.get("version_url");
		String version_flag = (String)map.get("version_flag");
		String version_online = (String)map.get("version_online");
		Timestamp version_date = dateutil.getTimestamp();

		VersionEntity version= new VersionEntity();
		version.setVersion_no(version_no);
		version.setVersion_desc(version_desc);
		version.setVersion_url(version_url);
		version.setVersion_flag(version_flag);
		version.setVersion_online(version_online);
		version.setVersion_date(version_date);
		
		if("null".equals(version_id) || "".equals(version_id) || null==version_id){
			version.setVersion_id("#");
		}else{
			version.setVersion_id(version_id);
		}
		versionDao.version_update(version);
		transData.setExpMsg("success");
		return transData;
	}

	/**
	 * 按照启用状态查询最新版本
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public VersionEntity Version_query(String version_online,String version_flag) throws BusinessException{
		return versionDao.getVersionByonline(version_online,version_flag);
	}
}
