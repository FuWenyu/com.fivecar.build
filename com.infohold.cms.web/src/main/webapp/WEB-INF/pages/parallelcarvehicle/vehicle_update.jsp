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
				<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/version_editSave.do"
					method="post">
					<h3 class="header smaller lighter grey">图片信息修改</h3>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id"> </label>
					</div>
					<input id="vehicle_id" type="hidden" class="" name="vehicle_id"  value="${vehicle.id}" />
					<input id="carbrand1" type="hidden" class="" name="carbrand1"  value="${vehicle.carbrandid}-${vehicle.carbrand}" />
					<input id="pricearea1" type="hidden" class="" name="pricearea1"  value="${vehicle.pricekey}-${vehicle.pricetagevalue}" />
					<input id="vehicleversion1" type="hidden" class="" name="vehicleversion1"  value="${vehicle.vehicleversionkey}-${vehicle.vehicleversionvalue}" />
					<input id="dealer1" type="hidden" class="" name="dealer1"  value="${vehicle.dealerid}-${vehicle.dealerName}" />
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							车辆品牌</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="carbrand" name="carbrand">
							<c:forEach items="${brandList}" var="list" varStatus="status">
	                        <option value="${list.id}-${list.brandNamecn}">${list.initial}-${list.brandNamecn}</option>
	               		    </c:forEach>
               		    </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							经销商</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="dealer" name="dealer">
							<c:forEach items="${dealerList}" var="list" varStatus="status">
	                        <option value="${list.id}-${list.dealerName}">${list.dealerName}</option>
	               		    </c:forEach>
               		    </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							车辆名称  </label>
						<div class="col-sm-9">
							<input type="text" id="vehicleName" name="vehicleName" placeholder="请输入车辆名称 "
								class="col-xs-10 col-sm-5"
								value="${vehicle.vehicleName}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							价格区间</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="pricearea" name="pricearea">
							<c:forEach items="${priceList}" var="list" varStatus="status">
	                        <option value="${list.pricekey}-${list.pricetagevalue}">${list.pricetagevalue}</option>
	               		    </c:forEach>
               		    </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							销售价格</label>
						<div class="col-sm-9">
							<input type="text" id="price" name="price" placeholder="请输入价格！ "
								class="col-xs-10 col-sm-5"
								value="${vehicle.price}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							车辆信息</label>
						<div class="col-sm-9">
							<input type="text" id="vehicleinfo" name="vehicleinfo" placeholder="请输入车辆信息！ "
								class="col-xs-10 col-sm-5"
								value="${vehicle.vehicleinfo}" /> <span style="color: red"></span>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							车辆版本</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="vehicleversion" name="vehicleversion">
							<c:forEach items="${vehicleversionList}" var="list" varStatus="status">
	                        <option value="${list.versionkey}-${list.versionvalue}">${list.versionvalue}</option>
	               		    </c:forEach>
               		    </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							所在城市</label>
						<div class="col-sm-9">
							<input type="text" id="whereis" name="whereis" placeholder="请输入所在城市！ "
								class="col-xs-10 col-sm-5"
								value="${vehicle.whereis}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							销售范围</label>
						<div class="col-sm-9">
							<input type="text" id="salesarea" name="salesarea" placeholder="请输入销售范围！ "
								class="col-xs-10 col-sm-5"
								value="${vehicle.salesarea}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							车辆颜色</label>
						<div class="col-sm-9">
							<input type="text" id="color" name="color" placeholder="请输入车辆颜色！ "
								class="col-xs-10 col-sm-5"
								value="${vehicle.color}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							环保标准</label>
						<div class="col-sm-9">
							<input type="text" id="epstandard" name="epstandard" placeholder="请输入环保标准！ "
								class="col-xs-10 col-sm-5"
								value="${vehicle.epstandard}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							看车地点</label>
						<div class="col-sm-9">
							<input type="text" id="wherelook" name="wherelook" placeholder="请输入看车地点！ "
								class="col-xs-10 col-sm-5"
								value="${vehicle.wherelook}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							车辆详细信息 </label>
						<div class="col-sm-9">
							<textarea rows="6" cols="72" id="description" name="description">${vehicle.description}</textarea>
						</div>
					</div>
					<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" for="fileInput">车辆图片上传</label>
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
		/*********页面加载区域**********/
		
	jQuery(function($) {
		var carbrand1 = document.getElementById('carbrand1').value;
		var carbrand = document.getElementById('carbrand').value;
		checkOption('carbrand',carbrand1);
		var dealer1 = document.getElementById('dealer1').value;
		checkOption('dealer',dealer1);
		var vehicleversion1 = document.getElementById('vehicleversion1').value;
		checkOption('vehicleversion',vehicleversion1);
		var pricearea1 = document.getElementById('pricearea1').value;
		checkOption('pricearea',pricearea1);
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
		if (!checkData('carbrand', '品牌', 'input')) {
			return;
		}
		if (!checkData('dealer', '经销商', 'input')) {
			return;
		}
		if (!checkData('pricearea', '价格区间', 'input')) {
			return;
		}
		if (!checkData('price', '价格', 'input')) {
			return;
		}
		if (!checkData('price', '价格', 'illegal')) {
			return;
		}
		if (!limitCheck('price', '价格', 32)) {
			return;
		}
		if (!checkData('vehicleinfo', '车辆信息', 'input')) {
			return;
		}
		if (!checkData('vehicleinfo', '车辆信息', 'illegal')) {
			return;
		}
		if (!limitCheck('vehicleinfo', '车辆信息', 64)) {
			return;
		}
		if (!checkData('vehicleversion', '车辆版本', 'input')) {
			return;
		}
		if (!checkData('whereis', '所在城市', 'input')) {
			return;
		}
		if (!checkData('whereis', '所在城市', 'illegal')) {
			return;
		}
		if (!limitCheck('whereis', '所在城市', 64)) {
			return;
		}
		if (!checkData('salesarea', '销售范围', 'input')) {
			return;
		}
		if (!checkData('salesarea', '销售范围', 'illegal')) {
			return;
		}
		if (!limitCheck('salesarea', '销售范围', 64)) {
			return;
		}
		if (!checkData('color', '颜色', 'input')) {
			return;
		}
		if (!checkData('color', '颜色', 'illegal')) {
			return;
		}
		if (!limitCheck('color', '颜色', 64)) {
			return;
		}
		if (!checkData('epstandard', '环保标准', 'input')) {
			return;
		}
		if (!checkData('epstandard', '环保标准', 'illegal')) {
			return;
		}
		if (!limitCheck('epstandard', '环保标准', 64)) {
			return;
		}
		if (!checkData('wherelook', '看车地点', 'input')) {
			return;
		}
		if (!checkData('wherelook', '看车地点', 'illegal')) {
			return;
		}
		if (!limitCheck('wherelook', '看车地点', 64)) {
			return;
		}
		if (!checkData('description', '车辆详细信息', 'input')) {
			return;
		}
		if (!checkData('description', '车辆详细信息', 'illegal')) {
			return;
		}
		if (!limitCheck('description', '车辆详细信息', 255)) {
			return;
		}
		if (!checkData('vehicleName', '车辆名称', 'input')) {
			return;
		}
		if (!checkData('vehicleName', '车辆名称', 'illegal')) {
			return;
		}
		if (!limitCheck('vehicleName', '车辆名称', 64)) {
			return;
		}
		if (!checkData('price', '价格区间', 'input')) {
			return;
		}
		if (!limitCheck('price', '车辆名称', 36)) {
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
		param["imageName"]=imageName;
		param["vehicle_id"]=$("#vehicle_id").val();
		param["carbrand"]=$("#carbrand").val();
		param["carbrandid"]=$("#carbrandid").val();
		param["vehicleName"]=$("#vehicleName").val();
		param["pricearea"]=$("#pricearea").val();
		param["price"]=$("#price").val();
		param["dealer"]=$("#dealer").val();
		param["vehicleinfo"]=$("#vehicleinfo").val();
		param["vehicleversion"]=$("#vehicleversion").val();
		param["whereis"]=$("#whereis").val();
		param["salesarea"]=$("#salesarea").val();
		param["color"]=$("#color").val();
		param["epstandard"]=$("#epstandard").val();
		param["wherelook"]=$("#wherelook").val();
		param["description"]=$("#description").val();
		param["imageHref"]=filePath;
		param["imageHrefReal"]=filePathreal;
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/pavehicle_editSave.do",
			data : param,
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					alert("保存成功！");
					window.location = "<%=path%>/mvc/pavehicle.do";
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
			window.location = "<%=path%>/mvc/pavehicle.do";
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
