<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
				<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
					<table id="sample-table-2" class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2">
						<thead>
							<tr>
								<th>合同编号</th>
								<th>产品名称</th>
								<th>项目金额</th>
								<th>项目期限</th>
								<th>期限类型</th>
								<th>利率</th>
								<th>客户名称</th>
								<th>担保公司名称</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${list}" var="list">
								<tr>
									<td>${list.contract_id}</td>
									<td>${list.product_name}</td>
									<td>${list.amount}</td>
									<td>${list.periods}</td>
									<td>${list.periods_type}</td>
									<td>${list.rat_exe_val}</td>
									<td>${list.cust_name}</td>
									<td>${list.branch_name}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<div class="col-sm-4">
							<div class="btn-group">
								<!-- 列表底部按钮区域 -->
							</div>
						</div>
						<!-- 分页 -->
						<jsp:include page="../common/page.jsp"></jsp:include>
					</div>
				</div>

