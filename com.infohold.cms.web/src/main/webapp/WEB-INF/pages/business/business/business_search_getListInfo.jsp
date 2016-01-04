<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

					<div id="sample-table-2_wrapper" class="dataTables_wrapper"
						role="grid">
						<input type="hidden" id="id" name="id" />
						<table id="sample-table-2"
							class="table table-striped table-bordered table-hover dataTable"
							aria-describedby="sample-table-2">
							<thead>
								<tr>
									<th>业务编号</th>
									<th>合同编号</th>
									<th>客户编号</th>
									<th>客户名称</th>
									<th>产品名称</th>
									<th>申请金额</th>
									<th>担保方式</th>
									<th>循环标志</th>
									<th>申请状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${bizBussinessList}" var="bizBusinessEntity">
									<tr>
										<td>${bizBusinessEntity.BUSINESSID}</td>
										<td><a href="#" onclick="viewContract('${bizBusinessEntity.contract_id}');">${bizBusinessEntity.contract_id}</a></td>
										<td>${bizBusinessEntity.CUSTID}</td>
										<td>${bizBusinessEntity.CUSTNAME}</td>
										<td>${bizBusinessEntity.pro_name}</td>
										<td>${bizBusinessEntity.AMOUNT}</td>
										<td>${bizBusinessEntity.dbfs}</td>
										<td>${bizBusinessEntity.xhbz}</td>
										<td><span class="label label-sm label-warning">${bizBusinessEntity.sqzt_name}</span></td>
										<td>
											<!-- 列表按钮区域 -->
											<div
												class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<button type="button" class="btn btn-xs btn-primary"
													onclick="viewEntity('${bizBusinessEntity.BUSINESSID}','${bizBusinessEntity.SQZT}','${bizBusinessEntity.ZYDBFS}')">查看</button>
											</div>
										</td>
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
							<jsp:include page="../../common/page.jsp"></jsp:include>
						</div>
					</div>
				