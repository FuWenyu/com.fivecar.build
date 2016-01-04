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
	<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				
				<form class="form-horizontal" id="queryForm" name="queryform"
				action="<%=path%>/mvc/productDef_getList.do" method="post">
				<div class="form-group">
					<div class="col-md-1"></div>
					<label class="col-sm-1 control-label no-padding-right"
						for="pro_code"> 产品代码</label>
					<div class="col-sm-4">
						<input type="text" id="pro_code" class="col-xs-10 col-sm-5"
							name="pro_code" />
					</div>
					<label class="col-sm-1 control-label no-padding-right"
						for="status"> 产品状态</label>
					<div class="col-sm-4">
						<select class="col-xs-10 col-sm-5" id="status" name="status">
							<option value="">请选择...</option>
							<option value="1">启用</option>
							<option value="0">停用</option>
						</select>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="form-group">
					<div class="col-md-1"></div>
					<label class="col-sm-1 control-label no-padding-right"
						for="pro_name"> 产品名称</label>
					<div class="col-sm-4">
						<input type="text" id="pro_name" class="col-xs-10 col-sm-5"
							name="pro_name" />
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
								<th>产品代码</th>
								<th>产品名称</th>
								<th>产品类型</th>
								<th>币种</th>
								<th>担保方式</th>
								<th>还款方式</th>
								<th>产品状态</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${rsList}" var="rsList">
							<tr>
								<td>${rsList.pro_code}</td>
								<td>${rsList.pro_name}</td>
								<td><fmt:message key="pro_type.${rsList.pro_type}" /></td>
								<td><fmt:message key="currency_type.${rsList.cny}" /></td>
								<td>${rsList.guarantee_type_name}</td>
								<td>${rsList.repay_type_name}</td>
								<td>
									<c:if test="${rsList.status  == '1'}">启用</c:if>
									<c:if test="${rsList.status  == '0'}">停用</c:if>
								</td>	
								<td>
									<div class="btn-group">
										<button class="btn btn-sm btn-primary" onclick="editEntity('${rsList.pro_code}');"
											type="button">修改</button>
										<c:if test="${rsList.status  == '1'}">
											<button class="btn btn-sm btn-primary" onclick="stopEntity('${rsList.pro_code}');"
												type="button">停用</button>
										</c:if>
										<c:if test="${rsList.status  == '0'}">
											<button class="btn btn-sm btn-primary" onclick="useEntity('${rsList.pro_code}');"
												type="button">启用</button>
										</c:if>
										<button class="btn btn-sm btn-primary" onclick="viewEntity('${rsList.pro_code}');"
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
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		//根据查询条件查看
		function toQry()
		{
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("productDef_getList.do", param, function(result) {			
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function addEntity(){
			window.location="<%=path%>/mvc/productDef_add.do";
		};
		function editEntity(id){
			window.location="<%=path%>/mvc/productDef_edit.do?id="+id;
		};
		function viewEntity(id){
			window.location="<%=path%>/mvc/productDef_view.do?id="+id;
		};
		function stopEntity(pro_code){			
			var param={};
			param["pro_code"]=pro_code;
			$.ajax({
    			type : "POST",
    			url : "<%=path%>/mvc/productDef_delete.do",
    			data : param,
    			async : false,
    			success : function(data) {
    				if(data.msg == "success"){
    					alert("停用成功");
        				movePage($("#pageNo").val());
    				}else{
    					alert(data.msg);
    				}
    			},
    		});				
		};
		function useEntity(pro_code){			
			var param={};
			param["pro_code"]=pro_code;
			$.ajax({
    			type : "POST",
    			url : "<%=path%>/mvc/productDef_use.do",
    			data : param,
    			async : false,
    			success : function(data) {
    				if(data.msg == "success"){
    					alert("启用成功");
        				movePage($("#pageNo").val());
    				}else{
    					alert(data.msg);
    				}
    			},
    		});				
		};
	</script>
</body>
</html>
