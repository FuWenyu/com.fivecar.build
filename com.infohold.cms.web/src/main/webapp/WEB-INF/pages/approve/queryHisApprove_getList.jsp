<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<!-- 查询条件begin -->
				<form class="form-horizontal" id="queryForm" name="queryForm" action="<%=path%>/mvc/queryHisApprove_getList.do" method="post">
					<div class="row">
						<div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="search_date">起止日期</label>
								<div class="col-sm-6 input-group">
									<input id="search_date" name="search_date"
									class="form-control date-range-picker" type="text">
									<span class="input-group-addon"> 
										<i class="icon-calendar bigger-110"></i>
									</span>
								</div>
							</div>
						</div>
						<!-- <div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="end_date">截至日期</label>
								<div class="col-sm-6 input-group">
									<input id="end_date" name="end_date"
									class="form-control date-picker" type="text" data-date-format="yyyy-mm-dd" >
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
								</div>
							</div>
						</div> -->
						<div class="form-group">
							<div class="col-sm-10"></div>
							<div class="col-sm-2">
								<button class="btn btn-sm btn-primary" onclick="toQry();" type="button">查询</button>
							</div>
						</div>
						<div class="space-6"></div>
					</div>
				</form>
				<!-- 查询条件end -->
				<div id="qryContent">
					<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
						<table id="sample-table-2"
							class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2">
							<thead>
								<tr>
									<th>流程实例ID</th>
									<th>业务编号</th>
									<th>客户编号</th>
									<th>客户名称</th>
									<th>审批类型</th>
									<th>启动时间</th>
								</tr>
							</thead>
		
							<tbody>
								<c:forEach items="${queryHisApproveList}" var="queryHisApproveList">
									<tr>
										<td><a href="#" onclick="viewApprove('${queryHisApproveList.bizid}')">${queryHisApproveList.processinsid}</a></td>
										<td><a href="#" onclick="viewBusiness('${queryHisApproveList.bizid}','${queryHisApproveList.bizcode}')">${queryHisApproveList.bizid}</a></td>
										<td><a href="#" onclick="viewCust('${queryHisApproveList.custid}')">${queryHisApproveList.custid}</a></td>
										<td>${queryHisApproveList.custname}</td>
										<td><fmt:message key='approve_type.${queryHisApproveList.bizcode}'/></td>
										<td>${queryHisApproveList.createdate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="row">
							<div class="col-sm-4">
								<div class="btn-group">
									<!-- 列表底部按钮区域 -->
									<!-- <button class="btn btn-sm btn-primary" onclick="addEntity();" type="button">新增</button> -->
								</div>
							</div>
							<!-- 分页 -->
							<jsp:include page="../common/page.jsp"></jsp:include>
						</div>
					</div>
				</div>
				<!-- PAGE CONTENT ENDS -->
			</div>
		</div>
			<!-- 审批界面-->
			<jsp:include page="approveInfo.jsp"></jsp:include>
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
	<script src="<%=path%>/js/fuelux/data/fuelux.tree-sampledata.js"></script>
	<script src="<%=path%>/js/ajaxfileupload.js"></script>
	<script src="<%=path%>/js/fuelux/fuelux.tree.min.js"></script>
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
	<script src="<%=path%>/js/framework_menu.js"></script>
	<script src="<%=path%>/js/framework_pubFunction.js"></script>
	<script src="<%=path%>/js/framework_form.js"></script>
	<script src="<%=path%>/js/framework_modal.js"></script>
	<script type="text/javascript">
		/*********页面加载区域**********/
		jQuery(function($) {
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
			$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			$('.date-range-picker').daterangepicker({
				format: 'YYYY/MM/DD'
			}).prev().on(ace.click_event, function(){
				$(this).next().focus();
			});
		});
		//根据查询条件查看
		function toQry()
		{
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("queryHisApprove_getList.do", param, function(result) {			
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function viewBusiness(biz_id,biz_code){
			window.location="<%=path%>/mvc/approve_getBusiness.do?biz_id="+biz_id+"&biz_code="+biz_code;
		}
		function viewApprove(id){
			window.location="<%=path%>/mvc/approve_get.do?biz_id="+id+"&viewtype=query";
		}
		function viewCust(id){
			window.location="<%=path%>/mvc/approve_getCust.do?cust_id="+id+"&viewtype=query";
		}
	</script>
	</body>
</html>
