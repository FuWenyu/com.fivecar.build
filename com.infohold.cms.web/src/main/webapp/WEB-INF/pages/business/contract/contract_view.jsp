<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
					<form id="form_1" class="col-xs-12 form-horizontal" action=""method="post">
					<input type="hidden" id="contract_id" name="contract_id" value="${contractEntrty.contract_id}">
								<div class="row">
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 客户编号 </label>
										<div class="col-sm-4">
											<input type="text" id="custid" 
												class="col-xs-10 col-sm-5" name="custid" data-toggle="modal" data-target="#myModal"
												value="${contractEntrty.custid}" />
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 客户名称 </label>
										<div class="col-sm-4">
										<input type="text" id="cust_name"  
												class="col-xs-10 col-sm-5" name="cust_name"  data-toggle="modal" data-target="#myModal"
												value="${contractEntrty.cust_name}" />
										</div>
										<div class="col-md-1"></div>
									</div>
							    </div>
							    <div class="row">
									<div class="space-6"></div>
										<div class="form-group">
											<div class="col-md-2"></div>
											
											<label class="col-sm-1 control-label no-padding-right"
												for="form-field-2"> 贷款品种 </label>
											<div class="col-sm-4">
												<select name="pro_List" id="pro_List"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${pro_List}" data-select-value="${contractEntrty.product_code}"></select> 
												
											</div>
											<div class="col-md-0"></div>
											<label class="col-sm-1 control-label no-padding-right"
												for="form-field-2"> 合同金额 </label>
											<div class="col-sm-4">
												<input type="text" id="amount"  class="col-xs-10 col-sm-5" name="amount" style="text-align:right" value="${contractEntrty.amount}" />
											</div>
											<div class="col-md-1"></div>
										</div>
								</div>
								<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 起始日期 </label>
										<div class="col-sm-4">
											<input type="text" id="start_date" 
												class="date-picker col-xs-10 col-sm-5" name="start_date" data-date-format="yyyy-mm-dd"
												value="${contractEntrty.start_date }" />
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 到期日期 </label>
										<div class="col-sm-4">
											<input type="text" id="end_date"  onchange="getRate()"
												class="date-picker col-xs-10 col-sm-5" name="end_date" data-date-format="yyyy-mm-dd"
												value="${contractEntrty.end_date }" />
										</div>
										<div class="col-md-1"></div>
									</div>
							   </div>
							   <div class="row">
									<div class="space-6"></div>
										<div class="form-group">
											<div class="col-md-2"></div>
											
											<label class="col-sm-1 control-label no-padding-right"
												for="form-field-2"> 还款方式 </label>
											<div class="col-sm-4">
												<select name="repayment_type" id="repayment_type"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${rep_way_List}" data-select-value="${contractEntrty.repayment_type}"></select> 
												
											</div>
											<div class="col-md-0"></div>
											<label class="col-sm-1 control-label no-padding-right"
												for="form-field-2"> 主要担保方式 </label>
											<div class="col-sm-4">
												<select name="gua_type" id="gua_type"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${gua_type_List}" data-select-value="${contractEntrty.gua_type}"></select> 
											</div>
											<div class="col-md-1"></div>
										</div>
								</div>
								<div class="row">
									<div class="space-6"></div>
										<div class="form-group">
											<div class="col-md-2"></div>
											
											<label class="col-sm-1 control-label no-padding-right"
												for="form-field-2"> 还款账号 </label>
											<div class="col-sm-4">
												<input type="text" id="rep_acct"  class="col-xs-10 col-sm-5" name="rep_acct" style="text-align:right" value="${contractEntrty.rep_acct}" />
											</div>
											<div class="col-md-0"></div>
											<label class="col-sm-1 control-label no-padding-right"
												for="form-field-2"> 放款账号 </label>
											<div class="col-sm-4">
												<input type="text" id="loan_acct"  class="col-xs-10 col-sm-5" name="loan_acct" style="text-align:right" value="${contractEntrty.loan_acct}" />
											</div>
											<div class="col-md-1"></div>
										</div>
								</div>

								
								<div class="row">
									<div class="space-6"></div>
										<div class="form-group">
											<div class="col-md-2"></div>
											<label class="col-sm-1 control-label no-padding-right"
												for="form-field-2"> 基准利率 </label>
											<div class="col-sm-4">
												<input type="text" 
													class="col-xs-10 col-sm-5" name="rat_int_val" id="rat_int_val"
													value="${contractEntrty.rat_int_val }" />
											</div>
											<div class="col-md-0"></div>
											<label class="col-sm-1 control-label no-padding-right"
												for="form-field-2"> 利率调整时间 </label>
											<div class="col-sm-4">
												<select name="rat_adj_eff_time" id="rat_adj_eff_time"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${rat_adj_eff_time_List}" data-select-value="1"></select> 
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
										<select name="rat_exe_cha" id="rat_exe_cha"  class="col-xs-10 col-sm-3" data-emptyoption="false" data-select-list="${CHA_List}" data-select-value="${contractEntrty.rat_exe_cha}" onchange="get_rat_exe_coe()" disabled="disabled"></select> 
										
											<input type="text" id="rat_exe_coe" 
												class="col-xs-10 col-sm-2" name="rat_exe_coe"
												value="${contractEntrty.rat_exe_coe }"  onblur="get_rat_exe_coe()" readonly="readonly"/>
										</div>
										
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 执行利率 </label>
										<div class="col-sm-4">
											<input type="text" id="rat_exe_val" 
												class="col-xs-10 col-sm-5" name="rat_exe_val" readonly="readonly"
												value="${contractEntrty.rat_exe_val}" />
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
											<select name="rat_ove_cha" id="rat_ove_cha"  class="col-xs-10 col-sm-3" data-emptyoption="false" data-select-list="${CHA_List}" data-select-value="${contractEntrty.rat_ove_cha}" onchange="get_rat_ove_coe()" disabled="disabled"></select> 
											
											<input type="text" id="rat_ove_coe" 
												class="col-xs-10 col-sm-2" name="rat_ove_coe"
												value="${contractEntrty.rat_ove_coe }"   onblur="get_rat_ove_coe()" readonly="readonly"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 逾期利率 </label>
										<div class="col-sm-4">
											<input type="text" id="rat_ove_val"  readonly="readonly"
												class="col-xs-10 col-sm-5" name="rat_ove_val" 
												value="${contractEntrty.rat_ove_val }" />
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
											<select name="rat_emb_cha" id="rat_emb_cha"  class="col-xs-10 col-sm-3" data-emptyoption="false" data-select-list="${CHA_List}" data-select-value="${contractEntrty.rat_emb_cha}" onchange="get_rat_ove_coe()" disabled="disabled"></select> 
											
											<input type="text" id="rat_emb_coe" 
												class="col-xs-10 col-sm-2" name="rat_emb_coe"
												value="${contractEntrty.rat_emb_coe }"   onblur="get_rat_emb_coe()" readonly="readonly"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 挪用利率 </label>
										<div class="col-sm-4">
											<input type="text" id="rat_emb_val"  readonly="readonly"
												class="col-xs-10 col-sm-5" name="rat_emb_val" 
												value="${contractEntrty.rat_emb_val }" />
										</div>
										<div class="col-md-1"></div>
									</div>
								</div>

								<div class="row">
									<div class="row">
									<div class="form-group col-sm-6">
										<div class="form-group">
											<label class="col-sm-6 control-label" for="loan_at">贷款形式</label>
											<div class="col-sm-4 input-group">
												<input type="text" id="loan_type" value="${contractEntrty.loan_type}" name="loan_type"
													class="form-control" placeholder="" >
											</div>
										</div>
									</div>
									<div class="form-group col-sm-6">
										<div class="form-group">
											<label class="col-sm-5 control-label" for="loan_use">贷款用途</label>
											<div class="col-sm-4 input-group">
												<input type="text" id="loan_use" value="${contractEntrty.loan_use}" name="loan_use"
													class="form-control" placeholder="">
											</div>
										</div>
									</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-sm-6">
										<div class="form-group">
											<label class="col-sm-6 control-label" for="loan_agr_type">涉农贷款标识</label>
											<div class="col-sm-4 input-group">
												<input type="text" id="loan_agr_type" value="${contractEntrty.loan_agr_type}" name="loan_agr_type"
													class="form-control" placeholder="" >
											</div>
										</div>
									</div>
									<div class="form-group col-sm-6">
										<div class="form-group">
											<label class="col-sm-5 control-label" for="loan_agr_cla">涉农贷款分类</label>
											<div class="col-sm-4 input-group">
												<input type="text" id="loan_agr_cla" value="${contractEntrty.loan_agr_cla}" name="loan_agr_cla"
													class="form-control" placeholder="">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-sm-6">
										<div class="form-group">
											<label class="col-sm-6 control-label" for="branch_no">经办机构</label>
											<div class="col-sm-4 input-group">
												<input type="text" id="branch_no" value="${sessionScope.userSession.branchName}" name="branch_no" readonly="readonly"
													class="form-control" placeholder="" >
											</div>
										</div>
									</div>
									<div class="form-group col-sm-6">
										<div class="form-group">
											<label class="col-sm-5 control-label" for="cust_manager">经办客户经理</label>
											<div class="col-sm-4 input-group">
												<input type="text" id="cust_manager" value="${sessionScope.userSession.userName}"name="cust_manager" readonly="readonly"
													class="form-control" placeholder="">
											</div>
										</div>
									</div>
								</div>
								<div class="hr hr32 hr-dotted"></div>
								<div class="space-6"></div>
									<div class="center">
							        <button class="btn btn-sm btn-primary" type="button" onclick="javascript:history.go(-1);">返回</button>
								</div>
						<!--引入利率信息  -->
							<jsp:include page="getInterestRate.jsp"></jsp:include>
					</form>
			</div>
		</div>
	<!-- PAGE CONTENT ENDS -->
	<script type="text/javascript">
		//表单提交
	jQuery(function($) {
		//加载下拉列表
		$("#pro_List").formComponents("select");
		$("#gua_type").formComponents("select");
		$("#repayment_type").formComponents("select");
		$("#rat_ove_cha").formComponents("select");
		$("#rat_exe_cha").formComponents("select");
		$("#rat_emb_cha").formComponents("select");
		$("#rat_adj_eff_time").formComponents("select");
		//Date Picker 控件
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		}); 
	})
	</script>
