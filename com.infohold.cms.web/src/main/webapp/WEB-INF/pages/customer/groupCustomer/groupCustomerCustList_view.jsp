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
	<div id="modal_area"></div>
	<div id="iframeDiv" style="display: none"></div>
	<div class="page-content" id="loadPageContent">
		<form class="form-horizontal" id="sub_form" name="sub_form" action="#" method="post">
		<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
			<h3 class="header smaller lighter grey">集团信息</h3>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="is_mycust">是否本行集团客户</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='YESORNO.${groupCustomerEntity.is_mycust }' /></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
					</div>
				</div>		
			 	<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="groupname">集团名称</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${groupCustomerEntity.groupname }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="organizationcode">组织机构代码</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${groupCustomerEntity.organizationcode }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="create_date">创建日期</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${groupCustomerEntity.create_date }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="update_date">维护日期</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${groupCustomerEntity.update_date }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="branch_noname">经办机构</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${groupCustomerEntity.branch_noname }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_managername">经办客户经理</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${groupCustomerEntity.cust_managername }</label>
							</div>
						</div>
					</div>
				</div>	
			</form>
				<!--查询结果列表  -->
				<div class="row" id = "result">
					<form class="col-xs-12" id="queryForm" name="queryForm" action="<%=path%>/mvc/groupCustomer_getList.do" method="post">
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
											<th>客户名称</th>
											<th>是否本行客户</th>
											<th>文件编号</th>
											<th>文件类型</th>
											<th>集团成员类型</th>
											<th>维护日期</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${groupCustListList}" var="groupCustListList">
											<tr>
												<td>
													<a href="javascript:viewEntity('${groupCustListList.id}')" >${groupCustListList.cust_name}</a>
												</td>
													<td><fmt:message key='YESORNO.${groupCustListList.is_mycust}' /></td>
												<td><fmt:message key='cor_id_type.${groupCustListList.file_type}' /></td>
												<td>${groupCustListList.file_number}</td>
												<td><fmt:message key='group_custtype.${groupCustListList.group_custtype}' /></td>
												<td>${groupCustListList.update_date}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
									<div class="row">
										<div class="col-sm-4">
											<div class="btn-group">
												<!-- 列表底部按钮区域 -->
												<button class="btn btn-sm btn-primary" onclick="goback()" type="button">返回</button>
											</div>
										</div>
								    </div>
							    </div>
							</div>
						</div>
						<!--/// 查询结果列表  -->
					</div>
				</div>
				 <jsp:include page="groupCustomerMember_view.jsp"></jsp:include>
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
	//维护集团成员信息模态块
	function viewEntity(id){
		showModal($("#groupCustomerMember_view"));
		param={};
		param["id"]=id;
			$.ajax( {
				type : "POST",
				url : "<%=path%>/mvc/groupCustomerMember_get.do",
				data : param,
				async : false,
				success : function(obj) {
					$(window.document).find("#groupCustomerMember_view input[name='groupid1']").val(obj.groupMemberEntity.groupid);
					$(window.document).find("#groupCustomerMember_view input[name='cust_id1']").val(obj.groupMemberEntity.cust_id);
					$(window.document).find("#groupCustomerMember_view input[name='cust_name1']").val(obj.groupMemberEntity.cust_name);
					$(window.document).find("#groupCustomerMember_view input[name='cust_managername1']").val(obj.groupMemberEntity.cust_managername);
					$(window.document).find("#groupCustomerMember_view input[name='branch_noname1']").val(obj.groupMemberEntity.branch_noname);
					$(window.document).find("#groupCustomerMember_view input[name='is_mycust1']").val(obj.groupMemberEntity.is_mycust1);
					$(window.document).find("#groupCustomerMember_view input[name='is_mycust2']").val(obj.groupMemberEntity.is_mycust);
					$(window.document).find("#groupCustomerMember_view input[name='file_type1']").val(obj.groupMemberEntity.file_type1);
					$(window.document).find("#groupCustomerMember_view input[name='file_number1']").val(obj.groupMemberEntity.file_number);
					$(window.document).find("#groupCustomerMember_view input[name='group_custtype1']").val(obj.groupMemberEntity.group_custtype1);
					$(window.document).find("#groupCustomerMember_view input[name='group_relationship1']").val(obj.groupMemberEntity.group_relationship1);
					$(window.document).find("#groupCustomerMember_view input[name='organizationcode1']").val(obj.groupMemberEntity.organizationcode);
				},
				error : function(msg) {
					f_alert("<%=path%>",msg,"");
					
				}
			});
		}
	</script>
</body>
</html>