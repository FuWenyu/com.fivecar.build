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
<body id="iframe_body"	onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display: none"></div>
	<div class="page-content" id="loadPageContent">
		<form class="form-horizontal" id="sub_form" name="sub_form" action="#"method="post">
			<input type="hidden" id="id"  name="id" value="${corCustomerEntity.id }"/>
			<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
			<input type="hidden" id="accDate" name="accDate"	value="${corCustomerEntity.accDate }" />
		<div id="fuelux-wizard" class="row-fluid"	data-target="#step-container">
			<ul class="wizard-steps">
				<li data-target="#step1" class="active"><span class="step">1</span>
					<span class="title">客户概况信息</span></li>

				<li data-target="#step2"><span class="step">2</span> 
					<span class="title">客户联系信息</span></li>
				
				<li data-target="#step3"><span class="step">3</span> 
				    <span class="title">客户分类信息</span></li>

				<li data-target="#step4"><span class="step">4</span> 
					<span class="title">客户属性信息</span></li>

				<li data-target="#step5"><span class="step">5</span> 
				 	<span class="title">客户描述信息</span></li>
			</ul>
		</div>
		<hr />
			<div class="step-content row-fluid position-relative" id="step-container">
				<!--  客户概况信息 -->
				<div class="step-pane active" id="step1">
				  <div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_id">客户编号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="cust_id" value="${corCustomerEntity.cust_id }"name="cust_id"
									class="form-control" placeholder="客户编号" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custchname">客户中文全称</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="custchname" value="${corCustomerEntity.custchname }"name="custchname"
									class="form-control" placeholder="客户中文全称" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custjcname">客户简称</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="custjcname" value="${corCustomerEntity.custjcname }"name="custjcname"
									class="form-control" placeholder="客户简称" >
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custenname">客户外文全称</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="custenname" value="${corCustomerEntity.custenname }"name="custenname"
									class="form-control" placeholder="客户外文全称" >
							</div>
						</div>
					</div>
				</div>
				 <div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="organizationcode">组织机构代码</label>
							<div class="col-sm-6 input-group">
							<input type="text" id="organizationcode" value="${corCustomerEntity.organizationcode }"name="organizationcode"
									class="form-control" placeholder="组织机构代码" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_property">借款人性质</label>
							<div class="col-sm-6 input-group">
								<select id="cust_property" class="form-control"  name="cust_property" data-emptyoption="true"
								data-select-value="${corCustomerEntity.cust_property }" data-select-list="${cust_propertyList }"></select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="file_type">文件类型</label>
							<div class="col-sm-6 input-group">
								<select id="file_type" class="form-control"  name="file_type" disabled="disabled"
								data-select-value="${corCustomerEntity.file_type }" data-select-list="${fileTypeList }"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="file_number">文件编号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="file_number" value="${corCustomerEntity.file_number }"name="file_number"
									class="form-control" placeholder="文件编号" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="country">所属国别</label>
							<div class="col-sm-6 input-group">	
								<select id="country" class="form-control"  name="country" data-emptyoption="true"
								data-select-value="${corCustomerEntity.country }" data-select-list="${countryList }"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="canton">行政区划</label>
							<div class="col-sm-6 input-group">
								<select id="canton" class="form-control"  name="canton" data-emptyoption="true"
								data-select-value="${corCustomerEntity.canton }" data-select-list="${cantonList }"></select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="corproate_startdate">企业成立年份</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="corproate_startdate" value="${corCustomerEntity.corproate_startdate }"name="corproate_startdate"
									class="form-control" placeholder="企业成立年份" >
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="register_no">登记注册编号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="register_no" value="${corCustomerEntity.register_no }"name="register_no"
									class="form-control" placeholder="登记注册编号">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
					  	<div class="form-group">
							<label class="col-sm-4 control-label" for="register_StartDate">注册登记起始日期</label>
							<div class="col-sm-6 input-group">
								<input id="register_StartDate" name="register_StartDate"
									class="form-control date-picker" type="text" value="${corCustomerEntity.register_StartDate }" data-date-format="yyyy-mm-dd" >
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label"	for="register_EndDate">注册登记到期日期</label>
							<div class="col-sm-6 input-group">
								<input id="register_EndDate" name="register_EndDate"
									class="form-control date-picker" type="text" value="${corCustomerEntity.register_EndDate }" data-date-format="yyyy-mm-dd" >
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
							</div>
							<div class="col-sm-2 input-group"><input id="end_date" type="hidden"/></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label"	for="taxcode">国税登记证号码</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="taxcode" value="${corCustomerEntity.taxcode }" name="taxcode"
									class="form-control" placeholder="国税登记证号码">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label"	for="rentcode">地税登记证号码</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="rentcode"  name="rentcode" value="${corCustomerEntity.rentcode }"
									class="form-control" placeholder="地税登记证号码">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label">注册资本币种</label>
							<div class="input-group col-sm-6">
								<select id="registercapital_currency" class="form-control"  name="registercapital_currency" data-emptyoption="true"
								data-select-value="${corCustomerEntity.registercapital_currency }" data-select-list="${currencyList }"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="registercapital_amount">注册资本金额(元)</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="registercapital_amount"  name="registercapital_amount" value="${corCustomerEntity.registercapital_amount }"
									class="form-control" placeholder="注册资本金额(元)">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label">实收资本币种</label>
							<div class="input-group col-sm-6">
								<select id="paidincaptial_currency" class="form-control"  name="paidincaptial_currency" data-emptyoption="true"
								data-select-value="${corCustomerEntity.paidincaptial_currency }" data-select-list="${currencyList }"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="paidincapital_amount">实收资本金额(元)</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="paidincapital_amount"  name="paidincapital_amount" value="${corCustomerEntity.paidincapital_amount }"
									class="form-control" placeholder="实收资本金额(元)">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label">销售额（元/年）</label>
							<div class="input-group col-sm-6">
								<input type="text" id="sales_amount"  name="sales_amount" value="${corCustomerEntity.sales_amount }"
									class="form-control" placeholder="销售额（元/年）">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="general_assets">资产总额(元)</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="general_assets"  name="general_assets" value="${corCustomerEntity.general_assets }"
									class="form-control" placeholder="资产总额(元)">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label">经营地址</label>
							<div class="input-group col-sm-6">
								<input type="text" id="manage_address"  name="manage_address" value="${corCustomerEntity.manage_address }"
									class="form-control" placeholder="经营地址">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="practitioner_number">从业人数</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="practitioner_number"  name="practitioner_number" value="${corCustomerEntity.practitioner_number }"
									class="form-control" placeholder="从业人数">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label">基本账户开户行</label>
							<div class="input-group col-sm-6">
								<input type="text" id="basicaccount_bank"  name="basicaccount_bank" value="${corCustomerEntity.basicaccount_bank }"
									class="form-control" placeholder="基本账户开户行">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="basicaccount_number">基本存款账号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="basicaccount_number"  name="basicaccount_number" value="${corCustomerEntity.basicaccount_number }"
									class="form-control" placeholder="基本存款账号">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="loancard_no">贷款卡号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="loancard_no"  name="loancard_no" value="${corCustomerEntity.loancard_no }"
									class="form-control" placeholder="贷款卡号">
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
								<input id="loancard_hairpinDate" name="loancard_hairpinDate"
									class="form-control date-picker" type="text" value="${corCustomerEntity.loancard_hairpinDate }" data-date-format="yyyy-mm-dd" >
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="loancard_newDate">贷款卡最新年检日期</label>
							<div class="col-sm-6 input-group">
								<input id="loancard_newDate" name="loancard_newDate"
									class="form-control date-picker" type="text" value="${corCustomerEntity.loancard_newDate }" data-date-format="yyyy-mm-dd" >
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
							</div>
						</div>
					</div>
				</div>				
			</div>
			
			<!--联系信息 -->
			 <div class="step-pane" id="step2">
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="is_legal">法人代表是否本行客户</label>
							<div class="col-sm-6 input-group">
								<select id="is_legal" class="form-control"  name="is_legal"  data-emptyoption="true" onchange="islegal();"
								data-select-value="${corCustomerEntity.is_legal }" data-select-list="${yesornoList }">
								</select>
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
								<input type="text" id="legal_per_no"  name="legal_per_no" value="${corCustomerEntity.legal_per_no }"
									class="form-control" placeholder="法人代表客户编号">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="legal_per_name">法人代表人姓名</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="legal_per_name"  name="legal_per_name" value="${corCustomerEntity.legal_per_name }"
									class="form-control" placeholder="法人代表人姓名">
							</div>
						</div>
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="legal_per_cardtype">法人代表人证件类型</label>
							<div class="col-sm-6 input-group">
								<select id="legal_per_cardtype" class="form-control"  name="legal_per_cardtype" data-emptyoption="true"
								data-select-value="${corCustomerEntity.legal_per_cardtype }" data-select-list="${cardTypeList }">
								</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="legal_per_cardno">法人代表人证件号码</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="legal_per_cardno"  name="legal_per_cardno" value="${corCustomerEntity.legal_per_cardno }"
									class="form-control" placeholder="法人代表人证件号码">
							</div>
						</div>
					</div>
				</div>			
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="is_contributor">出资人是否本行客户</label>
							<div class="col-sm-6 input-group">
								<select id="is_contributor" class="form-control"  name="is_contributor"  data-emptyoption="true" onchange="iscontributor()"
								data-select-value="${corCustomerEntity.is_contributor }" data-select-list="${yesornoList }">
								</select>
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
								<input type="text" id="contributor_no"  name="contributor_no" value="${corCustomerEntity.contributor_no }"
									class="form-control" placeholder="出资人客户编号">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="contributor_name">出资人名称</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="contributor_name"  name="contributor_name" value="${corCustomerEntity.contributor_name }"
									class="form-control" placeholder="出资人名称">
							</div>
						</div>
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="contributor_cardtype">出资人证件类型</label>
							<div class="col-sm-6 input-group">
								<select id="contributor_cardtype" class="form-control"  name="contributor_cardtype" data-emptyoption="true"
								data-select-value="${corCustomerEntity.contributor_cardtype }" data-select-list="${cardTypeList }">
								</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="contributor_cardno">出资人证件号码</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="contributor_cardno"  name="contributor_cardno" value="${corCustomerEntity.contributor_cardno }"
									class="form-control" placeholder="出资人证件号码">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="finance_tel">财务部联系方式</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="finance_tel"  name="finance_tel" value="${corCustomerEntity.finance_tel }"
									class="form-control" placeholder="财务部联系方式">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_regaddress">客户注册地址</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="borrower_regaddress"  name="borrower_regaddress" value="${corCustomerEntity.borrower_regaddress }"
									class="form-control" placeholder="客户注册地址">
							</div>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_mesaddress">客户通讯地址</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="borrower_mesaddress"  name="borrower_mesaddress" value="${corCustomerEntity.borrower_mesaddress }"
									class="form-control" placeholder="客户通讯地址">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_URL">客户网址</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="borrower_URL"  name="borrower_URL" value="${corCustomerEntity.borrower_URL }"
									class="form-control" placeholder="客户网址">
							</div>
						</div>
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="borrower_zipcode">客户通讯地址邮编</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="borrower_zipcode"  name="borrower_zipcode" value="${corCustomerEntity.borrower_zipcode }"
									class="form-control" placeholder="客户通讯地址邮编">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="email">Email地址</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="email"  name="email" value="${corCustomerEntity.email }"
									class="form-control" placeholder="Email地址">
							</div>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="telephone">联系电话（手机）</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="telephone"  name="telephone" value="${corCustomerEntity.telephone }"
									class="form-control" placeholder="联系电话（手机）">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="fax">传真</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="fax"  name="fax" value="${corCustomerEntity.fax }"
									class="form-control" placeholder="传真">
							</div>
						</div>
					</div>
				</div>		
			</div> 
			<!--客户分类信息 -->
			<div class="step-pane" id="step3">
				<div class="row">
					<div class="form-group col-sm-12">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="cust_type_flag">特殊客户类型</label>
							<div class="col-sm-8 input-group">	
								<div class="checkbox">
									<input name="cust_type_flag_check"	id="cust_type_flag_check" type="hidden" value="${corCustomerEntity.cust_type_flag }"/>
									<label><input name="cust_type_flag"	id="cust_type_flag1" type="checkbox" class="ace"
										value="1"><span class="lbl">担保公司</span></label>
									<label><input name="cust_type_flag" id="cust_type_flag2" type="checkbox" class="ace" 
									    value="2"><span class="lbl">楼盘开发商</span></label>
									 <label><input name="cust_type_flag" id="cust_type_flag3" type="checkbox" class="ace" 
									 	value="3"><span class="lbl">经销商</span></label>
									<label><input name="cust_type_flag" id="cust_type_flag4" type="checkbox" class="ace" 
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
								<select id="corporate_grade_flag" class="form-control"  name="corporate_grade_flag" data-emptyoption="true"
								data-select-value="${corCustomerEntity.corporate_grade_flag }" data-select-list="${gradeList }"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="profession_type_flag">企业行业分类</label>
							<div class="col-sm-6 input-group">
								<select id="profession_type_flag" class="form-control"  name="profession_type_flag" data-emptyoption="true"
								data-select-value="${corCustomerEntity.profession_type_flag }" data-select-list="${profession_type_flagList }"></select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="registration_type">登记注册类型</label>
							<div class="col-sm-6 input-group">	
								<select id="registration_type" class="form-control"  name="registration_type" data-emptyoption="true"
								data-select-value="${corCustomerEntity.registration_type }" data-select-list="${registration_typeList }"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="corporate_type_flag">客户管理分类</label>
							<div class="col-sm-6 input-group">
								<select id="corporate_type_flag" class="form-control"  name="corporate_type_flag" data-emptyoption="true"
								data-select-value="${corCustomerEntity.corporate_type_flag }" data-select-list="${corporate_typeList }"></select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_worth_flag">客户价值分类</label>
							<div class="col-sm-6 input-group">	
								<select id="cust_worth_flag" class="form-control"  name="cust_worth_flag" data-emptyoption="true"
								data-select-value="${corCustomerEntity.cust_worth_flag }" data-select-list="${cust_worthList }"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="fdc_sx_flag">房地产授信业务属性</label>
							<div class="col-sm-6 input-group">
								<select id="fdc_sx_flag" class="form-control"  name="fdc_sx_flag" data-emptyoption="true"
								data-select-value="${corCustomerEntity.fdc_sx_flag }" data-select-list="${fdc_sx_flagList }"></select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_cyzctd_flag">产业政策特点</label>
							<div class="col-sm-6 input-group">	
								<select id="cust_cyzctd_flag" class="form-control"  name="cust_cyzctd_flag" data-emptyoption="true"
								data-select-value="${corCustomerEntity.cust_cyzctd_flag }" data-select-list="${cust_cyzctd_flagList }"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_qykglx_flag">企业控股类型</label>
							<div class="col-sm-6 input-group">
								<select id="cust_qykglx_flag" class="form-control"  name="cust_qykglx_flag" data-emptyoption="true"
								data-select-value="${corCustomerEntity.cust_qykglx_flag }" data-select-list="${cust_qykglx_flagList }"></select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 客户属性信息 -->
			<div class="step-pane" id="step4">
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_jtkh">是否集团客户</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_jtkh_check" id="is_jtkh_check" type="hidden"  value="${corCustomerEntity.is_jtkh }">
								<label><input name="is_jtkh" id="is_jtkh_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_jtkh" id="is_jtkh_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_jxs">是否是经销商</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_jxs_check" id="is_jxs_check" type="hidden"  value="${corCustomerEntity.is_jxs }">
								<label><input name="is_jxs" id="is_jxs_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_jxs" id="is_jxs_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_whgd">是否我行股东</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_whgd_check" id="is_whgd_check" type="hidden"  value="${corCustomerEntity.is_whgd }">
								<label><input name="is_whgd" id="is_whgd_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_whgd" id="is_whgd_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_ssgs">是否上市公司</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_ssgs_check" id="is_ssgs_check" type="hidden"  value="${corCustomerEntity.is_ssgs }">
								<label><input name="is_ssgs" id="is_ssgs_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_ssgs" id="is_ssgs_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_zfrzptkh">是否政府融资平台客户</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_zfrzptkh_check" id="is_zfrzptkh_check" type="hidden"  value="${corCustomerEntity.is_zfrzptkh }">
								<label><input name="is_zfrzptkh" id="is_zfrzptkh_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_zfrzptkh" id="is_zfrzptkh_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_jgkh">是否机构客户</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_jgkh_check" id="is_jgkh_check" type="hidden"  value="${corCustomerEntity.is_jgkh }">
								<label><input name="is_jgkh" id="is_jgkh_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_jgkh" id="is_jgkh_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_whedsxkh">是否我行额度授信客户</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_whedsxkh_check" id="is_whedsxkh_check" type="hidden"  value="${corCustomerEntity.is_whedsxkh }">
								<label><input name="is_whedsxkh" id="is_whedsxkh_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_whedsxkh" id="is_whedsxkh_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="is_yjckq">是否有进出口权</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_yjckq_check" id="is_yjckq_check" type="hidden"  value="${corCustomerEntity.is_yjckq }">
								<label><input name="is_yjckq" id="is_yjckq_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_yjckq" id="is_yjckq_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_blblzckh">是否剥离不良资产客户</label>
						<div class="col-sm-4 input-group">
							<div class="radio">
								<input name="is_blblzckh_check" id="is_blblzckh_check" type="hidden"  value="${corCustomerEntity.is_blblzckh }">
								<label><input name="is_blblzckh" id="is_blblzckh_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_blblzckh" id="is_blblzckh_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_nkmdkh">是否内控名单客户</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_nkmdkh_check" id="is_nkmdkh_check" type="hidden"  value="${corCustomerEntity.is_nkmdkh }">
								<label><input name="is_nkmdkh" id="is_nkmdkh_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_nkmdkh" id="is_nkmdkh_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_zzgkh">是否债转股客户</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_zzgkh_check" id="is_zzgkh_check" type="hidden"  value="${corCustomerEntity.is_zzgkh }">
								<label><input name="is_zzgkh" id="is_zzgkh_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_zzgkh" id="is_zzgkh_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="is_whqdyqhzxy">与我行签订银企合作协议</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_whqdyqhzxy_check" id="is_whqdyqhzxy_check" type="hidden"  value="${corCustomerEntity.is_whqdyqhzxy }">
								<label><input name="is_whqdyqhzxy" id="is_whqdyqhzxy_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_whqdyqhzxy" id="is_whqdyqhzxy_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_jrtykh">是否金融同业客户</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_jrtykh_check" id="is_jrtykh_check" type="hidden"  value="${corCustomerEntity.is_jrtykh }">
								<label><input name="is_jrtykh" id="is_jrtykh_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_jrtykh" id="is_jrtykh_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="is_zbldfxkh">是否只办理低风险业务</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_zbldfxkh_check" id="is_zbldfxkh_check" type="hidden"  value="${corCustomerEntity.is_zbldfxkh }">
								<label><input name="is_zbldfxkh" id="is_zbldfxkh_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_zbldfxkh" id="is_zbldfxkh_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_zblgylrz">是否只办理供应链融资业务</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_zblgylrz_check" id="is_zblgylrz_check" type="hidden"  value="${corCustomerEntity.is_zblgylrz }">
								<label><input name="is_zblgylrz" id="is_zblgylrz_y" type="radio" class="ace" value="1"><span class="lbl">是</span></label>
								<label><input name="is_zblgylrz" id="is_zblgylrz_n" type="radio" class="ace" value="2" checked="checked"><span class="lbl">否</span></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="is_xmrz">是否项目融资</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_xmrz_check" id="is_xmrz_check" type="hidden"  value="${corCustomerEntity.is_xmrz }">
								<label><input name="is_xmrz" id="is_xmrz_y" type="radio" class="ace" value="1" ><span	class="lbl">是</span></label>
								<label><input name="is_xmrz" id="is_xmrz_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label" for="is_zblmyrz">是否只办理贸易融资业务</label>
						<div class="col-sm-10 input-group">
							<div class="radio">
								<input name="is_zblmyrz_check" id="is_zblmyrz_check" type="hidden"  value="${corCustomerEntity.is_zblmyrz }">
								<label><input name="is_zblmyrz" id="is_zblmyrz_n" type="radio" class="ace" value="1" checked="checked"><span class="lbl">否</span></label>
								<label><input name="is_zblmyrz" id="is_zblmyrz_y1" type="radio" class="ace" value="2"><span	class="lbl">是，低风险</span></label>
								<label><input name="is_zblmyrz" id="is_zblmyrz_y2" type="radio" class="ace" value="3"><span	class="lbl">是，风险来源国内</span></label>
								<label><input name="is_zblmyrz" id="is_zblmyrz_y3" type="radio" class="ace" value="4"><span	class="lbl">是，风险来源国外</span></label>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="step-pane" id="step5">
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="specificchannel">特殊行业准入资格</label>
						<div class="col-sm-6">
							<textarea class="form-control" name="specificchannel" id="specificchannel"
								 rows="3">${corCustomerEntity.specificchannel }</textarea>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="preferentialpolicy">享有的优惠政策</label>
						<div class="col-sm-6">
							<textarea class="form-control" name="preferentialpolicy" id="preferentialpolicy"
								maxlength="200" rows="3">${corCustomerEntity.preferentialpolicy }</textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="mainproduct">主要产品情况</label>
						<div class="col-sm-6">
							<textarea class="form-control" name="mainproduct" id="mainproduct"
								maxlength="200" rows="3">${corCustomerEntity.mainproduct }</textarea>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="qualitycertification">企业获得的质量认证</label>
						<div class="col-sm-6">
							<textarea class="form-control" name="qualitycertification" id="qualitycertification" 
									rows="3">${corCustomerEntity.qualitycertification }</textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label " for="ps">备注</label>
						<div class="col-sm-6">
							<textarea class="form-control" name="ps" id="ps" rows="3">${corCustomerEntity.ps }</textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_manager_fb">辅办客户经理</label>
							<div class="col-sm-6 input-group">
								<select id="cust_manager_fb" class="form-control"  name="cust_manager_fb" data-emptyoption="true"
								data-select-value="${corCustomerEntity.cust_manager_fb }" data-select-list="${cust_manager_fbList }">
								</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="branch_noname">经办机构</label>
							<div class="col-sm-6 input-group">
								<input type="hidden" id="branch_no"  name="branch_no" value="${corCustomerEntity.branch_no }"/>
								<input type="text" id="branch_noname"  name="branch_noname" value="${corCustomerEntity.branch_noname }"
									class="form-control" placeholder="经办机构" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_managername">经办客户经理</label>
							<div class="col-sm-6 input-group">
								<input type="hidden" id="cust_manager"  name="cust_manager" value="${corCustomerEntity.cust_manager }"/>
								<input type="text" id="cust_managername"  name="cust_managername" value="${corCustomerEntity.cust_managername }"
									class="form-control" placeholder="经办客户经理" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>	
			</div>
		</div>
		<div class="wizard-actions center">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-9">
					<button class="btn btn-sm btn-primary btn-prev " type="button">
						<i class="icon-arrow-left"></i> 上一步
					</button>
					<button class="btn-primary btn  btn-sm btn-next" data-last="完成 "
						type="button">
						下一步 <i class="icon-arrow-right icon-on-right"></i>
					</button>
					<button class="btn btn-sm btn-primary" type="button" onclick="goback()">
						<i class="icon-remove"></i> 取&nbsp;&nbsp;&nbsp;&nbsp;消
					</button>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</form>
	</div>
	<div class="page-content" style="height:110px;"> </div>
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
		jQuery(function($) {
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
			
			$('[data-rel=tooltip]').tooltip();
		
			$(".select2").css('width','200px').select2({allowClear:true})
			
			$('#fuelux-wizard').ace_wizard(
			).on('change' , function(e, info){
				 $(window).resize(function() {
					setHash('${pageContext.request.contextPath}');
				}); 
				 window.location="#loadPageContent";
				 if($("#corproate_startdate").val()!=null &&$("#corproate_startdate").val()!="" ){
						if (!checkData('corproate_startdate', '企业成立年份', 'number')) {
							return false;
						}
						if (!checkData('corproate_startdate', '企业成立年份', 'length_Four')) {
							return false;
						}
						if($("#corproate_startdate").val()>$("#accDate").val()){
							$("#corproate_startdate").closest("form").find(".help-block").remove();
							$("#corproate_startdate").after("<div class=\"help-block red\" >&nbsp;&nbsp;*&nbsp;企业成立年份不能大于["+$("#accDate").val().subString(0,4)+"]");
							$("#corproate_startdate").focus();
							return false;
						}
					}
				if($("#register_StartDate").val()!=null &&$("#register_StartDate").val()!="" ){
					if($("#register_EndDate").val()!=null &&$("#register_EndDate").val()!="" ){
						if($("#register_EndDate").val()<=$("#register_StartDate").val()){
							$("#end_date").closest("form").find(".help-block").remove();
							$("#end_date").after("<div class=\"help-block red\" >&nbsp;&nbsp;*&nbsp;到期日期应大于起始日期！");
							$("#register_EndDate").focus();
							return false;
						}
					}
				}
				$("#end_date").closest("form").find(".help-block").remove();
				if($("#taxcode").val()==null &&$("#taxcode").val()=="" ){
					if($("#rentcode").val()==null &&$("#rentcode").val()=="" ){
						if (!checkData('taxcode', '国税号和地税号之一', 'input')) {
							return false;
						}
					}
				}
				 if($("#registercapital_amount").val()!=null &&$("#registercapital_amount").val()!="" ){
					if (!checkData('registercapital_amount', '注册资本金额', 'number')) {
						return false;
					}
				}
				if($("#paidincapital_amount").val()!=null &&$("#paidincapital_amount").val()!="" ){
					if (!checkData('paidincapital_amount', '实收资本金额', 'number')) {
						return false;
					}
				}
				if($("#sales_amount").val()!=null &&$("#sales_amount").val()!="" ){
					if (!checkData('sales_amount', '销售额', 'number')) {
						return false;
					}
				}
				if($("#general_assets").val()!=null &&$("#general_assets").val()!="" ){
					if (!checkData('general_assets', '资产总额', 'number')) {
						return false;
					}
				}
				if($("#practitioner_number").val()!=null &&$("#practitioner_number").val()!="" ){
					if (!checkData('practitioner_number', '从业人数', 'number')) {
						return false;
					}
				}
				if($("#basicaccount_number").val()!=null &&$("#basicaccount_number").val()!="" ){
					if (!checkData('basicaccount_number', '基本存款账号', 'number')) {
						return false;
					}
				}
				if($("#loancard_no").val()!=null &&$("#loancard_no").val()!="" ){
					if (!checkData('loancard_no', '贷款卡号', 'number')) {
						return false;
					}
					if (!checkData('loancard_no', '贷款卡号', 'length_Sixteen')) {
						return false;
					}
				}	
				if($("#loancard_hairpinDate").val()!=null &&$("#loancard_hairpinDate").val()!="" ){
					if($("#loancard_hairpinDate").val()>$("#accDate").val()){
						$("#loancard_hairpinDate").closest("form").find(".help-block").remove();
						$("#loancard_hairpinDate").after("<div class=\"help-block red\" >&nbsp;&nbsp;*&nbsp;贷款卡发卡日期应不能大于["+$("#accDate").val().subString(0,4)+"]");
						$("#loancard_hairpinDate").focus();
						return false;
					}
				}
				if($("#loancard_newDate").val()!=null &&$("#loancard_newDate").val()!="" ){
					if($("#loancard_newDate").val()>$("#accDate").val()){
						$("#loancard_newDate").closest("form").find(".help-block").remove();
						$("#loancard_newDate").after("<div class=\"help-block red\" >&nbsp;&nbsp;*&nbsp;贷款卡最新年检日期不能大于["+$("#accDate").val().subString(0,4)+"]");
						$("#loancard_newDate").focus();
						return false;
					}
				}
				if($("#legal_per_cardno").val()!=null &&$("#legal_per_cardno").val()!="" ){
					if (!checkData('legal_per_cardno', '法人代表人证件号码', 'number')) {
						return false;
					}
					if($("#legal_per_cardtype").val()=="01" ||$("#legal_per_cardtype").val()=="07"){
						if (!checkData('legal_per_cardno', '法人代表人证件号码', 'checkIdCard')) {
							return false;
						}
					}
				}
				if($("#legal_per_cardtype").val()!=null &&$("#legal_per_cardtype").val()!="" &&$("#legal_per_cardtype").val()!=-1){
					if (!checkData('legal_per_cardno', '法人代表人证件号码', 'input')) {
						return false;
					}
				}
				if($("#legal_per_name").val()!=null &&$("#legal_per_name").val()!="" ){
					if (!checkData('legal_per_name', '法人代表人姓名', 'check_char')) {
						return false;
					}
				}
				if($("#contributor_cardno").val()!=null &&$("#contributor_cardno").val()!="" ){
					if (!checkData('contributor_cardno', '出资人证件号码', 'number')) {
						return false;
					}
					if($("#contributor_cardtype").val()=="01" || $("#contributor_cardtype").val()=="07"){
						if (!checkData('contributor_cardno', '出资人证件号码', 'checkIdCard')) {
							return false;
						}
					}
				}
				if($("#contributor_cardtype").val()!=null &&$("#contributor_cardtype").val()!=""&&$("#contributor_cardtype").val()!=-1 ){
					if (!checkData('contributor_cardno', '出资人证件号码', 'input')) {
						return false;
					}
				}
				if($("#contributor_name").val()!=null &&$("#contributor_name").val()!="" ){
					if (!checkData('contributor_name', '出资人姓名', 'check_char')) {
						return false;
					}
				}
				if($("#borrower_zipcode").val()!=null &&$("#borrower_zipcode").val()!="" ){
					if (!checkData('borrower_zipcode', '客户通讯地址邮编', 'number')) {
						return false;
					}
					if (!checkData('borrower_zipcode', '客户通讯地址邮编', 'length_Six')) {
						return false;
					}
				}
				if($("#telephone").val()!=null &&$("#telephone").val()!="" ){
					if (!checkData('telephone', '联系人电话', 'number')) {
						return false;
					}
					if (!checkData('telephone', '联系人电话', 'length_tel')) {
						return false;
					}
				}
			}).on('finished', function(e) {
				subForm();
			}).on('stepclick', function(e){
			});
		});
		</script>
	<script type="text/javascript">
	//时间控件
	jQuery(function($){		
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	});
	//初始化下拉列表
	jQuery(function($){
		$("#file_type").formComponents("select");
		$("#cust_property").formComponents("select");
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
		$("#corporate_type_flag").formComponents("select");
		$("#cust_worth_flag").formComponents("select");
		$("#fdc_sx_flag").formComponents("select");
		$("#cust_cyzctd_flag").formComponents("select");
		$("#cust_qykglx_flag").formComponents("select");
		$("#registration_type").formComponents("select");
		$("#cust_manager_fb").formComponents("select");
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
		islegal();
		iscontributor();	
	});
	function subForm(){
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/corCustomer_editSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					f_alert("<%=path%>","success","corCustomer_getList.do");
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
	function islegal(){
		if($("#is_legal").val()=="1"){
		document.getElementById("legal_per_no").readOnly=false;
		}else{
		$("#legal_per_no").val("");
		document.getElementById("legal_per_no").readOnly=true;
		}
	}
	function iscontributor(){
		if($("#is_contributor").val()=="1"){
			document.getElementById("contributor_no").readOnly=false;
		}else{
			$("#contributor_no").val("");
			document.getElementById("contributor_no").readOnly=true;
		}
	}
	function goback(){
		window.location="<%=path%>/mvc/corCustomer_getList.do?pageNo="+$("#pageNo").val();
	}
	</script>
</body>
</html>