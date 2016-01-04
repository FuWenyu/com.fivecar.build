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
	<style type="text/css">
		a.bgBtn{ text-decoration: none; }
		.bgBtn { width: 250px;height: 160px; border: 1px solid #dddddd; display:block; margin: 20px auto;font-size: 16px; color: #5f5f5f;}
		.bgBtn span {display: block;}
		.bgBtn i{margin-top: 40px;}
		.bgBtn:HOVER { background-color: #0aa6cc;}
		a.bgBtns{ text-decoration: none; }
		.bgBtns{ width: 250px;height: 160px; border: 1px solid #dddddd; display:block; margin: 20px auto;font-size: 16px; color: #5f5f5f;}
		.bgBtns span {display: block;}
		.bgBtns i{margin-top: 40px;}
		.bgBtns:HOVER { background-color: #45b97c;}
		a.bgBtna{ text-decoration: none; }
		.bgBtna{ width: 250px;height: 160px; border: 1px solid #dddddd; display:block; margin: 20px auto;font-size: 16px; color: #5f5f5f;}
		.bgBtna span {display: block;}
		.bgBtna i{margin-top: 40px;}
		.bgBtna:HOVER { background-color: #FF6666;}
	</style>
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
			<div class="row">	
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right" for="role_code"></label>
					<div class="col-sm-4 ">
						<a class="bgBtns text-center" href="#" onclick="add(1);">
								<img alt="新增个人客户" src="<%=path%>/img/tp/b.png" style="margin-top: 40px "><span>新增个人客户</span>
						</a>
					</div>
					<label class="col-sm-1 control-label no-padding-right" for="role_code"></label>
					<div class="col-sm-4 ">
						<a class="bgBtn text-center" href="#" onclick="add(2);">
								<img alt="新增企业客户" src="<%=path%>/img/tp/a.png" style="margin-top: 40px "><span>新增企业客户</span>
						</a>
					</div>
					<div class="col-sm-1 " ></div>
				</div>
			</div>
			 <div class="row">
				<div class="space-10"></div>	
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right" for="role_code"></label>
					<div class="col-sm-4 ">
						<a class="bgBtns text-center" href="#" onclick="add(3);">
									<img alt="新增个人临时客户" src="<%=path%>/img/tp/c.png" style="margin-top: 40px "><span>新增个人临时客户</span>
						</a>
					</div>
					<label class="col-sm-1 control-label no-padding-right" for="role_code"></label>
					<div class="col-sm-4 ">
						<a class="bgBtn text-center" href="#" onclick="add(4);">
								<img alt="新增企业临时客户" src="<%=path%>/img/tp/d.png" style="margin-top: 40px "><span>新增企业临时客户</span>
						</a>	
					</div>
					<div class="col-sm-1 " ></div>
				</div>
			</div>
			<div class="row">
				<div class="space-10"></div>	
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right" for="role_code"></label>
					<div class="col-sm-4 ">
						<a class="bgBtna text-center" href="#" onclick="add(5);">
								<img alt="新增集团客户" src="<%=path%>/img/tp/e.png" style="margin-top: 40px "><span>新增集团客户</span>
						</a>
					<label class="col-sm-1 control-label no-padding-right" for="role_code"></label>
					<div class="col-sm-5 ">
					</div>
				</div>
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
	function add(obj){
		//1  个人客户	2://企业客户	3://个人临时客户	4://企业临时客户5://集团客户
		window.location="<%=path%>/mvc/customer_add.do?obj="+obj;
	}
	</script>
</body>
</html>