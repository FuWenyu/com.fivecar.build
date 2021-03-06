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
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<!-- 查询条件begin -->
				<form class="col-xs-12" id="queryForm" name="qry_form" action="loan.do" method="post">
					<input class="hidden" type="text" name="tradeCode" id="tradeCode" data-min="2" data-max="20" value="T10010" />
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-3"></div>
							<label class="col-sm-1 control-label no-padding-right" for="form-field-2">图片名称</label>
							<div class="col-sm-3">
								<input id="version_no" name="version_no" type="text" >
							</div>
							<div class="col-md-0"></div>
							<label class="col-sm-2 control-label no-padding-right" for="form-field-2">  </label>
							<div class="col-sm-5">
								<div class="col-sm-1">
									<button class="btn btn-sm btn-primary" onclick="toQry();" type="button">查询</button>
								</div>
							</div>
							<div class="col-md-0"></div>
						</div>
					</div>
					<!-- /row 横线-->
					<div class="page-header"></div>
				</form>
				<!-- 查询条件end -->
				<div id="qryContent">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
					<table id="sample-table-2" class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2">
						<thead>
							<tr>
								<th width="15%">车型名称</th>
								<th width="15%">金融机构</th>
								<th width="10%">裸车价</th>
								<th width="10%">首付</th>
								<th width="5%">首付百分比</th>
								<th width="10%">额外费用</th>
								<th width="12%">创建时间</th>
								<th width="13%">创建人</th>
								<th width="10%"></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${loanList}" var="loanList">
								<tr>
									<td>${loanList.modelName}</td>
									<td>${loanList.lender}</td>
									<td>${loanList.carprice}</td>
									<td>${loanList.downpayment}</td>
									<td>${loanList.downPaymentPercent}</td>
									<td>${loanList.premium}</td>
									<td>${loanList.createDate}</td>
									<td>${loanList.createName}</td>
									<td>
										<!-- 列表按钮区域 -->
										<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
											<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${modelid}-${modelName}-${loanList.id}')">编辑</button>
											<button type="button" class="btn btn-xs btn-primary" onclick="deleteEntity('${modelid}-${modelName}-${loanList.id}')">删除</button>
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
							 	<button class="btn btn-sm btn-primary" onclick="addEntity('${modelid}-${modelName}');"
									type="button">新增</button> 
							</div>
						</div>
						<!-- 分页 -->
						<jsp:include page="../common/page.jsp"></jsp:include>
					</div>
				</div>
				</div>
				<!-- PAGE CONTENT ENDS -->
			</div>
		</div>
	</div>
	<div class="modal fade bs-example-modal-lg" id="myRepUpload" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">&nbsp;</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-12" id ="imgid" >
						<table id="sample-table-2" class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2">
							<thead>
								<tr>
									<th>图片预览</th>
								</tr>
							</thead>
							<tbody id="custList">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">	
				<!-- <button type="button" class="btn btn-sm btn-default" onclick="toSaveUser()">添加</button> -->			
				<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭</button>
			</div>
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
		/*********自定于方法**********/
		//根据查询条件查看
		function toQry()
		{
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("loan.do", param, function(result) {			
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		//展示图片
		function viewFile(from_url,file_name){
			window.open("<%=path%>/upload/image/"+file_name);
		}
		//跳转至图片新增页面
		function addEntity(model){
			window.location="<%=path%>/mvc/loan_add.do?model="+model+"";
		};
		//跳转至图片编辑页面
		function editEntity(model){
			window.location="<%=path%>/mvc/loan_edit.do?model="+model+"";
		};
		function addSalesEntity(){
			window.location="<%=path%>/mvc/sales_add.do";
		};
		//删除图片By id
		function deleteEntity(model){
			window.location="<%=path%>/mvc/loan_delete.do?model="+model+"";
		};
	</script>
	</body>
</html>
