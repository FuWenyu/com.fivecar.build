<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display:none"></div>
	<div class="page-content" id="loadPageContent">
	<div class="row">
	<div class="col-xs-12">
		<form class="col-xs-12" id="queryForm" name="queryForm" action="<%=path%>/mvc/perCustomer_getList_temp.do" method="post">
			<div class="row">
				<div class="space-6"></div>
				<div class="form-group">
					<div class="col-md-1"></div>
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-2"> 客户编号 </label>
					<div class="col-sm-4">
						<input type="text" id="cust_id" placeholder=""	class="col-xs-10 col-sm-5 " name="cust_id"/>
					</div>
					<div class="col-md-0"></div>
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-2"> 客户名称 </label>
					<div class="col-sm-4">
						<input type="text" id="cust_name" placeholder="" class="col-xs-10 col-sm-5" name="cust_name" />
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>

			<div class="space-3"></div>
			<div class="row">
				<div class="form-group">
					<label class="col-sm-10 control-label no-padding-right"
						for="form-field-2"> </label>
					<div class="col-sm-1">
						<button class="btn btn-sm btn-primary" type="button"
							onclick="querySubmit()">查询</button>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>

			<!-- /row 横线-->
			<div class="page-header"></div>
		</form>
		<!--查询结果列表  -->
		<div class="row">
				<div class="col-xs-12">
					<div id="qryContent">
						<div id="sample-table-2_wrapper" class="dataTables_wrapper"
							role="grid">
							<table id="sample-table-2"
								class="table table-striped table-bordered table-hover dataTable"
								aria-describedby="sample-table-2">
								<thead>
									<tr>
										<th>客户编号</th>
										<th>客户名称</th>
										<th>证件类型</th>
										<th>证件号码</th>
										<th>创建日期</th>
										<th>维护日期</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${perCustomerList}" var="perCustomerList">
										<tr>
											<td><a href="javascript:viewEntity('${perCustomerList.id}')">${perCustomerList.cust_id}</a>
											</td>
											<td>${perCustomerList.cust_name}</td>
											<td><fmt:message key='per_id_type.${perCustomerList.cert_type}' /></td>
											<td>${perCustomerList.cert_no}</td>
											<td>${perCustomerList.create_date}</td>
											<td>${perCustomerList.update_date}</td>
											<td>
												<div class="btn-group">
													<button class="btn btn-sm btn-primary" onclick="editEntity('${perCustomerList.id}');" type="button">维护</button>
													<button class="btn btn-sm btn-primary" onclick="deleteEntity('${perCustomerList.id}');" type="button">删除</button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
								<div class="row">
									<div class="col-sm-4">
										
									</div>
									 <jsp:include page="../../common/page.jsp"></jsp:include>
							    </div>
						    </div>
						</div>
					</div>
					<!--/// 查询结果列表  -->
				</div>
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
		function viewEntity(id){
			window.location="<%=path%>/mvc/perCustomer_get_temp.do?id="+id+"&viewOrEdit=view&pageNo="+$("#pageNo").val();
		}
		function editEntity(id){
			window.location="<%=path%>/mvc/perCustomer_get_temp.do?id="+id+"&viewOrEdit=edit&pageNo="+$("#pageNo").val();
		}
		function querySubmit(){
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("perCustomer_getList_temp.do", param, function(result) {			
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function deleteEntity(id){
			var param={};
			param["id"]=id;
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/perCustomer_delete_temp.do",
				data : param,
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						f_alert("<%=path%>","success","perCustomer_getList_temp.do?pageNo="+$("#pageNo").val());
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
	</script>
</body>
</html>