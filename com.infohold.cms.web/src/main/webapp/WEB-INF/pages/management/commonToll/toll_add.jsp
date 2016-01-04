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
		<div id="modal_area"></div>
		<div class="page-content" id="loadPageContent">
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/productDef_addSave.do" method="post">
				       <div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="toll_type"> 收费类型 </label>
							<div class="col-sm-3">
								<select name="toll_type" id="toll_type" class="col-xs-10 col-sm-8" data-emptyoption="false" data-select-list="${toll_type }" data-select-value="10001">
								</select>
							</div>
							<label class="col-sm-2 control-label no-padding-right" for="trade_type"> 交易类别 </label>
							<div class="col-sm-5">
								<select name="trade_type" id="trade_type" class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${trade_type}" data-select-value="1">
								</select>
							</div>
				       </div>
				       <div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="toll_currency"> 币种 </label>
							<div class="col-sm-3">
								<select name="toll_currency" id="toll_currency" class="col-xs-10 col-sm-8" data-emptyoption="false" data-select-list="${currency_type}" data-select-value="CNY">
								</select>
							</div>
							<label class="col-sm-2 control-label no-padding-right" for="toll_amount"> 付费金额(元) </label>
							<div class="col-sm-5">
								<input type="text" id="toll_amount" placeholder="请输入收费金额" class="col-xs-10 col-sm-5" name="toll_amount" />
							</div>
				       </div>
				       <div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="toll_acct"> 付费账号 </label>
							<div class="col-sm-3">
								<input type="text" id="toll_acct" placeholder="请输入付费账号" class="col-xs-10 col-sm-8" name="toll_acct" />
							</div>
							<label class="col-sm-2 control-label no-padding-right" for="cust_name"> 客户名称 </label>
							<div class="col-sm-5">
								<input type="text" id="custchname" placeholder="点击选择客户" class="col-xs-10 col-sm-5" name="custchname" onclick="selectCustomer(1);"/>
								<input type="hidden" id="cust_id" name="cust_id" />
							</div>
				       </div>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
								<button class="btn btn-info" type="button"
									onclick="subForm();">
									<i class="icon-ok bigger-110"></i> 提交
								</button>

								&nbsp; &nbsp; &nbsp;
								<button class="btn" type="button" onclick="javascript:window.location = '<%=path%>/mvc/toll_getList.do';">
									<i class="icon-reply bigger-110"></i> 返回
								</button>
							</div>
						</div>
					</form>
					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<jsp:include page="../../common/customer_modal.jsp"></jsp:include>
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
		//加载机构列表
		$("#trade_type").formComponents("select");
		$("#toll_type").formComponents("select");
		$("#toll_currency").formComponents("select");
		
	});
	function subForm() {
		if (!checkData('toll_amount', '收费金额', 'input')) {
			return;
		}
		if (!checkData('toll_amount', '收费金额', 'number')) {
			return;
		}
		if (!checkData('toll_acct', '付费账号', 'input')) {
			return;
		}
		if (!checkData('toll_acct', '付费账号', 'number')) {
			return;
		}
		if (!checkData('cust_id', '客户名称', 'input')) {
			return;
		}
		
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/toll_addSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					alert("保存成功！");
					window.location = "<%=path%>/mvc/toll_getList.do";
				}else{
					alert("保存失败！");
				}
			},
			error : function(msg) {
				alert("分配出错  " + msg);
			}
		});
	}
	</script>
	</body>
</html>

