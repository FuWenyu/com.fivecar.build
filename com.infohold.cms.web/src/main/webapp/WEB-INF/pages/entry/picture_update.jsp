<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8" />
	<!-- basic styles -->
	<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="<%=path%>/css/font-awesome.min.css" />
	<link rel="stylesheet" href="<%=path%>/css/ace-fonts.css" />
	<link rel="stylesheet" href="<%=path%>/css/ace.min.css" />
	<link rel="stylesheet" href="<%=path%>/css/ace-rtl.min.css" />
	<link rel="stylesheet" href="<%=path%>/css/ace-skins.min.css" />
	<link rel="stylesheet" href="<%=path%>/css/datepicker.css" />
	<link rel="stylesheet" href="<%=path%>/css/bootstrap-timepicker.css" />
	<link rel="stylesheet" href="<%=path%>/css/daterangepicker.css" />
	<link rel="stylesheet" href="<%=path%>/css/jquery-ui-1.10.3.full.min.css" />
	<script src="<%=path%>/js/ace-extra.min.js"></script>
	</head>
	<!-- 该页面为iframe嵌套页面，以下代码用于计算iframe高度，不允许修改：
			<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
			<div id="iframeDiv" style="display:none"></div>
			<div class="page-content" id="loadPageContent">
	-->
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/picture_editSave.do"
					method="post">
					<h3 class="header smaller lighter grey">图片信息修改</h3>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id"> </label>
					</div>
					<input id="picture_id" type="hidden" class="" name="picture_id" id="picture_id"   value="${picture.id}" />
					<input id="usefor" type="hidden" class="" name="usefor" id="usefor"   value="${picture.usefo}-${picture.usefoName}" />
					<input id="usefo1" type="hidden" class="" name="usefo1" id="usefo1"   value="${picture.usefo}" />
					<input id="anchor1" type="hidden" class="" name="anchor1" id="anchor1"   value="${picture.anchorid}" />
