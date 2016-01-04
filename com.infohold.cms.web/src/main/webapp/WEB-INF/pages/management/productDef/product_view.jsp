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
					<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/productDef_editSave.do" method="post">
						<div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="pro_code"> 产品代码 </label>
							<div class="col-sm-3">
								<input type="text" id="pro_code" placeholder="请输入产品代码" class="col-xs-10 col-sm-8" name="pro_code" value="${entity.pro_code }" readonly/>
							</div>
							<label class="col-sm-2 control-label no-padding-right" for="pro_name"> 产品名称 </label>
							<div class="col-sm-5">
								<input type="text" id="pro_name" placeholder="请输入产品名称" class="col-xs-10 col-sm-5" name="pro_name" value="${entity.pro_name }"  maxlength="15" readonly/>
							</div>
				       </div>
				       <div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="pro_type"> 产品类型 </label>
							<div class="col-sm-3">
								<select name="pro_type" id="pro_type" class="col-xs-10 col-sm-8" data-emptyoption="false" data-select-list="${proTypeList }" data-select-value="${entity.pro_type }" disabled>
								</select>
							</div>
							<label class="col-sm-2 control-label no-padding-right" for="cny"> 币种 </label>
							<div class="col-sm-5">
								<select name="cny" id="cny" class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${cnyList}" data-select-value="${entity.cny }" disabled>
								</select>
							</div>
				       </div>
				       <div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="ps"> 产品描述 </label>
							<div class="col-sm-3">
								<input type="text" id="ps" placeholder="请输入产品描述" class="col-xs-10 col-sm-8" name="ps" value="${entity.ps }"  maxlength="32" readonly/>
							</div>
							<label class="col-sm-2 control-label no-padding-right" for="status">产品状态 </label>
							<div class="col-sm-5">
							<select name="status" id="status" class="col-xs-10 col-sm-5" disabled>
								<option value='1'>启用</option>
								<option value='0'>停用</option>
							</select>
						</div>
				       </div>
				       <div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="postpone_flag"> 展期标志 </label>
							<div class="col-sm-3">
								<select name="postpone_flag" id="postpone_flag" class="col-xs-10 col-sm-8" disabled>
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</div>
							<label class="col-sm-2 control-label no-padding-right" for="guaranteechange_flag"> 担保变更标志 </label>
							<div class="col-sm-5">
								<select name="guaranteechange_flag" id="guaranteechange_flag" class="col-xs-10 col-sm-5" disabled>
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</div>
				       </div>
				       <div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="loan_type"> 贷款类型 </label>
							<div class="col-sm-3">
								<select name="loan_type" id="loan_type" class="col-xs-10 col-sm-8" disabled>
									<option value="1">定期贷款</option>
									<option value="2">循环贷款</option>
								</select>
							</div>
				       </div>
				        <div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="guarantee_type"> 担保方式  </label>
							<div class="col-sm-6">
								<div class="checkbox" id="guarantee_type" name="guarantee_type" data-check-list="${guaranteeTypeList}" >
								</div>
							</div>
				       </div>
				       <div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="rep_way"> 还款方式 </label>
							<div class="col-sm-6">
								<div class="checkbox" id="rep_way" name="rep_way" data-check-list="${repayTypeList}" data-check-value="">
								</div>
							</div>
				       </div>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
								<button class="btn" type="button" onclick="javascript:window.location = '<%=path%>/mvc/productDef_getList.do'">
									<i class="icon-reply bigger-110"></i> 返回
								</button>
							</div>
						</div>
					</form>
					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
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
		$("#guarantee_type").formComponents("check");
		$("#rep_way").formComponents("check");
		$("#pro_type").formComponents("select");
		$("#cny").formComponents("select");
		
		$("#pro_type").val('${entity.pro_type}');
		$("#status").val('${entity.status}');
		$("#postpone_flag").val('${entity.postpone_flag}');
		$("#guaranteechange_flag").val('${entity.guaranteechange_flag}');
		$("#loan_type").val('${entity.loan_type}');
		var arr_guarantee = "${entity.guarantee_type }".split(",");
		$("input[name='guarantee_type']").each(function(index){
			var value = $(this).val();
			if(arr_guarantee.indexOf(value) >= 0){
				$(this).attr("checked",true);
			}
		}); 
		
		var arr_rep = "${entity.rep_way }".split(",");
		$("input[name='rep_way']").each(function(index){
			var value = $(this).val();
			if(arr_rep.indexOf(value) >= 0){
				$(this).attr("checked",true);
			}
		});
		
		$("input[type='checkbox']").attr("disabled",true);
	});
	function subForm() {
		if (!checkData('pro_code', '产品代码', 'input')) {
			return;
		}
		if (!checkData('pro_code', '产品代码', 'number')) {
			return;
		}
		if (!checkData('pro_name', '产品名称', 'input')) {
			return;
		}
		
		
		if(!checkCheckBox('guarantee_type','担保方式')){
			return;
		}
		if(!checkCheckBox('rep_way','还款方式')){
			return;
		}
		
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/productDef_editSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					alert("保存成功！");
					window.location = "<%=path%>/mvc/productDef_getList.do";
				}else{
					alert(data.msg);
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

