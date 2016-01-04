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

				<div class="widget-body">
					<div class="widget-main">
						<div id="fuelux-wizard" class="row-fluid"
							data-target="#step-container">
							<ul class="wizard-steps">
								<li data-target="#step1" class="active"><span class="step">1</span>
									<span class="title">报告基本信息</span></li>
								<li data-target="#step2"><span class="step">2</span> <span
									class="title">报告分析及情况</span></li>
								<li data-target="#step3"><span class="step">3</span> <span
									class="title">报告分析及情况</span></li>
								<li data-target="#step4"><span class="step">4</span> <span
									class="title">报告分析及情况</span></li>
								<li data-target="#step5"><span class="step">5</span> <span
									class="title">报告附件信息</span></li>
							</ul>
						</div>
						<hr />
						<form id="form_1" class="col-xs-12 form-horizontal" action=""
							method="post">
							<div class="step-content row-fluid position-relative"
								id="step-container">
								<div class="step-pane active" id="step1">
									<input type="hidden" id="report_id" name="report_id"
										value="${map.report_id }" /> <input type="hidden"
										id="duebill_id" name="duebill_id" />
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="duebill_acct"> 借据编号 </label>
										<div class="col-sm-3">
											<input type="text" id="duebill_acct" placeholder="点击选择借据"
												class="col-xs-10 col-sm-8" name="duebill_acct"
												onclick="selectCustem();" readonly />
										</div>
										<label class="col-sm-1 control-label no-padding-right"
											for="duebill_ser_no"> 借据序号 </label>
										<div class="col-sm-6">
											<input type="text" id="duebill_ser_no" placeholder=""
												class="col-xs-10 col-sm-4" name="duebill_ser_no" readonly />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="duebill_amount"> 借据金额</label>
										<div class="col-sm-3">
											<input type="text" id="duebill_amount" placeholder=""
												class="col-xs-10 col-sm-8" name="duebill_amount" readonly />
										</div>
										<!-- <label class="col-sm-2 control-label no-padding-right" for="tel"> 联系电话 </label> -->
										<div class="col-sm-6">
											<!-- <input type="text" id="tel" placeholder="" class="col-xs-10 col-sm-4" name="tel" readonly/> -->
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="authExeCause">调查结果</label>
										<div class="col-sm-4">
											<textarea class="form-control" id="ps" name="ps"></textarea>
										</div>
									</div>
									<br> <br> <br> <br> <br> <br> <br>
									<br> <br> <br> <br> <br>
								</div>

								<div class="step-pane" id="step2">
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="basicsituation">授信客户的基本情况</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="basicsituation"
												name="basicsituation"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="changesituation">管理层的变动情况</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="changesituation"
												name="changesituation"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="corporatestructure">企业组织结构分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="corporatestructure"
												name="corporatestructure"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="financialability">财务管理能力分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="financialability"
												name="financialability"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="indoorsystem">内部制度建设方面分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="indoorsystem"
												name="indoorsystem"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="customersituation">集团客户情况</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="customersituation"
												name="customersituation"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="managetactic">经营战略分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="managetactic"
												name="managetactic"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="purchase">采购环节风险分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="purchase" name="purchase"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="produce">生产环节风险分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="produce" name="produce"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="sell">销售环节风险分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="sell" name="sell"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="capitalsituation">资本经营情况分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="capitalsituation"
												name="capitalsituation"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="financereliability">财务报表可信度判断</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="financereliability"
												name="financereliability"></textarea>
										</div>
									</div>
								</div>
								<div class="step-pane" id="step3">
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="property">对资产项目分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="property" name="property"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="liabilities">对负债项目分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="liabilities"
												name="liabilities"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="customerincome">授信客户收入成本费用等项目分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="customerincome"
												name="customerincome"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="customerliabilities">异常变动的资产负债及损益类项目分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="customerliabilities"
												name="customerliabilities"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="cashflow">现金流量分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="cashflow" name="cashflow"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="customercycle">授信客户所在行业周期</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="customercycle"
												name="customercycle"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="specialsituation">行业特殊情况</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="specialsituation"
												name="specialsituation"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="relatedtrade">授信客户所在行业与相关行业的关联度分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="relatedtrade"
												name="relatedtrade"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="comoete">授信客户产品受同业竞争影响的程度分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="comoete" name="comoete"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="isornosubstitute">授信客户产品被其他产品替代的可能性分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="isornosubstitute"
												name="isornosubstitute"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="lawsituation">行业的法律环境分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="lawsituation"
												name="lawsituation"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="bailsituation">保证主体资格分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="bailsituation"
												name="bailsituation"></textarea>
										</div>
									</div>
								</div>
								<div class="step-pane" id="step4">
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="guarantysituation">担保物情况分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="guarantysituation"
												name="guarantysituation"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="bailfinancer">保证人财务分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="bailfinancer"
												name="bailfinancer"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="bailcredit">保证人信用情况</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="bailcredit"
												name="bailcredit"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="contractsituation">借款合同履行情况</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="contractsituation"
												name="contractsituation"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="limitingclause">限制性条款落实情况</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="limitingclause"
												name="limitingclause"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="riskchange">贷款风险迁徒变动情况</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="riskchange"
												name="riskchange"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="riskwarning">风险预警情况</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="riskwarning"
												name="riskwarning"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="relatedwork">相关业务及客户资源需要进一步拓展和挖掘方面</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="relatedwork"
												name="relatedwork"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="propose">建议及措施</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="propose" name="propose"></textarea>
										</div>
										<!-- <label class="col-sm-2 control-label no-padding-right"
											for="isornosubstitute">授信客户产品被其他产品替代的可能性分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="isornosubstitute" name="isornosubstitute"></textarea>
										</div> -->
									</div>
									<div class="form-group">
										<!-- <label class="col-sm-2 control-label no-padding-right"
											for="lawsituation">行业的法律环境分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="lawsituation"
												name="lawsituation"></textarea>
										</div>
										<label class="col-sm-2 control-label no-padding-right"
											for="bailsituation">保证主体资格分析</label>
										<div class="col-sm-3">
											<textarea class=" form-control" id="bailsituation"
												name="bailsituation"></textarea>
										</div> -->
									</div>
								</div>

								<div class="step-pane" id="step5">
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="fileInput">上传文件</label>
										<div class="col-sm-3" id="upload">
											<div class="ace-file-input col-sm-12" id="fileInputDiv">
												<input type="file" id="fileInput" name="myfile"
													class="ace-file-input col-sm-12" onblur="clean()">

											</div>
										</div>
										<div class="col-sm-4">
											<h6 class="inline blue">请上传|xls|doc|gif|png|jpg|jpeg格式附件。</h6>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"
											for="btn"></label>
										<div class="col-sm-3">
											&nbsp;&nbsp;&nbsp;&nbsp;
											<button id="fileUpLoadBtn" type="button" class="btn btn-xs">上传文件</button>
										</div>
										<div class="col-sm-4"></div>
									</div>
									<div class="form-group hide" id="fileListGroup">
										<label class="col-sm-2 control-label no-padding-right"
											for="btn">已上传文件</label>
										<div class="col-sm-3" id="upload1"></div>
										<div class="col-sm-4"></div>
									</div>
									<br> <br> <br> <br> <br> <br> <br>
									<br> <br> <br> <br> <br> <br> <br>
									<br>
								</div>

							</div>
						</form>
						<hr />
						<div class="row-fluid wizard-actions">
							<button class="btn btn-prev">
								<i class="icon-arrow-left"></i> 上一步
							</button>

							<button class="btn btn-success btn-next" data-last="提交">
								下一步 <i class="icon-arrow-right icon-on-right"></i>
							</button>
						</div>
					</div>
					<!-- /widget-main -->
				</div>
				<!-- /widget-body -->
			</div>
		</div>
	</div>
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" onclick="hideModal();">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">借据列表</h4>
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
											<th>借据号</th>
											<th>借据编号</th>
											<th>借据金额</th>
											<th>合同业务号</th>
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
	<script src="<%=path%>/js/fuelux/fuelux.wizard.min.js"></script>
	<!-- PAGE CONTENT ENDS -->
	<script type="text/javascript">
		//表单提交
	jQuery(function($) {
		//上传文件控件
		$('#fileInput').ace_file_input({
			no_file:'空...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false
		});
		
		$("#fileUpLoadBtn").on("click.upLoad",function(){
			//附件格式控制，ID，白名单
			var fileInput=$("#fileInput").val();
			var array=fileInput.split(".");
			if("txt|docx|xls|doc|gif|png|jpg|jpeg".indexOf(array[1])==-1){
				alert("此文件格式不支持上传！");
				return;
			}; 
			var fileInput = $("#fileInput").val();
			if(fileInput==null ||fileInput=="" ){
				$("#fileInputDiv").next().remove();
				$("#fileInputDiv").after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;请上传附件");
				return false;
			}
			param = {};
			param["biz_id"]=$("#report_id").val();
			param["biz_type"]="1";
			//ajax上传文件
			$.ajaxFileUpload({
				url : "fileUpLoad.do",
				type : "POST",
				secureuri : false,
				fileElementId : 'fileInput',
				data : param,
				dataType : 'JSON',
				success : function(data,status){
					var obj = $.parseJSON($(data).html());
					if(obj.reCode == "failed"){
						alert(obj.expMsg);
						initFileInput();
					}else{
						$("#fileListGroup").removeClass("hide");
						$("#upload1").append("<label class='filelist col-sm-12'><a href=\"downloadFile.do?att_id="+obj.fileVo.att_id+"\">"+obj.fileVo.att_name+" &nbsp;&nbsp;&nbsp;</a><a class=\"remove\" data-attid="+obj.fileVo.att_id+" data-fileName="+obj.fileVo.fileName+" href=\"#\" onclick=\"removeFile(this);\"><i class=\"icon-remove\"></i></a></label>");
						initFileInput();
					}
					
				},
				error : function(data,status,e){
					initFileInput();
				}
			});
		});
		
		//Date Picker 控件
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
		$('#fuelux-wizard').ace_wizard()
		.on('change' , function(e, info){
			setHash('${pageContext.request.contextPath}');
		})
		.on('finished', function(e) {
			if($("#duebill_id").val() == ""){
				alert("请选择借据信息");
				return;
			}
			var upload=document.getElementById("upload1").innerHTML.trim();
			if((($("#ps").val() == "")||($("#ps").val() == null)) && (upload == ""||upload == null||upload.length==0)){
				alert("调查结果与附件不能同时为空！");
				return;
			}
			if((($("#fileInput").val() != "")&&($("#fileInput").val() != null))&& (upload == ""||upload == null||upload.length==0)){
				alert("附件没有上传！");
				return;
			}
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/loanReport_addSave.do",
				data : $("#form_1").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						alert("保存成功！");
						window.location = "<%=path%>/mvc/loanReport_getList.do";
					}else{
						alert("保存失败！");
					}
				},
				error : function(msg) {
					alert("分配出错  " + msg);
				}
			});
		});
	});
	function removeFile(obj){
		var param={};
		param["att_id"]=$(obj).data("attid");
		$.ajax( {
			type : "POST",
			url : "removeFile.do",
			data : param,
			async : false,
			success : function(flag) {
				if(flag){
					alert("删除成功");
					$(obj).parents("label").remove();
					$("#fileUpLoadBtn").show();
					initFileInput();
				}else{
					alert("删除失败");
					initFileInput();
				}
				
			},
			error : function(msg) {
				alert("表单提交失败："+msg);
				initFileInput();
			}
		}); 
	}
	function initFileInput(){
		var html = "<div class=\"ace-file-input col-sm-12\" id=\"fileInputDiv\"> "+
		"<input type=\"file\" id=\"fileInput\" name=\"myfile\" class=\"ace-file-input col-sm-12\" onblur=\"clean()\"> "+
		"<div id=\"fileInput_font\" class=\"help-block red\" onclick=\"clean()\"></div></div>"; 
		$("#fileInputDiv").remove(); 
		$("#upload").html(html); 
		$('#fileInput').ace_file_input({
			no_file:'空...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false 
		}); 
		setHash('${pageContext.request.contextPath}');
	}
	function selectCustem(){
		showModal($("#myModal"));
		$.ajax( {
			type : "POST",
			url : "${pageContext.request.contextPath}/mvc/loanReport_queryDuebill.do",
			async : false,
			success : function(obj) {
				$(obj).each(function(index){
					var $tr = "<tr><td>"+$(obj)[index].duebill_id+"</td> "
								+" <td>"+$(obj)[index].duebill_acct+"</td> "
								+" <td>"+$(obj)[index].duebill_amount+"</td> "
								+" <td>"+$(obj)[index].contract_id+"</td> "
								+" <td><button type=\"button\" onclick=\"CallBackSubmit('"+$(obj)[index].duebill_id+","+$(obj)[index].duebill_amount+","+$(obj)[index].duebill_acct+","+$(obj)[index].duebill_ser_no+"');\">选择</button></td> "
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
		$("#duebill_id").val(objs[0]);
		$("#duebill_amount").val(objs[1]);
		$("#duebill_acct").val(objs[2]);
		$("#duebill_ser_no").val(objs[3]);
		hideModal();
	}
	</script>
</body>
</html>
