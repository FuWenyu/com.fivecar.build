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
				<form id="form_sub" name="form_sub" class="col-xs-12" action=#	method="post">
							<input type="hidden" id="duebill_id" name="duebill_id"value="${BizDueBillEntity.duebill_id }"> 
							<h3 class="breadcrumb">
								<small> <span><b>合同信息</b></span>	</small>
							</h3>
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 业务编号 </label>
									<div class="col-sm-4">
										<input type="text" id="contract_id" class="col-xs-10 col-sm-6" data-toggle="modal" data-target="#duebill_Modal"
											name="contract_id" value="${BizcontractEntity.contract_id }" readonly="readonly" />
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2">合同编号</label>
									<div class="col-sm-4">
									<input type="text" id="con_acct" class="col-xs-10 col-sm-6"
											name="con_acct" value="${BizcontractEntity.con_acct }"
											readonly="readonly" />
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 客户编号 </label>
									<div class="col-sm-4">
										<input type="text" id="cust_id" class="col-xs-10 col-sm-6"
											name="custid" value="${BizcontractEntity.custid }"
											readonly="readonly" />
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 客户名称 </label>
									<div class="col-sm-4">
										<input type="text" id="custchname" class="col-xs-10 col-sm-6"
											name="cust_name" value="${BizcontractEntity.cust_name }"
											readonly="readonly" />
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 合同金额 </label>
									<div class="col-sm-4">
										<input type="text" id="amount" class="col-xs-10 col-sm-6"
											name="amount" value="${BizcontractEntity.amount}"
											readonly="readonly" style="text-align: right" />
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 产品名称 </label>
									<div class="col-sm-4">
										<input type="text" id="product_name"
											class="col-xs-10 col-sm-6" name="product_name"
											value="${BizcontractEntity.product_name }"
											readonly="readonly" />
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<%-- <div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 担保方式 </label>
									<div class="col-sm-4">
									<select name="gua_type" id="gua_type" class="col-xs-10 col-sm-6 abc" disabled="disabled"></select> 
										<input type="hidden" id="gua_type_1" class="col-xs-10 col-sm-6"
											name="gua_type_1" value="${BizcontractEntity.gua_type}"/>
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 还款方式 </label>
									<div class="col-sm-4">
									  <select name="repayment_type" id="repayment_type" class="col-xs-10 col-sm-6 abc" disabled="disabled"></select> 									
										<input type="hidden" class="col-xs-10 col-sm-6" name="repayment_type_1" id="repayment_type_1" value="${BizcontractEntity.repayment_type }" />
									</div>
									<div class="col-md-1"></div>
								</div>
							</div> --%>
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 合同起始日期 </label>
									<div class="col-sm-4">									
										<input type="text" id="start_date_contract"
											class="col-xs-10 col-sm-6" name="start_date_contract"
											value="${BizcontractEntity.start_date }" readonly="readonly" />											
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 合同到期日期 </label>
									<div class="col-sm-4">								
										<input type="text" id="end_date_contract"
											class="col-xs-10 col-sm-6" name="end_date_contract"
											value="${BizcontractEntity.end_date }" readonly="readonly" />										
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<%-- <div class="hr hr32 hr-dotted"></div>
							<h3 class="breadcrumb">
								<small> <span><b>账号信息</b></span></small>
							</h3>
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 放款账号</label>
									<div class="col-sm-4">
										<input type="text" id="loan_acct" class="col-xs-10 col-sm-6"
											name="loan_acct" value="${BizcontractEntity.loan_acct }"
											readonly="readonly" />
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 还款账号 </label>
									<div class="col-sm-4">
										<input type="text" id="rep_acct" class="col-xs-10 col-sm-6"
											name="rep_acct" value="${BizcontractEntity.rep_acct }"
											readonly="readonly" />
									</div>
									<div class="col-md-1"></div>
								</div>
							</div> --%>
							<div class="hr hr32 hr-dotted"></div>
							<h3 class="breadcrumb">
								<small><span><b>借据信息</b></span></small>
							</h3>
							<input 	type="hidden" id="duebill_acct" name="duebill_acct" value="${BizDueBillEntity.duebill_acct }"> 
					        <input 	type="hidden" id="duebill_ser_no" name="duebill_ser_no" value="${BizDueBillEntity.duebill_ser_no }"> 
							<input 	type="hidden" id="loan_date" name="loan_date" value="${BizDueBillEntity.loan_date }"> 
							<input 	type="hidden" id="close_date" name="close_date" value="${BizDueBillEntity.close_date }"> 
							<input 	type="hidden" id="extend_mark" name="extend_mark" value="${BizDueBillEntity.extend_mark }"> 
							<input 	type="hidden" id="pay_type" name="pay_type" value="${BizDueBillEntity.pay_type }"> 
							<%-- <input 	type="hidden" id="repay_type" name="repay_type" value="${BizDueBillEntity.repay_type }">  --%>
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2">借据金额
									</label>
									<div class="col-sm-4">
										<input type="text" id="duebill_amount"
											class="col-xs-10 col-sm-6" name="duebill_amount"
											value="${BizDueBillEntity.duebill_amount }"
											style="text-align: right" onblur="checkDuebill_amount();" />
											<div id="checkAmount" class="help-block red" onclick="clean()"></div>										
									</div>
									<div class="col-md-0"></div>
									<!-- <label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 还款日选择 </label>
									<div class="col-sm-4">
										<input type="text" id="repay_date" class="col-xs-10 col-sm-6"
											name="repay_date" value="对月对日" readonly="readonly" />
									</div> -->
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2">起始日期
									</label>
									<div class="col-sm-4">						
										<input type="text" id="start_date" class="col-xs-10 col-sm-6 " data-date-format="yyyy-mm-dd"
											name="start_date" value="${BizDueBillEntity.start_date }" readonly="readonly" />
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2">到期日期
									</label>
									<div class="col-sm-4">	
										   <input type="text" id="end_date" class="col-xs-10 col-sm-6" 
											name="end_date" value="${BizDueBillEntity.end_date }" onblur="check_enddate()" readonly="readonly"/>
											<div id="check_end_date" class="help-block red" onclick="clean()"></div>																													   							
									 </div>									     									
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="hr hr32 hr-dotted"></div>
							<h3 class="breadcrumb">
								<small> <span><b>还款计划</b></span></small>
							</h3>
							<div class="row">
								<div class="space-6"></div>
								<div class="col-sm-1"></div>	
								<div class="col-sm-9">
								<table id="sample-table-22" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>阶段号</th>
											<th>期数</th>
											<th>开始日期</th>
											<th>还款日期</th>
											<th>利率</th>
											<th>本金金额</th>
											<th>利息金额</th>
											<th>分期金额</th>
											<th>剩余本金</th>
											<th>当期担保费金额</th>
											<th>计息天数</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${rsList}" var="rsList">
											<tr>
												<td>${rsList.stageNumber}</td>
												<td>${rsList.installmentNumber}</td>
												<td>${rsList.startDate}</td>
												<td>${rsList.repaymentDay}</td>
												<td>${rsList.interestDays}</td>
												<td>${rsList.principalAmount}</td>
												<td>${rsList.interestAmount}</td>
												<td>${rsList.installmentAmount}</td>
												<td>${rsList.principalBalance}</td>
												<td>${rsList.guaranteeFeeAmount}</td>
												<td>${rsList.interestDays}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								</div>
								<div class="col-sm-2"></div>	
							</div>
							
							<div class="hr hr32 hr-dotted"></div>
							<div class="space-6"></div>
							<div class="span12">
								<div class="center">
									
							        <button class="btn btn-sm btn-primary" type="button" onclick="javascript:history.go(-1);">返回</button>
								</div>
						   </div>
						   
						</form>
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
    <script src="<%=path%>/js/fuelux/fuelux.wizard.min.js"></script>
	<!-- PAGE CONTENT ENDS -->
	<script type="text/javascript">
	jQuery(function($) {
		//加载下拉列表
		$("#rat_exe_cha").formComponents("select");
		$("#rat_adj_eff_time").formComponents("select");
		$("#rat_ove_cha").formComponents("select");
		$("#rat_emb_cha").formComponents("select");
		//Date Picker 控件
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		
		var oTable1 = $('#sample-table-22').dataTable( {
			"aoColumns": [
		      null,null,null,null,null,null,null,null,null,null,null
			] } );
		$("#sample-table-22_wrapper").find("div").get(0).remove();
		$("#sample-table-22_info").remove();
		
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
     })
	</script>
	</body>
</html>
