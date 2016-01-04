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
				
				<div class="tabbable" id="tabbale">
					<ul class="nav nav-tabs" id="myTab">
						<li class="active"><a data-toggle="tab" href="#" data-name="contract"> 合同利率调整
						</a></li>
		
						<li><a data-toggle="tab" href="#" data-name="duebill"> 借据利率调整
						</a></li>
					</ul>
		
					<div class="tab-content">
						<div id="tabContent" class="tab-pane active">
							<!-- tabContent异步加载区域 -->
						</div>
					</div>
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
			param={};
			//ajaxLoadPage("#tabContent","rateAdjust_contract_getList.do",param);
			$.post("rateAdjust_contract_getList.do", param, function(result) {			
				$("#tabContent").html(result).hide();
				$("#tabContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
			$("#tabbale a").on("click",function(){
				if($(this).parent().hasClass("active")){
					return false;
				}
				var tabName=$(this).attr("data-name");
				if(tabName == 'contract'){
					$.post("rateAdjust_contract_getList.do", param, function(result) {			
						$("#tabContent").html(result).hide();
						$("#tabContent").fadeIn('fast');
						setHash('${pageContext.request.contextPath}');
					});
				}else if(tabName == 'duebill'){
					$.post("rateAdjust_duebill_getList.do", param, function(result) {	
						$("#tabContent").html(result).hide();
						$("#tabContent").fadeIn('fast');
						setHash('${pageContext.request.contextPath}');
					});
				}else{
					return false;
				}
				
			});
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		<%-- //根据查询条件查看
		function toQry()
		{
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("acctModify_getList.do", param, function(result) {			
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function addEntity(){
			window.location="<%=path%>/mvc/acctModify_add.do";
		};
		function editEntity(modify_id){
			window.location="<%=path%>/mvc/acctModify_edit.do?modify_id="+modify_id;
		};
		function approveEntity(modify_id){		
			showModal($("#myModal"));
			$(window.parent.document).find("#modify_id").val(modify_id);
				
		};
		function CallBackSubmit(obj){
			var param={};
			param["modify_id"]=$(obj).closest("#myModal").find("#modify_id").val();
			param["reason_approve"]=$(obj).closest("#myModal").find("#reason_approve").val();
			$.ajax({
    			type : "POST",
    			url : "<%=path%>/mvc/acctModify_approve.do",
    			data : param,
    			async : false,
    			success : function(data) {
    				alert("发起审批成功");
    				movePage($("#pageNo").val());
    			},
    		});		
			hideModal();
		} --%>
	</script>
</body>
</html>
