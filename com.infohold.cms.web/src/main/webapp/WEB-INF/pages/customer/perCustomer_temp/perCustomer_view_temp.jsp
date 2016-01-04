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
			<input type="hidden" id="id"  name="id" value="${perCustomerEntity.id }"/>
			<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
		<!--  基本信息 -->
		<h3 class="header smaller lighter grey">客户基本信息</h3>
		  <div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="cust_id">客户编号:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.cust_id }</label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="cust_name">客户名称:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.cust_name }</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="zjlx">证件类型:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" ><fmt:message key='per_id_type.${perCustomerEntity.cert_type }' /></label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="cert_no">证件号码:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.cert_no }</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-6">
			  	<div class="form-group">
					<label class="col-sm-4 control-label" for="cert_validitytype">证件有效类型:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" ><fmt:message key='cert_validitytype.${perCustomerEntity.cert_validitytype }' /></label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label"
						for="cert_duedate">证件到期日:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.cert_duedate }</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label"
						for="cert_place">证件签发地区:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.cert_place }</label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label"
						for="cert_place_name">证件签发机构:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.cert_place_name }</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label">性别:</label>
					<div class="input-group col-sm-6">
						<label class="control-label" ><fmt:message key='SEX_.${perCustomerEntity.sex }' /></label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="birthdate">出生日期:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.birthdate }</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="nation">民族:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" ><fmt:message key='nation_type.${perCustomerEntity.nation }' /></label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="nationality">国籍:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" ><fmt:message key='nationality.${perCustomerEntity.nationality }' /></label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="education">最高学历</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" ><fmt:message key='education_grade.${perCustomerEntity.education }' /></label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="education_duties">最高学位</label>
					<div class="col-sm-6 input-group">
							<label class="control-label" ><fmt:message key='education_xw.${perCustomerEntity.education_duties }' /></label>
					</div>
				</div>
			</div>
		</div>		
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="cust_worth">客户价值类别</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" ><fmt:message key='cust_worth.${perCustomerEntity.cust_worth }' /></label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="loancard_no">贷款卡号:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.loancard_no }</label>
					</div>
				</div>
			</div>
		</div>				
	<!--配偶信息 -->
	<h3 class="header smaller lighter grey">客户配偶信息</h3>
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="maritalstatus">婚姻状况:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" ><fmt:message key='marital_status.${perCustomerEntity.maritalstatus }' /></label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
			</div>
		</div>		
		
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="spouse_name">配偶姓名:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.spouse_name }</label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="spouse_tel">配偶电话:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.spouse_tel }</label>
					</div>
				</div>
			</div>
		</div>		
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="spouse_papertype">配偶证件类型:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" ><fmt:message key='per_id_type.${perCustomerEntity.spouse_papertype }' /></label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="spouse_paperno">配偶证件号码:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.spouse_paperno }</label>
					</div>
				</div>
			</div>
		</div>			
	<!--居住信息 -->
	<h3 class="header smaller lighter grey">客户居住信息 </h3>
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="homephone">住宅电话:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.homephone }</label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="telephone">手机号码:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.telephone }</label>
					</div>
				</div>
			</div>
		</div>	
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="mailbox">电子邮箱:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.mailbox }</label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="qq">QQ号码:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.qq }</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-6">
				<label class="col-sm-4 control-label" for="is_dxtx">是否短信提醒</label>
				<div class="col-sm-6 input-group">
					<label class="control-label" ><fmt:message key='YESORNO.${perCustomerEntity.is_dxtx }' /></label>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="livingcondition">居住状况</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" ><fmt:message key='living_type.${perCustomerEntity.livingcondition }' /></label>
					</div>
				</div>
			</div>
		</div>	
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="live_postcode">居住地址邮政编码:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.live_postcode }</label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="touch_postcode">通讯地址邮政编码:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.touch_postcode }</label>
					</div>
				</div>
			</div>
		</div>		
		<div class="row">
			<div class="form-group col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="live_address">居住地址:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.live_address }</label>
					</div>
				</div>
			</div>
		</div>		
		<div class="row">
			<div class="form-group col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="touch_address">通讯地址:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.touch_address }</label>
					</div>
				</div>
			</div>
		</div>	
		<div class="row">
			<div class="form-group col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="domicile">户籍地址:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.domicile }</label>
					</div>
				</div>
			</div>
		</div>		
			
	<!-- 客户职业信息 -->
	<h3 class="header smaller lighter grey">客户职业信息 </h3>
		<div class="row">
			<div class="form-group col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="job">职业:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" ><fmt:message key='job_type.${perCustomerEntity.job }' /></label>
					</div>
				</div>
			</div>
		</div>		
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="company_name">单位名称:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.company_name }</label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="company_type">单位所属行业:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" ><fmt:message key='profession_type.${perCustomerEntity.company_type }' /></label>
					</div>
				</div>
			</div>
		</div>		
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="company_postcode">单位邮编:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.company_postcode }</label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="company_tel">单位电话:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.company_tel }</label>
					</div>
				</div>
			</div>
		</div>	
		<div class="row">
			<div class="form-group col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="company_address">单位地址:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.company_address }</label>
					</div>
				</div>
			</div>
		</div>	
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="job_title">个人职称:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" ><fmt:message key='job_title.${perCustomerEntity.job_title }' /></label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="company_duties">担任职务:</label>
					<div class="col-sm-6 input-group">
					<label class="control-label" ><fmt:message key='company_duties.${perCustomerEntity.company_duties }' /></label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="work_startdate">本单位工作起始年份:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.work_startdate }</label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="income">年收入(元):</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.income }</label>
					</div>
				</div>
			</div>
		</div>	
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="salary_bank">工资账户开户银行:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.salary_bank }</label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="salary_account">工资账号:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.salary_account }</label>
					</div>
				</div>
			</div>
		</div>	
		<!-- 客户经办信息 -->
	<h3 class="header smaller lighter grey">客户经办信息 </h3>
		<div class="row">
			<div class="form-group col-sm-6">
				<label class="col-sm-4 control-label" for="is_mycust">是否为本行员工</label>
				<div class="col-sm-6 input-group">
					<label class="control-label" ><fmt:message key='YESORNO.${perCustomerEntity.is_mycust }' /></label>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="cust_manager_fb">辅办客户经理</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.cust_manager_fbname }</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="branch_noname">经办机构:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.branch_noname }</label>
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="cust_managername">经办客户经理:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.cust_managername }</label>
					</div>
				</div>
			</div>
		</div>	
		<div class="row">
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="create_date">创建日期:</label>
					<div class="col-sm-6 input-group">
					<label class="control-label" >${perCustomerEntity.create_date }</label> 
					</div>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<label class="col-sm-4 control-label" for="update_date">维护日期:</label>
					<div class="col-sm-6 input-group">
						<label class="control-label" >${perCustomerEntity.update_date }</label>
					</div>
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
	<div class="page-content" style="height:40px;"> </div>
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
				
			}).on('finished', function(e) {
				return false;
			}).on('stepclick', function(e){
			});
		
		});
		</script>
	<script type="text/javascript">
	jQuery(function($){
		$("#sex").formComponents("select");
		$("#cert_type").formComponents("select");
		$("#cert_validitytype").formComponents("select");
		$("#nation").formComponents("select");
		$("#nationality").formComponents("select");
		$("#education").formComponents("select");
		$("#maritalstatus").formComponents("select");
		$("#spouse_papertype").formComponents("select");
		$("#salary_bank").formComponents("select");
		$("#company_type").formComponents("select");
		$("#job").formComponents("select");
		$("#job_title").formComponents("select");
	});
	function goback(viewtype){
		window.location="<%=path%>/mvc/perCustomer_getList_temp.do?pageNo="+$("#pageNo").val();
	}
	</script>
</body>
</html>