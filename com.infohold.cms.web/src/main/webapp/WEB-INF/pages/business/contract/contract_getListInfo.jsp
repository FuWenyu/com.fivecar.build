<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

										<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
												<table id="sample-table-2"
													class="table table-striped table-bordered table-hover dataTable"
													aria-describedby="sample-table-2">
													<thead>
													<tr>
													<th>业务编号</th>
													<th>合同编号</th>
													<th>客户名称</th>
													<th>产品名称</th>
													<th>合同金额</th>
													<th>担保方式</th>
													<th>起始日期</th>
													<th>到期日期</th>
													<th>合同状态</th>
													<th>操作</th>
													</tr>
													</thead>
													<tbody>
														<c:forEach items="${contractList}" var="contractList" >
												<tr>
													
													<td>${contractList.contract_id}</td>
													<td>${contractList.con_acct}</td>
													<td>${contractList.custchname}</td>
													<td>${contractList.product_name}</td>
													<td>${contractList.amount}</td>
													<td>${contractList.gua_type}</td>
													<td>${contractList.start_date}</td>
													<td>${contractList.end_date}</td>
													<td><span class="label label-sm label-warning">${contractList.status_name}</span></td>
													<td>
													<!-- 列表按钮区域 -->
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
														<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${contractList.contract_id}')">查看</button>
														<c:if test="${flag !=1}"><!-- 1:从查询菜单过来的请求，非1：是业务菜单发的请求 -->
															<c:if test="${contractList.status==1}"><!-- 待审批 -->
															<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${contractList.contract_id}','${contractList.status}')">编辑</button>
															</c:if>
															<c:if test="${contractList.status ==1&&contractList.status ==7}"><!-- 待审批 -->
															<button type="button" class="btn btn-xs btn-primary" onclick="deleteEntity('${contractList.contract_id}','${contractList.status}')">取消</button>
															</c:if>
															<button class="btn btn-xs btn-primary" onclick="yingxiang('${contractList.contract_id}')" type="button">上传影像</button>
															<c:if test="${contractList.status==1}"><!-- 待审批 -->
															<button type="button" id="approve" class="btn btn-xs btn-primary" onclick="approveEntity('${contractList.contract_id}','${contractList.status}')">提起审批</button>
															</c:if>
															<c:if test="${contractList.status==7}"><!-- 待补录 -->
															<button type="button" class="btn btn-xs btn-primary" onclick="notify_operare_addLoan('${contractList.contract_id}','${contractList.status}')">提交运营中心</button>
															</c:if>
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
														<!-- 列表底部按钮区域 -->
														<c:if test="${flag !=1}">
															<button class="btn btn-sm btn-primary" onclick="addEntity();" type="button">新增</button>
														</c:if>
													</div>
												</div>
												<!-- 分页 -->
												<jsp:include page="../../common/page.jsp"></jsp:include>
											</div>
									</div>			