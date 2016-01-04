package com.infohold.cms.basic.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.infohold.cms.basic.common.FileVO;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.dao.impl.AttachmentDao;
import com.infohold.cms.basic.entity.AttachmentEntity;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.DateFormatUtil;
import com.infohold.cms.basic.util.FileUtil;
import com.infohold.cms.basic.util.SysConfigUtil;

@Service(value = "attService")
public class AttachmentServiceImpl implements IBusinessService{

	@Autowired
	private AttachmentDao attDao;
	
	@Autowired
	private SysConfigUtil sysConfigUtil;
	
	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode=transData.getTradeCode();
		if(tradCode.equals("T90001")){
			return this.upload(transData);
		}else if(tradCode.equals("T90002")){
			return this.download(transData);
		}else if(tradCode.equals("T90003")){
			return this.remove(transData);
		}
		return transData;
	}

	/**
	 * 附件上传
	 * @param transData
	 * @return
	 */
	public TransData upload(TransData transData) {
		MultipartFile file = (MultipartFile) transData.getObj();
		String biz_id = (String) transData.getViewMap().get("biz_id");
		String biz_type  = (String) transData.getViewMap().get("biz_type");
		String fileName = file.getOriginalFilename();
		// 文件检查
		FileUtil.fileCheck(file);
		// 记录数据库
		Blob blob = null;
		try {
			blob = Hibernate.createBlob(file.getInputStream());
		} catch (IOException e) {
			throw new BusinessException("E013");
		}
		AttachmentEntity attach = new AttachmentEntity();
		attach.setAtt_id(String.valueOf(sysConfigUtil.getPrimaryId()));
		attach.setAtt_name(fileName);
		attach.setAtt_suffix(fileName.substring(fileName.lastIndexOf(".")+1));
		attach.setAtt_size(file.getSize());
		attach.setAtt_blob(blob);
		attach.setBiz_id(Integer.valueOf(biz_id));
		attach.setBiz_type(Integer.valueOf(biz_type));
		attach.setCreate_date(DateFormatUtil.getCurrentDate());
		attDao.save(attach);
		// 组装返回数据
		FileVO vo = new FileVO();
		vo.setAtt_id(attach.getAtt_id());
		vo.setAtt_name(fileName);
		transData.setObj(vo);
		return transData;
	}


	/**
	 * 附件下载
	 * @param transData
	 * @return
	 */
	public TransData download(TransData transData) {
		String att_id = (String) transData.getViewMap().get("att_id");
		AttachmentEntity attach = attDao.get(att_id);
		if (attach == null)
			return null;
		Blob blob = attach.getAtt_blob();
	    InputStream inputStream = null;
	    byte[] b = null;
		try {
			inputStream = blob.getBinaryStream();
			int length = (int)blob.length();
			b = new byte[length];
			inputStream.read(b,0,length);//IO流
		} catch (SQLException e) {
			throw new BusinessException("E012");
		}
		catch (IOException e) {
			throw new BusinessException("E012");
		}
		FileVO vo = new FileVO();
		vo.setAtt_name(attach.getAtt_name());
		vo.setData(b);
		transData.setObj(vo);
		return transData;
	}

	/**
	 * 附件删除
	 * @param transData
	 * @return
	 */
	public TransData remove(TransData transData) {
		String att_id = (String) transData.getViewMap().get("att_id");
		AttachmentEntity attach = (AttachmentEntity) attDao.get(AttachmentEntity.class, att_id);
		try {
			attDao.remove(attach);
			transData.setObj(true);
		} catch (Exception e) {
			transData.setObj(false);
			throw new BusinessException("E008");
		}
		return transData;
	}

	public List<AttachmentEntity> loanAttInfo(String att_id) {
		return attDao.loanAttInfo(att_id);
	}
}
