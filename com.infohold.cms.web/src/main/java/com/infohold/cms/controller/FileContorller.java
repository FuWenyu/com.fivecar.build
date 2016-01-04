/*package com.infohold.cms.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mzsx.admin.contorller.AdminContorller;
import com.mzsx.flie.service.FileService;
import com.mzsx.model.Admin;
import com.mzsx.model.FileLoading;

@Controller
@RequestMapping("file.sp")
public class FileContorller {
        @Autowired
        private FileService fileService;
        private static Logger logger = Logger.getLogger(AdminContorller.class);
        @RequestMapping(params = "method=upload", method = RequestMethod.POST)
        public void addFileUp(HttpServletRequest request,HttpServletResponse response) {
                Map<String, Object> map = new HashMap<String, Object>();
                FileLoading fileUp = new FileLoading();
                //获取用户
                Admin admin = (Admin) request.getSession().getAttribute("admin");
                int userid = admin.getId();//用户ID
                Date createdTime = new Date();

                //使用MultipartHttpServletRequest包装文件数据
                MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
                //目录命名格式如：*files2013-03-05-22
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd-HH");
                //构建图片保存的目录
                String logoPathDir = "/files" + dateformat.format(new Date());
                //得到图片保存目录的真实路径 
                String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
                //根据真实路径创建目录
                File logoSaveFile = new File(logoRealPathDir);
                if (!logoSaveFile.exists())
                        logoSaveFile.mkdirs();
                //页面控件的文件流
                MultipartFile multipartFile = multipartRequest.getFile("userfile");
                // 获取文件名/
                String filename = multipartFile.getOriginalFilename();
                fileUp.setFileOldName(filename);
                long time = createdTime.getTime(); // 时间
                int index = filename.lastIndexOf(".");
                if (index == -1) {
                        filename = filename + "-" + time; // 文件名
                        logger.info("文件名："+filename);
                } else {
                        filename = filename.substring(0, index) + "-" + time
                                        + filename.substring(index);
                        logger.info("文件名："+filename);
                }
                
                //设置属性值
                fileUp.setUserid(userid);
                fileUp.setFileNewName(filename);
                fileUp.setPath(logoRealPathDir);
                fileUp.setStatus(1);

                //拼成完整的文件保存路径加文件 
                String fileName = logoRealPathDir + File.separator + filename;
                File file = new File(fileName);
                try {
                        //保存上传文件
                        multipartFile.transferTo(file);
                        logger.info(filename+"上传成功！！！");
                        try {
                                //插入数据库
                                fileService.insertFile(fileUp);
                                map.put("success", "true");
                        } catch (Exception e) {
                                // TODO: handle exception
                                map.put("success", "false");
                                logger.error("异常出现："+e);
                        }
                        ；String json = "{success: true}";
                        response.setContentType("text/html; charset=UTF-8");
                        response.getWriter().write(json);
                        response.flushBuffer();
                        Map<String, Object> result = new HashMap<String, Object>(0);
                        result.put("success", true);
                        response.setContentType("text/html");
                        ObjectMapper mapper = new ObjectMapper();
                        mapper.writeValue(response.getOutputStream(), result);
                        response.setContentType("text/html;charset=UTF-8");  
                        response.getWriter().write("{success:true}");

                } catch (IllegalStateException e) {
                        logger.error("异常出现："+e);
                } catch (IOException e) {
                        logger.error("异常出现："+e);
                }
                //response.setContentType("text/html; charset=UTF-8");
                //response.setContentType("application/json; charset=utf-8");
                //return new ModelAndView("jsonView", map);
                String json="{success : true}";
                HttpHeaders reHeaders=new HttpHeaders();
                reHeaders.setContentType(MediaType.TEXT_HTML);
                return new ResponseEntity<String>(json,reHeaders,HttpStatus.OK);
                

        }
        


}
*/