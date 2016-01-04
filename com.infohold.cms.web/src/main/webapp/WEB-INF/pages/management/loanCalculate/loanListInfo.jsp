<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
	<table id="sample-table-2" class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>期数</th>
				<th>开始日期</th>
				<th>还款日期</th>
				<th>利率</th>
				<th>本金金额</th>
				<th>利息金额</th>
				<th>分期金额</th>
				<th>剩余本金</th>
				<th>计息天数</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.installmentNumber}</td>
					<td>${list.startDate}</td>
					<td>${list.repaymentDay}</td>
					<td>${list.interestRate}</td>
					<td>${list.principalAmount}</td>
					<td>${list.interestAmount}</td>
					<td>${list.installmentAmount}</td>
					<td>${list.principalBalance}</td>
					<td>${list.interestDays}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script type="text/javascript">
		/*********页面加载区域**********/
		jQuery(function($) {
			initTable();
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		//初始化表格
		function initTable(){
			var oTable1 = $('#sample-table-2').dataTable( {
				"aoColumns": [
			      null,null,null,null,null,null,null,null,null
				] } );
			$("#sample-table-2_wrapper").find("div").get(0).remove();
			$("#sample-table-2_info").remove();
		}
	</script>