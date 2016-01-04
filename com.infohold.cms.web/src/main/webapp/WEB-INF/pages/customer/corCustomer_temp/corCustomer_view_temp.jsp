<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<body id="iframe_body"
	onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display: none"></div>
	<div class="page-content" id="loadPageContent">
		<form class="form-horizontal" id="sub_form" name="sub_form" action="#"method="post">
			<input type="hidden" id="id"  name="id" value="${corCustomerEntity.id }"/>
			<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
				<!--  客户概况信息 -->
			<h3 class="header smaller lighter grey">客户概况信息</h3>
			  <div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_id">客户编号</label>
							<div class="col-sm-6 input-group">
								<label  class="control-label">${corCustomerEntity.cust_id }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custchname">客户中文全称</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.custchname }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custjcname">客户简称</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.custjcname }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custenname">客户外文全称</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.custenname }</label>
							</div>
						</div>
					</div>
				</div>
				 <div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="organizationcode">组织机构代码</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.organizationcode }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_property">借款人性质</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='cust_property.${corCustomerEntity.cust_property }' /></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="file_type">文件类型</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='cor_id_type.${corCustomerEntity.file_type }' /></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="file_number">文件编号</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.file_number }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="country">所属国别</label>
							<div class="col-sm-6 input-group">	
								<label class="control-label" ><fmt:message key='nationality.${corCustomerEntity.country }' /></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="canton">行政区划</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='province.${corCustomerEntity.canton }' /></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="corproate_startdate">企业成立年份</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.corproate_startdate }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="register_no">登记注册编号</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.register_no }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
					  	<div class="form-group">
							<label class="col-sm-4 control-label" for="register_StartDate">注册登记起始日期</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.register_StartDate }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label"	for="register_EndDate">注册登记到期日期</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.register_EndDate }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label"	for="taxcode">国税登记证号码</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.taxcode }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label"	for="rentcode">地税登记证号码</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.rentcode }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label">注册资本币种</label>
							<div class="input-group col-sm-6">
								<label class="control-label" ><fmt:message key='currency_type.${corCustomerEntity.registercapital_currency }' /></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="registercapital_amount">注册资本金额(元)</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.registercapital_amount }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label">实收资本币种</label>
							<div class="input-group col-sm-6">
								<label class="control-label" ><fmt:message key='currency_type.${corCustomerEntity.paidincaptial_currency }' /></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="paidincapital_amount">实收资本金额(元)</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.paidincapital_amount }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label">销售额（元/年）</label>
							<div class="input-group col-sm-6">
								<label class="control-label" >${corCustomerEntity.sales_amount }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="general_assets">资产总额(元)</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.general_assets }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label">经营地址</label>
							<div class="input-group col-sm-6">
								<label class="control-label" >${corCustomerEntity.manage_address }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="practitioner_number">从业人数</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.practitioner_number }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label">基本账户开户行</label>
							<div class="input-group col-sm-6">
								<label class="control-label" >${corCustomerEntity.basicaccount_bank }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="basicaccount_number">基本存款账号</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.basicaccount_number }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="loancard_no">贷款卡号</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.loancard_no }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="loancard_hairpinDate">贷款卡发卡日期</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.loancard_hairpinDate }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="loancard_newDate">贷款卡最新年检日期</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.loancard_newDate }</label>
							</div>
						</div>
					</div>
				</div>				
			<!--联系信息 -->
			<h3 class="header smaller lighter grey">客户联系信息</h3>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="is_legal">法人代表是否本行客户</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_legal }' /></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="legal_per_no">法人代表客户编号</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.legal_per_no }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="legal_per_name">法人代表人姓名</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.legal_per_name }</label>
							</div>
						</div>
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="legal_per_cardtype">法人代表人证件类型</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='per_id_type.${corCustomerEntity.legal_per_cardtype }' /></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="legal_per_cardno">法人代表人证件号码</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.legal_per_cardno }</label>
							</div>
						</div>
					</div>
				</div>			
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="is_contributor">出资人是否本行客户</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_contributor }' /></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="contributor_no">出资人客户编号</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.contributor_no }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="contributor_name">出资人名称</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.contributor_name }</label>
							</div>
						</div>
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="contributor_cardtype">出资人证件类型</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='per_id_type.${corCustomerEntity.contributor_cardtype }' /></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="contributor_cardno">出资人证件号码</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.contributor_cardno }</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="finance_tel">财务部联系方式</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.finance_tel }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_regaddress">客户注册地址</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.borrower_regaddress }</label>
							</div>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_mesaddress">客户通讯地址</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.borrower_mesaddress }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_URL">客户网址</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.borrower_URL }</label>
							</div>
						</div>
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_zipcode">客户通讯地址邮编</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.borrower_zipcode }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="email">Email地址</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.email }</label>
							</div>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="telephone">联系电话（手机）</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.telephone }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="fax">传真</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.fax }</label>
							</div>
						</div>
					</div>
				</div>		
			<!--客户分类信息 -->
			<h3 class="header smaller lighter grey">客户分类信息</h3>
				<div class="row">
					<div class="form-group col-sm-12">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="cust_type_flag">特殊客户类型</label>
							<div class="col-sm-8 input-group">	
								<div class="checkbox">
									<input name="cust_type_flag_check"	id="cust_type_flag_check" type="hidden" value="${corCustomerEntity.cust_type_flag }"/>
									<label><input name="cust_type_flag"	id="cust_type_flag1" type="checkbox" class="ace" disabled="disabled"
										value="1"><span class="lbl">担保公司</span></label>
									<label><input name="cust_type_flag" id="cust_type_flag2" type="checkbox" class="ace" disabled="disabled"
									    value="2"><span class="lbl">楼盘开发商</span></label>
									 <label><input name="cust_type_flag" id="cust_type_flag3" type="checkbox" class="ace" disabled="disabled"
									 	value="3"><span class="lbl">经销商</span></label>
									<label><input name="cust_type_flag" id="cust_type_flag4" type="checkbox" class="ace" disabled="disabled"
										value="4"><span class="lbl">质押监管商</span></label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="corporate_grade_flag">企业规模等级</label>
							<div class="col-sm-6 input-group">	
								<label class="control-label" ><fmt:message key='corporate_grade.${corCustomerEntity.corporate_grade_flag }' /></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="profession_type_flag">企业行业分类</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='profession_type_flag.${corCustomerEntity.profession_type_flag }' /></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="registration_type">登记注册类型</label>
							<div class="col-sm-6 input-group">	
								<label class="control-label" ><fmt:message key='registration_type.${corCustomerEntity.registration_type }' /></label>	
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="corporate_type_flag">客户管理分类</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='corporate_type.${corCustomerEntity.corporate_type_flag }' /></label>	
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_worth_flag">客户价值分类</label>
							<div class="col-sm-6 input-group">	
								<label class="control-label" ><fmt:message key='cust_worth.${corCustomerEntity.cust_worth_flag }' /></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="fdc_sx_flag">房地产授信业务属性</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='fdc_sx_flag.${corCustomerEntity.fdc_sx_flag }' /></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_cyzctd_flag">产业政策特点</label>
							<div class="col-sm-6 input-group">	
								<label class="control-label" ><fmt:message key='cust_cyzctd.${corCustomerEntity.cust_cyzctd_flag }' /></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_qykglx_flag">企业控股类型</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='cust_qykglx.${corCustomerEntity.cust_qykglx_flag }' /></label>
							</div>
						</div>
					</div>
				</div>
			<!-- 客户属性信息 -->
		<h3 class="header smaller lighter grey">客户属性信息</h3>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_jtkh">是否集团客户</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_jtkh }' /></label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_jxs">是否是经销商</label>
						<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_jxs }' /></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_whgd">是否我行股东</label>
						<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_whgd }' /></label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_ssgs">是否上市公司</label>
						<div class="col-sm-6 input-group">
								<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_ssgs }' /></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_zfrzptkh">是否政府融资平台客户</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_zfrzptkh }' /></label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_jgkh">是否机构客户</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_jgkh }' /></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_whedsxkh">是否我行额度授信客户</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_nkmdkh }' /></label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="is_yjckq">是否有进出口权</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_yjckq }' /></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_blblzckh">是否剥离不良资产客户</label>
						<div class="col-sm-4 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_blblzckh }' /></label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_nkmdkh">是否内控名单客户</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_nkmdkh }' /></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_zzgkh">是否债转股客户</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_zzgkh }' /></label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="is_whqdyqhzxy">与我行签订银企合作协议</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_whqdyqhzxy }' /></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_jrtykh">是否金融同业客户</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_jrtykh }' /></label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="is_zbldfxkh">是否只办理低风险业务</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_zbldfxkh }' /></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_zblgylrz">是否只办理供应链融资业务</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_zblgylrz }' /></label>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="is_xmrz">是否项目融资</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='YESORNO.${corCustomerEntity.is_xmrz }' /></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label" for="is_zblmyrz">是否只办理贸易融资业务</label>
						<div class="col-sm-10 input-group">
							<label class="control-label" ><fmt:message key='is_zblmyrz.${corCustomerEntity.is_zblmyrz }' /></label>
						</div>
					</div>
				</div>
			<!-- 客户描述信息-->
			<h3 class="header smaller lighter grey">客户描述信息</h3>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="specificchannel">特殊行业准入资格</label>
						<div class="col-sm-10">
							<label class="control-label" >${corCustomerEntity.specificchannel }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="preferentialpolicy">享有的优惠政策</label>
						<div class="col-sm-10">
							<label class="control-label" >${corCustomerEntity.preferentialpolicy }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="mainproduct">主要产品情况</label>
						<div class="col-sm-10">
							<label class="control-label" >${corCustomerEntity.mainproduct }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="qualitycertification">企业获得的质量认证</label>
						<div class="col-sm-6">
							<label class="control-label" >${corCustomerEntity.qualitycertification }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label " for="ps">备注</label>
						<div class="col-sm-10">
							<label class="control-label" >${corCustomerEntity.ps }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_manager_fb">辅办客户经理</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${corCustomerEntity.cust_manager_fbname }</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="branch_noname">经办机构</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" >${corCustomerEntity.branch_noname }</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="cust_managername">经办客户经理</label>
						<div class="col-sm-6 input-group">
							<label class="control-label" >${corCustomerEntity.cust_managername }</label>
						</div>
					</div>
				</div>	
			<!-- /row 横线-->
		  <div class="row">
			<div class="form-group col-sm-6"></div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<!-- <button class="btn btn-info"  type="button" onclick="goback()"> -->
					<button class="btn btn-info"  type="button" onclick="goback('${viewtype }');">
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
	<script src="<%=path%>/js/select2.min.js"></script>
	<script src="<%=path%>/js/fuelux/fuelux.wizard.min.js"></script>
	<script src="<%=path%>/js/additional-methods.min.js"></script>
	<script type="text/javascript">
	//初始化下拉列表
	jQuery(function($){
		$("#file_type").formComponents("select");
		$("#country").formComponents("select");
		$("#canton").formComponents("select");
		$("#registercapital_currency").formComponents("select");
		$("#paidincaptial_currency").formComponents("select");
		$("#is_legal").formComponents("select");
		$("#legal_per_cardtype").formComponents("select");
		$("#is_contributor").formComponents("select");
		$("#contributor_cardtype").formComponents("select");
		$("#corporate_grade_flag").formComponents("select");
		$("#profession_type_flag").formComponents("select");
		$("#economy_type_flag").formComponents("select");
		$("#corporate_type_flag").formComponents("select");
		$("#cust_worth_flag").formComponents("select");
		$("#fdc_sx_flag").formComponents("select");
	});
	//初始化单选框
	jQuery(function($){
		$('[name="is_jtkh"]:radio').each(function(){if(this.value==$("#is_jtkh_check").val()){this.checked=true;}});
		
		$('[name="is_jxs"]:radio').each(function(){if(this.value==$("#is_jxs_check").val()){this.checked=true;}});
		
		$('[name="is_whgd"]:radio').each(function(){if(this.value==$("#is_whgd_check").val()){this.checked=true;}});
		
		$('[name="is_ssgs"]:radio').each(function(){if(this.value==$("#is_ssgs_check").val()){this.checked=true;}});
		
		$('[name="is_zfrzptkh"]:radio').each(function(){if(this.value==$("#is_zfrzptkh_check").val()){this.checked=true;}});
		
		$('[name="is_jgkh"]:radio').each(function(){if(this.value==$("#is_jgkh_check").val()){this.checked=true;}});
		
		$('[name="is_whedsxkh"]:radio').each(function(){if(this.value==$("#is_whedsxkh_check").val()){this.checked=true;}});
		
		$('[name="is_yjckq"]:radio').each(function(){if(this.value==$("#is_yjckq_check").val()){this.checked=true;}});
		
		$('[name="is_blblzckh"]:radio').each(function(){if(this.value==$("#is_blblzckh_check").val()){this.checked=true;}});
		
		$('[name="is_nkmdkh"]:radio').each(function(){if(this.value==$("#is_nkmdkh_check").val()){this.checked=true;}});
		
		$('[name="is_zzgkh"]:radio').each(function(){if(this.value==$("#is_zzgkh_check").val()){this.checked=true;}});
		
		$('[name="is_whqdyqhzxy"]:radio').each(function(){if(this.value==$("#is_whqdyqhzxy_check").val()){this.checked=true;}});
	
		$('[name="is_jrtykh"]:radio').each(function(){if(this.value==$("#is_jrtykh_check").val()){this.checked=true;}});
		
		$('[name="is_zbldfxkh"]:radio').each(function(){if(this.value==$("#is_zbldfxkh_check").val()){this.checked=true;}});
		
		$('[name="is_zblgylrz"]:radio').each(function(){if(this.value==$("#is_zblgylrz_check").val()){this.checked=true;}});
		
		$('[name="is_xmrz"]:radio').each(function(){if(this.value==$("#is_xmrz_check").val()){this.checked=true;}});
		
		$('[name="is_zblmyrz"]:radio').each(function(){if(this.value==$("#is_zblmyrz_check").val()){this.checked=true;}});
	});
	//初始化复选款
	jQuery(function($){
		var cust_type_flag=$("#cust_type_flag_check").val().split(",");
		for(var i=0;i<cust_type_flag.length;i++){
			$('[name="cust_type_flag"]:checkbox').each(function(){if(this.value==cust_type_flag[i]){this.checked=true;}});
		}
		
	});
	function goback(viewtype){
			window.location="<%=path%>/mvc/corCustomer_getList_temp.do?pageNo="+$("#pageNo").val();
	}
	</script>
</body>
</html>