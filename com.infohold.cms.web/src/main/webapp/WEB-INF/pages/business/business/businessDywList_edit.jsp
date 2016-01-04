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
		<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
		<input type="hidden" id="businessid" name="businessid"	value="${bizBusinessEntity.businessid }" />
		<input type="hidden" id="bzxs" name="bzxs"	value="${bizBusinessEntity.bzxs }" />
		<input type="hidden" id="bzrsl" name="bzrsl"	value="${bizBusinessEntity.bzrsl }" />
		<input type="hidden" id="sqzt" name="sqzt"	value="${bizBusinessEntity.sqzt }" />
		<input type="hidden" id="custid" name="custid"	value="${bizBusinessEntity.custid }" />
			<h3 class="header smaller lighter grey">贷款申请信息</h3>		
			 	<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custname">客户名称</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${bizBusinessEntity.custname }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="zydbfs">主要担保方式</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${bizBusinessEntity.zydbfs }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="prodname">贷款种类</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${bizBusinessEntity.prodname }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="amount">申请金额</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${bizBusinessEntity.amount }</label>
							</div>
						</div>
					</div>
				</div>	
			</form>
				<!--查询结果列表  -->
				<div class="row" id = "result">
					<form class="col-xs-12" id="queryForm" name="queryForm" action="<%=path%>/mvc/business_view.do" method="post">
						<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
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
											<th>序号</th>
											<th>抵押物种类</th>
											<th>抵押物数量</th>
											<th>评估金额</th>
											<th>担保金额</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${fsxxList}" var="fsxxList">
											<tr>
												
												<td>${fsxxList.xh}</td>
												<td><fmt:message key='FL_DYW.${fsxxList.dywzl}' /></td>
												<td>${fsxxList.dywsl}</td>
												<td>${fsxxList.dywpgje}</td>
												<td>${fsxxList.dywdbje}</td>
												<td><div class="btn-group">
													<button class="btn btn-sm btn-primary" onclick="editEntity('${fsxxList.xh}','${bizBusinessEntity.businessid}','${bizBusinessEntity.sqzt}','${bizBusinessEntity.custid}');" type="button">维护</button>
													<button class="btn btn-sm btn-primary" onclick="deleteEntity('${fsxxList.xh}','${fsxxList.businessid}','${bizBusinessEntity.sqzt}');" type="button">删除</button>
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
												<button class="btn btn-sm btn-primary" onclick="addEntity('${bizBusinessEntity.businessid }','${bizBusinessEntity.bzxs }','${bizBusinessEntity.bzrsl }','${bizBusinessEntity.sqzt}','${bizBusinessEntity.custid}');" type="button">新增</button>
											</div>
										</div>
								    </div>
							    </div>
							</div>
						</div>
						<!--/// 查询结果列表  -->
					</div>
				</div>
				 <jsp:include page="business_tab_view.jsp"></jsp:include>
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
	jQuery(function($){
		$("#is_mycust").formComponents("select");
	});
	function goback(){
		window.location="<%=path%>/mvc/groupCustomer_getList.do?pageNo="+$("#pageNo").val();
	}
	function addEntity(businessid,bzxs,bzrsl,sqzt,custid){
		if(sqzt==8||sqzt==11){
			window.location="<%=path%>/mvc/businessFsxx_add.do?bzxs="+bzxs+"&zydbfs=3&businessid="+businessid+"&custid="+custid;
		}else{
			f_alert("<%=path%>","当前状态不可维护!","");	
			return;
		}
		
	}
	function editEntity(xh,businessid,sqzt,custid){
		if(sqzt==8||sqzt==11){
			window.location="<%=path%>/mvc/businessFsxx_edit.do?businessid="+businessid+"&zydbfs=3&xh="+xh+"&custid="+custid;
		}else{
			f_alert("<%=path%>","当前状态不可维护!","");	
			return;
		}
		
	}
	function deleteEntity(xh,businessid,sqzt){
		if(sqzt==8||sqzt==11){
			 var param={};
				param["xh"]=xh;
				$.post("businessFsxx_delete.do?zydbfs=3",param,function(result){
					if(result.msg=="success"){
						f_alert("<%=path%>","success","business_view.do?zydbfs=3&viewOrEdit=edit&businessid="+businessid);
					}else{
						f_alert("<%=path%>","删除失败!","");			
					}
				});
		}else{
			f_alert("<%=path%>","当前状态不可删除!","");	
			return;
		}
		 
	};
	
	</script>
</body>
</html>