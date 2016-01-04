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
													<th>合同编号</th>
													<th>借据编号</th>
													<th>产品名称</th>
													<th>借据金额</th>
													<th>客户名称</th>
													<th>借据起始日期</th>
													<th>借据到期日期</th>
													<th>展期到期日期</th>
													<th>展期金额</th>
													<th>申请状态</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${extensionList}" var="bizExtensionEntity">
													<tr>
														<td>${bizExtensionEntity.con_acct}</td>
														<td>${bizExtensionEntity.duebill_acct}</td>
														<td>${bizExtensionEntity.product_name}</td>
														<td>${bizExtensionEntity.duebill_amount}</td>
														<td>${bizExtensionEntity.cust_name}</td>
														<td>${bizExtensionEntity.start_date}</td>
														<td>${bizExtensionEntity.end_date}</td>
														<td>${bizExtensionEntity.zqdqrq}</td>
														<td>${bizExtensionEntity.zqje}</td>
														<td><fmt:message key='FL_SPZT.${bizExtensionEntity.sqzt}' /></td>
														<td>
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
															<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${bizExtensionEntity.xh}','${bizExtensionEntity.spzt}')">查看</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${bizExtensionEntity.xh}','${bizExtensionEntity.spzt}')">编辑</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="cancleEntity('${bizExtensionEntity.xh}','${bizExtensionEntity.spzt}')">取消</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="startWork('${bizExtensionEntity.xh}','${bizExtensionEntity.spzt}')">提起审批</button>
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
												<jsp:include page="../../common/page.jsp"></jsp:include>
											</div>
									</div>	