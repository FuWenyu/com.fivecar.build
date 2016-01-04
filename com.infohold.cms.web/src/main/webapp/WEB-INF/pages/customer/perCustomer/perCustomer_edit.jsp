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
<link rel="stylesheet"
	href="<%=path%>/css/jquery-ui-1.10.3.full.min.css" />
<script src="<%=path%>/js/ace-extra.min.js"></script>
</head>
<body id="iframe_body"
	onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display: none"></div>
	<div class="page-content" id="loadPageContent">
		<form class="form-horizontal" id="sub_form" name="sub_form" action="#"method="post">
			<input type="hidden" id="id"  name="id" value="${perCustomerEntity.id }"/>
			<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
			<input type="hidden" id="accDate" name="accDate"	value="${perCustomerEntity.accDate }" />
		<div id="fuelux-wizard" class="row-fluid"	data-target="#step-container">
			<ul class="wizard-steps">
				<li data-target="#step1" class="active"><span class="step">1</span>
					<span class="title">客户基本信息</span></li>

				<li data-target="#step2"><span class="step">2</span> 
					<span class="title">客户配偶信息</span></li>
				
				<li data-target="#step3"><span class="step">3</span> 
				    <span class="title">客户居住信息</span></li>

				<li data-target="#step4"><span class="step">4</span> 
					<span class="title">客户职业信息</span></li>

				<li data-target="#step5"><span class="step">5</span> 
				 	<span class="title">经办信息</span></li>
			</ul>
		</div>
		<hr />
			<div class="step-content row-fluid position-relative" id="step-container">
				<!--  基本信息 -->
				<div class="step-pane active" id="step1">
				  <div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_id">客户编号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="cust_id" value="${perCustomerEntity.cust_id }"name="cust_id"
									class="form-control" placeholder="客户编号" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_name">客户名称</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="cust_name" value="${perCustomerEntity.cust_name }"name="cust_name"
									class="form-control" placeholder="客户名称" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="zjlx">证件类型</label>
							<div class="col-sm-6 input-group">
								<select id="cert_type" class="form-control"  name="cert_type" disabled="disabled"
								data-select-value="${perCustomerEntity.cert_type }" data-select-list="${certTypeList }"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cert_no">证件号码</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="cert_no" value="${perCustomerEntity.cert_no }" name="cert_no"
								class="form-control" placeholder="证件号码" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
					  	<div class="form-group">
							<label class="col-sm-4 control-label" for="cert_validitytype">证件有效类型</label>
							<div class="col-sm-6 input-group">
								<select id="cert_validitytype" class="form-control"  name="cert_validitytype" data-emptyoption="true"
								data-select-value="${perCustomerEntity.cert_validitytype }" data-select-list="${cert_validitytypeList }">
								</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label"
								for="cert_duedate">证件到期日</label>
							<div class="col-sm-6 input-group">
								<input id="cert_duedate" name="cert_duedate"
									class="form-control date-picker" type="text" value="${perCustomerEntity.cert_duedate }" data-date-format="yyyy-mm-dd" >
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label"
								for="cert_place">证件签发地区</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="cert_place" value="${perCustomerEntity.cert_place }" name="cert_place"
									class="form-control" placeholder="证件签发地区">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label"
								for="cert_place_name">证件签发机构</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="cert_place_name"  name="cert_place_name" value="${perCustomerEntity.cert_place_name }"
									class="form-control" placeholder="证件签发机构">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label">性别</label>
							<div class="input-group col-sm-6">
								<select id="sex" class="form-control"  name="sex" data-emptyoption="true"
								data-select-value="${perCustomerEntity.sex }" data-select-list="${sexList }"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="birthdate">出生日期</label>
							<div class="col-sm-6 input-group">
								<input id="birthdate" name="birthdate" 	class="form-control date-picker" 
								type="text" value="${perCustomerEntity.birthdate }" data-date-format="yyyy-mm-dd" >
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
							</div>
							<div class="col-sm-2 input-group"><input id="birthdate_help" type="hidden"/></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="nation">民族</label>
							<div class="col-sm-6 input-group">
								<select id="nation" class="form-control"  name="nation"  data-emptyoption="true"
								data-select-value="${perCustomerEntity.nation }" data-select-list="${nationList }">
								 </select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="nationality">国籍</label>
							<div class="col-sm-6 input-group">
								<select id="nationality" class="form-control"  name="nationality"  data-emptyoption="true"
								data-select-value="${perCustomerEntity.nationality }" data-select-list="${nationalityList }">
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="education">最高学历</label>
							<div class="col-sm-6 input-group">
								<select id="education" class="form-control"  name="education" data-emptyoption="true"
								data-select-value="${perCustomerEntity.education }" data-select-list="${educationList }">
								</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="education_duties">最高学位</label>
							<div class="col-sm-6 input-group">
								<select id="education_duties" class="form-control"  name="education_duties" data-emptyoption="true"
								data-select-value="${perCustomerEntity.education_duties }" data-select-list="${education_xwList }">
								</select>
							</div>
						</div>
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_worth">客户价值类别</label>
							<div class="col-sm-6 input-group">
								<select id="cust_worth" class="form-control"  name="cust_worth" data-emptyoption="true"
								data-select-value="${perCustomerEntity.cust_worth }" data-select-list="${cust_worthList }">
								</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="loancard_no">贷款卡号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="loancard_no"  name="loancard_no" value="${perCustomerEntity.loancard_no }"
									class="form-control" placeholder="贷款卡号">
							</div>
						</div>
					</div>
				</div>				
			</div>
			<!--配偶信息 -->
			 <div class="step-pane" id="step2">
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="maritalstatus">婚姻状况</label>
							<div class="col-sm-6 input-group">
								<select id="maritalstatus" class="form-control"  name="maritalstatus"  data-emptyoption="true"
								data-select-value="${perCustomerEntity.maritalstatus }" data-select-list="${maritalstatusList }">
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
							<label class="col-sm-4 control-label" for="spouse_name">配偶姓名</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="spouse_name"  name="spouse_name" value="${perCustomerEntity.spouse_name }"
									class="form-control" placeholder="配偶姓名">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="spouse_tel">配偶电话</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="spouse_tel"  name="spouse_tel" value="${perCustomerEntity.spouse_tel }"
									class="form-control" placeholder="配偶电话">
							</div>
						</div>
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="spouse_papertype">配偶证件类型</label>
							<div class="col-sm-6 input-group">
								<select id="spouse_papertype" class="form-control"  name="spouse_papertype" data-emptyoption="true"
								data-select-value="${perCustomerEntity.spouse_papertype }" data-select-list="${certTypeList }">
								</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="spouse_paperno">配偶证件号码</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="spouse_paperno"  name="spouse_paperno" value="${perCustomerEntity.spouse_paperno }"
									class="form-control" placeholder="配偶证件号码">
							</div>
						</div>
					</div>
				</div>			
				
			</div> 
			<!--居住信息 -->
			<div class="step-pane" id="step3">
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="homephone">住宅电话</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="homephone"  name="homephone" value="${perCustomerEntity.homephone }"
									class="form-control" placeholder="住宅电话">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="telephone">手机号码</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="telephone"  name="telephone" value="${perCustomerEntity.telephone }"
									class="form-control" placeholder="手机号码">
							</div>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="mailbox">电子邮箱</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="mailbox"  name="mailbox" value="${perCustomerEntity.mailbox }"
									class="form-control" placeholder="电子邮箱">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="qq">QQ号码</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="qq"  name="qq" value="${perCustomerEntity.qq }"
									class="form-control" placeholder="QQ号码">
							</div>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_dxtx">是否短信提醒</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_dxtx_check" id="is_dxtx_check" type="hidden"  value="${perCustomerEntity.is_dxtx }">
								<label><input name="is_dxtx" id="is_dxtx_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_dxtx" id="is_dxtx_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="livingcondition">居住状况</label>
							<div class="col-sm-6 input-group">
								<select id="livingcondition" class="form-control"  name="livingcondition" data-emptyoption="true"
								data-select-value="${perCustomerEntity.livingcondition }" data-select-list="${living_typeList }">
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="live_postcode">居住地址邮政编码</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="live_postcode"  name="live_postcode" value="${perCustomerEntity.live_postcode }"
									class="form-control" placeholder="居住地址邮政编码">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="touch_postcode">通讯地址邮政编码</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="touch_postcode"  name="touch_postcode" value="${perCustomerEntity.touch_postcode }"
									class="form-control" placeholder="通讯地址邮政编码">
							</div>
						</div>
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-12">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="live_address">居住地址</label>
							<div class="col-sm-6 input-group">
								<textarea rows="2" cols="78" id="live_address" name="live_address" 
									maxlength="128" placeholder="居住地址">${perCustomerEntity.live_address }</textarea>
							</div>
						</div>
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-12">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="touch_address">通讯地址</label>
							<div class="col-sm-6 input-group">
								<textarea rows="2" cols="78" id="touch_address" name="touch_address" 
									maxlength="128" placeholder="通讯地址">${perCustomerEntity.touch_address }</textarea>
							</div>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-12">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="domicile">户籍地址</label>
							<div class="col-sm-6 input-group">
								<textarea rows="2" cols="78" id="domicile" name="domicile" 
									maxlength="128" placeholder="户籍地址">${perCustomerEntity.domicile }</textarea>
							</div>
						</div>
					</div>
				</div>		
					
			</div>
			<!-- 客户职业信息 -->
			<div class="step-pane" id="step4">
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="job">职业</label>
							<div class="col-sm-6 input-group">
								<select id="job" class="form-control"  name="job" data-emptyoption="true"
								data-select-value="${perCustomerEntity.job }" data-select-list="${jobList }">
								</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="company_name">单位名称</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="company_name"  name="company_name" value="${perCustomerEntity.company_name }"
									class="form-control" placeholder="单位名称">
							</div>
						</div>
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="company_postcode">单位邮编</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="company_postcode"  name="company_postcode" value="${perCustomerEntity.company_postcode }"
									class="form-control" placeholder="单位邮编">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="company_tel">单位电话</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="company_tel"  name="company_tel" value="${perCustomerEntity.company_tel }"
									class="form-control" placeholder="单位电话">
							</div>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="company_type">单位所属行业</label>
							<div class="col-sm-6 input-group">
								<select id="company_type" class="form-control"  name="company_type" data-emptyoption="true"
								data-select-value="${perCustomerEntity.company_type }" data-select-list="${companyTypeList }">
								</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
					</div>
				</div>		
				<div class="row">
					<div class="form-group col-sm-12">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="company_address">单位地址</label>
							<div class="col-sm-6 input-group">
								<textarea rows="2" cols="69" id="company_address" name="company_address" 
									maxlength="128" placeholder="单位地址">${perCustomerEntity.company_address }</textarea>
							</div>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="job_title">个人职称</label>
							<div class="col-sm-6 input-group">
									<select id="job_title" class="form-control"  name="job_title" data-emptyoption="true"
										data-select-value="${perCustomerEntity.job_title }" data-select-list="${job_titleList }">
									</select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="company_duties">担任职务</label>
							<div class="col-sm-6 input-group">
								<select id="company_duties" class="form-control"  name="company_duties" data-emptyoption="true"
										data-select-value="${perCustomerEntity.company_duties }" data-select-list="${company_dutiesList }">
									</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="work_startdate">本单位工作起始时间</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="work_startdate"  name="work_startdate" value="${perCustomerEntity.work_startdate }" data-date-format="yyyy-mm-dd"
									class="form-control date-picker"  placeholder="本单位工作起始时间">
								<span class="input-group-addon"> 
									<i class="icon-calendar bigger-110"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="income">年收入(元)</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="income"  name="income" value="${perCustomerEntity.income }"
									class="form-control" placeholder="年收入(元)">
							</div>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="salary_bank">工资账户开户银行</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="salary_bank"  name="salary_bank" value="${perCustomerEntity.salary_bank }"
									class="form-control" placeholder="工资账户开户银行">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="salary_account">工资账号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="salary_account"  name="salary_account" value="${perCustomerEntity.salary_account }"
									class="form-control" placeholder="工资账号">
							</div>
						</div>
					</div>
				</div>	
			</div>
			
			<div class="step-pane" id="step5">
				<div class="row">
					<div class="form-group col-sm-6">
						<label class="col-sm-4 control-label" for="is_mycust">是否为本行员工</label>
						<div class="col-sm-6 input-group">
							<div class="radio">
								<input name="is_mycust_check" id="is_mycust_check" type="hidden"  value="${perCustomerEntity.is_mycust }">
								<label><input name="is_mycust" id="is_mycust_y" type="radio" class="ace" value="1"><span	class="lbl">是</span></label>
								<label><input name="is_mycust" id="is_mycust_n" type="radio" class="ace" value="2" checked="checked"><span	class="lbl">否</span></label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_manager_fb">辅办客户经理</label>
							<div class="col-sm-6 input-group">
								<select id="cust_manager_fb" class="form-control"  name="cust_manager_fb" data-emptyoption="true"
								data-select-value="${perCustomerEntity.cust_manager_fb }" data-select-list="${cust_manager_fbList }">
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="branch_noname">经办机构</label>
							<div class="col-sm-6 input-group">
								<input type="hidden" id="branch_no"  name="branch_no" value="${perCustomerEntity.branch_no }"/>
								<input type="text" id="branch_noname"  name="branch_noname" value="${perCustomerEntity.branch_noname }"
									class="form-control" placeholder="经办机构" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_managername">经办客户经理</label>
							<div class="col-sm-6 input-group">
								<input type="hidden" id="cust_manager"  name="cust_manager" value="${perCustomerEntity.cust_manager }"/>
								<input type="text" id="cust_managername"  name="cust_managername" value="${perCustomerEntity.cust_managername }"
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
					<button class="btn btn-sm btn-primary btn-prev" type="button">
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
				 window.location="#loadPageContent";
				 if($("#birthdate").val()!=null &&$("#birthdate").val()!="" ){
					 if($("#birthdate").val().replace("-","").replace("-","")>$("#accDate").val()){
						$("#birthdate_help").closest("form").find(".help-block").remove();
						$("#birthdate_help").after("<div class=\"help-block red\" >&nbsp;&nbsp;*&nbsp;出生日期不能大于["+$("#accDate").val()+"]");
						$("#birthdate").focus();
						return false;
					}
				}
				 $("#birthdate_help").closest("form").find(".help-block").remove();
				if($("#loancard_no").val()!=null &&$("#loancard_no").val()!="" ){
					if (!checkData('loancard_no', '贷款卡号', 'number')) {
						return false;
					}
					if (!checkData('loancard_no', '贷款卡号', 'length_Sixteen')) {
						return false;
					}
				}
				if($("#spouse_name").val()!=null &&$("#spouse_name").val()!="" ){
					if (!checkData('spouse_name', '配偶姓名', 'check_char')) {
						return false;
					}
				}
				if($("#spouse_tel").val()!=null &&$("#spouse_tel").val()!="" ){
					if (!checkData('spouse_tel', '配偶联系电话', 'number')) {
						return false;
					}
					if (!checkData('spouse_tel', '配偶联系电话', 'length_tel')) {
						return false;
					}
				}
				if($("#spouse_paperno").val()!=null &&$("#spouse_paperno").val()!="" ){
					if($("#spouse_papertype").val()=="01" || $("#spouse_papertype").val()=="07"){
						if (!checkData('spouse_paperno', '配偶证件号码', 'checkIdCard')) {
							return false;
						}
					}
				}
				if($("#spouse_papertype").val()!=null &&$("#spouse_papertype").val()!=""&&$("#spouse_papertype").val()!=-1 ){
					if (!checkData('spouse_paperno', '配偶证件号码', 'input')) {
						return false;
					}
				}
				if($("#telephone").val()!=null &&$("#telephone").val()!="" ){
					if (!checkData('telephone', '手机号码', 'number')) {
						return false;
					}
					if (!checkData('telephone', '手机号码', 'length_Eleven')) {
						return false;
					}
				}
				if($("#mailbox").val()!=null &&$("#mailbox").val()!="" ){
					var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
					if (!reg.test($("#mailbox").val())) {
						$("#mailbox").closest("form").find(".help-block").remove();
						$("#mailbox").after("<div class=\"help-block red\" >&nbsp;&nbsp;*&nbsp;电子邮件格式错误！");
						$("#mailbox").focus();
						return false;
					}
				}
				if($("#qq").val()!=null &&$("#qq").val()!="" ){
					if (!checkData('qq', 'QQ', 'number')) {
						return false;
					}
				}
				if($("#live_postcode").val()!=null &&$("#live_postcode").val()!="" ){
					if (!checkData('live_postcode', '居住地址邮编', 'number')) {
						return false;
					}
					if (!checkData('live_postcode', '居住地址邮编', 'length_Six')) {
						return false;
					}
				}
				if($("#touch_postcode").val()!=null &&$("#touch_postcode").val()!="" ){
					if (!checkData('touch_postcode', '通讯地址邮编', 'number')) {
						return false;
					}
					if (!checkData('touch_postcode', '通讯地址邮编', 'length_Six')) {
						return false;
					}
				}
				if($("#company_name").val()!=null &&$("#company_name").val()!="" ){
					if (!checkData('company_name', '单位名称', 'check_char')) {
						return false;
					}
				}
				if($("#company_postcode").val()!=null &&$("#company_postcode").val()!="" ){
					if (!checkData('company_postcode', '单位邮编', 'number')) {
						return false;
					}
					if (!checkData('company_postcode', '单位邮编', 'length_Six')) {
						return false;
					}
				}
				if($("#company_tel").val()!=null &&$("#company_tel").val()!="" ){
					if (!checkData('company_tel', '单位电话', 'number')) {
						return false;
					}
					if (!checkData('company_tel', '单位电话', 'length_tel')) {
						return false;
					}
				}
				if($("#income").val()!=null &&$("#income").val()!="" ){
					if (!checkData('income', '年收入', 'number')) {
						return false;
					}
				}
				if($("#salary_account").val()!=null &&$("#salary_account").val()!="" ){
					if (!checkData('salary_account', '工资账号', 'number')) {
						return false;
					}
				}
				if($("#salary_bank").val()!=null &&$("#salary_bank").val()!="" ){
					if (!checkData('salary_bank', '工资账户开户银行', 'check_char')) {
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
	jQuery(function($){		
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});});
	jQuery(function($){
		$("#sex").formComponents("select");
		$("#cert_type").formComponents("select");
		$("#cert_validitytype").formComponents("select");
		$("#nation").formComponents("select");
		$("#nationality").formComponents("select");
		$("#education").formComponents("select");
		$("#cust_worth").formComponents("select");
		$("#livingcondition").formComponents("select");
		$("#company_duties").formComponents("select");
		$("#education_duties").formComponents("select");
		$("#cust_manager_fb").formComponents("select");
		$("#maritalstatus").formComponents("select");
		$("#spouse_papertype").formComponents("select");
		$("#salary_bank").formComponents("select");
		$("#company_type").formComponents("select");
		$("#job").formComponents("select");
		$("#job_title").formComponents("select");
		$('[name="is_mycust"]:radio').each(function(){if(this.value==$("#is_mycust_check").val()){this.checked=true;}});
		$('[name="is_dxtx"]:radio').each(function(){if(this.value==$("#is_dxtx_check").val()){this.checked=true;}});
	});
	function subForm(){
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/perCustomer_editSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					f_alert("<%=path%>","success","perCustomer_getList.do?pageNo="+$("#pageNo").val());
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
	function goback(){
		window.location="<%=path%>/mvc/perCustomer_getList.do?pageNo="+$("#pageNo").val();
	}
	</script>
</body>
</html>