<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
%>

											<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
												<table id="sample-table-2"
											class="table table-striped table-bordered table-hover dataTable"
											aria-describedby="sample-table-2">
											<thead>
												
												<tr>
													<th>序号</th>
													<th>合同编号</th>
													<th>客户名称</th>
													<th>产品名称</th>
													<th>合同起始日期</th>
													<th>合同到期日期</th>
													<th>合同金额</th>
													<th>审批状态</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${terminationList}" var="terminationEntity">
													<tr>
														<td>${terminationEntity.xh}</td>
														<td>${terminationEntity.con_no}</td>
														<td>${terminationEntity.cust_name}</td>
														<td>${terminationEntity.product_name}</td>
														<td>${terminationEntity.start_date}</td>
														<td>${terminationEntity.end_date}</td>
														<td>${terminationEntity.amount}</td>
														<td><fmt:message key='FL_SPZT.${terminationEntity.spzt}' /></td>
														<td>
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
															<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${terminationEntity.xh}','${terminationEntity.spzt}')">查看</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${terminationEntity.xh}','${terminationEntity.spzt}')">编辑</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="cancleEntity('${terminationEntity.xh}','${terminationEntity.spzt}')">取消</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="approveEntity('${terminationEntity.xh}','${terminationEntity.spzt}')">推送运营中心</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="openAccountEntity('${terminationEntity.xh}','${terminationEntity.spzt}')">开立贷款账户</button>
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
															<button class="btn btn-sm btn-primary" onclick="addEntity();" type="button">新增</button>
													</div>
												</div>
												<!-- 分页 -->
												<jsp:include page="../common/page.jsp"></jsp:include>
											</div>
									</div>	