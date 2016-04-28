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
				<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/brand_editSave.do"
					method="post">
					<h3 class="header smaller lighter grey">图片信息修改</h3>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id"> </label>
					</div>
					<input id="cardbrand_id" type="hidden" class="" name="cardbrand_id" value="${cardbrand.id}" />
					<input id="initial1" type="hidden" class="" name="initial1" value="${cardbrand.initial}" />
					<input id="belong1" type="hidden" class="" name="belong1" value="${cardbrand.belong}" />
				<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							品牌英文名称 </label>
						
						<div class="col-sm-9">
							<input type="text" id="brandNameen" name="brandNameen" placeholder="请输入品牌英文名称 "
								class="col-xs-10 col-sm-5"
								value="${cardbrand.brandNameen}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							品牌中文名称</label>
						
						<div class="col-sm-9">
							<input type="text" id="brandNamecn" name="brandNamecn" placeholder="请输入品牌英文名称 "
								class="col-xs-10 col-sm-5"
								value="${cardbrand.brandNamecn}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							品牌首字母</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="initial" name="initial">
                                <option value="">-请选择-</option> 
								<option value="A">-A-</option>
								<option value="B">-B-</option>
								<option value="C">-C-</option>
								<option value="D">-D-</option>
								<option value="E">-E-</option>
								<option value="F">-F-</option>
								<option value="G">-G-</option>
								<option value="H">-H-</option>
								<option value="I">-I-</option>
								<option value="J">-J-</option>
								<option value="K">-K-</option>
								<option value="L">-L-</option>
								<option value="M">-M-</option>
								<option value="N">-N-</option>
								<option value="O">-O-</option>
								<option value="P">-P-</option>
								<option value="Q">-Q-</option>
								<option value="R">-R-</option>
								<option value="S">-S-</option>
								<option value="T">-T-</option>
								<option value="U">-U-</option>
								<option value="V">-V-</option>
								<option value="W">-W-</option>
								<option value="X">-X-</option>
								<option value="Y">-Y-</option>
								<option value="Z">-Z-</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							品牌归属</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="belong" name="belong">
                                <option value="">-请选择-</option> 
								<option value="ssss">4s店</option>
								<option value="parallel">平行进口车</option>
							</select>
						</div>
					</div>
					<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" for="fileInput">品牌logo上传</label>
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
							<button class="btn" type="button" onclick="javascript:window.location = '<%=path%>/mvc/brand.do';">
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
		
		var initial1 = document.getElementById('initial1').value;
		checkOption('initial',initial1);
		var belong1 = document.getElementById('belong1').value;
		checkOption('belong',belong1);
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
		if (!checkData('initial', '品牌首字母', 'input')) {
			return;
		}
		if (!limitCheck('initial', '品牌首字母', 1)) {
			return;
		}
		if (!checkData('belong', '品牌归属', 'input')) {
			return;
		}
		if (!checkData('brandNameen', '品牌英文名称', 'input')) {
			return;
		}
		if (!limitCheck('brandNameen', '品牌英文名称', 64)) {
			return;
		}
		if (!checkData('brandNameen', '品牌英文名称', 'chinese')) {
			return;
		}
		if (!checkData('brandNameen', '品牌英文名称', 'illegal')) {
			return;
		}
		
		if (!checkData('brandNamecn', '品牌中文名称', 'input')) {
			return;
		}
		if (!checkData('brandNamecn', '品牌中文名称', 'illegal')) {
			return;
		}
		if (!limitCheck('brandNamecn', '品牌英文名称', 64)) {
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
		param["initial"]=$("#initial").val();
		param["brandNamecn"]=$("#brandNamecn").val();
		param["brandNameen"]=$("#brandNameen").val();
		param["imageHref"]=filePath;
		param["imageHrefReal"]=filePathreal;
		param["imageid"]=imageid;
		param["cardbrand_id"]=$("#cardbrand_id").val();
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/brand_editSave.do",
			data : param,
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					alert("保存成功！");
					window.location = "<%=path%>/mvc/brand.do";
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
			window.location = "<%=path%>/mvc/brand.do";
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
