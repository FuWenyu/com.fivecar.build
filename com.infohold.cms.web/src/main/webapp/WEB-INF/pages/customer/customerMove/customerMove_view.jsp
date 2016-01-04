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
					<input id="move_id" name="move_id" type="hidden" value="${map.move_id }">
					<h3 class="header smaller lighter blue">原客户信息</h3>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="duebill_id"> 移交客户名称 </label>
						<div class="col-sm-3">
							<input name="custchname" id="custchname" placeholder="点击选择客户" type="text"
								class="col-xs-10 col-sm-8"  value="${map.cust_name }" readonly>
							<input id="cust_id" name="cust_id" type="hidden" value="${map.cust_id }">
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="branch_no_old">
							原机构 </label>
						<div class="col-sm-5">
							<input name="branch_no_old" id="branch_no_old" class="col-xs-10 col-sm-5" type="text" value="${sessionScope.userSession.branchName}" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="old_cust_manager"> 原客户经理 </label>
						<div class="col-sm-3">
							<input name="old_cust_manager" id="old_cust_manager" class="col-xs-10 col-sm-8" value="${map.old_cust_manager_name}" type="text"
								readonly>
						</div>
						<!-- <label class="col-sm-2 control-label no-padding-right" for="amount">
							借据金额 </label>
						<div class="col-sm-5">
							<input name="duebill_amount" id="duebill_amount" class="col-xs-10 col-sm-5" type="text" readonly>
						</div> -->
					</div>
					<h3 class="header smaller lighter blue">移交信息</h3>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="new_cust_manager"> 新客户经理 </label>
						<div class="col-sm-3">
							<select name="new_cust_manager" id=new_cust_manager class="col-xs-10 col-sm-8" data-emptyoption="false" data-select-list="${custManagerList}" data-select-value="${map.new_cust_manager}" disabled></select>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="cust_name">
							新机构 </label>
						<div class="col-sm-5">
							<input name="branch_no_new" id="branch_no_new" class="col-xs-10 col-sm-5" type="text"  value="${map.branch_no_new_name}"  readonly>
						</div>
					</div>
				       <div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="branchName"> 申请人 </label>
						<div class="col-sm-3">
							<input name="branchName" id="branchName" 
								   class="col-xs-10 col-sm-5" type="text" value="${map.cust_manager_name}" readonly>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="userName">
							申请时间 </label>
						<div class="col-sm-5">
							<input name="move_date" id="move_date" class="col-xs-10 col-sm-5" type="text" value="${map.move_date}" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="move_reason">申请原因</label>
						<div class="col-sm-3">
							<textarea class="form-control" id="move_reason" name="move_reason" readonly>${map.move_reason }</textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="ps">备        注</label>
						<div class="col-sm-3">
							<textarea class="form-control" id="ps" name="ps" readonly>${map.ps }</textarea>
						</div>
					</div>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
								<button class="btn" type="button" onclick="javascript:history.go(-1);">
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
		$("#new_cust_manager").formComponents("select");
	});
	function subForm() {
		/* if (!checkData('toll_amount', '收费金额', 'input')) {
			return;
		}
		if (!checkData('toll_acct', '收费账号', 'number')) {
			return;
		}
		if (!checkData('cust_id', '客户名称', 'input')) {
			return;
		} */
		
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/customerMove_editSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					alert("保存成功！");
					window.location = "<%=path%>/mvc/customerMove_getList.do";
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

