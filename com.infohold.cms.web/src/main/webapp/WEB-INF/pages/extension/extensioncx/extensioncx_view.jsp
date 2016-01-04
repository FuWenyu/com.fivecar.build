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
				<form id="sub_form"  class="col-xs-12" action="" method="post">
       						<input type="hidden" id="xh" name="xh" value="${bizExtensioncxEntity.xh }">
					<h1 class="breadcrumb">	
								<small>
									<span><h5><b>展期撤销信息</b></h5></span>
								</small>
							</h1>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2" onfocus="selectinfo()">展期申请序号</label>
										<div class="col-sm-4">
										<input type="text" id="zqxh" class="col-xs-10 col-sm-5" name="zqxh" value="${bizExtensioncxEntity.zqxh }" readonly="readonly"/>
										<div id="duebill_id_font" class="help-block red" ></div>													
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">撤销申请时间</label>
										
										<div class="col-sm-4">
											<input type="text" id="sqsj" placeholder="" onblur="clean()" readonly="readonly"
												class="col-xs-10 col-sm-5" name="sqsj"  value="${bizExtensioncxEntity.sqsj }"/>
										<div class="help-block red"  ></div>	
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">撤销原因</label>
										<div class="col-sm-4">
										<textarea rows="5" cols="10"  class="col-xs-10 col-sm-5" id="sqyy" name="sqyy" disabled="disabled">${bizExtensioncxEntity.sqyy }</textarea>
                                        </div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">撤销备注</label>
										<div class="col-sm-4">
											<textarea rows="5" cols="10"  class="col-xs-10 col-sm-5" id="remark" name="remark" disabled="disabled">${bizExtensioncxEntity.remark }</textarea>	
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="hr hr32 hr-dotted"></div>
							<h1 class="breadcrumb">	
								<small>
									<span><h5><b>展期申请信息</b></h5></span>
								</small>
							</h1>
									<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据编号 </label>
										<div class="col-sm-4">     
											<input type="text" id="duebill_acct" placeholder="  "
												class="col-xs-10 col-sm-5" name=duebill_acct readonly="readonly" value="${bizExtensioncxEntity.duebill_acct }"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据金额</label>
										<div class="col-sm-4">
											<input type="text" id="duebill_amount" value="${bizExtensioncxEntity.duebill_amount }"
												class="col-xs-10 col-sm-5" name="duebill_amount" readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
									<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据起始日期</label>
										<div class="col-sm-4">
											<input type="text" id="start_date" value="${bizExtensioncxEntity.start_date }"
												class="col-xs-10 col-sm-5" name="start_date" readonly="readonly"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据到期日期</label>
										
										<div class="col-sm-4">
											<input type="text" id="end_date" value="${bizExtensioncxEntity.end_date }"
												class="col-xs-10 col-sm-5" name="end_date" readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
									<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">展期申请时间</label>
										<div class="col-sm-4">
											<input type="text" id="zqsqsj" 
												class="col-xs-10 col-sm-5" name="zqsqsj" readonly="readonly" value="${bizExtensioncxEntity.zqsqsj }"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">展期金额</label>
										<div class="col-sm-4">
											<input type="text" id="zqje" 
												class="col-xs-10 col-sm-5" name="zqje"  readonly="readonly" value="${bizExtensioncxEntity.zqje }"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">展期起始日期</label>
										<div class="col-sm-4">
											<input type="text" id="zqqsrq" 
												class="col-xs-10 col-sm-5" name="zqqsrq" readonly="readonly" value="${bizExtensioncxEntity.zqqsrq }"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">展期到期日期</label>
										<div class="col-sm-4">
											<input type="text" id="zqdqrq" placeholder=""
												class="col-xs-10 col-sm-5" name="zqdqrq"  readonly="readonly" value="${bizExtensioncxEntity.zqdqrq }"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
							<div class="hr hr32 hr-dotted"></div>
					<h1 class="breadcrumb">	
								<small>
									<span><h5><b>经办信息</b></h5></span>
								</small>
							</h1>
								 <div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">申请人</label>
										<div class="col-sm-4">
											<input type="text" id="jbkhjlmc" 
												class="col-xs-10 col-sm-5" name="jbkhjlmc" value="${bizExtensioncxEntity.jbkhjlmc }" readonly="readonly"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">申请机构</label>
										
										<div class="col-sm-4">
											<input type="text" id="jbjgmc" 
												class="col-xs-10 col-sm-5" name="jbjgmc" value="${bizExtensioncxEntity.jbjgmc }" readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
						<div class="hr hr32 hr-dotted"></div>	
						<div class="row">
								<div class="form-group">
						<div class="col-md-offset-4 col-md-4">
							<button class="btn btn-sm btn-primary" type="button"
								onclick="javascript:history.go(-1);">
								<i class=""></i> 返回
							</button>
							&nbsp; &nbsp; &nbsp;
							
						</div>
					</div>
							</div>
				</form>
			</div>
		</div>
		</div>
		<jsp:include page="./extensioncx-dialog.jsp"></jsp:include> 
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
	jQuery(function($) {
		//加载下拉列表
		$("#REPAYMENT_TYPE_List").formComponents("select");
		$("#repayment_choose_List").formComponents("select");
		$("#sfzxxll").formComponents("select");
		$("#repayment_way_List").formComponents("select");
		//Date Picker 控件
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
     })
		
	</script>
	</body>
</html>
