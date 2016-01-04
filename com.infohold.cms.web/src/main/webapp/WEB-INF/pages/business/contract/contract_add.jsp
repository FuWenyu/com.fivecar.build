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
		<div id="modal_area"></div>
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
					<form id="form_1" class="col-xs-12 form-horizontal" action=""method="post">
					<input type="hidden" id="zydbfs" name="zydbfs" value="">
								<div class="row">
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 客户编号 </label>
										<div class="col-sm-4">
											<input type="text" id="cust_id" 
												class="col-xs-10 col-sm-5" name="cust_id"
												value="${contractEntrty.custid}" readonly="readonly" onclick="selectCustomer(1);" placeholder="请选择"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 客户名称 </label>
										<div class="col-sm-4">
										<input type="text" id="custchname"  
												class="col-xs-10 col-sm-5" name="custchname" onclick="selectCustomer(1);"
												value="${contractEntrty.custchname}" readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>
							    </div>
							    <div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 业务单编号 </label>
										<div class="col-sm-4">
											<input type="text" id="businessid" 
												class="col-xs-10 col-sm-5" name="businessid" onclick="selectBusiness();" value="" placeholder="请选择" readonly="readonly"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 签订日期 </label>
										<div class="col-sm-4">
											<input type="text" id="sptgrq"
												class="col-xs-10 col-sm-5" name="sptgrq" readonly="readonly" value="" />
										</div>
										<div class="col-md-1"></div>
									</div>
							   </div>
							    <div class="row">
									<div class="space-6"></div>
										<div class="form-group">
											<div class="col-md-2"></div>
											
											<label class="col-sm-1 control-label no-padding-right"
												for="form-field-2"> 贷款品种 </label>
											<div class="col-sm-4">
												<input type="text" id="pro_name" class="col-xs-10 col-sm-5" name="pro_name" readonly="readonly"  value="" />
											</div>
											<div class="col-md-0"></div>
											<label class="col-sm-1 control-label no-padding-right"
												for="form-field-2"> 合同金额 </label>
											<div class="col-sm-4">
												<input type="text" id="amount"  class="col-xs-10 col-sm-5" name="amount" style="text-align:right" value="${contractEntrty.amount}" readonly="readonly" />
											</div>
											<div class="col-md-1"></div>
										</div>
								</div>
								<div class="hr hr32 hr-dotted"></div>
								<div class="space-6"></div>
								<div class="span12">
									<div class="center">
									<button class="btn btn-sm btn-primary" type="button" onclick="AddOrUpdate();">保存 </button>
							        &nbsp; &nbsp; &nbsp;
							        <button class="btn btn-sm btn-primary" type="button" onclick="javascript:history.go(-1);">返回</button>
								</div>
						   </div>
					</form>
			</div>
		</div>
		</div>
		<!-- 引模态 -->
 <jsp:include page="../../common/customer_modal.jsp"></jsp:include><!-- 引客户 -->
 <jsp:include page="business_modal.jsp"></jsp:include><!-- 引业务 -->
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
    <script src="<%=path%>/js/fuelux/fuelux.wizard.min.js"></script>
	<!-- PAGE CONTENT ENDS -->
	<script type="text/javascript">
		//表单提交
	jQuery(function($) {
		//加载下拉列表 
		$("#pro_List").formComponents("select");
		$("#gua_type").formComponents("select");
		$("#repayment_type").formComponents("select");
		$("#rat_ove_cha").formComponents("select");
		$("#rat_exe_cha").formComponents("select");
		$("#rat_adj_eff_time").formComponents("select");
		//Date Picker 控件
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
     })
		
	function AddOrUpdate(){
		if (!checkData('cust_id', '客户号', 'input')) {
			return;
		}
		if (!checkData('businessid', '业务单编号', 'input')) {
			return;
		}
		 
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/contract_addSave.do",
			data : $("#form_1").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					f_alert("<%=path%>","success","contract_getList.do");
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
