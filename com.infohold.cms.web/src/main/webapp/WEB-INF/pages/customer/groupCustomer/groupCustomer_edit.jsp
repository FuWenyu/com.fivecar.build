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
<link rel="stylesheet"
	href="<%=path%>/css/jquery-ui-1.10.3.full.min.css" />
<script src="<%=path%>/js/ace-extra.min.js"></script>
</head>
<body id="iframe_body"	onload="setHash('${pageContext.request.contextPath}')">
	<div id="modal_area"></div>
	<div id="iframeDiv" style="display: none"></div>
	<div class="page-content" id="loadPageContent">
		<form class="form-horizontal" id="sub_form" name="sub_form" action="#" method="post">
			<input type="hidden" id="id" name="id"	value="${groupCustomerEntity.groupid }" />
			<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
			<h3 class="header smaller lighter grey">集团信息</h3>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="is_mycust">是否本行集团客户</label>
							<div class="col-sm-6 input-group">
								<select id="is_mycust" class="form-control"  name="is_mycust" onchange="Check_Mycust();"
									data-select-value="${groupCustomerEntity.is_mycust}" data-select-list="${yesornoList }" >
								</select>
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
								<input type="text" id="groupname" name="groupname" value="${groupCustomerEntity.groupname}"
									class="form-control" placeholder="集团名称"  onclick="get_Mycust();">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="organizationcode">组织机构代码</label>
							<div class="col-sm-6 input-group">
							<input type="text" id="organizationcode" name="organizationcode" value="${groupCustomerEntity.organizationcode}"
									class="form-control" placeholder="组织机构代码" onclick="get_Mycust();">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="branch_noname">经办机构</label>
							<div class="col-sm-6 input-group">
								<input type="hidden" id="branch_no"  name="branch_no" value="${groupCustomerEntity.branch_no }"/>
								<input type="text" id="branch_noname"  name="branch_noname" value="${groupCustomerEntity.branch_noname }"
									class="form-control" placeholder="经办机构" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_managername">经办客户经理</label>
							<div class="col-sm-6 input-group">
								<input type="hidden" id="cust_manager"  name="cust_manager" value="${groupCustomerEntity.cust_manager }"/>
								<input type="text" id="cust_managername"  name="cust_managername" value="${groupCustomerEntity.cust_managername }"
									class="form-control" placeholder="经办客户经理" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>	
				<!-- /row 横线-->
				<div class="clearfix form-actions">
				  <div class="row">
					<div class="col-md-offset-3 col-md-9">
						<button class="btn btn-info" type="button" onclick="subForm();">
							<i class="icon-ok bigger-110"></i> 提交
						</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn" type="button" onclick="goback()">
							<i class="icon-reply bigger-110"></i> 返回
						</button>
					</div>
				</div>
			  </div>
			</form>
		</div>
		<!-- 引模态 -->
 <jsp:include page="getGroupcust_modal.jsp"></jsp:include><!-- 引客户 -->
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
	function subForm(){
		if (!checkData('groupname', '集团名称', 'input')) {
			return;
		}
		if (!checkData('groupname', '集团名称', 'length_custName')) {
			return;
		}
		if (!checkData('organizationcode', '组织机构代码', 'input')) {
			return;
		}
		if (!checkData('organizationcode', '组织机构代码', 'checkOrgcode')) {
			return;
		}
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/groupCustomer_editSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					f_alert("<%=path%>","success","groupCustomer_getList.do");
				}else{
					f_alert("<%=path%>",data.msg,"");
				}
			},
			error : function(msg) {
				var exp="分配出错 " + msg;
				f_alert("<%=path%>",exp,"");
			}
		});
	}
	function goback(){
		window.location="<%=path%>/mvc/groupCustomer_getList.do?pageNo="+$("#pageNo").val();
	}
	function get_Mycust(){
		var is_mycust=$("#is_mycust").val();
		if(is_mycust=="1"){
			selectCustomer(1);
		}else if(is_mycust=="2"){
		}
	}
	function Check_Mycust(){
		$("#groupname").val("");
		$("#organizationcode").val("");
	}
	</script>
</body>
</html>