<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">

					<table id="sample-table-2"
						class="table table-striped table-bordered table-hover dataTable"
						aria-describedby="sample-table-2">
						<thead>
							<tr>
								<th>冲账编号</th>
								<th>借据编号</th>
								<th>客户名称</th>
								<th>交易金额</th>
								<th>交易时间</th>
								<th>客户经理</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${rsList}" var="rsList">
							<tr>
								<td>${rsList.acc_back_id}</td>
								<td>${rsList.biz_id}</td>
								<td>${rsList.cust_name}</td>
								<td>${rsList.duebill_amount}</td>
								<td>${rsList.loan_date}</td>
								<td>${rsList.cust_manager_name}</td>
								<td>
									<c:if test="${rsList.status  == '0'}">已取消</c:if>
									<c:if test="${rsList.status  == '1'}">待审批</c:if>
									<c:if test="${rsList.status  == '2'}">审批中</c:if>
									<c:if test="${rsList.status  == '3'}">审批通过</c:if>
									<c:if test="${rsList.status  == '4'}">审批未通过</c:if>
									<c:if test="${rsList.status  == '5'}">已生效</c:if>
									<c:if test="${rsList.status  == '6'}">退回修改</c:if>
								</td>	
								<td>
									<div class="btn-group">
										<c:if test="${rsList.status  == '1' || rsList.status  == '6'}">
											<button class="btn btn-sm btn-primary" onclick="editEntity('${rsList.acc_back_id}');"
												type="button">修改</button>
											<button class="btn btn-sm btn-primary" onclick="approveEntity('${rsList.acc_back_id}');"
												type="button">提起审批</button>
										</c:if>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<div class="col-sm-4">
							<div class="btn-group">
								<button class="btn btn-sm btn-primary" onclick="addEntity();"
									type="button">新增</button>
							</div>
						</div>
						<!-- 分页 -->
						<jsp:include page="../../common/page.jsp"></jsp:include>
					</div>
				</div>