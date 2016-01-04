package com.infohold.cms.basic.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.constant.TradeCodeDef;
import com.infohold.cms.basic.dao.impl.BizFlowDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.util.DateFormatUtil;
import com.infohold.cms.basic.util.SysConfigUtil;

/**
 * 
 * 描述:业务流水DAO
 * @author yangyantao
 */
@Service(value = "bizFlowService")
public class BizFlowService {

	@Autowired
	private SysConfigUtil sysConfigUtil;
	
	@Autowired
	private BizFlowDao bizFlowDao;
	
	/**
	 * 生成流水信息
	 * @param transData
	 * @throws BusinessException
	 */
	/*public void saveBizFlow(TransData transData)  {
		BizFlowEntity bizFlowEntity = new BizFlowEntity();
		bizFlowEntity.setFlow_no(sequenceUtil.getTermSeq()+"");
		bizFlowEntity.setBiz_id(sequenceUtil.getPrimaryId());
		bizFlowEntity.setBiz_code(transData.getViewMap().get("biz_code")+"");
		bizFlowEntity.setProduct_code(transData.getViewMap().get("product_code")+"");
		String tradeCode=transData.getTradeCode();
		String tradeName=TradeCodeDef.valueOf(tradeCode).cnname();
		bizFlowEntity.setStatus("1");
		bizFlowEntity.setTrade_code(tradeCode);
		bizFlowEntity.setTrade_name(tradeName);
		String oper_id=transData.getUserSession().getUserId();
		String oper_branch=transData.getUserSession().getBranchName();
		bizFlowEntity.setOper_id(oper_id);
		bizFlowEntity.setOper_branch(oper_branch);
		String create_date = transData.getUserSession().getAccDate();
		create_date = create_date+" "+DateFormatUtil.getCurrentTime();
		DateFormatUtil.getCurrentTime();
		bizFlowEntity.setCreate_date(create_date);
		transData.setBizFlowEntity(bizFlowEntity);
		bizFlowDao.save(bizFlowEntity);
	}*/
	
	/**
	 * 报错接口调用日志记录
	 * @param transData
	 * @throws BusinessException
	 */
	public void saveSendMsg(TransData transData) {
		List<BaseEntity> list =transData.getBizSendEntityList();
		if(!list.isEmpty()){
			for(int k=0;k<list.size();k++){
				bizFlowDao.save(list.get(k));
			}
		}
	}

}
