<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
	<table id="sample-table-2"
		class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2">
		<thead>
			<tr>
				<th>流程实例ID</th>
				<th>业务编号</th>
				<th>客户编号</th>
				<th>客户名称</th>
				<th>审批类型</th>
				<th>启动时间</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${queryHisApproveList}" var="queryHisApproveList">
				<tr>
					<td><a href="#" onclick="viewApprove('${queryHisApproveList.bizid}')">${queryHisApproveList.processinsid}</a></td>
					<td><a href="#" onclick="viewBusiness('${queryHisApproveList.bizid}','${queryHisApproveList.bizcode}')">${queryHisApproveList.bizid}</a></td>
					<td><a href="#" onclick="viewCust('${queryHisApproveList.custid}')">${queryHisApproveList.custid}</a></td>
					<td>${queryHisApproveList.custname}</td>
					<td><fmt:message key='approve_type.${queryHisApproveList.bizcode}' /></td>
					<td>${queryHisApproveList.createdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="row">
		<div class="col-sm-4"></div>
		<!-- 分页 -->
		<jsp:include page="../common/page.jsp"></jsp:include>
	</div>
</div>