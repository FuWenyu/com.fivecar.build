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
				<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/version_editSave.do"
					method="post">
					<h3 class="header smaller lighter grey">图片信息修改</h3>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id"> </label>
					</div>
					<%-- <input id="VERSION_FOR" type="hidden" class="" name="VERSION_FOR"   value="${picture.version_flag}" />	
					<input id="version_ol" type="hidden" class="" name="version_ol"   value="${picture.version_online}" />	 --%>
					<input id="version_id" type="hidden" class="" name="picture_id" id="picture_id"   value="${picture.id}" />
					<input id="version_id" type="hidden" class="" name="usefor" id="usefor"   value="${picture.usefo}" />
					<input id="version_id" type="hidden" class="" name="add_date" id="add_date"   value="${picture.add_date}" />	
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							图片名称 </label>
						
						<div class="col-sm-9">
							<input type="text" id="imageName" name="imageName" placeholder="请输入图片名称"
								class="col-xs-10 col-sm-5"
								value="${picture.imageName}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							标题</label>
						
						<div class="col-sm-9">
							<input type="text" id="title" name="title" placeholder="请输入标题"
								class="col-xs-10 col-sm-5"
								value="${picture.title}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							用途</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="usefo" name="usefo">
                                <option value="">-请选择-</option> 
								<option value="11">行业资讯</option>
								<option value="21">优惠信息</option>
								<option value="31">汽车生活</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							图片链接地址 </label>
		
						<div class="col-sm-9">
							<input type="text" id="anchor" placeholder="请输入图片链接地址"
								class="col-xs-10 col-sm-5" name="anchor" value="" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							图片链接地址 </label>
		
						<div class="col-sm-9">
							<input type="text" id="picture_url" placeholder="请输入图片链接地址"
								class="col-xs-10 col-sm-5" name="picture_url" value="${picture.to_url}" />
						</div>
					</div>
							<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							图片描述 </label>
		
						<div class="col-sm-9">
							<%-- <input type="text" id="picture_desc" placeholder="请输入图片描述"
								class="col-xs-10 col-sm-5" name="picture_desc" value="${picture.picture_desc}" /> --%>
							<textarea rows="6" cols="72" id="picture_desc" name="picture_desc"> ${picture.picture_desc}</textarea>
						</div>
					</div>
		
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
		
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="javascript:window.location = '<%=path%>/mvc/picture.do?type=cms';">
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
			var usefor = document.getElementById('usefor').value;
			var VERSION_OL = document.getElementById('version_ol').value;
			
			checkOption('usefo',usefor);
			checkOption('version_online',VERSION_OL);
			/* $("#cms_form-group").hide();
			$("#organizationId").change(function(){
				var orgId = $("#organizationId").val();
				if(orgId == "000000"){
					$("#oms_form-group").show();
					$("#cms_form-group").hide();
				}else{
					$("#oms_form-group").hide();
					$("#cms_form-group").show();
				}
			}); */
			//$("#organizationId").addClass("disabled");
			$("#cms_form-group").find("input[value=2]").attr("checked","checked").attr("disabled","disabled");
		});
		/*********自定于方法**********/
		//表单提交
		function subForm() {
//			if (!checkData('version_no', '版本号', 'input')) {
//				return;
//			}
			/* if (!checkData('version_flag', '系统标记', 'input')) {
				return;
			} */
			if (!checkData('picture_name', '图片名称', 'input')) {
				return;
			}
			if (!checkData('picture_desc', '图片描述', 'input')) {
				return;
			}
			if (!checkData('picture_url', '图片地址 ', 'input')) {
				return;
			}
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/picture_editSave.do",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						alert("保存成功！");
						window.location = "<%=path%>/mvc/picture.do";
					}else{
						alert("保存失败:"+data.msg);
					}
				},
				error : function(msg) {
					alert("分配出错  " + msg.msg);
				}
			});
		}
		function checkOption(id,value)
		{
			var select = document.getElementById(id);
			var options = select.options;
			for(var i= 0;i<options.length;i++)
			{
				if(options[i].value == value)
				{
					options[i].selected = true;
					break;
				}
			}
		}
	</script>
	</body>
</html>
