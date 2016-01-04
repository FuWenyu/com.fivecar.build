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
				<th>本期预分类结果</th>
				<th>当前分类结果</th>
				<th>调整后分类结果</th>
				<th>调整时间</th>
				<th>是否为新增不良</th>
				<th>审批状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${loanClassAdjustList}" var="loanClassAdjustList">
				<tr>
					<td><a
						href="javascript:viewEntity(${loanClassAdjustList.duebill_id});">${loanClassAdjustList.duebill_id}</a></td>
					<td>${loanClassAdjustList.cust_name}</td>
					<td>${loanClassAdjustList.balance}</td>
					<td>${loanClassAdjustList.curr_batch_name}</td>
					<td>${loanClassAdjustList.curr_manual_name}</td>
					<td>${loanClassAdjustList.level_name}</td>
					<td>${loanClassAdjustList.create_date}</td>
					<td>
						<c:if test="${loanClassAdjustList.curr_level_manual<=2 }">
							<c:if test="${loanClassAdjustList.level<3}">
								否</c:if>
							<c:if test="${loanClassAdjustList.level>=3}">
								是</c:if>
						</c:if>
						<c:if test="${loanClassAdjustList.curr_level_manual>2 }">
							否
						</c:if>
					</td>
					<td class="hidden-240"><span
						class="label label-sm label-warning">${loanClassAdjustList.name_}</span>
					</td>
					<td><c:if test="${ loanClassAdjustList.status==0}">
							<button type="button" class="btn btn-sm btn-primary"
								onclick="upApprove(${loanClassAdjustList.adjust_id},${loanClassAdjustList.cust_id});">提起审批</button>
							<button type="button" class="btn btn-sm btn-primary"
								onclick="deleteEntity(${loanClassAdjustList.adjust_id});">取消分类调整</button>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
		<div class="row">
			<div class="col-sm-4">
				<div class="btn-group">
					<button type="button" class="btn btn-sm btn-primary"
						onclick="addEntity();">新增分类调整</button>
				</div>
			</div>
			<jsp:include page="../common/page.jsp"></jsp:include>
		</div>
	</div>
</div>
