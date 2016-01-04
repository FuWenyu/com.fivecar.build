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
				action="<%=path%>/mvc/toll_getList.do" method="post">
				<div class="form-group">
					<div class="col-md-1"></div>
					<label class="col-sm-1 control-label no-padding-right"
						for="toll_type"> 收费类型</label>
					<div class="col-sm-4">
						<select class="col-xs-10 col-sm-5" id="toll_type" name="toll_type" data-emptyoption="true" data-select-list="${toll_type}" >
						</select>
					</div>
					<label class="col-sm-1 control-label no-padding-right"
						for="trade_type"> 交易类别</label>
					<div class="col-sm-4">
						<select class="col-xs-10 col-sm-5" id="trade_type" name="trade_type" data-emptyoption="true" data-select-list="${trade_type}" >
						</select>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="form-group">
					<div class="col-md-1"></div>
					<label class="col-sm-1 control-label no-padding-right"
						for="cust_name"> 客户名称</label>
					<div class="col-sm-4">
						<input type="text" id="cust_name" class="col-xs-10 col-sm-5"
							name="cust_name" />
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
								<th>收费编号</th>
								<th>收费类型</th>
								<th>交易类别</th>
								<th>付费账号</th>
								<th>客户名称</th>
								<th>客户类型</th>
								<th>收费金额</th>
								<th>收费日期</th>
								<th>收费状态</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${rsList}" var="rsList">
							<tr>
								<td>${rsList.toll_id}</td>
								<td>
									<c:if test="${rsList.toll_type  == '10001'}">票据结算手续费收入</c:if>
									<c:if test="${rsList.toll_type  == '10002'}">国内贸易融资手续费收入</c:if>
									<c:if test="${rsList.toll_type  == '10003'}">银行承兑汇票手续费收入</c:if>
									<c:if test="${rsList.toll_type  == '10004'}">人民币担保业务手续费收入</c:if>
									<c:if test="${rsList.toll_type  == '20001'}">代收手续费分润</c:if>
								</td>
								<td>
									<c:if test="${rsList.trade_type  == '1'}">现金</c:if>
									<c:if test="${rsList.trade_type  == '2'}">转账</c:if>
								</td>
								<td>${rsList.toll_acct}</td>
								<td>${rsList.cust_name}</td>
								<td>
									<c:if test="${rsList.khlx  == '1'}">企业客户</c:if>
									<c:if test="${rsList.khlx  == '2'}">个人客户</c:if>
								</td>
								<td>${rsList.toll_amount}</td>
								<td>${rsList.create_date}</td>
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
										<c:if test="${rsList.status  == '1'}">
											<button class="btn btn-sm btn-primary" onclick="editEntity('${rsList.toll_id}');"
												type="button">修改</button>
											<button class="btn btn-sm btn-primary" onclick="toll_account('${rsList.toll_id}');"
												type="button">入账审批</button>
										</c:if>
										<button class="btn btn-sm btn-primary" onclick="viewEntity('${rsList.toll_id}');"
												type="button">查看</button>
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
			$("#trade_type").formComponents("select");
			$("#toll_type").formComponents("select");
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		//根据查询条件查看
		function toQry()
		{
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("toll_getList.do", param, function(result) {			
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function addEntity(){
			window.location="<%=path%>/mvc/toll_add.do";
		};
		function editEntity(toll_id){
			window.location="<%=path%>/mvc/toll_edit.do?toll_id="+toll_id;
		};
		function viewEntity(toll_id){
			window.location="<%=path%>/mvc/toll_view.do?toll_id="+toll_id;
		};
		//入账
		function toll_account(toll_id){			
			var param={};
			param["toll_id"]=toll_id;
			$.ajax({
    			type : "POST",
    			url : "<%=path%>/mvc/toll_account.do",
    			data : param,
    			async : false,
    			success : function(data) {
    				if(data.msg == "success"){
	    				alert("发起入账审批成功");
	    				movePage($("#pageNo").val());
    				}else{
    					alert(data.msg);
    				}
    			},
    		});				
		};
		//收费
		function toll_charge(toll_id){
			var param={};
			param["toll_id"]=toll_id;
			$.ajax({
    			type : "POST",
    			url : "<%=path%>/mvc/toll_charge.do",
    			data : param,
    			async : false,
    			success : function(data) {
    				alert("收费成功");
    				movePage($("#pageNo").val());
    			},
    		});				
		};
	</script>
</body>
</html>
