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
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form" action="<%=path %>/mvc/role_editMenuSave.do" method="post">
						<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="id">角色ID：</label>
		
						<div class="col-sm-3">
							<input type="text" id="id" placeholder="请输入角色ID"
								class="col-xs-10 col-sm-10" name="id" value="${roleEntity.id}"
								readonly="readonly" />
						</div>
						<label class="col-sm-1 control-label no-padding-right"
							for="rolename">角色名称：</label>
		
						<div class="col-sm-6">
							<input type="text" id="name" placeholder="请输入角色名称"
								class="col-xs-10 col-sm-5" name="name" value="${roleEntity.name}"
								readonly="readonly" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="role_code">角色编号：</label>
		
						<div class="col-sm-3">
							<input type="text" id="role_code" placeholder="请输入角色ID"
								class="col-xs-10 col-sm-10" name="role_code" value="${roleEntity.role_code}"
								readonly="readonly" />
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-body">
							<c:forEach items="${menu_list }" var="menuEntity">
									<c:choose>
										<c:when test="${menuEntity.url=='#' }">
										<div class="col-sm-12">
											<%-- <h3><strong>${menuEntity.name }</strong></h3> --%>
											<h3 class="header smaller lighter blue">${menuEntity.name }</h3>
											<input name="ids" type="hidden" id ="${menuEntity.id }" value =""/>
										</div>
										</c:when>
										<c:otherwise>
											<div class="col-sm-4">
												<div class="checkbox">
												<label> <input name="ids" type="checkbox" id="${menuEntity.pid }_${menuEntity.id }"
													class="ace ace-checkbox-2 menuFuncCheck"
													value="${menuEntity.id }">
													<span class="lbl"> ${menuEntity.name }</span>
												</label>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
							</c:forEach>
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 修改
							</button>
		
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="javascript:history.go(-1);">
								<i class="icon-reply bigger-110"></i> 返回
							</button>
						</div>
					</div>
					<div id="checkedHidden">
						<c:forEach items="${roleMenu }" var="roleMenu">
							<input type="hidden" name="checkedId" value="${roleMenu.menuid}" />
						</c:forEach>
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
	<script type="text/javascript">
		jQuery(function($) {
			var array = new Array();
			$("#checkedHidden input").each(function() {
				array.push($(this).val());
			});
			$(".menuFuncCheck").each(function(index) {
				var menuFuncId = $(this).val();
				if (array.indexOf(menuFuncId) >= 0) {
					$(this).attr("checked", "checked");
				}
			});
		});
		function subForm() {
			var array =document.getElementsByName("ids");
			for(var i=0;i<array.length;i++){
				if(array[i].checked){
					var value = array[i].id.split("_");
					document.getElementById(value[0]).value=value[0];
				}
			}
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/role_editMenuSave.do",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						f_alert("<%=path%>","success","role_getList.do?pageNo="+$("#pageNo").val());
					}else{
						f_alert("<%=path%>",data.msg,"");
					}
				},
				error : function(msg) {
					var exp="配置出错 " + msg;
					f_alert("<%=path%>",exp,"");
				}
			});
		}
	</script>
	</body>
</html>

