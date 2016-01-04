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
				<form id="form_sub" class="col-xs-12" action=""method="post">
							<input type="hidden" id="contract_id" name="contract_id" value="${contract_id}">
							<input type="hidden" id="guarantee_id" name="guarantee_id" value="${guaranteeEntrty.guarantee_id }">
							<input type="hidden" id="flag" name="flag" value="${flag}">
							<input type="hidden" value = "${contractEntrty.gua_type}" name = "contract_gua_type" id="contract_gua_type"></input>
							<input type="hidden" value = "${contractEntrty.amount}" name = "contract_amount" id="contract_amount"></input>
							<input type="hidden" value = "${contractEntrty.start_date}" name = "contract_start_date" id="contract_start_date"></input>
							<input type="hidden" value = "${contractEntrty.end_date}" name = "contract_end_date" id="contract_end_date"></input>
							<h1 class="breadcrumb">	
								<small>
									<span><h5><b>担保合同信息</b></h5></span>
								</small>
							</h1>
							<div class="row">
								
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 担保合同金额  </label>
										<div class="col-sm-4">
											<input type="text" id="guarantee_amount" 
												class="col-xs-10 col-sm-5" name="guarantee_amount" onblur="changeGua_amount()"
												value="${guaranteeEntrty.amount}" readonly="readonly"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 担保份额 </label>
										<div class="col-sm-4">
											<input type="text" id="gua_amount" 
												class="col-xs-10 col-sm-5" name="gua_amount" style="text-align:right"
												value="${guaranteeEntrty.gua_amount}" readonly="readonly"/>
										</div>
										
										<div class="col-md-1"></div>
									</div>
							</div> 
							<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 保证形式 </label>
										<div class="col-sm-4">
											<select name="gua_form_List" id="gua_form_List"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${gua_form_List}" data-select-value="${guaranteeEntrty.gua_form}" disabled="disabled"></select>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 担保方式 </label>
										<div class="col-sm-4">
										<select name="gua_type_List_guarantee" id="gua_type_List_guarantee"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${gua_type_List_guarantee}" data-select-value="${guaranteeEntrty.gua_type}" disabled="disabled"></select>
										</div>
										
										<div class="col-md-1"></div>
									</div>
							</div>
							<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 起始日期 </label>
										<div class="col-sm-4">
										<input type="text" id="start_date_gua" 
												class="date-picker col-xs-10 col-sm-5" name="start_date_gua" data-date-format="yyyy-mm-dd"
												value="${guaranteeEntrty.start_date}" disabled="disabled"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 到期日期 </label>
										<div class="col-sm-4">
											<input type="text" id="end_date_gua" 
												class="date-picker col-xs-10 col-sm-5" name="end_date_gua" data-date-format="yyyy-mm-dd"
												value="${guaranteeEntrty.end_date}" disabled="disabled"/>
										</div> 
									</div>
										<div class="col-md-1"></div>
							</div>		
							<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 争议解决方式</label>
										<div class="col-sm-4">
											<select name="dispute_sol_List" id="dispute_sol_List"  disabled="disabled" class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${dispute_sol_List}" data-select-value="1"></select>
										</div>
										<div class="col-md-0"></div>
										
										<div class="col-md-1"></div>
									</div>
							</div>
							<div class="hr hr32 hr-dotted"></div>
							<div class="space-6"></div>
							<div class="span12">
								<%-- <div class="center">
										<button class="btn btn-sm btn-primary" type="button" onclick="go_back(${contract_id})">返回</button>
								</div> --%>	
							</div>																
				</form>
			</div>
		</div>
		<!-- 抵质押品列表 -->
				<div class="page-content">
					<div class="row-fluid">
						<form class="col-xs-12" id="queryForm" name="queryForm" 
							action="" method="post">
							<input type="hidden" id="contract_id" name="contract_id" value="${contract_id}">						
							<input class="hidden" type="text" name="pageNo_" id="pageNo_" data-min="2" data-max="20"/>
						</form>
							<!--查询结果列表  -->
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
													<th>抵质押品编号</th>
													<th>担保份额</th>
													<th>操作</th>
												</tr>
													</thead>
													<tbody>
														<c:forEach items="${list}" var="list_col" >
												<tr>
													<td>${list_col.collateral_id}</td>											
													<td>${list_col.gua_share}</td>
													<td>
													<!-- 列表按钮区域 -->
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
														<c:if test="${viewFlag==1}">
														<button type="button" class="btn btn-xs btn-primary" onclick="guarantee(3,${guaranteeEntrty.guarantee_id})">取消</button>
														</c:if>
														</div>
													</td>
												</tr>
											</c:forEach>
													</tbody>
												</table>
										<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
											<div class="row">
											<div class="col-sm-6">
											<c:if test="${viewFlag==1}">
												<button type="button" class="btn btn-xs btn-primary" onclick="selectCollateral(${guaranteeEntrty.guarantee_id})">关联抵质押物</button>
											</c:if>
											</div>
											</div>
									    </div>
									</div>
								   </div> 
								<!-- /.row -->
				<!--/// 查询结果列表  -->						
					</div>
				</div>
			</div>
		</div>
		</div>
		 <jsp:include page="../guarantee/collateral_modal.jsp"></jsp:include><!-- 引押品信息 -->
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
		$("#gua_form_List").formComponents("select");
		$("#dispute_sol_List").formComponents("select");
		$("#gua_type_List_guarantee").formComponents("select");
		//Date Picker 控件
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
     })
    //返回查询列表
    function go_back(contract_id){
    	var flag = document.getElementById("flag").value;
    	if(flag==1){
			$.post("<%=path%>/mvc/guarantee_getList.do?contract_id="+contract_id, function(result) {
				$("#guarantee").html(result);
			});
	    		
    	}else{
    		window.location="<%=path%>/mvc/GuaranteeChangegetList.do";
    	}
	}
	</script>
	</body>
</html>
