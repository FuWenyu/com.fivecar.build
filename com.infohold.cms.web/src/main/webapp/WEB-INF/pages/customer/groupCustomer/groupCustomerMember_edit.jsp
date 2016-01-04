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
		<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
		<input type="hidden" id="id" name="id"	value="${groupCustListEntity.id }" />
			<h3 class="header smaller lighter grey">集团成员信息</h3>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="groupid">集团编号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="groupid" name="groupid" value="${groupCustListEntity.groupid}"
									class="form-control" placeholder="集团编号"  readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="group_relationship">集团关联关系类型</label>
							<div class="col-sm-6 input-group">
								<select id="group_relationship" class="form-control"  name="group_relationship" 
									data-select-value="${groupCustListEntity.group_relationship}" data-select-list="${group_relationshipList }" >
								</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="group_custtype">集团成员类型</label>
							<div class="col-sm-6 input-group">
								<select id="group_custtype" class="form-control"  name="group_custtype" 
									data-select-value="${groupCustListEntity.group_custtype}" data-select-list="${group_custtypeList }" >
								</select>
							</div>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="is_mycust">是否本行集团客户</label>
							<div class="col-sm-6 input-group">
								<select id="is_mycust" class="form-control"  name="is_mycust" onchange="ismycust()"
									data-select-value="${groupCustListEntity.is_mycust}" data-select-list="${yesornoList }" disabled="disabled">
								</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_id">客户编号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="cust_id" name="cust_id" value="${groupCustListEntity.cust_id}"
									class="form-control" placeholder="客户编号" onclick="selectCustomer(1,${groupCustListEntity.groupid})">
							</div>
						</div>
					</div>
				</div>	
			 	<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_name">客户名称</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="cust_name" name="cust_name" value="${groupCustListEntity.cust_name}"
									class="form-control" placeholder="客户名称" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="organizationcode">组织机构代码</label>
							<div class="col-sm-6 input-group">
							<input type="text" id="organizationcode" name="organizationcode" value="${groupCustListEntity.organizationcode}"
									class="form-control" placeholder="组织机构代码" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="file_type">文件类型</label>
							<div class="col-sm-6 input-group">
								<select id="file_type" class="form-control"  name="file_type" data-emptyoption="true" disabled="disabled"
									data-select-value="${groupCustListEntity.file_type}" data-select-list="${cor_id_typeList }" >
								</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="file_number">文件编号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="file_number" name="file_number" value="${groupCustListEntity.file_number}"
									class="form-control" placeholder="文件编号" readonly="readonly">
							</div>
						</div>
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="branch_noname">经办机构</label>
							<div class="col-sm-6 input-group">
								<input type="hidden" id="branch_no"  name="branch_no" value="${groupCustListEntity.branch_no }"/>
								<input type="text" id="branch_noname"  name="branch_noname" value="${groupCustListEntity.branch_noname }"
									class="form-control" placeholder="经办机构" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_managername">经办客户经理</label>
							<div class="col-sm-6 input-group">
								<input type="hidden" id="cust_manager"  name="cust_manager" value="${groupCustListEntity.cust_manager }"/>
								<input type="text" id="cust_managername"  name="cust_managername" value="${groupCustListEntity.cust_managername }"
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
						<button class="btn" type="button" onclick="javascript:history.go(-1);">
							<i class="icon-reply bigger-110"></i> 返回
						</button>
					</div>
				</div>
			  </div>
			</form>
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
		$("#file_type").formComponents("select");
		$("#group_custtype").formComponents("select");
		$("#group_relationship").formComponents("select");
		ismycust();
	});
	function subForm(){
		if (!checkData('groupid', '集团编号', 'input')) {
			return;
		}
		if (!checkData('cust_name', '客户名称', 'input')) {
			return;
		}
		if (!checkData('organizationcode', '组织机构代码', 'input')) {
			return;
		}
		if (!checkData('organizationcode', '组织机构代码', 'checkOrgcode')) {
			return;
		}
		if (!checkData('file_number', '文件编号', 'input')) {
			return;
		}
		$("select").prop("disabled",false);
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/groupCustomerMember_editSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					f_alert("<%=path%>","success","groupCustList_get.do?id="+$("#groupid").val()+"&viewOrEdit=edit");
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
	function ismycust(){
		if($("#is_mycust").val()=="1"){
			document.getElementById("cust_id").readOnly=false;
		}else{
			$("#cust_id").val("");
			document.getElementById("cust_id").readOnly=true;
		}
	}
	</script>
</body>
</html>