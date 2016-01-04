package com.infohold.cms.basic.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.dao.impl.SequenceDao;
import com.infohold.cms.basic.entity.SysSequenceCfgEntity;
import com.infohold.cms.basic.service.ISequenceService;
import com.infohold.cms.basic.util.DateFormatUtil;

@Service(value = "sequenceServiceImpl")
public class SequenceServiceImpl implements ISequenceService {

	@Autowired
	private SequenceDao sequenceDao;
	
	private final int primaryCachCount=100;
	
	private final int termSeqCachCount=100;
	
	@Override
	public List<Integer>  getPrimaryId(){
		List<Integer> list = new ArrayList<Integer>(); 
		String sql="select value_ value_ from sys_sequence_cfg a where a.key_ ='primary_id'";
		Map<String,Object> map=sequenceDao.queryForMap(sql);
		String value=(String) map.get("value_");
		String new_primary_id=(Integer.parseInt(value) + primaryCachCount) +"";
		SysSequenceCfgEntity entity = new SysSequenceCfgEntity();
		entity=(SysSequenceCfgEntity) sequenceDao.get(entity.getClass(),"primary_id");
		entity.setValue(new_primary_id);
		sequenceDao.update(entity);
		for(int n=1;n<=primaryCachCount;n++){
			list.add(Integer.parseInt(value) + n);
		}
		return list;
	}

	@Override
	public List<String> getTermSeq(){
		List<String> list = new ArrayList<String>(); 
		String sql="select value_ value_ from sys_sequence_cfg a where a.key_ ='termSeq'";
		Map<String,Object> map=sequenceDao.queryForMap(sql);
		String value=(String) map.get("value_");
		String new_termSeq=(Integer.parseInt(value) + termSeqCachCount) +"";
		SysSequenceCfgEntity entity = new SysSequenceCfgEntity();
		entity=(SysSequenceCfgEntity) sequenceDao.get(entity.getClass(),"termSeq");
		entity.setValue(new_termSeq);
		sequenceDao.update(entity);
		for(int n=1;n<=termSeqCachCount;n++){
			//String seq = "TFSP"+DateFormatUtil.getDate().replaceAll("-", "") + (Integer.parseInt(value) + n);
			String seq = DateFormatUtil.getDate().replaceAll("-", "") + (Integer.parseInt(value) + n);
			list.add(seq);
		}
		return list;
	}

}
