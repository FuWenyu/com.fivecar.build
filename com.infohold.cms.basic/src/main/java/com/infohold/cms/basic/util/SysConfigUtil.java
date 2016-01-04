package com.infohold.cms.basic.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.basic.service.ISequenceService;

/**
 * 系统配置工具
 */
@Repository(value = "sysConfigUtil")
public class SysConfigUtil extends BaseDao<BaseEntity> {
	
	private List<Integer> primaryCach = new ArrayList<Integer>(); 
	
	private List<String> termSeqCach = new ArrayList<String>(); 
	
	@Autowired
	private ISequenceService sequenceClient;
	
	/**
	 * 获取五级分类处理日期
	 * @return
	 */
	public String getLoanClassDateMonth(){
		String sql="select value_ from sys_parameter_cfg a where a.key_ ='loan_class_date_month'";
		Map<String,Object> map=super.queryForMap(sql);
		String value=(String) map.get("value_");
		return value;
	}
	
	/**
	 * 获取系统记账日期
	 * @return
	 */
	public String getAccDate(){
		String sql="select value_ from sys_parameter_cfg a where a.key_ ='system_date'";
		Map<String,Object> map=super.queryForMap(sql);
		String value=(String) map.get("value_");
		return value;
	}
	
	/**
	 * 获取基准利率
	 * @return
	 */
	public String getBaseRate(String key){
		String sql="select value_ from sys_parameter_cfg a where a.key_ ='"+key+"'";
		Map<String,Object> map=super.queryForMap(sql);
		String value=(String) map.get("value_");
		return value;
	}
	
	/**
	 * 获取用户开户时的产品类型。pro_type_guarantee担保公司开户；pro_type_person投融资人开户
	 * @param key
	 * @return
	 */
	public String getProcCodyByOpenUser(String key){
		String sql="select value_ from sys_parameter_cfg a where a.key_ ='"+key+"'";
		Map<String,Object> map=super.queryForMap(sql);
		String value=(String) map.get("value_");
		return value;
	}
	
	/**
	 * 获取webService地址
	 * @param key
	 * @return
	 */
	public String getWsURL(String key){
		String sql="select value_ from sys_parameter_cfg a where a.key_ ='"+key+"'";
		Map<String,Object> map=super.queryForMap(sql);
		String value=(String) map.get("value_");
		return value;
	}
	
	/**
	 * 获取配置参数
	 * @param key
	 * @return
	 */
	public String getCfgInfo(String key){
		String sql="select value_ from sys_parameter_cfg a where a.key_ ='"+key+"'";
		Map<String,Object> map=super.queryForMap(sql);
		String value=(String) map.get("value_");
		return value;
	}
	
	
	/**
	 * 获取工作流图像地址
	 * @param key
	 * @return
	 */
	public String getWorkFlowImgURL(){
		String sql="select value_ from sys_parameter_cfg a where a.key_ ='activiti_explorer_url'";
		Map<String,Object> map=super.queryForMap(sql);
		String value=(String) map.get("value_");
		return value;
	}
	
	/**
	 * 获取核算系统对应的证件类型
	 * @param key
	 * @return
	 */
	public String getType(String type){
		String sql="select a.custtype_ifpa from pub_custtype_maping a where a.custtype_cms='"+type+"'";
		Map<String,Object> map=super.queryForMap(sql);
		String value=(String) map.get("custtype_ifpa");
		return value;
	}

	/**
	 * 生成主键ID
	 * @return
	 */
	public int getPrimaryId(){
		synchronized(primaryCach){
			if(primaryCach.isEmpty()){
				primaryCach=sequenceClient.getPrimaryId();
			}
			return getPrimaryId(primaryCach);
		}
	}
	
	/**
	 * 生成系统流水号
	 * @return
	 */
	public String getTermSeq(){
		synchronized(termSeqCach){
			if(termSeqCach.isEmpty()){
				termSeqCach=sequenceClient.getTermSeq();
			}
			return getTermSeqCach(termSeqCach);
		}
	}
	
	/**
	 * 取值
	 * @param primaryCach
	 * @return
	 */
	private int getPrimaryId(List<Integer> primaryCach){
		int value=primaryCach.get(0);
		primaryCach.remove(0);
		return value;
	}
	
	/**
	 * 取值
	 * @param termSeqCach
	 * @return
	 */
	private String getTermSeqCach(List<String> termSeqCach){
		String value=termSeqCach.get(0);
		termSeqCach.remove(0);
		return value;
	}
	
}
