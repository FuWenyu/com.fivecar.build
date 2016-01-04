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
<body id="iframe_body"	onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display: none"></div>
	<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<form class="col-xs-12" id="sub_form" name="sub_form" action="#" method="post">
					<h3 class="header smaller lighter grey">企业客户信息</h3>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-1"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-1"> 客户名称 </label>
							<div class="col-sm-4">
								<input type="text" id="cust_name" placeholder="请输入客户名称" class="col-xs-7 col-dm-5" name="cust_name" />
							</div>
							<div class="col-md-0"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="organizationcode">
								组织机构代码 </label>
							<div class="col-sm-4">
								<input type="text" id="organizationcode" placeholder="请输入组织机构代码 " class="col-xs-7 col-dm-5" name="organizationcode" />
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>

					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-1"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="file_type"> 文件类型 </label>
							<div class="col-sm-4">
								<select id="file_type" class="col-xs-10 col-sm-7" name="file_type" data-select-value="52" data-select-list="${cor_id_typeList }"></select>
							</div>
							<div class="col-md-0"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="file_number"> 文件编号 </label>
							<div class="col-sm-4">
								<input type="text" id="file_number" placeholder="请输入文件编号" class="col-xs-7 col-dm-5" name="file_number" maxlength="32" />
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<!-- /row 横线-->
					<div class="clearfix form-actions">
					  <div class="row">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="javascript:history.go(-1);">
								<i class="icon-reply bigger-110"></i> 返回
							</button>
						</div>
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
	<script type="text/javascript">
	jQuery(function($){
		$("#file_type").formComponents("select");
	});
	function subForm(){
		if (!checkData('cust_name', '客户名称', 'input')) {
			return;
		}
		if (!checkData('cust_name', '客户名称', 'check_char')) {
			return;
		}
		if (!checkData('cust_name', '客户名称', 'length_custName')) {
			return;
		}
		if (!checkData('organizationcode', '组织机构代码', 'input')) {
			return;
		}
		if (!checkData('organizationcode', '组织机构代码', 'checkOrgcode')) {
			return;
		}
		if (!checkData('file_number', '文件编号', 'input')) {
			return;
		}
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/customer_check.do?custtype=2",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					if(window.confirm('客户不存在,是否新增?')){
		 				param={};
		 				param["cust_name"]=$("#cust_name").val();
		 				param["organizationcode"]=$("#organizationcode").val();
		 				param["file_number"]=$("#file_number").val();
		 				param["file_type"]=$("#file_type").val();
		 				param["custid"]=null;
		 				var url="<%=path%>/mvc/corCustomer_add.do";
		 				$.post(url, param, function(result) {
		 					if(result.msg == "success"){
		 						f_alert("<%=path%>","success","corCustomer_getList.do");
		 					}else{
		 						f_alert("<%=path%>",result.msg,"");
		 					}
		 					$(areaId).html(result).hide().fadeIn('fast');
		 					setHash(param);
		 				});
					}
				}else if(data.msg == "error"){
					if(window.confirm('客户已存在,是否引入?')){
						window.location="<%=path%>/mvc/customerLink_add.do";
					}
				}else if(data.msg == "have"){
					f_alert("<%=path%>",'客户已建立,不需要再次创建!',"corCustomer_getList.do");
				}else if(data.msg == "Xface_have"){
					if(window.confirm('客户在核算系统已存在,是否进行客户同步?')){
						param={};
		 				param["cust_name"]=$("#cust_name").val();
		 				param["organizationcode"]=$("#organizationcode").val();
		 				param["file_number"]=$("#file_number").val();
		 				param["file_type"]=$("#file_type").val();
		 				param["custid"]=data.custid;
		 				var url="<%=path%>/mvc/corCustomer_add.do";
		 				$.post(url, param, function(result) {
		 					if(result.msg == "success"){
		 						f_alert("<%=path%>","success","corCustomer_getList.do");
		 					}else{
		 						f_alert("<%=path%>",result.msg,"");
		 					}
		 					$(areaId).html(result).hide().fadeIn('fast');
		 					setHash(param);
		 				});
					}
				}
			},
			error : function(msg) {
				var exp="分配出错 " + msg;
				f_alert("<%=path%>",exp,"");
			}
		});
		}
	</script>
</body>
</html>