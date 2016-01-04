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
					<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/productDef_addSave.do" method="post">
					<div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="disbursementAmount"> 放款金额</label>
							<div class="col-sm-3">
								<input type="text" id="disbursementAmount" placeholder="请输入放款金额" class="col-xs-10 col-sm-8" name="disbursementAmount" />
							</div>
							<label class="col-sm-2 control-label no-padding-right" for="disbursementDate"> 放款日期 </label>
							<div class="col-sm-5">
								<input type="text" id="disbursementDate" placeholder="点击选择放款日期" class="date-picker col-xs-10 col-sm-5" name="disbursementDate" data-date-format="yyyymmdd" readonly/>
							</div>
				       </div>
				       <div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="interestRate"> 利率 </label>
							<div class="col-sm-3">
								<input type="text" id="interestRate" placeholder="请输入利率" class="col-xs-10 col-sm-8" name="interestRate" />
							</div>
							<label class="col-sm-2 control-label no-padding-right" for="scheduleType"> 还款计划类型 </label>
							<div class="col-sm-5">
								<select name="scheduleType" id="scheduleType" class="col-xs-10 col-sm-5">
									<option value="IPI">等额本金</option>
									<option value="EPI">等额本息</option>
									<option value="MOR">利随本清</option>
									<option value="IOI">一次还本按月付息</option>
									<!-- <option value="IOI_3">一次还本按季付息</option>
									<option value="IOI_12">一次还本按年付息</option> -->
								</select>
							</div>
				       </div>
				       <div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="loanTerm"> 贷款期限 </label>
							<div class="col-sm-3">
								<input type="text" id="loanTerm" placeholder="请输入贷款期限" class="col-xs-10 col-sm-8" name="loanTerm" />
							</div>
							<label class="col-sm-2 control-label no-padding-right" for="loanTermType"> 期限单位 </label>
							<div class="col-sm-5">
								<select name="loanTermType" id="loanTermType" class="col-xs-10 col-sm-5" disabled>
									<option value="M" selected>月</option>
									<option value="Y">年</option>
									<option value="Q">季</option>
								</select>
							</div>
				       </div>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
								<button class="btn btn-info" type="button"
									onclick="subForm();">
									<i class="icon-ok bigger-110"></i> 提交
								</button>
							</div>
						</div>
					</form>
					<div id="tableInfo"></div>
					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<jsp:include page="../../common/customer_modal.jsp"></jsp:include>
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
	<!-- PAGE CONTENT ENDS -->
	<script type="text/javascript">
	jQuery(function($) {
		//Date Picker 控件
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		
		/* $("#scheduleType").change(function(){
			if($(this).val() == "IOI_3"){
				$("#loanTermType").val("Q");
			}else if($(this).val() == "IOI_12"){
				$("#loanTermType").val("Y");
			}else{
				$("#loanTermType").val("M");
			}
		});  */
	});
	
	function subForm() {
		
		if (!checkData('disbursementAmount', '放款金额', 'input')) {
			return;
		}
		if (!checkData('disbursementAmount', '放款金额', 'number')) {
			return;
		}
		 if (!checkData('disbursementDate', '放款日期', 'input')) {
			return;
		}/*
		if (!checkData('maturityDate', '贷款到期日期', 'input')) {
			return;
		} */
		
		if (!checkData('interestRate', '利率', 'input')) {
			return;
		}
		if (!checkData('interestRate', '利率', 'number')) {
			return;
		}
		if (!checkData('loanTerm', '贷款期限', 'input')) {
			return;
		}
		if (!checkData('loanTerm', '贷款期限', 'number')) {
			return;
		}
		
		/* if($("#scheduleType").val() == "IOI_12"){
			if($("#loanTerm").val() == 0 || $("#loanTerm").val()%12 != 0){
				alert("还款计划类型为：一次还本按年付息，请输入12的倍数");
				return;
			}
		}
		if($("#scheduleType").val() == "IOI_3"){
			var loanTerm = $("#loanTerm").val();
			if(loanTerm>0 && loanTerm<3){
				$("#loanTerm").val(1);
			}else if(loanTerm >3){
				$("#loanTerm").val(Math.ceil(loanTerm / 3));
			}
			$("#loanTermType").val("J");
		} */
		$("#tableInfo").html("");
		$.post("<%=path%>/mvc/loanCalculate_doCalculate.do",$("#sub_form").serialize(),function(result){
			$("#tableInfo").html(result).hide();
			$("#tableInfo").fadeIn('fast');
			setHash('${pageContext.request.contextPath}');
		});
		<%-- $.ajax({
			type : "POST",
			url : "<%=path%>/mvc/loanCalculate_doCalculate.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				$.post("loanCalculate_doCalculate.do", param, function(result) {			
					$("#tableInfo").html(result).hide();
					$("#tableInfo").fadeIn('fast');
					setHash('${pageContext.request.contextPath}');
				});
			},
			error : function(msg) {
				alert("分配出错  " + msg);
			}
		}); --%>
	}
	</script>
	</body>
</html>

