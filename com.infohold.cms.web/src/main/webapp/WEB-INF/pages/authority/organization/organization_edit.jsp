<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
		<script type="text/javascript">
		var pids = {};
		var pid = {};
		<%
		List<Map<String,Object>> pOrgtypeList = (List<Map<String,Object>>)request.getAttribute("pOrgtypeList");
		String pre_id ="1";
		for(int i=0;i<pOrgtypeList.size();i++) {
			Map<String,Object> organizationEntity = (Map<String,Object>)pOrgtypeList.get(i);
			if(pre_id .equals(organizationEntity.get("orgtype")+"")) {
				out.println("pid['"+organizationEntity.get("id")+""+"']='"+organizationEntity.get("name")+""+"';");
			}else {
				if(!"1".equals(pre_id)) {
					out.println("pids['"+pre_id+"'] = pid;");
					out.println("pid = {};");
				}
				out.println("pid['"+organizationEntity.get("id")+""+"']='"+organizationEntity.get("name")+""+"';");	
			}
			
			pre_id = organizationEntity.get("orgtype")+"";
		}

		if("1".equals(pre_id)) {
			out.println("pids['"+pre_id+"'] = pid;");
			out.println("pid = {};");
		}
		%>
		//选机构等级关联的方法
		function changeOrgId() {
			var orgtype=$("#orgtype").val();
			if(orgtype==1){
				document.getElementById("changeOrgId").style.display="none";
			}
			else{
				document.getElementById("changeOrgId").style.display="";
				$("#pid").html("");
				$("#pid").append("<option value=''>请选择</option>");
				if(orgtype != "1" || orgtype != "") {
					var ptype=orgtype-1;
					var pidlist = pids[ptype];
					for(var key in pidlist) {
						$("#pid").append("<option value='"+key+"'>"+pidlist[key]+"</option>");
					}
				}
			}
		}
</script>
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form" action="" method="post">
				<input id="id" type="hidden" class="" name="id" value="${organizationEntity.id}" />
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="orgid"> 机构编号 </label>
						<div class="col-sm-9">
							<input type="text" id="orgid" placeholder="请输入机构编号" class="col-xs-10 col-sm-5" name="orgid" value="${organizationEntity.orgid}"  readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name"> 机构名称 </label>
						<div class="col-sm-9">
							<input type="text" id="name" placeholder="请输入机构名称" class="col-xs-10 col-sm-5" name="name" value="${organizationEntity.name}"/>
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="goback();">
								<i class="icon-reply bigger-110"></i> 返回
							</button>
						</div>
					</div>
				</form>
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
	<!-- PAGE CONTENT ENDS -->
	<script type="text/javascript">
	jQuery(function($) {
		//加载机构列表
		$("#orgtype").formComponents("select");
		//Date Picker 控件
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		changeOrgId();
	});
		//表单提交
		function subForm() {
			if (!checkData('name', '机构名称 ', 'input')) {
				return;
			}
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/organization_editSave.do",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						f_alert("<%=path%>","success","organization_getList.do");
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
			window.location="<%=path%>/mvc/organization_getList.do";
		}
	</script>
	</body>
</html>
