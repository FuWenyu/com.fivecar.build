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
					<div class="row-fluid">
						<form class="col-xs-12" id="queryForm" name="queryForm" action="" method="post">
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 合同编号 </label>
									<div class="col-sm-4">
										<input type="text" id="con_acct_s" placeholder=""
											class="col-xs-10 col-sm-5" name="con_acct_s"/>
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 客户名称</label>
									<div class="col-sm-4">									
										<input type="text" id="custchname" placeholder=""
											class="col-xs-10 col-sm-5" name="custchname" onclick="selectCustomer(1)"/>
											<input class="hidden" type="text" name="cust_id" id="cust_id" value="" /> 
											<input class="hidden" type="text" name="khlx1" id="khlx1" value="" /> 
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="space-1"></div>
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 担保合同号 </label>
									<div class="col-sm-4">									
										<input type="text" id="guarantee_id_s" placeholder=""
											class="col-xs-10 col-sm-5" name="guarantee_id_s" />
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 申请状态 </label>
									<div class="col-sm-4">									
										<select name="status_s" id="status_s"  class="col-xs-10 col-sm-5" data-emptyoption="true" data-select-list="${BIZ_STATUS_List}" data-select-value=""></select>
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="space-3"></div>
							<div class="row">
								<div class="form-group">
									<label class="col-sm-10 control-label no-padding-right"
										for="form-field-2"> </label>
									<div class="col-sm-1">
										<button class="btn btn-sm btn-primary" onclick="toQry1();" type="button">查询</button>
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<!-- /row 横线-->
							<div class="page-header"></div>
						</form>
							<!--查询结果列表  -->
								<div id="qryContent">
									<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
												<table id="sample-table-2"
													class="table table-striped table-bordered table-hover dataTable"
													aria-describedby="sample-table-2">
													
													<thead>
												
												<tr>
												    <th>申请序号</th>
													<th>合同编号</th>
													<th>担保合同编号</th>
													<th>客户名称</th>
													<th>合同金额</th>
													<th>合同起始日期</th>
													<th>合同到期日期</th>
													<th>申请状态</th>	
													<th>操作</th>

												</tr>
											</thead>
													<tbody>
														<c:forEach items="${Guarantee_ChangeList}" var="Guarantee_ChangeList" >
												<tr>
													<td>${Guarantee_ChangeList.change_id}</td>
													<td>${Guarantee_ChangeList.con_acct}</td>
													<td>${Guarantee_ChangeList.guarantee_id}</td>
													<td>${Guarantee_ChangeList.custchname}</td>
													<td>${Guarantee_ChangeList.amount}</td>
													<td>${Guarantee_ChangeList.start_date}</td>
													<td>${Guarantee_ChangeList.end_date}</td>
													<td><span class="label label-sm label-warning">${Guarantee_ChangeList.status_name}</span></td>
													<td>
														<!-- 列表按钮区域 -->
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
														<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${Guarantee_ChangeList.contract_id}','${Guarantee_ChangeList.guarantee_id}')">查看</button>
														<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${Guarantee_ChangeList.contract_id}','${Guarantee_ChangeList.guarantee_id}','${Guarantee_ChangeList.status}')">编辑</button>
														<button type="button" class="btn btn-xs btn-primary" onclick="cancleEntity('${Guarantee_ChangeList.change_id}','${Guarantee_ChangeList.status}')">取消</button>
														<button type="button" class="btn btn-xs btn-primary" onclick="approveEntity('${Guarantee_ChangeList.change_id}','${Guarantee_ChangeList.status}')">提起审批</button>
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
														<c:if test="${flag !=1}">
															<button class="btn btn-sm btn-primary" onclick="addEntity();" type="button">新增</button>
														</c:if>
													</div>
												</div>
												<!-- 分页 -->
												<jsp:include page="../../common/page.jsp"></jsp:include>
											</div>
					</div>
					<!-- /.row -->
					<!--/// 查询结果列表  -->
				</div>
			</div>
		</div>
	 <jsp:include page="../../common/customer_modal.jsp"></jsp:include><!-- 引客户 -->
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
			//Date Picker 控件
			$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			$("#REPAYMENT_TYPE_List").formComponents("select");
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
			
			$("#status_s").formComponents("select");
		});
		//根据查询条件查看
		function toQry1()
		{
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("GuaranteeChangegetList.do", param, function(result) {
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function addEntity(){
			window.location="<%=path%>/mvc/GuaranteeChange_add.do";
		};
		function viewEntity(contract_id,guarantee_id){
			window.location="<%=path%>/mvc/guarantee_view.do?flag=2&guarantee_id="+guarantee_id+"&contract_id="+contract_id;
		};
		
 		function editEntity(contract_id,guarantee_id,status){
      		window.location="<%=path%>/mvc/guarantee_edit.do?flag=2&guarantee_id="+guarantee_id+"&contract_id="+contract_id;
			//if(status==1){
			//}else{
			//	alert("该状态不可修改");				
			//}
		};
		
		function cancleEntity(id,status){
			
			$.ajax( {
				type : "POST",
				url : "<%=path%>/mvc/GuaranteeChange_cancle.do?change_id="+id,
				async : false,
				success : function(data) {
					if(data.msg == "success"){
						f_alert("<%=path%>","success","GuaranteeChangegetList.do");
						
					}else{
						f_alert("<%=path%>",data.msg,"");
					}
				},
				error : function(msg) {
					var exp="分配出错 " + msg;
					f_alert("<%=path%>",exp,"");
				}
			});
	
	    };
		//根据查询条件查看
		function toQry()
		{
		var param = $("#queryForm").serialize();
		param += "&qry_type=qry";
		$.post("afterLoanRepayment_getList.do", param, function(result) {
			$("#qryContent").html(result).hide();
			$("#qryContent").fadeIn('fast');
			setHash('${pageContext.request.contextPath}');
		});
		}
		//提起审批
		function approveEntity(id,status){
			
			$.ajax( {
				type : "POST",
				url : "<%=path%>/mvc/GuaranteeChange_approve.do?change_id="+id,
				async : false,
				success : function(data) {
					if(data.msg == "success"){
						f_alert("<%=path%>","success","GuaranteeChangegetList.do");
						
					}else{
						f_alert("<%=path%>",data.msg,"");
					}
				},
				error : function(msg) {
					var exp="分配出错 " + msg;
					f_alert("<%=path%>",exp,"");
				}
			});
	
	    };
		
	</script>
	</body>
</html>
