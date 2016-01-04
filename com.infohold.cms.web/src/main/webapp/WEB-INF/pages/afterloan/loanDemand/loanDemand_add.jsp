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
<body id="iframe_body"	onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display: none"></div>
	<div class="page-content" id="loadPageContent">
		<form class="form-horizontal" id="sub_form" name="sub_form" action="#" method="post">
			<input type="hidden" id="duebill_acct" name="duebill_acct" value="${map.duebill_acct }" >
			<h3 class="header smaller lighter grey">催收记录</h3>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="demand_status">催收状态</label>
							<div class="col-sm-6 input-group">
								<c:if test="${map.loandemand_type==null || map.loandemand_type==''}">
									<select id="demand_status" class="form-control"  name="demand_status" 
										data-select-value="1" data-select-list="${demand_statusList }" >
									</select>
								</c:if>
								<c:if test="${map.loandemand_type!=null || map.loandemand_type!=''}">
									<select id="demand_status" class="form-control"  name="demand_status" disabled="disabled"
										data-select-value="1" data-select-list="${demand_statusList }" >
									</select>
								</c:if>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_type">催收客户类型</label>
							<div class="col-sm-6 input-group">
								<select id="cust_type" class="form-control"  name="cust_type" 
									data-select-value="1" data-select-list="${pro_typeList }" >
								</select>
							</div>
						</div>
					</div>	
				</div>		
			 	<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="personliable">催收人名称</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="personliable" name="personliable"
									class="form-control" placeholder="催收人名称" >
							</div>
						</div>
					</div>
					<div class="form-group  col-sm-6">
							<label class="col-sm-4 control-label" for="demand_type">催收类型</label>
							<div class="col-sm-6 input-group">
								<select id="demand_type" class="form-control"  name="demand_type" disabled="disabled"
									data-select-value="${map.demand_type }" data-select-list="${demand_typeList }" >
								</select>
							</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="create_date">催收日期</label>
							<div class="col-sm-6 input-group">
								<input id="create_date" name="create_date"
									class="form-control date-picker" type="text" data-date-format="yyyy-mm-dd" value="${map.create_date }"/>
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="way">催收方式</label>
							<div class="col-sm-6 input-group">
								<select id="way" class="form-control"  name="way" 
									data-select-value="1" data-select-list="${demand_wayList }" >
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="address">催收地点</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="address" name="address"
									class="form-control" placeholder="催收地点" >
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="contact_name">联系人名称</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="contact_name"  name="contact_name" 
									class="form-control" placeholder="联系人名称"/>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="contact_job">联系人职位</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="contact_job" name="contact_job"
									class="form-control" placeholder="联系人职位" >
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_tel">联系人电话</label>
							<div class="col-sm-6 input-group">
							<input type="text" id="borrower_tel" name="borrower_tel"
									class="form-control" placeholder="联系人电话">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="refund_date">落实还款日期</label>
							<div class="col-sm-6 input-group">
								<input id="refund_date" name="refund_date"
									class="form-control date-picker" type="text" data-date-format="yyyy-mm-dd" >
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="effect">催收效果</label>
							<div class="col-sm-6 input-group">
							<input type="text" id="effect" name="effect"
									class="form-control" placeholder="催收效果">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="date_next">下次催收日期</label>
							<div class="col-sm-6 input-group">
								<input id="date_next" name="date_next"
									class="form-control date-picker" type="text" data-date-format="yyyy-mm-dd" >
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="way_next">下次催收方式</label>
							<div class="col-sm-6 input-group">
								<select id="way_next" class="form-control"  name="way_next" 
										data-select-value="1" data-select-list="${demand_wayList }" >
									</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="acceptance_date">承诺还款日期</label>
							<div class="col-sm-6 input-group">
								<input id="acceptance_date" name="acceptance_date"
									class="form-control date-picker" type="text" data-date-format="yyyy-mm-dd" >
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="collateral_change">抵押物变动情况</label>
							<div class="col-sm-6 input-group">
							<input type="text" id="collateral_change" name="collateral_change"
									class="form-control" placeholder="抵押物变动情况">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="guard_date">保全日期</label>
							<div class="col-sm-6 input-group">
								<input id="guard_date" name="guard_date"
									class="form-control date-picker" type="text" data-date-format="yyyy-mm-dd" >
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="guard_numer">保全次数</label>
							<div class="col-sm-6 input-group">
							<input type="text" id="guard_numer" name="guard_numer"
									class="form-control" placeholder="保全次数">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="dqzsq">当前追索权状况</label>
							<div class="col-sm-6 input-group">
							<input type="text" id="dqzsq" name="dqzsq"
									class="form-control" placeholder="当前追索权状况">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<c:if test="${map.loandemand_type==null || map.loandemand_type==''}">
								<label class="col-sm-4 control-label" for="noticeback_date">催收通知书(回执)日期 </label>
								<div class="col-sm-6 input-group">
									<input id="noticeback_date" name="noticeback_date"
										class="form-control date-picker" type="text" data-date-format="yyyy-mm-dd" >
									<span class="input-group-addon"> 
										<i class="icon-calendar bigger-110"></i>
									</span>
								</div>
							</c:if>
							<c:if test="${map.loandemand_type!=null || map.loandemand_type!=''}">
								<label class="col-sm-4 control-label" for="noticeback_date"> </label>
								<div class="col-sm-6 input-group">
									<input id="noticeback_date" name="noticeback_date"
										class="form-control date-picker" type="hidden" data-date-format="yyyy-mm-dd" >
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower">落实借款人名称</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="borrower" name="borrower"
									class="form-control" placeholder="落实借款人名称 " >
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="guarantor">落实保证人名称</label>
							<div class="col-sm-6 input-group">
							<input type="text" id="guarantor" name="guarantor"
									class="form-control" placeholder="落实保证人名称">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_desire">借款人还款意愿</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="borrower_desire" name="borrower_desire"
									class="form-control" placeholder="借款人还款意愿 " >
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_ability">借款人还款能力</label>
							<div class="col-sm-6 input-group">
							<input type="text" id="borrower_ability" name="borrower_ability"
									class="form-control" placeholder="借款人还款能力">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="guarantor_desire">担保方还款意愿</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="guarantor_desire" name="guarantor_desire"
									class="form-control" placeholder="担保方还款意愿 " >
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="guarantor_ability">担保方代偿能力</label>
							<div class="col-sm-6 input-group">
							<input type="text" id="guarantor_ability" name="guarantor_ability"
									class="form-control" placeholder="担保方代偿能力">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="opinion">不良贷款客户关系建议</label>
						<div class="col-sm-6">
							<textarea class="form-control" name="opinion" id="opinion"
								 rows="3"></textarea>	
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="trend">趋势预测</label>
						<div class="col-sm-6">
							<textarea class="form-control" name="trend" id="trend"
								 rows="3"></textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="handle">不良贷款的处置思路</label>
						<div class="col-sm-6">
							<textarea class="form-control" name="handle" id="handle"
								 rows="3"></textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="measures">措施与对策</label>
						<div class="col-sm-6">
							<textarea class="form-control" name="measures" id="measures"
								 rows="3"></textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="ps">备注</label>
						<div class="col-sm-6">
							<textarea class="form-control" name="ps" id="ps"
								 rows="3"></textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="branch_noname">经办机构</label>
							<div class="col-sm-6 input-group">
								<input type="hidden" id="branch_no"  name="branch_no" value="${map.branch_no }"/>
								<input type="text" id="branch_noname"  name="branch_noname" value="${map.branch_noname }"
									class="form-control" placeholder="经办机构" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_managername">客户经理</label>
							<div class="col-sm-6 input-group">
								<input type="hidden" id="cust_manager"  name="cust_manager" value="${map.cust_manager }"/>
								<input type="text" id="cust_managername"  name="cust_managername" value="${map.cust_managername }"
									class="form-control" placeholder="经办客户经理" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>	
				<!-- /row 横线-->
				<div class="clearfix form-actions">
				  <div class="row">
					<div class="col-md-offset-3 col-md-9">
						<button class="btn btn-info" type="button" onclick="subForm();">
							<i class="icon-ok bigger-110"></i> 提交
						</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn" type="button" onclick="javascript:history.go(-1);">
							<i class="icon-reply bigger-110"></i> 返回
						</button>
					</div>
				</div>
			  </div>
			</form>
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
	<script type="text/javascript">
	//时间控件
	jQuery(function($){		
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	});
	//下拉框
	jQuery(function($){
		$("#demand_status").formComponents("select");
		$("#demand_type").formComponents("select");
		$("#way").formComponents("select");
		$("#way_next").formComponents("select");
		$("#cust_type").formComponents("select");
	});
	function subForm(){
		if($("#guard_numer").val()!=null &&$("#guard_numer").val()!="" ){
			if (!checkData('guard_numer', '保全人数', 'number')) {
				return false;
			}
		}
		$("select").prop("disabled",false);
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/loanDemand_addSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					f_alert("<%=path%>","success","loanDemand_get.do?duebill_acct="+$("#duebill_acct").val());
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