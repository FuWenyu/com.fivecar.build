<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet"
	href="<%=path%>/css/jquery-ui-1.10.3.full.min.css" />
<script src="<%=path%>/js/ace-extra.min.js"></script>
</head>
<body id="iframe_body"	onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display: none"></div>
	 <div class="row" style="background-color: #FFF"><h4 class="header smaller lighter" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;【审批流程图】</h4></div>
	<div style="height: 40%; width: 100%">
		<object style="border: 0px" type="text/x-scriptlet" width="100%" height="38%"
		data="${map.url}?processDefinitionId=${map.pro_def_id}&processInstanceId=${map.processinsid}">
			<param name="wmode" value="transparent">
		</object>
	</div>
	<div class="page-content" id="loadPageContent">
		<form class="form-horizontal" id="sub_form" name="sub_form" action="#" method="post">
		<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
			<h4 class="header smaller lighter">【业务信息】</h4>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="bizid">业务编号</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${map.bizid }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="processinsid">流程实例ID</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${map.processinsid }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custid">客户编号</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${map.custid }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custname">客户名称</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${map.custname }</label>
							</div>
						</div>
					</div>
				</div>
			</form>
				<!--查询结果列表  -->
				<div class="row" id = "result">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div id="qryContent">
							<div id="sample-table-2_wrapper" class="dataTables_wrapper"
								role="grid">
								<table id="sample-table-2"
									class="table table-striped table-bordered table-hover dataTable"
									aria-describedby="sample-table-2">
									<thead>
										<tr>
											<th>审批节点</th>
											<th>审批时间</th>
											<th>审批类型</th>
											<th>操作人Id</th>
											<th>操作人名称</th>
											<th>审批意见</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${map.approveDetailItem}" var="approveDetailItem">
											<tr>
												<td>${approveDetailItem.actName}</td>
												<td>${approveDetailItem.approveDate}</td>
												<td><fmt:message key='approveType.${approveDetailItem.approveType}' /></td>
												<td>${approveDetailItem.operId}</td>
												<td>${approveDetailItem.operName}</td>
												<td>${approveDetailItem.ps}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
									<div class="row">
										<div class="col-sm-4">
											<div class="btn-group">
												<!-- 列表底部按钮区域 -->
												<button class="btn btn-sm btn-primary" onclick="goback('${map.viewtype }')" type="button">返回</button>
											</div>
										</div>
								    </div>
							    </div>
							</div>
						</div>
						<!--/// 查询结果列表  -->
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
	jQuery(function($) {
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
	});
	function goback(viewtype){
		if(viewtype=="wait"){
			window.location="<%=path%>/mvc/waitApprove_getList.do";
		}
		if(viewtype=="query"){
			window.location="<%=path%>/mvc/queryHisApprove_getList.do";
		}
	}
	</script>
</body>
</html>