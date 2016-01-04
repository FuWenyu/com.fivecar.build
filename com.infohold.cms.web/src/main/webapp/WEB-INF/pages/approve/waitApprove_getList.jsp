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
		<div id="modal_area"></div>
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<!-- 查询条件begin -->
				<form class="form-horizontal" id="queryForm" name="queryForm" action="<%=path%>/mvc/waitApprove_getList.do" method="post">
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
						<div class="form-group">
							<div class="col-sm-10"></div>
							<div class="col-sm-2">
								<button class="btn btn-sm btn-primary" onclick="toQry();" type="button">查询</button>
							</div>
						</div>
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
									<th>操作</th>
								</tr>
							</thead>
		
							<tbody>
								<c:forEach items="${waitApproveList}" var="waitApproveList">
									<tr>
										<td><a href="#" onclick="viewApprove('${waitApproveList.bizid}')">${waitApproveList.processinsid}</a></td>
										<td><a href="#" onclick="viewBusiness('${waitApproveList.bizid}','${waitApproveList.bizcode}')">${waitApproveList.bizid}</a></td>
										<td><a href="#" onclick="viewCust('${waitApproveList.custid}')">${waitApproveList.custid}</a></td>
										<td>${waitApproveList.custname}</td>
										<td><fmt:message key='approve_type.${waitApproveList.bizcode}' /></td>
										<td>${waitApproveList.createdate}</td>
										<td>
											<!-- 列表按钮区域 -->
											<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<button type="button" class="btn btn-xs btn-primary" onclick="approve('${waitApproveList.bizid}','${waitApproveList.bizcode}')">审批</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="row">
							<div class="col-sm-4">
								<div class="btn-group">
									<!-- 列表底部按钮区域 -->
									<!-- <button class="btn btn-sm btn-primary" onclick="addEntity();" type="button">新增</button> -->
									<!-- <input class="btn" type="button" value="影像查看" onclick="test();"></input> -->
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
			/*  document.getElementById("roleback").style.display="none";  */
		});
		//根据查询条件查看
		function toQry()
		{
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("waitApprove_getList.do", param, function(result) {			
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function approve(id,bizCode){
			$("#biz_id").val(id);
			$("#biz_code").val(bizCode);
			showModal($("#Modal_approve"));
		}
		function viewBusiness(biz_id,biz_code){
			window.location="<%=path%>/mvc/approve_getBusiness.do?biz_id="+biz_id+"&biz_code="+biz_code;
		}
		function viewApprove(id){
			window.location="<%=path%>/mvc/approve_get.do?biz_id="+id+"&viewtype=wait";
		}
		function viewCust(id){
			window.location="<%=path%>/mvc/approve_getCust.do?cust_id="+id+"&viewtype=wait";
		}
		function CallBackSubmit(obj){
			var reason = $(window.document).find("#Modal_approve textarea[name='reason_approve']").val();
			var backType = $(window.document).find("#Modal_approve select[name='backType']").val();
			$(window.document).find("#roleback").addClass("hidden");
			if(obj==3){//终止
				if(reason==null||reason==""){
					$(window.document).find("#Modal_approve textarea[name='reason_approve']").closest("form").find(".help-block").remove();
					$(window.document).find("#Modal_approve textarea[name='reason_approve']").after("<div class=\"help-block red\" >&nbsp;&nbsp;*&nbsp;终止操作需填写审批意见！");
					$(window.document).find("#Modal_approve textarea[name='reason_approve']").focus();
					return false;
				}
			}
			if(obj==2){	//回退
				if(reason==null||reason==""){
					$(window.document).find("#Modal_approve textarea[name='reason_approve']").closest("form").find(".help-block").remove();
					$(window.document).find("#Modal_approve textarea[name='reason_approve']").after("<div class=\"help-block red\" >&nbsp;&nbsp;*&nbsp;回退操作需填写审批意见！");
					$(window.document).find("#Modal_approve textarea[name='reason_approve']").focus();
					return false;
				}
				if($("#biz_code").val()=="B019"||$("#biz_code").val()=="B025"){//业务申请（关联额度）
					backType=2;
				}else{
					$(window.document).find("#roleback").removeClass("hidden");
					if(backType==null||backType==""){
						$(window.document).find("#Modal_approve select[name='backType']").closest("form").find(".help-block").remove();
						$(window.document).find("#Modal_approve select[name='backType']").after("<div class=\"help-block red\" >&nbsp;&nbsp;*&nbsp;回退操作需选择回退方式！");
						$(window.document).find("#Modal_approve select[name='backType']").focus();
						return false;
					}
				}
			}
			hideModal();
			param={};
			param["biz_id"]=$("#biz_id").val();
			param["biz_code"]=$("#biz_code").val();
			param["reason_approve"]=reason ;
			param["backType"]=backType;
			$("select").prop("disabled",false);
			 $.ajax({
				type : "POST",
				url : "<%=path%>/mvc/waitApprove_doapprove.do?oper_flag="+obj,
				data : param,
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						f_alert("<%=path%>","success","waitApprove_getList.do");
					}else{
						f_alert("<%=path%>",data.msg,"waitApprove_getList.do");
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
