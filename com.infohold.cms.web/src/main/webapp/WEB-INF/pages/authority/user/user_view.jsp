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
				<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/user_editSave.do"
					method="post">
					<input type="hidden" id="userid" name="userid" value="${userEntity.userid}">
					<c:forEach items="${user_roleList }" var="user_roleList">
							<input type="hidden" name="check_roleid" value="${user_roleList.roleid }"/>
					</c:forEach>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="loginid">
							登录ID </label>
		
						<div class="col-sm-9">
							<input type="text" id="loginid" name="loginid" placeholder="请输入登录ID"
								class="col-xs-10 col-sm-5"
								value="${userEntity.loginid}" readonly/>
						</div>
					</div>
		
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							用户名称 </label>
		
						<div class="col-sm-9">
							<input type="text" id="name" placeholder="请输入用户名称"
								class="col-xs-10 col-sm-5" name="name" value="${userEntity.name}" readonly/>
						</div>
					</div>
		
					<%-- <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"
							for="password"> 用户密码 </label>
		
						<div class="col-sm-9">
							<input type="password" id="password" placeholder="请输入密码"
								class="col-xs-10 col-sm-5" name="password"
								value="${userEntity.password}" />
						</div>
					</div> --%>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="orgId">
							所属机构 </label>
		
						<div class="col-sm-9">
							<select name="organizationid" id="organizationId" class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-value="${userEntity.organizationid}" data-select-list="${guaranteeList }" disabled>
							</select>
						</div>
					</div>
					<%-- <div class="form-group" id="oms_form-group">
						<label class="col-sm-3 control-label no-padding-right" for="orgId">
							运营中心角色 </label>
						<div class="col-sm-9">
							<div class="checkbox" id="oms_roleid" name="oms_roleid" data-check-list="${omsRoleList }" >
							</div>
						</div>
					</div> --%>
					<div class="form-group" id="cms_form-group">
						<label class="col-sm-3 control-label no-padding-right" for="orgId">
							担保公司角色 </label>
						<div class="col-sm-9">
							<div class="checkbox" id="cms_roleid" name="cms_roleid" data-check-list="${cmsRoleList }" >
							</div>
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<!-- <button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button> -->
		
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="javascript:window.location = '<%=path%>/mvc/user_getList.do';">
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
		/*********页面加载区域**********/
		jQuery(function($) {
			//加载机构列表
			$("#organizationId").formComponents("select");
			$("#cms_roleid").formComponents("check");
			$("#oms_roleid").formComponents("check");
			//初始化机构
			//selectOrgInfo('${userEntity.organizationid}');
			//担保公司默认为3号角色，并且不可修改
			//$("#cms_form-group").find("input[value=2]").attr("checked","checked").attr("disabled","disabled");
			//注册  选择机构时间，按机构号显示运营中心角色/担保公司角色
			/* $("#organizationId").change(function(){
				selectOrgInfo($("#organizationId").val());
			}); */
			//角色复选
			var arr=new Array();
			$("input[name='check_roleid']").each(function(){
				arr.push($(this).val());
			});
			$("input[name='cms_roleid']").each(function(index){
				var roleId = $(this).val();
				if(arr.indexOf(roleId) >= 0){
					$(this).attr("checked","checked");
				}
			}); 
		});
		//初始化机构
		/* function selectOrgInfo(orgId){
			if(orgId == "000000"){
				$("#oms_form-group").show();
				$("#cms_form-group").hide();
			}else{
				$("#oms_form-group").hide();
				$("#cms_form-group").show();
			}
		} */
		/*********自定于方法**********/
		//表单提交
		function subForm() {
			if (!checkData('loginid', '登录编号', 'input')) {
				return;
			}
			if (!checkData('name', '用户名称', 'input')) {
				return;
			}
			/* if (!checkData('password', '用户密码 ', 'input')) {
				return;
			} */
			if (!checkOption('organizationId', '所属机构')) {
				return;
			} 
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/user_editSave.do",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						alert("保存成功！");
						window.location = "<%=path%>/mvc/user_getList.do?type=cms";
					}else{
						alert("保存失败！");
					}
				},
				error : function(msg) {
					alert("分配出错  " + msg);
				}
			});
		}
	</script>
	</body>
</html>
