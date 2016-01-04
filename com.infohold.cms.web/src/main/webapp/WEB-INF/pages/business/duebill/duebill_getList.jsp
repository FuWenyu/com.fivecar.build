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
		
		<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<!-- 查询条件begin -->
						<form class="col-xs-12" id="queryForm" name="queryForm" action="" method="post">
						<input type="hidden" id="flag" name="flag" value="${flag}"><!--1:从查询菜单过来的请求，非1：是业务菜单发的请求 -->
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 借据编号 </label>
									<div class="col-sm-4">
										<input type="text" id=duebill_acct_s placeholder=""
											class="col-xs-10 col-sm-5" name="duebill_acct_s"
											value="" />
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 借据状态</label>
									<div class="col-sm-4">
									<select name="DUEBILL_STATUS_S" id="DUEBILL_STATUS_S"  class="col-xs-10 col-sm-5" data-emptyoption="true" data-select-list="${DUEBILL_STATUS_List}" data-select-value=""></select>
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
										for="form-field-2"> 起始日期 </label>
									<div class="col-sm-4">
										<input type="text" id="start_date_s" 
												class="date-picker col-xs-10 col-sm-5" name="start_date_s" data-date-format="yyyy-mm-dd"
												value="${start_date_s}" />
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 到期日期 </label>
									<div class="col-sm-4">
										<input type="text" id="end_date_s" 
												class="date-picker col-xs-10 col-sm-5" name="end_date_s" data-date-format="yyyy-mm-dd"
												value="${end_date_s}" />
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
										for="form-field-2"> 客户编号 </label>
									<div class="col-sm-4">
										<input type="text" id="cust_id_s" 
												class="col-xs-10 col-sm-5" name="cust_id_s" 
												value="${cust_id_s}" />
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 合同编号 </label>
									<div class="col-sm-4">
										<input type="text" id="con_acct_s" 
												class="col-xs-10 col-sm-5" name="con_acct_s" 
												value="${con_acct_s}" />
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
										<button class="btn btn-sm btn-primary" onclick="toQry();" type="button">查询</button>
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<!-- /row 横线-->
							<div class="page-header"></div>
						</form>
						<!-- 查询条件end -->
						<!--查询结果列表  -->
								<div id="qryContent">
											<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
												<table id="sample-table-2"
											class="table table-striped table-bordered table-hover dataTable"
											aria-describedby="sample-table-2">
											<thead>
												
												<tr>
													<th>系统借据编号</th>
													<th>客户名称</th>
													<th>产品名称</th>
													<th>合同编号</th>
													<th>借据编号</th>
													<th>借据金额</th>
													<th>起始日期</th>
													<th>到期日期</th>
													<th>借据状态</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${BizDueBillList}" var="BizDueBillList">
													<tr>
														<td>${BizDueBillList.duebill_id}</td>
														<td>${BizDueBillList.custchname}</td>
														<td>${BizDueBillList.product_name}</td>
														<td>${BizDueBillList.con_acct}</td>
														<td>${BizDueBillList.duebill_acct}</td>
														<td>${BizDueBillList.duebill_amount}</td>
														<td>${BizDueBillList.start_date}</td>
														<td>${BizDueBillList.end_date}</td>
														<td><span class="label label-sm label-warning">
														    ${BizDueBillList.status1}</span></td>
														<td>
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
															<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${BizDueBillList.duebill_id}','${BizDueBillList.status}')">查看</button>
															<c:if test="${flag !=1}">
															<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${BizDueBillList.duebill_id}','${BizDueBillList.status}')">编辑</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="cancleEntity('${BizDueBillList.duebill_id}','${BizDueBillList.status}')">取消</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="approveEntity('${BizDueBillList.duebill_id}','${BizDueBillList.status}')">推送运营中心</button>
															</c:if>
															
															<c:if test="${flag == 1}"><!-- 查询列表的请求 -->
															<button type="button" class="btn btn-xs btn-primary" onclick="schedule('${BizDueBillList.duebill_id}')">还款计划查询</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="arearDetails('${BizDueBillList.duebill_id}')">欠款信息查询</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="approveEntity('${BizDueBillList.duebill_id}','${BizDueBillList.status}')">还款记录查询</button>
															</c:if>
														</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										    <div class="row">
												<div class="col-sm-4">
													<div class="btn-group">
													<c:if test="${flag !=1}">
														<!-- 列表底部按钮区域 -->
															<button class="btn btn-sm btn-primary" onclick="addEntity();" type="button">新增</button>
													</c:if>
													</div>
												</div>
												<!-- 分页 -->
												<jsp:include page="../../common/page.jsp"></jsp:include>
											</div>
									</div>				
					</div>
					<!--列表结束-->
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
			//加载下拉列表
			$("#DUEBILL_STATUS_S").formComponents("select");
			/* $('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
			}); */
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		//根据查询条件查看
		function toQry()
		{
			var start_date_s = document.getElementById("start_date_s").value;
			var end_date_s   = document.getElementById("end_date_s").value;
			var d1 = new Date(start_date_s.replace(/\-/g,"\/"));
			var d2 = new Date(end_date_s.replace(/\-/g,"\/"))
			if(start_date_s != ""&&end_date_s !=""&&d1>d2){
				alert("起始日期不能大于到期日期");
				return false;
			}
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("DueBill_getList.do", param, function(result) {
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function addEntity(){
			window.location="<%=path%>/mvc/DueBill_add.do";
		};
		function editEntity(id,status){
			if(status==1){
      			window.location="<%=path%>/mvc/duebill_edit.do?duebill_id="+id;
			}else{
				alert("该状态不可修改");				
			}
		};
		function viewEntity(id){
			window.location="<%=path%>/mvc/duebill_view.do?duebill_id="+id;
		};
		
		function openAccountEntity(duebill_id,status){
			 	var param={};
				param["duebill_id"]=duebill_id;
				if(status==3){
					
					$.post("duebill_openAccount.do",param,function(result){
						if(result.msg=="success"){
							f_alert("<%=path%>","success","duebill_getList.do?pageNo="+$("#pageNo").val());
						}else{
							f_alert("<%=path%>","开户失败!","");			
						}
					}); 
				}else{
					alert("该状态不可开立贷款账户");
				}
		};
		//推送运营中心审批
		function approveEntity(duebill_id,status){
			 var param={};
				param["duebill_id"]=duebill_id;
				if(status==1){
					
					$.post("DueBill_approve.do",param,function(result){
						if(result.msg=="success"){
							f_alert("<%=path%>","success","DueBill_getList.do?pageNo="+$("#pageNo").val());
						}else{
							f_alert("<%=path%>","推送运营中心失败!","");			
						}
					}); 
				}else{
					alert("该状态不可以推送运营中心审批");
				}
		};
		function cancleEntity(duebill_id,status){
			 var param={};
			param["duebill_id"]=duebill_id;
			if(status==1){
				
				$.post("duebill_cancle.do",param,function(result){
					if(result.msg=="success"){
						f_alert("<%=path%>","success","DueBill_getList.do?pageNo="+$("#pageNo").val());
					}else{
						f_alert("<%=path%>","取消失败!","");			
					}
				}); 
			}else{
				alert("该状态不可以取消");
			}
		};
		//还款计划查询
		function schedule(duebill_id){
			window.location="<%=path%>/mvc/duebill_schedule.do?duebill_id="+duebill_id;
		}
		//欠款信息查询
		function arearDetails(duebill_id){
			window.location="<%=path%>/mvc/duebill_arearDetails.do?duebill_id="+duebill_id;
		}
		
	</script>
	</body>
</html>
