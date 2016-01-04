<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet"
	href="<%=path%>/css/jquery-ui-1.10.3.full.min.css" />
<script src="<%=path%>/js/ace-extra.min.js"></script>
</head>
<!-- 该页面为iframe嵌套页面，以下代码用于计算iframe高度，不允许修改：
			<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
			<div id="iframeDiv" style="display:none"></div>
			<div class="page-content" id="loadPageContent">
	-->
<body id="iframe_body"
	onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display: none"></div>
	<div id="modal_area"></div>
	<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				
				<form class="form-horizontal" id="queryForm" name="queryform"
				action="<%=path%>/mvc/account_cancle_getList.do" method="post">
				<div class="form-group">
					<div class="col-md-1"></div>
					<label class="col-sm-1 control-label no-padding-right"
						for="biz_id"> 借据编号</label>
					<div class="col-sm-4">
						<input type="text" id="biz_id" class="col-xs-10 col-sm-5"
							name="biz_id" />
					</div>
					<label class="col-sm-1 control-label no-padding-right"
						for="status"> 状态</label>
					<div class="col-sm-4">
						<select class="col-xs-10 col-sm-5" id="status" name="status">
							<option value="">请选择...</option>
							<option value="0">已取消</option>
							<option value="1">待审批</option>
							<option value="2">审批中</option>
							<option value="3">审批通过</option>
							<option value="4">审批未通过</option>
							<option value="5">已生效</option>
							<option value="6">退回修改</option>
						</select>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="form-group">
					<div class="col-md-1"></div>
					<label class="col-sm-1 control-label no-padding-right"
						for="pro_name"> </label>
					<div class="col-sm-4">
						<!-- <input type="text" id="pro_name" class="col-xs-10 col-sm-5"
							name="pro_name" /> -->
					</div>
					<div class="col-sm-2"></div>
					<div class="col-sm-4">
						<button class="btn btn-sm btn-primary" onclick="toQry();"
							type="button">查询</button>
					</div>
				</div>
				<!-- /row 横线-->
				<div class="page-header"></div>
			</form>
				<div id="qryContent">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">

					<table id="sample-table-2"
						class="table table-striped table-bordered table-hover dataTable"
						aria-describedby="sample-table-2">
						<thead>
							<tr>
								<th>冲账编号</th>
								<th>借据编号</th>
								<th>客户名称</th>
								<th>交易金额</th>
								<th>交易时间</th>
								<th>客户经理</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${rsList}" var="rsList">
							<tr>
								<td>${rsList.acc_back_id}</td>
								<td>${rsList.duebill_acct}</td>
								<td>${rsList.cust_name}</td>
								<td>${rsList.duebill_amount}</td>
								<td>${rsList.sendTime}</td>
								<td>${rsList.cust_manager_name}</td>
								<td>
									<c:if test="${rsList.status  == '0'}">已取消</c:if>
									<c:if test="${rsList.status  == '1'}">待审批</c:if>
									<c:if test="${rsList.status  == '2'}">审批中</c:if>
									<c:if test="${rsList.status  == '3'}">审批通过</c:if>
									<c:if test="${rsList.status  == '4'}">审批未通过</c:if>
									<c:if test="${rsList.status  == '5'}">已生效</c:if>
									<c:if test="${rsList.status  == '6'}">退回修改</c:if>
								</td>	
								<td>
									<div class="btn-group">
										<button class="btn btn-sm btn-primary" onclick="viewEntity('${rsList.acc_back_id}');"
												type="button">查看</button>
										<c:if test="${rsList.status  == '1' || rsList.status  == '6'}">
											<button class="btn btn-sm btn-primary" onclick="editEntity('${rsList.acc_back_id}');"
												type="button">修改</button>
											<button class="btn btn-sm btn-primary" onclick="cancleEntity('${rsList.acc_back_id}');"
												type="button">取消</button>
											<button class="btn btn-sm btn-primary" onclick="approveEntity('${rsList.acc_back_id}');"
												type="button">提起审批</button>
										</c:if>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<div class="col-sm-4">
							<div class="btn-group">
								<button class="btn btn-sm btn-primary" onclick="addEntity();"
									type="button">新增</button>
							</div>
						</div>
						<!-- 分页 -->
						<jsp:include page="../../common/page.jsp"></jsp:include>
					</div>
				</div>
				</div>
				</form>
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	</div>
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" onclick="hideModal();">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">发起审批意见</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12 center">
							<input type="hidden" id="acc_back_id" name="acc_back_id">
							<textarea rows="5" cols="30" id="reason_approve" name="reason_approve"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-primary" onclick="CallBackSubmit(this);">确定</button>
					<button type="button" class="btn btn-sm btn-default"
						onclick="hideModal();">关闭</button>
				</div>
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
		jQuery(function($) {
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		//根据查询条件查看
		function toQry()
		{
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("account_cancle_getList.do", param, function(result) {			
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function addEntity(){
			window.location="<%=path%>/mvc/account_cancle_add.do";
		};
		function editEntity(acc_back_id){
			window.location="<%=path%>/mvc/account_cancle_edit.do?acc_back_id="+acc_back_id;
		};
		function viewEntity(acc_back_id){
			window.location="<%=path%>/mvc/account_cancle_view.do?acc_back_id="+acc_back_id;
		};
		function cancleEntity(acc_back_id){
			var param={};
			param["acc_back_id"]=acc_back_id;
			param["status"]="0";
			$.ajax({
    			type : "POST",
    			url : "<%=path%>/mvc/account_cancle_cancle.do",
    			data : param,
    			async : false,
    			success : function(data) {
    				if(data.msg == "success"){
	    				alert("取消成功");
	    				movePage($("#pageNo").val());
    				}else{
    					alert(data.msg);
    				}
    			},
    		});		
		};
		function approveEntity(acc_back_id){		
			showModal($("#myModal"));
			$(window.document).find("#acc_back_id").val(acc_back_id);
				
		};
		function CallBackSubmit(obj){
			var param={};
			param["acc_back_id"]=$(obj).closest("#myModal").find("#acc_back_id").val();
			param["reason_approve"]=$(obj).closest("#myModal").find("#reason_approve").val();
			$.ajax({
    			type : "POST",
    			url : "<%=path%>/mvc/account_cancle_approve.do",
    			data : param,
    			async : false,
    			success : function(data) {
    				if(data.msg == "success"){
	    				alert("发起审批成功");
	    				movePage($("#pageNo").val());
    				}else{
    					alert(data.msg);
    				}
    			},
    		});		
			hideModal();
		}
	</script>
</body>
</html>
