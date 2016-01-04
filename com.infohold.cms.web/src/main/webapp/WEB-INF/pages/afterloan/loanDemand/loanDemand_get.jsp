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
			<h3 class="header smaller lighter grey">合同基本信息</h3>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="con_acct">合同编号：</label>
							<label class="col-sm-6" >${conAndDueEntity.con_acct }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="amount">合同金额：</label>
								<label class="col-sm-6" >${conAndDueEntity.amount }(元)</label>
						</div>
					</div>
				</div>		
			 	<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="repayment_type">还款方式：</label>
							<label class="col-sm-6" ><fmt:message key='rep_way.${conAndDueEntity.repayment_type }' /></label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="product_name">产品名称：</label>
							<label class="col-sm-6 pull-left">${conAndDueEntity.product_name }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="con_start_date">合同起始日期：</label>
								<label class="col-sm-4" >${conAndDueEntity.con_start_date }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="con_end_date">合同到期日期：</label>
								<label class="col-sm-4" >${conAndDueEntity.con_end_date }</label>
						</div>
					</div>
				</div>
				<h3 class="header smaller lighter grey">借据基本信息：</h3>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="duebill_acct">借据编号：</label>
								<label class="col-sm-6" >${conAndDueEntity.duebill_acct }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="duebill_amount">借据金额：</label>
								<label class="col-sm-6" >${conAndDueEntity.duebill_amount }(元)</label>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="loan_acct_no">贷款账号：</label>
								<label class="col-sm-6" >${conAndDueEntity.loan_acct_no }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="status">借据状态：</label>
								<label class="col-sm-6" ><fmt:message key='DUEBILL_STATUS.${conAndDueEntity.duebill_status }'/></label>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="start_date">借据起始日期：</label>
								<label class="col-sm-6" >${conAndDueEntity.start_date }</label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="end_date">借据到期日期：</label>
								<label class="col-sm-6" >${conAndDueEntity.end_date }</label>
						</div>
					</div>
				</div>	
			</form>
				<!--查询结果列表  -->
				<div class="row" id = "result">
					<form class="col-xs-12" id="queryForm" name="queryForm" action="<%=path%>/mvc/loanDemad_add.do" method="post">
						<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
						<input type="hidden" id="duebill_acct" name="duebill_acct"	value="${conAndDueEntity.duebill_acct }" />
					</form>
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div id="qryContent">
							<div id="sample-table-2_wrapper" class="dataTables_wrapper"
								role="grid">
								<table id="sample-table-2"
									class="table table-striped table-bordered table-hover dataTable"
									aria-describedby="sample-table-2">
									<thead>
										<tr>
											<th>催收记录序号</th>
											<th>催收类型</th>
											<th>催收客户类型</th>
											<th>催收日期</th>
											<th>催收方式</th>
											<th>催收状态</th>
											<th>客户经理</th>
											<th>经办机构</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${loanDemandList}" var="loanDemandList">
											<tr>
												<td>
													<a href="javascript:viewEntity('${loanDemandList.loan_demand_id}')" >${loanDemandList.loan_demand_id}</a>
												</td>
												<td><fmt:message key='demand_type.${loanDemandList.demand_type}' /></td>
												<td><fmt:message key='pro_type.${loanDemandList.cust_type}' /></td>
												<td>${loanDemandList.create_date}</td>
												<td><fmt:message key='demand_way.${loanDemandList.way}' /></td>
												<td><fmt:message key='demand_status.${loanDemandList.demand_status}' /></td>
												<td>${loanDemandList.cust_managername}</td>
												<td>${loanDemandList.branch_noname}</td>
												<td><div class="btn-group">
													<button class="btn btn-sm btn-primary" onclick="editEntity('${loanDemandList.loan_demand_id}');" type="button">维护</button>
												</div></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
									<div class="row">
										<div class="col-sm-4">
											<div class="btn-group">
												<!-- 列表底部按钮区域 -->
												<button class="btn btn-sm btn-primary" onclick="loanDemad_add(1);" type="button">借款人催收</button>
												<button class="btn btn-sm btn-primary" onclick="loanDemad_add(2);" type="button">担保人催收</button>
												<button class="btn btn-sm btn-primary" onclick="history.go(-1)" type="button">返回</button>
											</div>
										</div>
							    		 <!-- 分页 -->
										<jsp:include page="../../common/page.jsp"></jsp:include>
								    </div>
							    </div>
							</div>
						</div>
						<!--/// 查询结果列表  -->
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
	function goback(){
		window.location="<%=path%>/mvc/groupCustomer_getList.do?pageNo="+$("#pageNo").val();
	}
	function loanDemad_add(demand_type){
		window.location="<%=path%>/mvc/loanDemand_add.do?demand_type="+demand_type+"&duebill_acct="+$("#duebill_acct").val();
	}
	function editEntity(id){
		window.location="<%=path%>/mvc/loanDemand_edit.do?viewOrEdit=edit&id="+id;
	}
	function viewEntity(id){
		window.location="<%=path%>/mvc/loanDemand_edit.do?viewOrEdit=view&id="+id;
	}
	</script>
</body>
</html>