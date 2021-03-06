<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/commonList.jsp"></jsp:include><!-- 引入公供js -->
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/vehicle_save.do"
					method="post">
					<h3 class="header smaller lighter grey">4s店车辆信息新增</h3>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id"> </label>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							所属车辆</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="vehicle" name="vehicle">
							<c:forEach items="${vehicleList}" var="list" varStatus="status">
	                        <option value="${list.id}-${list.vehicleName}-${list.carbrandid}-${list.carbrand}">${list.carbrand}-${list.vehicleName}</option>
	               		    </c:forEach>
               		    </select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							车型名称  </label>
						<div class="col-sm-9">
							<input type="text" id="modelName" name="modelName" placeholder="请输入车型名称 "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							官方指导价格</label>
						<div class="col-sm-9">
							<input type="text" id="originalprice" name="originalprice" placeholder="请输入官方指导价格！ "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							五车折扣价格</label>
						<div class="col-sm-9">
							<input type="text" id="discountprice" name="discountprice" placeholder="请输入五车折扣价格！ "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							配置摘要</label>
						<div class="col-sm-9">
							<input type="text" id="Carabstract" name="Carabstract" placeholder="请输入配置摘要！ "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" for="fileInput">车型图片上传</label>
							<div class="col-sm-3" id="upload">
								<div class="ace-file-input col-sm-12" id="fileInputDiv">
									<input type="file" id="fileInput" name="myfile" class="ace-file-input col-sm-12" onblur="clean()">
								</div>
							</div>
							<div class="col-sm-4">
								<h6 class="inline blue">请上传|gif|png|jpg|jpeg格式附件。</h6>
							</div>
					</div>
					<div class="form-group hide" id="fileListGroup">
								<label class="col-sm-2 control-label no-padding-right" for="btn">已上传文件</label>
								<div class="col-sm-3" id="upload1">
								</div>
								<div class="col-sm-4">
								</div>
					</div>
					
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
		
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="goBack();">
								<i class="icon-reply bigger-110"></i> 返回
							</button>
						</div>
					</div>
				</form>
				<!-- PAGE CONTENT ENDS -->
				</div>
			</div>
		</div>
	
	<script type="text/javascript">
	
	
	jQuery(function($) {
		
		//上传文件控件
		$('#fileInput').ace_file_input({
			no_file:'空...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false
		});
		
		
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
	});
	
	function pictureupload(){
		
	}
	
	function subForm() {
		if (!checkData('vehicle', '所属车辆', 'input')) {
			return;
		}
		if (!checkData('modelName', '车型名称', 'input')) {
			return;
		}
		if (!checkData('modelName', '车型名称', 'illegal')) {
			return;
		}
		if (!limitCheck('modelName', '车型名称', 64)) {
			return;
		}
		
		if (!checkData('originalprice', '官方指导价格', 'input')) {
			return;
		}
		if (!checkData('originalprice', '官方指导价格', 'illegal')) {
			return;
		}
		if (!limitCheck('originalprice', '官方指导价格', 32)) {
			return;
		}
		
		if (!checkData('discountprice', '五车折扣价格', 'input')) {
			return;
		}
		if (!checkData('discountprice', '五车折扣价格', 'illegal')) {
			return;
		}
		if (!limitCheck('discountprice', '五车折扣价格', 32)) {
			return;
		}
		
		if (!checkData('Carabstract', '配置摘要', 'input')) {
			return;
		}
		if (!checkData('Carabstract', '配置摘要', 'illegal')) {
			return;
		}
		if (!limitCheck('Carabstract', '配置摘要', 255)) {
			return;
		}
		//附件格式控制，ID，白名单
		var fileInput=$("#fileInput").val();
		var array=fileInput.split(".");
		if("|gif|png|jpg|jpeg|jasper".indexOf(array[1])==-1){
			myalert("此文件格式不支持上传！");
			return;
		}; 
		//var fileInput = $("#fileInput").val();
		if(fileInput==null ||fileInput=="" ){
			$("#fileInputDiv").next().remove();
			$("#fileInputDiv").after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;请上传附件");
			return false;
		}
		param = {};
		param["biz_id"]=$("#report_id").val();
		param["biz_type"]="1";
		//ajax上传文件
		$.ajaxFileUpload({
			url :  "<%=path%>/mvc/pictureUpLoad.do",
			type : "POST",
			secureuri : false,
			fileElementId : 'fileInput',
			data : param,
			dataType : 'JSON',
			success : function(data,status){
				var obj = $.parseJSON($(data).html());
				if(obj.reCode == "failed"){
					myalert(obj.expMsg,initFileInput);
					return false;
					/* initFileInput(); */
				}else{
					$("#fileListGroup").removeClass("hide");
// 					$("#upload1").append("<label class='filelist col-sm-12'><a href=\"downloadFile.do?att_id="+obj.fileVo.attId+"\">"+obj.fileVo.attName+" &nbsp;&nbsp;&nbsp;</a><a class=\"remove\" data-attid="+obj.fileVo.attId+" data-fileName="+obj.fileVo.fileName+" href=\"#\" onclick=\"removeFile(this);\"><i class=\"icon-remove\"></i></a></label>");
					initFileInput();
					subForm1(obj.imageName,obj.filePath,obj.filePathreal,obj.imageid);
					return true;
				}
				
			},
			error : function(data,status,e){
				initFileInput();
				return false;
			}
		});
	}
	
	function subForm1(imageName,filePath,filePathreal,imageid){
		param = {};
		param["vehicle"]=$("#vehicle").val();
		param["modelName"]=$("#modelName").val();
		param["originalprice"]=$("#originalprice").val();
		param["discountprice"]=$("#discountprice").val();
		param["Carabstract"]=$("#Carabstract").val();
		param["imageName"]=imageName;
		param["imageHref"]=filePath;
		param["imageHrefReal"]=filePathreal;
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/model_save.do",
			data : param,
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					alert("保存成功！");
					window.location = "<%=path%>/mvc/model.do";
				}else{
					alert("保存失败:"+data.msg);
				}
			},
			error : function(msg) {
				alert("分配出错  " + msg);
			}
		});
	}
	function removeFile(obj){
		var param={};
		param["att_id"]=$(obj).data("attid");
		$.ajax( {
			type : "POST",
			url : "removeFile.do",
			data : param,
			async : false,
			success : function(flag) {
				if(flag){
					myalert("删除成功",initFileInput);
					$(obj).parents("label").remove();
					$("#fileUpLoadBtn").show();
				}else{
					myalert("删除失败",initFileInput);
				}
				
			},
			error : function(msg) {
				myalert("表单提交失败："+msg,initFileInput);
			}
		}); 
	}
	function initFileInput(){
		var html = "<div class=\"ace-file-input col-sm-12\" id=\"fileInputDiv\"> "+
		"<input type=\"file\" id=\"fileInput\" name=\"myfile\" class=\"ace-file-input col-sm-12\" onblur=\"clean()\"> "+
		"<div id=\"fileInput_font\" class=\"help-block red\" onclick=\"clean()\"></div></div>"; 
		$("#fileInputDiv").remove(); 
		$("#upload").html(html); 
		$('#fileInput').ace_file_input({
			no_file:'空...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false 
		}); 
		setHash('${pageContext.request.contextPath}');
	}
	function goBack(){
			window.location = "<%=path%>/mvc/model.do";
	}
	</script>
</body>
</html>
