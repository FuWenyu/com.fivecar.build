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
<!-- 该页面为iframe嵌套页面，以下代码用于计算iframe高度，不允许修改：
			<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
			<div id="iframeDiv" style="display:none"></div>
			<div class="page-content" id="loadPageContent">
	-->
<body id="iframe_body"
	onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display: none"></div>
	<div id="modal_area"></div>
	<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form"
					action="<%=path%>/mvc/productDef_addSave.do" method="post">
					<h3 class="header smaller lighter blue">合同信息</h3>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="contract_id"> 合同编号 </label>
						<div class="col-sm-3">
							<input name="contract_id" id="contract_id" placeholder="点击选择合同编号" type="text"
								class="col-xs-10 col-sm-8" onclick="selectContract();"readonly>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="cust_name">
							客户名称 </label>
						<div class="col-sm-5">
							<input name="cust_name" id="cust_name" class="col-xs-10 col-sm-5" type="text" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="product_name"> 产品名称 </label>
						<div class="col-sm-3">
							<input name="product_name" id="product_name" class="col-xs-10 col-sm-8" type="text"
								readonly>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="amount">
							合同金额 </label>
						<div class="col-sm-5">
							<input name="amount" id="amount" class="col-xs-10 col-sm-5" type="text" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="start_date"> 合同起始日期 </label>
						<div class="col-sm-3">
							<input name="start_date" id="start_date" class="col-xs-10 col-sm-8" type="text"
								readonly>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="end_date">
							合同到期日期 </label>
						<div class="col-sm-5">
							<input name="end_date" id="end_date" class="col-xs-10 col-sm-5" type="text" readonly>
						</div>
					</div>
					<h3 class="header smaller lighter blue">还款账户变更</h3>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="rep_acct"> 原还款账号 </label>
						<div class="col-sm-3">
							<input name="rep_acct" id="rep_acct" class="col-xs-10 col-sm-8" type="text"
								readonly>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="account_new">
							新还款账号 </label>
						<div class="col-sm-5">
							<input name="account_new" id="account_new" placeholder="请输入新还款账号" type="text"
								class="col-xs-10 col-sm-5">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="ps">备注</label>
						<div class="col-sm-3">
							<textarea class="form-control" id="ps" name="ps"></textarea>
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>

							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button"
								onclick="javascript:history.go(-1);">
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
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" onclick="hideModal();">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">合同列表</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12">
							<div id="sample-table-2_wrapper" class="dataTables_wrapper"
								role="grid">
								<table id="sample-table-2"
									class="table table-striped table-bordered table-hover dataTable"
									aria-describedby="sample-table-2">
									<thead>
										<tr>
											<th>合同编号</th>
											<th>合同金额</th>
											<th>起始日期</th>
											<th>到期日期</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="custList">

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-sm btn-primary" onclick="callBackfunction();">选择</button> -->
					<button type="button" class="btn btn-sm btn-default"
						onclick="hideModal();">关闭</button>
				</div>
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
		
	});
	function subForm() {
		if (!checkData('account_new', '新还款账号', 'input')) {
			return;
		}
		if (!checkData('account_new', '新还款账号', 'number')) {
			return;
		}
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/acctModify_addSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					alert("保存成功！");
					window.location = "<%=path%>/mvc/acctModify_getList.do";
				}else{
					alert("保存失败！");
				}
			},
			error : function(msg) {
				alert("分配出错  " + msg);
			}
		});
	}
	function selectContract(){
		showModal($("#myModal"));
		$.ajax( {
			type : "POST",
			url : "${pageContext.request.contextPath}/mvc/acctModify_queryContract.do",
			async : false,
			success : function(obj) {
				$(obj).each(function(index){
					var $tr = "<tr><td>"+$(obj)[index].contract_id+"</td> "
								+" <td>"+$(obj)[index].amount+"</td> "
								+" <td>"+$(obj)[index].start_date+"</td> "
								+" <td>"+$(obj)[index].end_date+"</td> "
								+" <td><button type=\"button\" onclick=\"CallBackSubmit('"
										+$(obj)[index].contract_id+","
										+$(obj)[index].cust_name+","
										+$(obj)[index].product_name+","
										+$(obj)[index].start_date+","
										+$(obj)[index].end_date+","
										+$(obj)[index].amount+","
										+$(obj)[index].rep_acct+"');\">选择</button></td> "
								+" </tr>";
					$(window.document).find("#custList").append($tr);
				});
				var oTable1 = $('#sample-table-2').dataTable( {
					"aoColumns": [
				      null,null, null,null, null
					] } );
				$("#sample-table-2_length").remove();
				$("#sample-table-2_filter").remove();
			},
			error : function(msg) {
				alert("获取数据失败: " + msg);
			}
		});
	}
	function CallBackSubmit(obj){
		var objs = obj.split(",");
		$("#contract_id").val(objs[0]);
		$("#cust_name").val(objs[1]);
		$("#product_name").val(objs[2]);
		$("#start_date").val(objs[3]);
		$("#end_date").val(objs[4]);
		$("#amount").val(objs[5]);
		$("#rep_acct").val(objs[6]);
		hideModal();
	}
	</script>
</body>
</html>

