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
				<div class="col-xs-3">
					<div class="widget-box">
						<div class="widget-header widget-header-flat">
							<h4 class="lighter smaller">机构树</h4>
							<div class="widget-toolbar">
							<a href="#" onclick="addEntity();" class="btn btn-minier btn-grey">
								新增
							</a>
						</div>
						</div>
						<div class="widget-body">
							<div class="widget-main padding-8">
								<div id="tree2" class="tree tree-selectable"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 查询条件begin -->
				<div class="col-xs-9" id="editContent">
				<form class="col-xs-12" id="queryForm" name="queryForm" action="<%=path%>/mvc/organization_getList.do" method="post">
					<input class="hidden" type="text" name="tradeCode" id="tradeCode" data-min="2" data-max="20" value="T50001" />
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-1"></div>
							<label class="col-sm-1 control-label no-padding-right" for="form-field-2">机构编号</label>
							<div class="col-sm-4">
								<input id="orgid" name="orgid" type="text" >
							</div>
							<div class="col-md-0"></div>
							<label class="col-sm-1 control-label no-padding-right" for="form-field-2">机构名称</label>
							<div class="col-sm-4">
								<input id="name" name="name" type="text" >
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10"></div>
							<div class="col-sm-2">
								<button class="btn btn-sm btn-primary" onclick="toQry();" type="button">查询</button>
							</div>
						</div>
					</div>
					<!-- /row 横线-->
					<div class="page-header"></div>
				</form>
				<!-- 查询条件end -->
				<div class="table-responsive">
				<div id="qryContent">
					<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
						<table id="sample-table-2" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>机构编号</th>
									<th>机构名称</th>
									<th>上级机构编号</th>
									<th>机构等级</th>
									<th>操作</th>
								</tr>
							</thead>
		
							<tbody>
								<c:forEach items="${organizationList}" var="organizationEntity">
									<tr>
										<td>${organizationEntity.orgid}</td>
										<td>${organizationEntity.name}</td>
										<td>${organizationEntity.porgid}</td>
										<td>${organizationEntity.orgtype}</td>
										<td>
											<!-- 列表按钮区域 -->
											<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${organizationEntity.id}')">编辑</button>
												<button type="button" class="btn btn-xs btn-primary" onclick="deleteEntity('${organizationEntity.id}')">删除</button>
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
							<jsp:include page="../../common/treepage.jsp"></jsp:include>
						</div>
					</div>
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
		${organizationTree}
		var treeDataSource = new DataSourceTree({data: tree_data});
		$('#tree2').ace_tree({
			dataSource : treeDataSource ,
			multiSelect : false,//true多选树   false单选树
			loadingHTML : '<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
			'open-icon' : 'icon-minus',
			'close-icon' : 'icon-plus',
			'clickrefresh' : true,
			'selectable' : true,
			//'selected-icon' : 'icon-ok',//已选择图标
			//'unselected-icon' : 'icon-remove'//未选择图标
		});
		$('#tree2').on('loaded', function (evt, data) {
		});
		$('#tree2').on('opened', function (evt, data) {
			var id=data.id;
			if(id!=0){viewEntity(id);}
			
		});

		$('#tree2').on('closed', function (evt, data) {
		});
		$('#tree2').on('selected', function (evt, data) {
			//选中
			if(data.info[0]){
				var id=data.info[0].id;
				if(id!=0){viewEntity(id);}
			}
			//取消选中
			else{
				$("#qryContent").html("");
				setHash('${pageContext.request.contextPath}');
			}
			
		});
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
	});
		//根据查询条件查看
		function toQry()
		{
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("organization_getList.do", param, function(result) {			
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function addEntity(){
			param={};
			$.post("organization_add.do", param, function(result) {			
				$("#editContent").html(result).hide();
				$("#editContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		};
		function viewEntity(id){
			param={};
			param["id"]=id;
			param["view"]="view";
			$.post("organization_view.do", param, function(result) {			
				$("#editContent").html(result).hide();
				$("#editContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		};
		function editEntity(id){
			window.location="<%=path%>/mvc/organization_view.do?id="+id+"&pageNo="+$("#pageNo").val();
		};
		function deleteEntity(id){
			 var param={};
			param["id"]=id;
			$.post("role_delete.do",param,function(result){
				if(result.msg=="success"){
					f_alert("<%=path%>","success","role_getList.do?pageNo="+$("#pageNo").val());
				}else{
					f_alert("<%=path%>","删除失败!","");			
				}
			}); 
		};
		//跳转至用户编辑页面
		function roleMenu(id){
			window.location="<%=path%>/mvc/role_editMenu.do?id="+id+"&pageNo="+$("#pageNo").val();
		};
	</script>
	</body>
</html>
