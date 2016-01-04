<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<div id="qryContent">
											<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
												<table id="sample-table-2"
											class="table table-striped table-bordered table-hover dataTable"
											aria-describedby="sample-table-2">
											<thead>
												
												<tr>
													<th>系统借据编号</th>
													<th>客户名称</th>
													<th>产品名称</th>
													<th>合同编号</th>
													<th>借据编号</th>
													<th>借据金额</th>
													<th>起始日期</th>
													<th>到期日期</th>
													<th>借据状态</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${BizDueBillList}" var="BizDueBillList">
													<tr>
														<td>${BizDueBillList.duebill_id}</td>
														<td>${BizDueBillList.custchname}</td>
														<td>${BizDueBillList.product_name}</td>
														<td>${BizDueBillList.con_acct}</td>
														<td>${BizDueBillList.duebill_acct}</td>
														<td>${BizDueBillList.duebill_amount}</td>
														<td>${BizDueBillList.start_date}</td>
														<td>${BizDueBillList.end_date}</td>
														<td><span class="label label-sm label-warning">
														    ${BizDueBillList.status1}</span></td>
														<td>
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
															<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${BizDueBillList.duebill_id}','${BizDueBillList.status}')">查看</button>
															<c:if test="${flag !=1}">
															<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${BizDueBillList.duebill_id}','${BizDueBillList.status}')">编辑</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="cancleEntity('${BizDueBillList.duebill_id}','${BizDueBillList.status}')">取消</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="approveEntity('${BizDueBillList.duebill_id}','${BizDueBillList.status}')">推送运营中心</button>
															</c:if>
															
															<c:if test="${flag == 1}"><!-- 查询列表的请求 -->
															<button type="button" class="btn btn-xs btn-primary" onclick="schedule('${BizDueBillList.duebill_id}')">还款计划查询</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="arearDetails('${BizDueBillList.duebill_id}')">欠款信息查询</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="approveEntity('${BizDueBillList.duebill_id}','${BizDueBillList.status}')">还款记录查询</button>
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
													<c:if test="${flag !=1}">
														<!-- 列表底部按钮区域 -->
															<button class="btn btn-sm btn-primary" onclick="addEntity();" type="button">新增</button>
													</c:if>
													</div>
												</div>
												<!-- 分页 -->
												<jsp:include page="../../common/page.jsp"></jsp:include>
											</div>
									</div>				
					</div>