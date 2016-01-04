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
				<input type="hidden" id="xh" name="xh" value="${bizExtensionEntity.xh}">

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
											for="form-field-2" onfocus="selectinfo()">系统借据编号</label>
											
										
										<div class="col-sm-4">
										
										<input type="text" id="duebill_id"
										        class="col-xs-10 col-sm-5" name="duebill_id" placeholder="请选择借据" readonly="readonly" disabled="disabled"
										value="${bizExtensionEntity.duebill_id}"  />
										<div id="duebill_id_font" class="help-block red" onclick="clean()"></div>													
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">展期金额</label>
										
										<div class="col-sm-4">
											<input type="text" id="zqje" placeholder="" onblur="clean()" readonly="readonly" disabled="disabled"
												class="col-xs-10 col-sm-5" name="zqje"  value="${bizExtensionEntity.zqje}"/>
										<div class="help-block red" onclick="clean()"  ></div>	
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								
								
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right" 
											for="form-field-2">申请时间</label>
										
										<div class="col-sm-4">
										<input type="text" id="sqsj"
										        class="col-xs-10 col-sm-5" name="sqsj"  value="${bizExtensionEntity.sqsj}"  readonly="readonly" disabled="disabled"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2" >展期到期日期</label>
										
										<div class="col-sm-4">
										<input type="text" id="zqdqrq" 
										        class="col-xs-10 col-sm-5 date-picker" name="zqdqrq" value="${bizExtensionEntity.zqdqrq}"  data-date-format="yyyy-mm-dd"/>
                                        </div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right" 
											for="form-field-2">新利率标志</label>
										
										<div class="col-sm-4">
										<select id="sfzxxll" class="col-xs-10 col-sm-5"  name="sfzxxll"
								 		data-select-list="${ynList }" data-select-value="${bizExtensionEntity.sfzxxll}" ></select>
										
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2" ></label>
										
										<div class="col-sm-4">
										
                                        </div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">展期次数</label>
										
										<div class="col-sm-4">
										<input type="text" id="zqcs" 
											class="col-xs-10 col-sm-5" name="zqcs" onblur="clean()" readonly="readonly"  value="${bizExtensionEntity.zqcs}" disabled="disabled"/>
                                        </div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">最大展期日期</label>
										
										<div class="col-sm-4">
											<input type="text" id="zdzqrq" 
												class="col-xs-10 col-sm-5" name="zdzqrq"
												value="${bizExtensionEntity.zdzqrq}" readonly="readonly" disabled="disabled"/>
											
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">展期原因</label>
										
										<div class="col-sm-4">
										<textarea rows="5" cols="10"  class="col-xs-10 col-sm-5" id="sqyy" name="sqyy" >"${bizExtensionEntity.sqyy}"</textarea>
                                        </div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">备注</label>
										
										<div class="col-sm-4">
											<textarea rows="5" cols="10"  class="col-xs-10 col-sm-5" id="remark" name="remark" >"${bizExtensionEntity.remark}"</textarea>
											
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
											<input type="text" id="contract_id" placeholder="  "
												class="col-xs-10 col-sm-5" name=contract_id
												value="${bizExtensionEntity.contract_id }" readonly="readonly" />
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">合同金额</label>
										
										<div class="col-sm-4">
											<input type="text" id="agreement_amount" placeholder=""
												class="col-xs-10 col-sm-5" name="agreement_amount"
												value="${bizExtensionEntity.amount }"readonly="readonly"/>
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
												value="${bizExtensionEntity.product_name }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">还款方式</label>
										
										<div class="col-sm-4">
											<input type="text" id="hkfs" placeholder=""
												class="col-xs-10 col-sm-5" name="hkfs"
												value="${bizExtensionEntity.hkfs }"readonly="readonly"/>
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
												value="${bizExtensionEntity.cust_id }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">客户名称</label>
											
										
										<div class="col-sm-4">
											<input type="text" id=cust_name placeholder=""
												class="col-xs-10 col-sm-5" name="custchname"
												value="${bizExtensionEntity.custchname }" readonly="readonly"/>
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
											<input type="text" id="constart" placeholder="   "
												class="col-xs-10 col-sm-5" name="constart"
												value="${bizExtensionEntity.htstart_date }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">到期日期</label>
											
										
										<div class="col-sm-4">
											<input type="text" id="conend" placeholder=""
												class="col-xs-10 col-sm-5" name="conend"
												value="${bizExtensionEntity.htend_date }" readonly="readonly"/>
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
											for="form-field-2">借据号</label>
										
										<div class="col-sm-4">
											<input type="text" id="duebill_acct" placeholder="  "
												class="col-xs-10 col-sm-5" name="duebill_acct"
												value="${bizExtensionEntity.jjbh }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据金额</label>
										
										<div class="col-sm-4">
											<input type="text" id="duebill_amount" placeholder=""
												class="col-xs-10 col-sm-5" name="duebill_amount"
												value="${bizExtensionEntity.duebill_amount }"readonly="readonly"/>
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
												value="${bizExtensionEntity.rat_int_val }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据执行利率</label>
										
										<div class="col-sm-4">
											<input type="text" id="rat_exe_val" placeholder=""
												class="col-xs-10 col-sm-5" name="rat_exe_val"
												value="${bizExtensionEntity.rat_exe_val }"readonly="readonly"/>
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
												value="${bizExtensionEntity.rat_ove_val }" readonly="readonly" />
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据挪用利率</label>
										
										<div class="col-sm-4">
											<input type="text" id="rat_emb_val" placeholder=""
												class="col-xs-10 col-sm-5" name="rat_emb_val"
												value="${bizExtensionEntity.rat_emb_val }" readonly="readonly"/>
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
												value="${bizExtensionEntity.loan_acct_no}"readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据状态</label>
										
										<div class="col-sm-4">
											<input type="text" id="status" placeholder=""
												class="col-xs-10 col-sm-5" name="status"
												value="${bizExtensionEntity.sqzt }" readonly="readonly"/>
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
											<input type="text" id="billstart" placeholder="  "
												class="col-xs-10 col-sm-5" name="billstart"
												value="${bizExtensionEntity.jjstart_date }" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">借据到期日期</label>
										
										<div class="col-sm-4">
											<input type="text" id="billend" placeholder=""
												class="col-xs-10 col-sm-5" name="billend"
												value="${bizExtensionEntity.jjend_date }"readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>

						<div class="hr hr32 hr-dotted"></div>
						<h1 class="breadcrumb">	
								<small>
									<span><h5><b>欠款信息</b></h5></span>
								</small>
							</h1>
			
									<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">未还本金欠款 </label>
										
										<div class="col-sm-4">     
											<input type="text" id="unpaidPrincipalArrears" placeholder="  "
												class="col-xs-10 col-sm-5" name="unpaidPrincipalArrears" value="0"
												readonly="readonly" />
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">未还利息欠款</label>
										
										<div class="col-sm-4">
											<input type="text" id="unpaidInterestArrears" placeholder=""
												class="col-xs-10 col-sm-5" name="unpaidInterestArrears" readonly="readonly" value="0"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								
									<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">未还罚息欠款 </label>
										
										<div class="col-sm-4">
											<input type="text" id="penaltyArrears" placeholder="   "
												class="col-xs-10 col-sm-5" name="penaltyArrears" value="0" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">未还复利欠款</label>
										
										<div class="col-sm-4">
											<input type="text" id="compoundingInterestArrears" placeholder=""
												class="col-xs-10 col-sm-5" name="compoundingInterestArrears" value="0" readonly="readonly"/>
										</div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								
									<div class="row">
									<div class="space-6"></div>									
									<div class="form-group">										
										<div class="col-md-1"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2">其他欠款</label>
										
										<div class="col-sm-4">
											<input type="text" id="otherArrears" placeholder="   "
												class="col-xs-10 col-sm-5" name="otherArrears" value="0" readonly="readonly"/>
										</div>
										<div class="col-md-0"></div>
										<div class="col-md-1"></div>
									</div>									
								</div>
								
							<div class="hr hr32 hr-dotted"></div>		
								
								
						<div class="row">
								<div class="form-group">
						<div class="col-md-offset-4 col-md-4">
							<button class="btn btn-sm btn-primary" type="button" onclick="subForm()">
								<i class=""></i> 保存
							</button>

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
		<jsp:include page="./extension-dialog.jsp"></jsp:include> 
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
	
	
		//表单提交
		function subForm() {
		if (!checkData('duebill_id', '客户编号', 'input')) {
			return;
		}
		if (!checkData('sfzxxll', '客户编号', 'input')) {
			return;
		}
		if (!checkData('zqdqrq', '客户编号', 'input')) {
			return;
		}
		if (document.getElementById("billend").value>document.getElementById("zqdqrq").value) {
			f_alert("<%=path%>","借据到期日期不得大于展期到期日期！","");
			return;
		}
			if (document.getElementById("penaltyArrears").value>0) {
				f_alert("<%=path%>","存在未还罚息欠款，不可以展期！","");
				return;
			}
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/extension_editSave.do",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						f_alert("<%=path%>","success","extension_getList.do");
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
	</script>
	</body>
</html>
