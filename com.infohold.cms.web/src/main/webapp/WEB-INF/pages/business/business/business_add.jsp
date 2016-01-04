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
		<div id="modal_area"></div>
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				
				<div class="widget-body">
					<div class="widget-main">
						<div id="fuelux-wizard" class="row-fluid" data-target="#step-container">
							<ul class="wizard-steps">
								<li data-target="#step1" class="active">
									<span class="step">1</span>
									<span class="title">贷款申请基本信息</span>
								</li>

								<li data-target="#step2">
									<span class="step">2</span>
									<span class="title">贷款申请利率信息</span>
								</li>

								<li data-target="#step3">
									<span class="step">3</span>
									<span class="title">贷款申请经办信息</span>
								</li>
							</ul>
						</div>
						<hr />
					<form id="form_1" class="col-xs-12 form-horizontal" action=""method="post">
						<div class="step-content row-fluid position-relative" id="step-container">
							<div class="step-pane active" id="step1">
								<div class="row">
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 客户编号 </label>
										<div class="col-sm-4">
											<input type="text" id="cust_id" name="cust_id"  value="${contractEntrty.custid}"  onclick="selectCustomer(1);"
												class="ol-xs-10 col-sm-5" readonly="readonly">
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 客户名称 </label>
										<div class="col-sm-4">
										<input type="hidden" id="khlx1" name="khlx1">
										<input type="text" id="custchname" name="custchname"  value="${contractEntrty.custchname}"  onclick="selectCustomer(1);"
								class="col-xs-10 col-sm-5 " readonly="readonly">
										</div>
										<div class="col-md-1"></div>
									</div>
							    </div>
							    <div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 产品名称 </label>
										<div class="col-sm-4">
								 			<input type="text" id="prodname"  
											placeholder="请输入选择产品"	class="col-xs-10 col-sm-5" name="prodname" onclick="selectProduct(1);" />
											<input type="hidden" id="xhbz" name="xhbz">
											<input type="hidden" id="khlx2" name="khlx2">
										</div>
										<div class="col-md-0"></div>
											<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 产品编号 </label>
										<div class="col-sm-4">
								 			<input type="text" id="prodcode"  
											placeholder="请输入选择产品"	class="col-xs-10 col-sm-5" name="prodcode" onclick="selectProduct(1);" />
										</div>
										<div class="col-md-1"></div>
									</div>
							   </div>
							   <div class="row">
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 币种</label>
										<div class="col-sm-4">
											<select id="ccycode" class="col-xs-10 col-sm-5"  name="ccycode"  data-select-list="${ccycodeList }" data-select-value="CNY"></select>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 金额 </label>
										<div class="col-sm-4">
										<input type="text" id="amount"  onblur="getLimitShow()"
												class="col-xs-10 col-sm-5" name="amount" />
										</div>
										<div class="col-md-1"></div>
									</div>
							    </div>
							    <div class="row">
									<div class="form-group">
										<!-- 
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 贷款用途</label>
										<div class="col-sm-4">
											<select id="dkyt" class="col-xs-10 col-sm-5"  name="dkyt"
								 			data-select-list="${dkytList }" ></select>
										</div> 
										-->
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 主要担保方式</label>
										<div class="col-sm-4">
											<select id="zydbfs" class="col-xs-10 col-sm-5"  name="zydbfs"
								 			data-select-list="${dbList }" ></select>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 贷款期限 </label>
										<div class="col-sm-4">
										<input type="text" id="dkqx"  
											placeholder="请输入整月数"	class="col-xs-10 col-sm-5" name="dkqx" onblur="checkNumber()"/>
										</div>
										<div class="col-md-1"></div>
									</div>
							    </div>
							    <!--
							    <div class="row">
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 还款方式</label>
										<div class="col-sm-4">
											<select id="hkfs" class="col-xs-10 col-sm-5"  name="hkfs"
								 			data-select-list="${hkfsList }" ></select>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 主要担保方式 </label>
										<div class="col-sm-4">
										<select id="zydbfs" class="col-xs-10 col-sm-5"  name="zydbfs"
								 			data-select-list="${dbList }" ></select>
										</div>
										<div class="col-md-1"></div>
									</div>
							    </div>
							    -->
							    <div class="row" id="limit" style="display: none">
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 关联额度编号</label>
										<div class="col-sm-4">
											<input type="text" id="limitid"  
											placeholder="请输入选择关联额度编号"	class="col-xs-10 col-sm-5" name="limitid" onclick="selectLimit(1);" />
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 额度可用余额</label>
										<div class="col-sm-4">
										<input type="text" id="creditBalance"  class="col-xs-10 col-sm-5" name="creditBalance" disabled="disabled"/>
											<input type="hidden" id="endDate" name="endDate">
										</div>
										<div class="col-md-1"></div>
									</div>
							    </div>
							</div>

							<div class="step-pane" id="step2">
								<div class="row">
									<div class="space-6"></div>
										<div class="form-group">
											<div class="col-md-2"></div>
												<label class="col-sm-1 control-label no-padding-right"
													for="form-field-2">利率获取方式 </label>
												<div class="col-sm-4">
												<select name="jzllhqfs" id="jzllhqfs"  class="col-xs-10 col-sm-5" data-emptyoption="true" data-select-list="${jzllhqfsList}" onblur="getjzll()"></select>
												</div>
											<div class="col-md-0"></div>
											
											<label class="col-sm-1 control-label no-padding-right"
												for="form-field-2"> 基准利率值</label>
											<div class="col-sm-4">
												<input type="text" 
													class="col-xs-10 col-sm-5" name="jzllz" id="jzllz" readonly="readonly"/>
											</div>
											<div class="col-md-1"></div>
										</div>
								</div>
								<!--
								<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 利率计算方式 </label>
										<div class="col-sm-4">
											<select name="zxlljsfs" id="zxlljsfs"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${zxlljsfsList}" ></select>
										</div>
										<div class="col-md-1"></div>
									</div>
								</div>
								<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 执行变动系数 </label>
										<div class="col-sm-4">
											<select name="zxllbdfs" id="zxllbdfs"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${llbdlxList}" data-select-value="P" onchange="get_zxllbdxs()"></select>
											<input type="text" id="zxllbdxs" 
												class="col-xs-10 col-sm-2" name="zxllbdxs"
												value="${bizBusinessEntity.zxllbdxs }"  onblur="get_zxllbdxs()" onclick="checkjzllz()"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 执行利率值</label>
										<div class="col-sm-4">
											<input type="text" id="zxll" 
												class="col-xs-10 col-sm-5" name="zxll" readonly="readonly"
												value="${bizBusinessEntity.zxll}" />
										</div>
										<div class="col-md-1"></div>
									</div>
								</div>
								<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 逾期变动系数 </label>
										<div class="col-sm-4">
											<select name="yqllbdfs" id="yqllbdfs"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${llbdlxList}" data-select-value="P" onchange="get_yqllbdxs()"></select>
											<input type="text" id="yqllbdxs" 
												class="col-xs-10 col-sm-2" name="yqllbdxs"
												value="${bizBusinessEntity.yqllbdxs }"   onblur="get_yqllbdxs()" onclick="checkjzllz()"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 逾期利率值</label>
										<div class="col-sm-4">
											<input type="text" id="yqll"  readonly="readonly"
												class="col-xs-10 col-sm-5" name="yqll" 
												value="${bizBusinessEntity.yqll }" />
										</div>
										<div class="col-md-1"></div>
									</div>
								</div>
								<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 挪用变动系数 </label>
										<div class="col-sm-4">
											<select name="nyllbdfs" id="nyllbdfs"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${llbdlxList}" data-select-value="P" onchange="get_nyllbdxs()"></select>
											<input type="text" id="nyllbdxs" 
												class="col-xs-10 col-sm-2" name="nyllbdxs"
												value="${bizBusinessEntity.nyllbdxs }"   onblur="get_nyllbdxs()" onclick="checkjzllz()"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 挪用利率值</label>
										<div class="col-sm-4">
											<input type="text" id="nyll"  readonly="readonly"
												class="col-xs-10 col-sm-5" name="nyll" 
												value="${bizBusinessEntity.nyll }" />
										</div>
										<div class="col-md-1"></div>
									</div>
								</div>
								<div class="row">
									<div class="space-6"></div>
										<div class="form-group">
											<div class="col-md-2"></div>
												<label class="col-sm-1 control-label no-padding-right"
													for="form-field-2">利率调整方式 </label>
												<div class="col-sm-4">
												<select name="lltzsj" id="lltzsj"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${lltzfsList}" ></select>
												</div>
											<div class="col-md-0"></div>
											
											<label class="col-sm-1 control-label no-padding-right"
												for="form-field-2"> 复利标志</label>
											<div class="col-sm-4">
												<select name="flbz" id="flbz"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${flbzList}" ></select>
											</div>
											<div class="col-md-1"></div>
										</div>
								</div>
								-->
							</div>
					
								<div class="step-pane" id="step3">
									<div class="row">
										<div class="row">
									<div class="form-group col-sm-6">
										<div class="form-group">
											<label class="col-sm-6 control-label" for="loan_agr_type">经办机构</label>
											<div class="col-sm-4 input-group">
												<input type="text" id="jbjgmc" value="${jbjgmc}" name="jbjgmc"
													class="form-control" disabled="disabled">
												<input type="hidden" id="jbjgbh" value="${jbjgbh}" name="jbjgbh">
											</div>
										</div>
									</div>
									<div class="form-group col-sm-6">
										<div class="form-group">
											<label class="col-sm-4 control-label" for="loan_agr_cla">经办客户经理</label>
											<div class="col-sm-4 input-group">
												<input type="text" id="jbkhjlmc" value="${jbkhjlmc}" name="jbkhjlmc"
													class="form-control" disabled="disabled">
												<input type="hidden" id="jbkhjlbh" value="${jbkhjlbh}" name="jbkhjlbh">
											</div>
										</div>
									</div>
								</div>
							</div>
									</div>
								</div>
								<!--引入利率信息  -->
									<jsp:include page="getInterestRate.jsp"></jsp:include>
					</form>
					<hr />
						<div class="row-fluid wizard-actions">
							<button class="btn btn-prev">
								<i class="icon-arrow-left"></i>
								Prev
							</button>

							<button class="btn btn-success btn-next" data-last="Finish ">
								Next
								<i class="icon-arrow-right icon-on-right"></i>
							</button>
						</div>
					</div><!-- /widget-main -->
				</div><!-- /widget-body -->
			</div>
		</div>
		</div>
		<!-- 引模态 -->
 <jsp:include page="../../common/customer_modal.jsp"></jsp:include><!-- 引客户 -->
 <jsp:include page="../business/business_limit.jsp"></jsp:include><!-- 额度信息 -->
 <jsp:include page="../business/business_getProduct.jsp"></jsp:include><!-- 产品信息 -->
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
	/******是否关联额度信息*******/
	function getLimitShow(){
		 var xhbz=document.getElementById("xhbz").value;
		if(xhbz=="2"){
			document.getElementById("limit").style.display="block";
		}else{
			document.getElementById("limit").style.display="none";
		}
	};
	</script>
	<script type="text/javascript">
		//表单提交
	jQuery(function($) {
		//加载下拉列表
		$("#ccycode").formComponents("select");
		$("#dkyt").formComponents("select");
		$("#hkfs").formComponents("select");
		$("#zydbfs").formComponents("select");
		$("#xhbz").formComponents("select");
		$("#jzllhqfs").formComponents("select");
		$("#zxlljsfs").formComponents("select");
		$("#zxllbdfs").formComponents("select");
		$("#yqllbdfs").formComponents("select");
		$("#nyllbdfs").formComponents("select");
		$("#lltzsj").formComponents("select");
		$("#flbz").formComponents("select");
		//Date Picker 控件
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
		
		
				$('#fuelux-wizard').ace_wizard()
				.on('change' , function(e, info){
					
					//alert('change');
					setHash('${pageContext.request.contextPath}');
				})
				.on('finished', function(e) {
					//必输项校验
					if (!checkData('cust_id', '客户编号', 'input')) {
						return;
					}
					if (!checkData('prodcode', '客户编号', 'input')) {
						return;
					}
					if (!checkData('amount', '申请金额', 'input')) {
						return;
					}
					if (!checkData('amount', '申请金额', 'number')) {
						return;
					}
					if (!checkData('amount', '申请金额', 'space')) {
						return;
					}
					if (!checkData('dkqx', '申请期限', 'input')) {
						return;
					}
					if (!checkData('jzllhqfs', '基准利率浮动方式', 'input')) {
						return;
					}
					if (!checkData('jzllz', '基准利率', 'input')) {
						return;
					}
/****					if (!checkData('zxllbdxs', '执行利率变动系数', 'input')) {
						return;
					}
					if (!checkData('yqllbdxs', '逾期利率变动系数', 'input')) {
						return;
					}
					if (!checkData('nyllbdxs', '挪用利率变动系数', 'input')) {
						return;
					}
					
****/					
					//可用余额校验
					if (document.getElementById("xhbz").value=="2") {
						if (parseFloat(document.getElementById("amount").value)>parseFloat(document.getElementById("creditBalance").value)) {
							f_alert("<%=path%>","可用余额不足！","");
							return false;
						}	
					}
					//客户类型校验
					var khlx1=document.getElementById("khlx1").value;
					var khlx2=document.getElementById("khlx2").value;
					if (khlx1=="个人客户"&&khlx2=="1") {
						f_alert("<%=path%>","产品客户类型与当前客户类型不一致！","");
						return false;
					}else if(khlx1=="企业客户"&&khlx2=="2") {
						f_alert("<%=path%>","产品客户类型与当前客户类型不一致！","");
						return false;
					}
					$.ajax({
						type : "POST",
						url : "<%=path%>/mvc/business_addSave.do",
						data : $("#form_1").serialize(),
						async : false,
						dataType:'json',
						success : function(data) {
							if(data.msg == "success"){
								f_alert("<%=path%>","success","business_getList.do");
							}else{
								f_alert("<%=path%>",data.msg,"");
							}
						},
						error : function(msg) {
							var exp="分配出错 " + msg;
							f_alert("<%=path%>",exp,"");
						}
					});
				});
			})
			//校验期限
			function checkNumber() {
				var sqqx=document.getElementById("dkqx").value;
				if (isNaN(sqqx)||sqqx<=0||!(/^\d+$/.test(sqqx))) {
					alert("申请期限只能为正整数！");
					document.getElementById("dkqx").value="";
					return false;
				}
			}
			//校验基准利率值
			function checkjzllz() {
				var jzllz=document.getElementById("jzllz").value;
				if (jzllz==null||jzllz=="") {
					alert("请输入基准利率！");
					document.getElementById("zxllbdxs").value="";
					document.getElementById("yqllbdxs").value="";
					document.getElementById("nyllbdxs").value="";
					return false;
				}
			}
	</script>
	</body>
</html>
