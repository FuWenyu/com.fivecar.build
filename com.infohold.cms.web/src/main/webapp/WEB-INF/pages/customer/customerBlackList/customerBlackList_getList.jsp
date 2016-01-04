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
				<!-- 查询条件begin -->
				<form class="col-xs-12" id="queryForm" name="qry_form" action="<%=path%>/mvc/customerBlackList_getList.do" method="post">
					<input class="hidden" type="text" name="tradeCode" id="tradeCode" data-min="2" data-max="20" value="T23001" />
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-1"></div>
							<label class="col-sm-1 control-label no-padding-right" for="form-field-2">客户编号</label>
							<div class="col-sm-4">
								<input id="custid" name="custid" type="text" >
							</div>
							<div class="col-md-1"></div>
							<label class="col-sm-1 control-label no-padding-right" for="form-field-2">客户名称</label>
							<div class="col-sm-4">
								<input id="custname" name="custname" type="text" >
							</div>
							<div class="col-md-0"></div>
						</div>
					</div>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-1"></div>
							<label class="col-sm-1 control-label no-padding-right" for="form-field-2"></label>
							<div class="col-sm-4"></div>
							<div class="col-md-0"></div>
							<label class="col-sm-2 control-label no-padding-right" for="form-field-2">  </label>
							<div class="col-sm-4">
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
						<table id="sample-table-2"
							class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2">
							<thead>
								<tr>
									<th>客户编号</th>
									<th>客户名称</th>
									<th>申请类别</th>
									<th>申请状态</th>
									<th>申请时间</th>
									<th>申请人</th>
									<th>申请机构</th>
									<th>操作</th>
								</tr>
							</thead>
		
							<tbody>
								<c:forEach items="${customerBlackListList}" var="customerBlackListEntity">
									<tr>
										<td>${customerBlackListEntity.custid}</td>
										<td>${customerBlackListEntity.custname}</td>
										<td>${customerBlackListEntity.sqlb}</td>
										<td>${customerBlackListEntity.sqzt}</td>
										<td>${customerBlackListEntity.sqsj}</td>
										<td>${sqrmc}</td>
										<td>${sqjgmc}</td>
										<td>
											<!-- 列表按钮区域 -->
											<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${customerBlackListEntity.xh}','${customerBlackListEntity.sqzt}')">编辑</button>
												<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${customerBlackListEntity.xh}')">查看</button>
												<button type="button" class="btn btn-xs btn-primary" onclick="cancleEntity('${customerBlackListEntity.xh}','${customerBlackListEntity.sqzt}')">取消</button>
												<button type="button" class="btn btn-xs btn-primary" onclick="startWorkEntity('${customerBlackListEntity.xh}','${customerBlackListEntity.sqzt}')">提交审批</button>
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
									<button class="btn btn-sm btn-primary" onclick="addEntity();" type="button">新增</button>
								</div>
							</div>
							<!-- 分页 -->
							<jsp:include page="../../common/page.jsp"></jsp:include>
						</div>
					</div>
				</div>
				<!-- PAGE CONTENT ENDS -->
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
		//根据查询条件查看
		function toQry()
		{
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("customerBlackList_getList.do", param, function(result) {			
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function addEntity(){
			window.location="<%=path%>/mvc/customerBlackList_add.do";
		};
		function viewEntity(xh){
			window.location="<%=path%>/mvc/customerBlackList_edit.do?xh="+xh+"&viewOrEdit=view&pageNo="+$("#pageNo").val();
		}
		function editEntity(xh,sqzt){
			
			if(sqzt=="待审批"||sqzt=="修改资料"||sqzt=="补充资料"){
				window.location="<%=path%>/mvc/customerBlackList_edit.do?xh="+xh+"&viewOrEdit=edit&pageNo="+$("#pageNo").val();	
			}else{
				var exp="当前状态不可修改 ";
				f_alert("<%=path%>",exp,"");
			}
		};
		function cancleEntity(xh,sqzt) {
			if(sqzt=="待审批"){
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/customerBlackList_updateStatue.do?xh="+xh+"&doOperate=cancle",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						f_alert("<%=path%>","success","customerBlackList_getList.do?pageNo="+$("#pageNo").val());
					}else{
						f_alert("<%=path%>",data.msg,"");
					}
				},
				error : function(msg) {
					var exp="分配出错 " + msg;
					f_alert("<%=path%>",exp,"");
				}
			});
			}else{
				var exp="当前状态不可取消 ";
				f_alert("<%=path%>",exp,"");
			}
		}

		function startWorkEntity(xh,sqzt) {
			if(sqzt=="待审批"){
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/customerBlackList_updateStatue.do?xh="+xh+"&doOperate=startWork",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						f_alert("<%=path%>","success","customerBlackList_getList.do?pageNo="+$("#pageNo").val());
					}else{
						f_alert("<%=path%>",data.msg,"");
					}
				},
				error : function(msg) {
					var exp="分配出错 " + msg;
					f_alert("<%=path%>",exp,"");
				}
			});}else{
				var exp="非待审批状态，不能提起审批";
				f_alert("<%=path%>",exp,"");
			}
			
		}
	</script>
	</body>
</html>
