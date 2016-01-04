package com.infohold.cms.basic.controller.impl;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.infohold.cms.basic.common.FileVO;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.basic.exception.BusinessException;

/**
 * 附件Controller
 * @author wanglei
 *
 */
@Controller
public class FileController extends CentreController{

	/**
	 * 文件上传
	 * 
	 * @param request
	 * @param myfile
	 * @return
	 */
	@RequestMapping("/mvc/fileUpLoad.do")
	@ResponseBody
	public Map<String,Object> fileUpLoad(HttpServletRequest request, MultipartFile myfile) {
		TransData transData = new TransData();
		transData.setServiceName("attService");
		transData.setTradeCode("T90001");
		transData.setObj(myfile);
		transData=super.doService(request, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		String expCode=transData.getExpCode();
		if(null != expCode && !"".equals(expCode)){
			map.put("reCode", "failed");
			map.put("expMsg",expCode+":"+ transData.getExpMsg());
		}else{
			FileVO fileVo = (FileVO) transData.getObj();
			map.put("fileVo", fileVo);
			map.put("reCode", "success");
		}
		return map;

	}

	/**
	 * 文件删除
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/mvc/removeFile.do")
	@ResponseBody
	public boolean removeFile(HttpServletRequest request) {
		TransData transData = new TransData();
		transData.setServiceName("attService");
		transData.setTradeCode("T90003");
		transData=super.doService(request, transData);
		return (Boolean) transData.getObj();
	}

	/**
	 * 文件下载
	 * 
	 * @param att_id
	 * @param order
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/mvc/downloadFile.do")
	@ResponseBody
	public void downdloadFile(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("attService");
		transData.setTradeCode("T90002");
		transData=super.doService(request, transData);
		FileVO fileVo = (FileVO) transData.getObj();
		response.setContentType("application/x-download");
		String filedisplay = fileVo.getAtt_name();
		filedisplay = URLEncoder.encode(filedisplay, "UTF-8");
		response.addHeader("Content-Disposition", "attachment;filename="
				+ filedisplay);
		OutputStream out = null;
		try {
			out = response.getOutputStream();
			out.write(fileVo.getData());
			out.flush();
		} catch (Exception e) {
			// 文件读取失败
			throw new BusinessException("E012");
		} finally {
			if (out != null) {
				out.close();
			}
		}

	}

	/**
	 * 图片查看
	 * 
	 * @param att_id
	 * @param order
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	/*@RequestMapping("/mvc/viewImages.do")
	@ResponseBody
	public void viewImages(String att_id,HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if(StrUtil.isNullOrEmpty(att_id) || "null".equals(att_id)){
			throw new BusinessException("W00008");
		}
		FileVO fileVo = attService.download(att_id);
		response.setContentType("image/jpeg");
		String filedisplay = fileVo.getAtt_name();
		filedisplay = URLEncoder.encode(filedisplay, "UTF-8");
		OutputStream out = null;
		try {
			out = response.getOutputStream();
			out.write(fileVo.getData());
			out.flush();
		} catch (Exception e) {
			// 文件读取失败
			throw new BusinessException("W00004");
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}*/
}