<%-- 					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							图片名称 </label>
						
						<div class="col-sm-9">
							<input type="text" id="imageName" name="imageName" placeholder="请输入图片名称 "
								class="col-xs-10 col-sm-5"
								value="${picture.imageName}" /> <span style="color: red"></span>
						</div>
					</div> --%>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							标题</label>
						
						<div class="col-sm-9">
							<input type="text" id="title" name="title" placeholder="请输入图片名称 "
								class="col-xs-10 col-sm-5"
								value="${picture.title}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							用途</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="usefo" name="usefo" disabled="disabled">
                                <option value="">-请选择-</option> 
								<option value="12-行业资讯">行业资讯</option>
								<option value="22-优惠信息">优惠信息</option>
								<option value="32-汽车生活">汽车生活</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							图片链接地址 </label>
						<div class="col-sm-9">
						<select class="input-medium"  id="anchor" name="anchor">
							<c:forEach items="${resourcesList}" var="list" varStatus="status">
	                        <option value="${list.id}">${list.resourceName }</option>
	               		    </c:forEach>
               		    </select>
               		    </div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							图片描述 </label>
						<div class="col-sm-9">
							<textarea rows="6" cols="72" id="description" name="description">${picture.description}</textarea>
						</div>
					</div>

					<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" for="fileInput">上传文件</label>
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
			</div>
		</div>
		</div>
	<script type="text/javascript">
		window.jQuery|| document.write("<script src='<%=path%>/js/jquery-2.0.3.min.js'>" + "<"+"script>");
	</script>
	<script type="text/javascript">
		var $assets = "assets";//this will be used in fuelux.tree-sampledata.js
	</script>
	<script type="text/javascript">
		if ("ontouchend" in document)
			document.write("<script src='<%=path%>/js/jquery.mobile.custom.min.js'>" + "<"+"script>");
	</script>
	<script src="<%=path%>/js/bootstrap.min.js"></script>
	<script src="<%=path%>/js/typeahead-bs2.min.js"></script>
	<script src="<%=path%>/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="<%=path%>/js/jquery-ui-1.10.3.full.min.js"></script>
	<script src="<%=path%>/js/jquery.ui.touch-punch.min.js"></script>
	<script src="<%=path%>/js/jquery.slimscroll.min.js"></script>
	<script src="<%=path%>/js/jquery.easy-pie-chart.min.js"></script>
	<script src="<%=path%>/js/jquery.sparkline.min.js"></script>
	<script src="<%=path%>/js/flot/jquery.flot.min.js"></script>
	<script src="<%=path%>/js/flot/jquery.flot.pie.min.js"></script>
	<script src="<%=path%>/js/flot/jquery.flot.resize.min.js"></script>
	<script src="<%=path%>/js/ace-elements.min.js"></script>
	<script src="<%=path%>/js/ace.min.js"></script>
	<script src="<%=path%>/js/framework_menu.js"></script>
	<script src="<%=path%>/js/framework_pubFunction.js"></script>
	<script src="<%=path%>/js/fuelux/data/fuelux.tree-sampledata.js"></script>
	<script src="<%=path%>/js/ajaxfileupload.js"></script>
	<script src="<%=path%>/js/fuelux/fuelux.tree.min.js"></script>
	<script src="<%=path%>/js/framework_form.js"></script>
	<script src="<%=path%>/js/framework_modal.js"></script>
	<script src="<%=path%>/js/jquery.maskedinput.min.js"></script>
	<script src="<%=path%>/js/jquery.validate.min.js"></script>
	<script src="<%=path%>/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="<%=path%>/js/date-time/bootstrap-timepicker.min.js"></script>
	<script src="<%=path%>/js/date-time/moment.min.js"></script>
	<script src="<%=path%>/js/date-time/daterangepicker.min.js"></script>
	<script src="<%=path%>/js/bootbox.min.js"></script>
	<script src="<%=path%>/js/bootstrap-wysiwyg.min.js"></script>
	<script src="<%=path%>/js/markdown/markdown.min.js"></script>
	<script src="<%=path%>/js/markdown/bootstrap-markdown.min.js"></script>
	<script src="<%=path%>/js/jquery.hotkeys.min.js"></script>
	<script src="<%=path%>/js/jquery.dataTables.min.js"></script>
	<script src="<%=path%>/js/jquery.dataTables.bootstrap.js"></script>
	<!-- PAGE CONTENT ENDS -->
		<script type="text/javascript">
	
	
	jQuery(function($) {
		var usefor = document.getElementById('usefor').value;
		checkOption('usefo',usefor);
		var anchor1 = document.getElementById('anchor1').value;
		checkOption('anchor',anchor1);
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
		if (!checkData('title', '标题', 'input')) {
			return;
		}
		if (!checkData('usefo', '用途', 'input')) {
			return;
		}
		if (!checkData('anchor', '图片连接地址', 'input')) {
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
		param["type"]=$("#type").val();
		param["imageName"]=imageName;
		param["picture_id"]=$("#picture_id").val();
		param["title"]=$("#title").val();
		param["usefo"]=$("#usefo").val();
		param["anchor"]=$("#anchor").val();
		param["imageHref"]=filePath;
		param["imageHrefReal"]=filePathreal;
		param["imageid"]=imageid;
		param["description"]=$("#description").val();
		
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/picture_editSave.do",
			data : param,
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					alert("保存成功！");
					var usefo=$("#usefo1").val();
					window.location = "<%=path%>/mvc/entry.do?usefo="+usefo+"";
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
		var usefo=$("#usefo1").val();
		window.location = "<%=path%>/mvc/entry.do?usefo="+usefo+"";
	}
		function checkOption(id,value)
		{
			var select = document.getElementById(id);
			var options = select.options;
			for(var i= 0;i<options.length;i++)
			{
				if(options[i].value == value)
				{
					options[i].selected = true;
					break;
				}
			}
		}
	</script>
	</body>
</html>
