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
						<form id="form_1" name="form_1" class="col-xs-12" action="#" method="post">
							<h3 class="breadcrumb">	
								<small>
									<span><b>申请信息</b></span>
								</small>
							</h3>
							<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 合同编号 </label>
										<div class="col-sm-4">
											<input type="text" id="con_acct"
												class="col-xs-10 col-sm-6" name="con_acct" placeholder="请选择合同"
												value="${contractEntity.con_acct }" onclick="selectCon(1)" />
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> </label>
										<div class="col-sm-4">
										</div>
										<div class="col-md-1"></div>
									</div>
							</div>
							<div class="hr hr32 hr-dotted"></div>
							<h3 class="breadcrumb">	
								<small>
									<span><b>合同信息</b></span>
								</small>
							<input type="hidden" id="contract_id" name="contract_id" value="${contractEntity.contract_id }">
							</h3>
							<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">客户名称</label>
										<div class="col-sm-4">
											<input type="text" id="duebill_acct"
												class="col-xs-10 col-sm-6" name="duebill_acct" 
												value="${contractEntity.custchname }"  readonly="readonly"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">产品名称 </label>
										<div class="col-sm-4">
											<input type="text" id="cust_name"
												class="col-xs-10 col-sm-6" name="cust_name" 
												value="${contractEntity.product_name }" readonly="readonly"/>										
										</div>
										<div class="col-md-1"></div>
									</div>
							</div>
							<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 合同起始日期 </label>
										<div class="col-sm-4">
											<input type="text" id="create_date"
												class="col-xs-10 col-sm-6" name="create_date" 
												value="${contractEntity.start_date }" readonly="readonly"/>	
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 合同到期日期 </label>
										<div class="col-sm-4">
												<input type="text" id="repay_amount"
												class="col-xs-10 col-sm-6" name="repay_amount" 
												value="${contractEntity.end_date }"  readonly="readonly"/>	
										</div>
										<div class="col-md-1"></div>
									</div>
							</div>		
							<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 主要担保方式</label>
										<div class="col-sm-4">
											<input type="text" id="repay_type_name"
												class="col-xs-10 col-sm-6 " name="repay_type_name" readonly="readonly"
												value="${contractEntity.gua_name }" />
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> </label>
										<div class="col-sm-4">										
										</div>
										<div class="col-md-0"></div>
									</div>
							</div>
							<div class="hr hr32 hr-dotted"></div>
							
							<h3 class="breadcrumb">	
								<small>
									<span><b>担保合同</b></span>
								</small>
							</h3>
							<div class="row">
									<div class="col-xs-12">
										<!-- PAGE CONTENT BEGINS -->
										<div class="table-responsive">
											<div id="sample-table-2_wrapper" class="dataTables_wrapper"
												role="grid">
												<table id="sample-table-2"
													class="table table-striped table-bordered table-hover dataTable"
													aria-describedby="sample-table-2">
													<thead>	
													<tr>												
													<th>担保合同编号</th>
													<th>担保方式</th>
													<th>担保金额</th>
													<th>起始日期</th>
													<th>到期日期</th>
													<th>担保合同状态</th>
													<th>操作</th>													
												</tr>
													</thead>
													<tbody>
											<c:forEach items="${GuaranteeList}" var="GuaranteeList" >
												<tr>
													<td><a href="<%=path%>/mvc/Guarantee_View_Forchange.do?guarantee_id=${GuaranteeList.guarantee_id}&contract_id=${GuaranteeList.contract_id}&tradeCode=T61103">${GuaranteeList.gua_con_no}</a></td>
													<td>${GuaranteeList.gua_name}</td>
													<td>${GuaranteeList.amount}</td>
													<td>${GuaranteeList.start_date}</td>
													<td>${GuaranteeList.end_date}</td>
													<td><span class="label label-sm label-warning">${GuaranteeList.status_name}</span></td>
													<td>
														<!-- 列表按钮区域 -->
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
														<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${afterloanlist.re_id}','${afterloanlist.approvestatus}')">担保合同取消</button>
														</div>
													</td>																	
												</tr>
											  </c:forEach>
													</tbody>
												</table>
												<div id="sample-table-2_wrapper" class="dataTables_wrapper"	role="grid">
													<div class="row">
														<div class="col-sm-5">
															<a class="btn btn-sm btn-primary" onclick="addGua('${contractEntity.contract_id}')">追加担保合同</a>
															<a class="btn btn-sm btn-primary" onclick="goback();">返回</a>
														</div>
													</div>								
												</div>
									   </div>
									</div>
								</div>
							</div>
							<!-- /row -->
							</form>									
							<!-- PAGE CONTENT ENDS -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
		</div>
			<jsp:include page="./guaranteeChange-dialog.jsp"></jsp:include> 
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
		
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		
		
		
		
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
     })
	function addGua(contract_id){
			window.location="<%=path%>/mvc/guarantee_add.do?flag=2&contract_id="+contract_id;
	};
	
	
	</script>
	</body>
</html>
