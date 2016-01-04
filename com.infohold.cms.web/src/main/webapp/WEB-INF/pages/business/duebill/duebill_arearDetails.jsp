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
											value="${BizDueBillEntity.duebill_amount }" readonly
											/>
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
								<small> <span><b>欠款明细查询</b></span></small>
							</h3>
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="valueFromDate">起始日期
									</label>
									<div class="col-sm-4">						
										<input type="text" id="valueFromDate" placeholder="点击选择起始日期" class="date-picker col-xs-10 col-sm-6 " data-date-format="yyyymmdd"
											name="valueFromDate"  readonly/>
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="ValueToDate">结束日期
									</label>
									<div class="col-sm-4">	
										   <input type="text" id="ValueToDate" placeholder="点击选择结束日期"  class="date-picker col-xs-10 col-sm-6" data-date-format="yyyymmdd"
											name="ValueToDate" readonly/>
									 </div>									     									
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2">欠款类型
									</label>
									<div class="col-sm-4">						
										<select id="arearType" name="arearType" class="col-xs-10 col-sm-6 ">
											<option value="1">所有交易</option>
											<option value="2">分期欠款（本金和利息欠款）</option>
											<option value="3">罚息欠款</option>
											<option value="4">其他欠款</option>
											<option value="5">本金欠款</option>
											<option value="6">利息欠款</option>
											<option value="7">PMI利息</option>
											<option value="8">费用欠款</option>
											<option value="9">保费欠款</option>
											<option value="10">对外欠款</option>
											<option value="11">法律费用欠款</option>
										</select>
									</div>
									<div class="col-md-0"></div>
									<div class="col-sm-4">	
										   <button class="btn btn-sm btn-primary" type="button" onclick="searchBtn()">查询</button>																													   							
									 </div>									     									
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="hr hr32 hr-dotted"></div>
							<div id="qryContent">
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="outStandingBalance">未偿还金额
									</label>
									<div class="col-sm-4">						
										<input type="text" id="outStandingBalance" class="col-xs-10 col-sm-6 " 
											name="outStandingBalance"  value="${map.outStandingBalance }" readonly/>
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="accrualStatus">贷款账户状态
									</label>
									<div class="col-sm-4">	
										   <input type="text" id="accrualStatus" class="col-xs-10 col-sm-6" 
											name="accrualStatus" value="${map.accrualStatus }"readonly/>
									 </div>									     									
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="maturityDate">贷款账户到期日
									</label>
									<div class="col-sm-4">						
										<input type="text" id="maturityDate" class="col-xs-10 col-sm-6 " data-date-format="yyyymmdd"
											name="maturityDate"  value="${map.maturityDate }" readonly/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="space-6"></div>
								<div class="col-sm-1"></div>	
								<div class="col-sm-9">
								<table id="sample-table-22" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>欠款期数</th>
											<th>欠款类型</th>
											<th>欠款日</th>
											<th>本期应收金额</th>
											<th>欠款金额</th>
											<th>上次偿还日</th>
											<th>逾期天数</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${map.item}" var="item">
											<tr>
												<td>${item.unPaidInstallments}</td>
												<td>${item.arrearType}</td>
												<td>${item.dueDate}</td>
												<td>${item.assessedAmount}</td>
												<td>${item.dueAmount}</td>
												<td>${item.lastPaymentDueDate}</td>
												<td>${item.daysPastDue}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								</div>
								<div class="col-sm-2"></div>	
							</div>
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
		      null,null,null,null,null,null,null
			] } );
		$("#sample-table-22_wrapper").find("div").get(0).remove();
		$("#sample-table-22_info").remove();
		
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
     })
     function searchBtn(){
		if($("#arearType").val() == "" || $("#valueFromDate").val() == "" || $("#ValueToDate").val()== ""){
			alert("请输入完整的查询条件");
			return;
		}
		param={};
		param["duebill_id"] = $("#duebill_id").val();
        param["arearType"] = $("#arearType").val();
        param["valueFromDate"] = $("#valueFromDate").val();
		param["ValueToDate"] = $("#ValueToDate").val();
		$.post("duebill_arearDetailsInfo.do", param, function(result) {	
			$("#qryContent").html(result).hide();
			$("#qryContent").fadeIn('fast');
			setHash('${pageContext.request.contextPath}');
		});
	}
	</script>
	</body>
</html>
