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
	
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form" action="" method="post">
				<input type="hidden" id="xh"  class="col-xs-10 col-sm-5" name="xh" value="${bizFsxx.xh}" />
				<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
					<div class="breadcrumb">
						<h4 class="row smaller lighter">贷款申请保证人信息</h4>
					</div>
					<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custname">业务编号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="businessid" name="businessid" readonly="readonly"
									class="form-control" value="${bizFsxx.businessid }"  >
									<input type="hidden" id="zydbfs" name="zydbfs" value="2">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="bzrlx">保证人类型</label>
							<div class="col-sm-6 input-group">
								<select id="bzrlx" class="form-control"  name="bzrlx"  disabled="disabled"
								 			data-select-list="${bzrlxList }" data-select-value="${bizFsxx.BZRLX}" ></select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="bzrbh">保证人编号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="bzrbh" value="${bizFsxx.bzrbh}" name="bzrbh"
								readonly="readonly" class="form-control" >
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="bzrxm">保证人名称</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="bzrxm" value="${bizFsxx.bzrxm}" name="bzrxm"
								readonly="readonly" class="form-control" >
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="bzxs">保证形式</label>
							<div class="col-sm-6 input-group">
								<select id="bzxs" id="bzxs" data-select-value="${bizFsxx.bzxs}" name="bzxs"
								class="form-control" data-select-list="${bzxsList }" ></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="dbfe">担保份额</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="dbfe" value="${bizFsxx.dbfe}" name="dbfe"
								class="form-control " onblur="checkDbkyye()">
							</div>
						</div>
					</div>
				</div>
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm('${bizFsxx.businessid}','${bzxs1}');">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="javascript:history.go(-1);">
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
	//jQuery获取
		jQuery(function($){		
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});});
		jQuery(function($){
			$("#bzxs").formComponents("select");
		});
		jQuery(function($){
			$("#bzrlx").formComponents("select");
		});
		//表单提交
		function subForm(businessid,bzxs1) {
			if (!checkData('dbfe', '业务编号', 'input')) {
				return;
			}
			var bzxs=document.getElementById("bzxs").value;
			if (bzxs1!="0") {
				if (bzxs1!=bzxs){
					if (bzxs1=="1") {
						f_alert("<%=path%>","当前保证形式只可以为单人担保","");
						return;
					}
					if (bzxs1=="2") {
						f_alert("<%=path%>","当前保证形式只可以为多人联保","");
						return;
					}
					if (bzxs1=="3") {
						f_alert("<%=path%>","当前保证形式只可以为多人分保","");
						return;
					}
				}
			} 
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/businessFsxx_editSave.do",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						f_alert("<%=path%>","success","business_view.do?viewOrEdit=edit&businessid="+businessid+"&pageNo="+$("#pageNo").val());
					}else{
						f_alert("<%=path%>",data.msg,"");
					}
				},
				error : function(msg) {
					var exp="分配出错 " + msg;
					f_alert("<%=path%>",exp,"");
				}
			});
		}
		//校验担保可用余额
		function checkDbkyye() {
			
			var bzrlx=document.getElementById("bzrlx").value;
			
			if (bzrlx=="1") {
				var bzrbh=document.getElementById("bzrbh").value;
				var businessid=document.getElementById("businessid").value;
				var dbfe=document.getElementById("dbfe").value;	
				var xh=document.getElementById("xh").value;
				$.ajax( {
					type : "POST",
					url : "<%=path%>/mvc/business_getBzrDbye.do?xh="+xh+"&bzrbh="+bzrbh+"&businessid="+businessid,
					async : false,
					success : function(dbkyye) {
						if (parseFloat(dbfe)>parseFloat(dbkyye)) {
							f_alert("<%=path%>","担保份额"+dbfe+"元大于可用余额"+dbkyye+"元，请重新输入担保份额！","");
							document.getElementById("dbfe").value="";
						}
						
					},
					error : function(msg) {
						alert("获取数据失败: " + msg);
					}
				});
			}
		}
	</script>
	</body>
</html>
