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
												    <th>申请序号</th>
													<th>合同编号</th>
													<th>担保合同编号</th>
													<th>客户名称</th>
													<th>合同金额</th>
													<th>合同起始日期</th>
													<th>合同到期日期</th>
													<th>申请状态</th>	
													<th>操作</th>

												</tr>
											</thead>
													<tbody>
														<c:forEach items="${Guarantee_ChangeList}" var="Guarantee_ChangeList" >
												<tr>
													<td>${Guarantee_ChangeList.change_id}</td>
													<td>${Guarantee_ChangeList.con_acct}</td>
													<td>${Guarantee_ChangeList.guarantee_id}</td>
													<td>${Guarantee_ChangeList.custchname}</td>
													<td>${Guarantee_ChangeList.amount}</td>
													<td>${Guarantee_ChangeList.start_date}</td>
													<td>${Guarantee_ChangeList.end_date}</td>
													<td><span class="label label-sm label-warning">${Guarantee_ChangeList.status_name}</span></td>
													<td>
														<!-- 列表按钮区域 -->
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
														<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${Guarantee_ChangeList.contract_id}','${Guarantee_ChangeList.guarantee_id}')">查看</button>
														<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${Guarantee_ChangeList.contract_id}','${Guarantee_ChangeList.guarantee_id}','${Guarantee_ChangeList.status}')">编辑</button>
														<button type="button" class="btn btn-xs btn-primary" onclick="cancleEntity('${Guarantee_ChangeList.change_id}','${Guarantee_ChangeList.status}')">取消</button>
														<button type="button" class="btn btn-xs btn-primary" onclick="approveEntity('${Guarantee_ChangeList.change_id}','${Guarantee_ChangeList.status}')">提起审批</button>
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
	</body>
</html>
