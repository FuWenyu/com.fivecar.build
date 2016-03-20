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
					<input id=modelid type="hidden" class="" name="modelid" value="${modelid}" />
					<input id=modelName type="hidden" class="" name="modelName" value="${modelName}" />
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							车型 </label>
						<div class="col-sm-9">
							<input type="text" id="modelName1" name="modelName1" placeholder=" "
								class="col-xs-10 col-sm-5" disabled="disabled"
								value="${modelName}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							购置税 </label>
						<div class="col-sm-9">
							<input type="text" id="tax" name="tax" placeholder="请输入购置税金额 "
								class="col-xs-10 col-sm-5"
								value="${FullPay.tax}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							交强险</label>
						<div class="col-sm-9">
							<input type="text" id="CompulsoryInsurance" name="CompulsoryInsurance" placeholder="请输入交强险金额 "
								class="col-xs-10 col-sm-5"
								value="${FullPay.compulsoryInsurance}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							牌照费用</label>
						<div class="col-sm-9">
							<input type="text" id="LicensePlate" name="LicensePlate" placeholder="请输入牌照费用 "
								class="col-xs-10 col-sm-5"
								value="${FullPay.licensePlate}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							车损险</label>
						<div class="col-sm-9">
							<input type="text" id="CDW" name="CDW" placeholder="请输入车损险金额"
								class="col-xs-10 col-sm-5"
								value="${FullPay.CDW}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							第三者责任险</label>
						<div class="col-sm-9">
							<input type="text" id="ThirdParityLiability" name="ThirdParityLiability" placeholder="请输入第三者责任险金额"
								class="col-xs-10 col-sm-5"
								value="${FullPay.thirdParityLiability}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							其它保险</label>
						<div class="col-sm-9">
							<input type="text" id="OtherInsurance" name="OtherInsurance" placeholder="请输入其它保险金额"
								class="col-xs-10 col-sm-5"
								value="${FullPay.otherInsurance}" /> <span style="color: red"></span>
						</div>
					</div>
					
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
		
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="javascript:window.location = '<%=path%>/mvc/model.do';">
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
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		/*********自定于方法**********/
		//表单提交
		function subForm() {
			if (!checkData('modelName', '车型名称', 'input')) {
				return;
			}
			
			if (!checkData('tax', '购置税', 'input')) {
				return;
			}
			if (!checkData('tax', '购置税', 'number')) {
				return;
			}
			if (!limitCheck('tax', '购置税', 12)) {
				return;
			}
			
			if (!checkData('CompulsoryInsurance', '交强险', 'input')) {
				return;
			}
			if (!checkData('CompulsoryInsurance', '交强险', 'number')) {
				return;
			}
			if (!limitCheck('CompulsoryInsurance', '交强险', 12)) {
				return;
			}
			
			if (!checkData('LicensePlate', '牌照费用', 'input')) {
				return;
			}
			if (!checkData('LicensePlate', '牌照费用', 'number')) {
				return;
			}
			if (!limitCheck('LicensePlate', '牌照费用', 12)) {
				return;
			}
			
			if (!checkData('CDW', '车损险', 'input')) {
				return;
			}
			if (!checkData('CDW', '车损险', 'number')) {
				return;
			}
			if (!limitCheck('CDW', '车损险', 12)) {
				return;
			}
			
			if (!checkData('ThirdParityLiability', '第三者责任险', 'input')) {
				return;
			}
			if (!checkData('ThirdParityLiability', '第三者责任险', 'number')) {
				return;
			}
			if (!limitCheck('ThirdParityLiability', '第三者责任险', 12)) {
				return;
			}
			
			if (!checkData('OtherInsurance', '其它保险', 'input')) {
				return;
			}
			if (!checkData('OtherInsurance', '其它保险', 'number')) {
				return;
			}
			if (!limitCheck('OtherInsurance', '其它保险', 12)) {
				return;
			}
			
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/fullpay_editSave.do",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						alert("保存成功！");
						window.location = "<%=path%>/mvc/model.do";
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
