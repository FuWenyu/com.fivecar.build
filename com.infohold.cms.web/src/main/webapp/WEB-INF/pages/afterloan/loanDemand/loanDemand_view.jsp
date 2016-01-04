<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<body id="iframe_body"	onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display: none"></div>
	<div class="page-content" id="loadPageContent">
		<form class="form-horizontal" id="sub_form" name="sub_form" action="#" method="post">
			<input type="hidden" id="duebill_acct" name="duebill_acct" value="${loanDemandEntity.duebill_acct }" >
			<input type="hidden" id="loan_demand_id" name="loan_demand_id" value="${loanDemandEntity.loan_demand_id }" >
			<h3 class="header smaller lighter grey">催收记录</h3>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="demand_status">催收状态:</label>
							<label class="col-sm-6" ><fmt:message key='demand_status.${loanDemandEntity.demand_status }' /></label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_type">催收客户类型:</label>
							<label class="col-sm-6" ><fmt:message key='pro_type.${loanDemandEntity.cust_type }' /></label>
						</div>
					</div>	
				</div>		
			 	<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="personliable">催收人名称:</label>
							<label class="col-sm-6" >${loanDemandEntity.personliable }</label>
						</div>
					</div>
					<div class="form-group  col-sm-6">
							<label class="col-sm-4 control-label" for="demand_type">催收类型:</label>
							<label class="col-sm-6" ><fmt:message key='demand_type.${loanDemandEntity.demand_type }' /></label>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="create_date">催收日期:</label>
							<label class="col-sm-6" >${loanDemandEntity.create_date }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="way">催收方式:</label>
							<label class="col-sm-6" ><fmt:message key='demand_way.${loanDemandEntity.way }' /></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="address">催收地点:</label>
							<label class="col-sm-6" >${loanDemandEntity.create_date }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="contact_name">联系人名称:</label>
							<label class="col-sm-6" >${loanDemandEntity.contact_name }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="contact_job">联系人职位:</label>
							<label class="col-sm-6" >${loanDemandEntity.contact_job }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_tel">联系人电话:</label>
							<label class="col-sm-6" >${loanDemandEntity.borrower_tel }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="refund_date">落实还款日期:</label>
							<label class="col-sm-6" >${loanDemandEntity.refund_date }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="effect">催收效果:</label>
							<label class="col-sm-6" >${loanDemandEntity.effect }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="date_next">下次催收日期:</label>
							<label class="col-sm-6" >${loanDemandEntity.date_next }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="way_next">下次催收方式:</label>
							<label class="col-sm-6" ><fmt:message key='demand_way.${loanDemandEntity.way_next }' /></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="acceptance_date">承诺还款日期:</label>
							<label class="col-sm-6" >${loanDemandEntity.acceptance_date }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="collateral_change">抵押物变动情况:</label>
							<label class="col-sm-6" >${loanDemandEntity.collateral_change }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="guard_date">保全日期:</label>
							<label class="col-sm-6" >${loanDemandEntity.guard_date }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="guard_numer">保全次数:</label>
							<label class="col-sm-6" >${loanDemandEntity.guard_numer }</label>
						</div>
					</div>
				</div>
				<div class="row">
				<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="dqzsq">当前追索权状况:</label>
							<label class="col-sm-6" >${loanDemandEntity.dqzsq }</label>
						</div>
					</div>
					<c:if test="${loanDemandEntity.demand_status !=1 }">
						<div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="noticeback_date">催收通知书(回执)日期 :</label>
								<label class="col-sm-6" >${loanDemandEntity.noticeback_date }</label>
							</div>
						</div>
					</c:if>
					<c:if test="${loanDemandEntity.demand_status ==1 }">
						<div class="form-group col-sm-6">
							<div class="form-group">
							</div>
						</div>
					</c:if>
					
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower">落实借款人名称:</label>
							<label class="col-sm-6" >${loanDemandEntity.borrower }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="guarantor">落实保证人名称:</label>
							<label class="col-sm-6" >${loanDemandEntity.guarantor }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_desire">借款人还款意愿:</label>
							<label class="col-sm-6" >${loanDemandEntity.borrower_desire }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_ability">借款人还款能力:</label>
							<label class="col-sm-6" >${loanDemandEntity.borrower_ability }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="guarantor_desire">担保方还款意愿:</label>
							<label class="col-sm-6" >${loanDemandEntity.guarantor_desire }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="guarantor_ability">担保方代偿能力:</label>
							<label class="col-sm-6" >${loanDemandEntity.guarantor_ability }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="opinion">不良贷款客户关系建议:</label>
						<label class="col-sm-6" >${loanDemandEntity.opinion }</label>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="trend">趋势预测:</label>
						<label class="col-sm-6" >${loanDemandEntity.trend }</label>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="handle">不良贷款的处置思路:</label>
						<label class="col-sm-6" >${loanDemandEntity.handle }</label>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="measures">措施与对策:</label>
						<label class="col-sm-6" >${loanDemandEntity.measures }</label>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="ps">备注:</label>
						<label class="col-sm-6" >${loanDemandEntity.ps }</label>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="branch_noname">经办机构:</label>
							<label class="col-sm-6" >${loanDemandEntity.branch_noname }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_managername">客户经理:</label>
							<label class="col-sm-6" >${loanDemandEntity.cust_managername }</label>
						</div>
					</div>
				</div>	
				<!-- /row 横线-->
				<div class="clearfix form-actions">
				  <div class="row">
					<div class="col-md-offset-3 col-md-9">
						&nbsp; &nbsp; &nbsp;
						<button class="btn" type="button" onclick="javascript:history.go(-1);">
							<i class="icon-reply bigger-110"></i> 返回
						</button>
					</div>
				</div>
			  </div>
			</form>
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
</body>
</html>