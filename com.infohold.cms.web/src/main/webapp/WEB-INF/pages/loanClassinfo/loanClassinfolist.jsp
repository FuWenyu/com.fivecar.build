<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<div class="table-responsive">
	<table id="sample-table-2"
		class="table table-striped table-bordered table-hover dataTable"
		aria-describedby="sample-table-2">
		<thead>
			<tr>
				<th>借据编号</th>
				<th>客户名称</th>
				<th>预分类贷款余额(元)</th>
				<th>上期分类结果</th>
				<th>本期预分类结果</th>
				<th>当前分类结果</th>
				<th>审批状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${contractList}" var="contractList">
				<tr>
					<td>${contractList.duebill_id}</td>
					<td>${contractList.cust_name}</td>
					<td>${contractList.balance}</td>
					<td><c:if test="${contractList.last_level==1}">正常</c:if> <c:if
							test="${contractList.last_level==2}">关注</c:if> <c:if
							test="${contractList.last_level==3}">次级</c:if> <c:if
							test="${contractList.last_level==4}">可疑</c:if> <c:if
							test="${contractList.last_level==5}">损失</c:if></td>
					<td><c:if test="${contractList.curr_level_batch==1}">正常</c:if>
						<c:if test="${contractList.curr_level_batch==2}">关注</c:if> <c:if
							test="${contractList.curr_level_batch==3}">次级</c:if> <c:if
							test="${contractList.curr_level_batch==4}">可疑</c:if> <c:if
							test="${contractList.curr_level_batch==5}">损失</c:if></td>
					<td><c:if test="${contractList.curr_level_manual==1}">正常</c:if>
						<c:if test="${contractList.curr_level_manual==2}">关注</c:if> <c:if
							test="${contractList.curr_level_manual==3}">次级</c:if> <c:if
							test="${contractList.curr_level_manual==4}">可疑</c:if> <c:if
							test="${contractList.curr_level_manual==5}">损失</c:if></td>
					<td>${contractList.create_date}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
		<div class="row">
			<!-- 分页 -->
			<jsp:include page="../common/page.jsp"></jsp:include>
		</div>
	</div>
</div>
