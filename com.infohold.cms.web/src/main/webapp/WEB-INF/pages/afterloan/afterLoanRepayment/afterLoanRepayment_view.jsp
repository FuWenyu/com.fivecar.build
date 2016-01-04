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
				<form id="form_sub" name="form_sub" class="col-xs-12" action=# method="post">
       						<input type="hidden" id="re_id" name="re_id" value="${afterLoanRepaymentEntrty.re_id }">
       						 <input type="hidden" id="status" name="status"	value="${afterLoanRepaymentEntrty.status}">



					<h1 class="breadcrumb">	
								<small>
									<span><h5><b>预约还款信息</b></h5></span>
								</small>
							</h1>
			
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2" onfocus="selectinfo()">系统借据号</label>
											
										
										<div class="col-sm-4">
										
										<input type="text" id="duebill_id"
										        class="col-xs-10 col-sm-5" name="duebill_id" placeholder="请选择借据" onclick="selectDuebill(1)"
										value="${PostPonelist[0].duebill_id}"  />
											<!-- <font color="red" id="duebill_id_font"></font> -->
										<div id="duebill_id_font" class="help-block red" onclick="clean()"></div>													
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">还款金额</label>
										
										<div class="col-sm-4">
											<input type="text" id="repay_amount" placeholder="" onblur="clean()"
												class="col-xs-10 col-sm-5" name="repay_amount"
												value="${afterLoanRepaymentEntrty.repay_amount }" />
												<!-- <font color="red" id="repay_amount_font"></font> -->
										<div id="repay_amount_font" class="help-block red" onclick="clean()"></div>	
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								
								
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">还款类型</label>
										
										<div class="col-sm-4">
										<select name="REPAYMENT_TYPE_List" id="REPAYMENT_TYPE_List"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${REPAYMENT_TYPE_List}" data-select-value="${afterLoanRepaymentEntrty.repay_type}"></select>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">还款选择</label>
										
										<div class="col-sm-4">
										<select name="repayment_choose_List" id="repayment_choose_List"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${repayment_choose_List}" data-select-value="${afterLoanRepaymentEntrty.repayment_choose}"></select>
                                        </div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">是否收违约金</label>
										
										<div class="col-sm-4">
										<select name="YESORNO_List" id="YESORNO_List"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${YESORNO_List}" data-select-value="${afterLoanRepaymentEntrty.penalty_whether}"></select>
                                        </div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">违约金金额</label>
										
										<div class="col-sm-4">
											<input type="text" id="penalty_amount" 
											class="col-xs-10 col-sm-5" name="penalty_amount"
												value="${afterLoanRepaymentEntrty.penalty_amount }" onblur="clean()" />
												<!-- <font color="red" id="penalty_amount_font"></font> -->
										<div id="penalty_amount_font" class="help-block red" onclick="clean()"></div>	
										
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">还款计划变更方式</label>
										
										<div class="col-sm-4">
										<select name="repayment_way_List" id="repayment_way_List"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${repayment_way_List}" data-select-value="${afterLoanRepaymentEntrty.repayment_way}"></select>
                                        </div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">财务凭证号</label>
										
										<div class="col-sm-4">
											<input type="text" id="certificate_no" placeholder=""
												class="col-xs-10 col-sm-5" name="certificate_no"
												value="${afterLoanRepaymentEntrty.certificate_no }" onblur="clean()"/>
											
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								
								
								<div class="hr hr32 hr-dotted"></div>

					
					<h1 class="breadcrumb">	
								<small>
									<span><h5><b>合同信息</b></h5></span>
								</small>
							</h1>
			
									<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">合同编号 </label>
										
										<div class="col-sm-4">     
											<input type="text" id="agreement_id" placeholder="  "
												class="col-xs-10 col-sm-5" name=agreement_id
												value="${afterLoanRepaymentEntrty.con_acct }" readonly="readonly" />
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">合同金额</label>
										
										<div class="col-sm-4">
											<input type="text" id="agreement_amount" placeholder=""
												class="col-xs-10 col-sm-5" name="agreement_amount"
												value="${afterLoanRepaymentEntrty.amount }"readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								
									<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">产品名称</label>
										
										<div class="col-sm-4">
											<input type="text" id="product_name" placeholder="   "
												class="col-xs-10 col-sm-5" name="product_name"
												value="${afterLoanRepaymentEntrty.product_name }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">还款方式</label>
										
										<div class="col-sm-4">
											<input type="text" id="repayment_type" placeholder=""
												class="col-xs-10 col-sm-5" name="repayment_type"
												value="${afterLoanRepaymentEntrty.repayway }"readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								
									<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">客户编号</label>
										
										<div class="col-sm-4">
											<input type="text" id="cust_id" placeholder="   "
												class="col-xs-10 col-sm-5" name="cust_id"
												value="${afterLoanRepaymentEntrty.custid }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">客户名称</label>
											
										
										<div class="col-sm-4">
											<input type="text" id=cust_name placeholder=""
												class="col-xs-10 col-sm-5" name="custchname"
												value="${afterLoanRepaymentEntrty.custchname }" readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">起始日期</label>
										
										<div class="col-sm-4">
											<input type="text" id="agreement_start" placeholder="   "
												class="col-xs-10 col-sm-5" name="agreement_start"
												value="${afterLoanRepaymentEntrty.start_date }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">到期日期</label>
											
										
										<div class="col-sm-4">
											<input type="text" id="agreement_end" placeholder=""
												class="col-xs-10 col-sm-5" name="agreement_end"
												value="${afterLoanRepaymentEntrty.end_date }" readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								
							<div class="hr hr32 hr-dotted"></div>
				
					<h1 class="breadcrumb">	
								<small>
									<span><h5><b>借据信息</b></h5></span>
								</small>
							</h1>
		
		
		
								 <div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据编号</label>
										
										<div class="col-sm-4">
											<input type="text" id="duebill_id_2" placeholder="  "
												class="col-xs-10 col-sm-5" name="duebill_id_2"
												value="${afterLoanRepaymentEntrty.duebill_acct }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据金额</label>
										
										<div class="col-sm-4">
											<input type="text" id="iou_amount" placeholder=""
												class="col-xs-10 col-sm-5" name="iou_amount"
												value="${afterLoanRepaymentEntrty.duebill_amount }"readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据基准利率</label>
										
										<div class="col-sm-4">
											<input type="text" id="rat_int_val" placeholder="  "
												class="col-xs-10 col-sm-5" name="rat_int_val"
												value="${afterLoanRepaymentEntrty.rat_int_val }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据执行利率</label>
										
										<div class="col-sm-4">
											<input type="text" id="rat_exe_val" placeholder=""
												class="col-xs-10 col-sm-5" name="rat_exe_val"
												value="${afterLoanRepaymentEntrty.rat_exe_val }"readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据逾期利率 </label>
										
										<div class="col-sm-4">
											<input type="text" id="rat_ove_val" placeholder="  "
												class="col-xs-10 col-sm-5" name="rat_ove_val"
												value="${afterLoanRepaymentEntrty.rat_ove_val }" readonly="readonly" />
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据挪用利率</label>
										
										<div class="col-sm-4">
											<input type="text" id="rat_emb_val" placeholder=""
												class="col-xs-10 col-sm-5" name="rat_emb_val"
												value="${afterLoanRepaymentEntrty.rat_emb_val }" readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">贷款账号</label>
										
										<div class="col-sm-4">
											<input type="text" id="loan_acct_no" placeholder="  "
												class="col-xs-10 col-sm-5" name="loan_acct_no"
												value="${afterLoanRepaymentEntrty.loan_acct_no}"readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据状态</label>
										
										<div class="col-sm-4">
											<input type="text" id="iou_status" placeholder=""
												class="col-xs-10 col-sm-5" name="iou_status"
												value="${afterLoanRepaymentEntrty.ststus_name }" readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据起始日期 </label>
										
										<div class="col-sm-4">
											<input type="text" id="iou_start" placeholder="  "
												class="col-xs-10 col-sm-5" name="iou_start"
												value="${afterLoanRepaymentEntrty.start_date }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据到期日期</label>
										
										<div class="col-sm-4">
											<input type="text" id="iou_end" placeholder=""
												class="col-xs-10 col-sm-5" name="iou_end"
												value="${afterLoanRepaymentEntrty.end_date }"readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								
								
								
								<div class="hr hr32 hr-dotted"></div>
					
					<h1 class="breadcrumb">	
								<small>
									<span><h5><b>利息信息</b></h5></span>
								</small>
							</h1>
			
									 <div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">应计利息</label>
										
										<div class="col-sm-4">
											<input type="text" id="accrued_amt" placeholder="  "
												class="col-xs-10 col-sm-5" name=accrued_amt
												value="${afterLoanRepaymentEntrty.accrued_amt }"readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">欠本金额</label>
										
										<div class="col-sm-4">
											<input type="text" id="arrears_amt" placeholder=""
												class="col-xs-10 col-sm-5" name="arrears_amt"
												value="${afterLoanRepaymentEntrty.arrears_amt }"readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">欠息金额</label>
										
										<div class="col-sm-4">
											<input type="text" id="arrears_int_amt" placeholder="  "
												class="col-xs-10 col-sm-5" name="arrears_int_amt"
												value="${afterLoanRepaymentEntrty.arrears_int_amt }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">罚息金额</label>
										
										<div class="col-sm-4">
											<input type="text" id="punitive_int_amt" placeholder=""
												class="col-xs-10 col-sm-5" name="punitive_int_amt"
												value="${afterLoanRepaymentEntrty.punitive_int_amt }" readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">剩余本金</label>
										
										<div class="col-sm-4">
											<input type="text" id="surplus_amt" placeholder="  "
												class="col-xs-10 col-sm-5" name="surplus_amt"
												value="${afterLoanRepaymentEntrty.surplus_amt }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">欠款合计</label>
										
										<div class="col-sm-4">
											<input type="text" id="arrears_all_amt" placeholder=""
												class="col-xs-10 col-sm-5" name="arrears_all_amt"
												value="${afterLoanRepaymentEntrty.arrears_all_amt }"readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
						<div class="hr hr32 hr-dotted"></div>
								
								
								
						<div class="row">
								<div class="form-group">
						<div class="col-md-offset-4 col-md-4">

							&nbsp; &nbsp; &nbsp;
							<button class="btn btn-sm btn-primary" type="button"
								onclick="javascript:history.go(-1);">
								<i class=""></i> 返回
							</button>
							&nbsp; &nbsp; &nbsp;
						</div>
					</div>
							</div>
													
								<!-- /row -->
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
    <script src="<%=path%>/js/fuelux/fuelux.wizard.min.js"></script>
	<!-- PAGE CONTENT ENDS -->
	<script type="text/javascript">
	jQuery(function($) {
		//加载下拉列表
		$("#REPAYMENT_TYPE_List").formComponents("select");
		$("#repayment_choose_List").formComponents("select");
		$("#YESORNO_List").formComponents("select");
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
