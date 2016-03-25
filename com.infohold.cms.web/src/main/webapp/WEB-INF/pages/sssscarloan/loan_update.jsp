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
					<input id="loan_id" type="hidden" class="" name="loan_id" value="${loan.id}" />
					<input id="lender1" type="hidden" class="" name="lender1" value="${lender.id}-${lender.lenderName}-${lender.url}" />
					<input id="modelid"type="hidden" class="" name="modelid" value="${modelid}" />
					<input id="modelName" type="hidden" class="" name="modelName" value="${modelName}" />
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
							金融机构</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="lender" name="lender">
							<c:forEach items="${lenderList}" var="list" varStatus="status">
	                        <option value="${list.id}-${list.lenderName}-${list.url}">${list.lenderName}</option>
	               		    </c:forEach>
               		    </select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							4s店全名 </label>
						<div class="col-sm-9">
							<input type="text" id="carprice" name="carprice" placeholder="请输入裸车价格 "
								class="col-xs-10 col-sm-5"
								value="${loan.carprice}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							首付金额</label>
						<div class="col-sm-9">
							<input type="text" id="downpayment" name="downpayment" placeholder="请输入首付金额 "
								class="col-xs-10 col-sm-5"
								value="${loan.downpayment}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							首付百分比</label>
						<div class="col-sm-9">
							<input type="text" id="downPaymentPercent" name="downPaymentPercent" placeholder="请输入首付百分比 "
								class="col-xs-10 col-sm-5"
								value="${loan.downPaymentPercent}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							额外费用</label>
						<div class="col-sm-9">
							<input type="text" id="premium" name="premium" placeholder="请输入额外费用 "
								class="col-xs-10 col-sm-5"
								value="${loan.premium}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							12期每期金额</label>
						<div class="col-sm-9">
							<input type="text" id="loan12" name="loan12" placeholder="请输入12期每期金额 "
								class="col-xs-10 col-sm-5"
								value="${loan.loan12}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							24期每期金额</label>
						<div class="col-sm-9">
							<input type="text" id="loan24" name="loan24" placeholder="请输入24期每期金额"
								class="col-xs-10 col-sm-5"
								value="${loan.loan24}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							36期每期金额</label>
						<div class="col-sm-9">
							<input type="text" id="loan36" name="loan36" placeholder="请输入36期每期金额 "
								class="col-xs-10 col-sm-5"
								value="${loan.loan36}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							48期每期金额</label>
						<div class="col-sm-9">
							<input type="text" id="loan48" name="loan48" placeholder="请输入48期每期金额 "
								class="col-xs-10 col-sm-5"
								value="${loan.loan48}" /> <span style="color: red"></span>
						</div>
					</div>
					
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="goBack('${modelid}-${modelName}');">
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
			var lender1 = document.getElementById('lender1').value;
			checkOption('lender',lender1);
			
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		/*********自定于方法**********/
		//表单提交
		function subForm() {
			if (!checkData('lender', '金融机构', 'input')) {
				return;
			}
			
			if (!checkData('carprice', '裸车价格', 'input')) {
				return;
			}
			if (!limitCheck('carprice', '裸车价格', 12)) {
				return;
			}
			if (!checkData('carprice', '裸车价格', 'number')) {
				return;
			}
			
			
			if (!checkData('downpayment', '首付金额', 'input')) {
				return;
			}
			if (!limitCheck('downpayment', '首付金额', 12)) {
				return;
			}
			if (!checkData('downpayment', '首付金额', 'number')) {
				return;
			}
			
			if (!checkData('downPaymentPercent', '首付百分比', 'input')) {
				return;
			}
			
			if (!checkData('premium', '额外费用', 'input')) {
				return;
			}
			if (!limitCheck('premium', '额外费用', 12)) {
				return;
			}
			if (!checkData('premium', '额外费用', 'number')) {
				return;
			}
			
			
			if (!checkData('loan12', '12期每期金额', 'input')) {
				return;
			}
			if (!limitCheck('loan12', '12期每期金额', 12)) {
				return;
			}
			if (!checkData('loan12', '12期每期金额', 'number')) {
				return;
			}
			
			if (!checkData('loan24', '24期每期金额', 'input')) {
				return;
			}
			if (!limitCheck('loan24', '24期每期金额', 12)) {
				return;
			}
			if (!checkData('loan24', '24期每期金额', 'number')) {
				return;
			}
			
			
			if (!checkData('loan36', '36期每期金额', 'input')) {
				return;
			}
			if (!limitCheck('loan36', '36期每期金额', 12)) {
				return;
			}
			if (!checkData('loan36', '36期每期金额', 'number')) {
				return;
			}
			
			
			if (!checkData('loan48', '48期每期金额', 'input')) {
				return;
			}
			if (!limitCheck('loan48', '48期每期金额', 12)) {
				return;
			}
			if (!checkData('loan48', '48期每期金额', 'number')) {
				return;
			}
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/loan_editSave.do",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						alert("保存成功！");
						var modelid =$("#modelid").val();
						var modelName =$("#modelName").val();
						var model = modelid+"-"+modelName;
						window.location = "<%=path%>/mvc/loan.do?model="+model+"";
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
		function goBack(model){
			window.location = "<%=path%>/mvc/loan.do?model="+model+"";
		}
	</script>
	</body>
</html>
