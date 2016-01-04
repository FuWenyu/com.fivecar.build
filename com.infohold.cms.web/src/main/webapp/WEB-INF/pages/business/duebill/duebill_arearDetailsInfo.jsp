<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<div class="row">
	<div class="space-6"></div>
	<div class="form-group">
		<div class="col-md-1"></div>
		<label class="col-sm-1 control-label no-padding-right"
			for="outStandingBalance">未偿还金额
		</label>
		<div class="col-sm-4">						
			<input type="text" id="outStandingBalance" class="col-xs-10 col-sm-6 " 
				name="outStandingBalance"  value="${map.outStandingBalance }" readonly/>
		</div>
		<div class="col-md-0"></div>
		<label class="col-sm-1 control-label no-padding-right"
			for="accrualStatus">贷款账户状态
		</label>
		<div class="col-sm-4">	
			   <input type="text" id="accrualStatus" class="col-xs-10 col-sm-6" 
				name="accrualStatus" value="${map.accrualStatus }"readonly/>
		 </div>									     									
		<div class="col-md-1"></div>
	</div>
</div>
<div class="row">
	<div class="space-6"></div>
	<div class="form-group">
		<div class="col-md-1"></div>
		<label class="col-sm-1 control-label no-padding-right"
			for="maturityDate">贷款账户到期日
		</label>
		<div class="col-sm-4">						
			<input type="text" id="maturityDate" class="col-xs-10 col-sm-6 " data-date-format="yyyymmdd"
				name="maturityDate"  value="${map.maturityDate }" readonly/>
		</div>
	</div>
</div>
<div class="row">
	<div class="space-6"></div>
	<div class="col-sm-1"></div>	
	<div class="col-sm-9">
	<table id="sample-table-22" class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>欠款期数</th>
				<th>欠款类型</th>
				<th>欠款日</th>
				<th>本期应收金额</th>
				<th>欠款金额</th>
				<th>上次偿还日</th>
				<th>逾期天数</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${map.item}" var="item">
				<tr>
					<td>${item.unPaidInstallments}</td>
					<td>${item.arrearType}</td>
					<td>${item.dueDate}</td>
					<td>${item.assessedAmount}</td>
					<td>${item.dueAmount}</td>
					<td>${item.lastPaymentDueDate}</td>
					<td>${item.daysPastDue}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="col-sm-2"></div>	
</div>
<script type="text/javascript">
	jQuery(function($) {
		var oTable1 = $('#sample-table-22').dataTable( {
			"aoColumns": [
		      null,null,null,null,null,null,null
			] } );
		$("#sample-table-22_wrapper").find("div").get(0).remove();
		$("#sample-table-22_info").remove();
     })
	</script>