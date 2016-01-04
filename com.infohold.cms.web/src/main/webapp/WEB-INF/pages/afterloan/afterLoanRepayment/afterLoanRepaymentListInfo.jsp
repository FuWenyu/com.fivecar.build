<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>

		
				<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
												<table id="sample-table-2"
													class="table table-striped table-bordered table-hover dataTable"
													aria-describedby="sample-table-2">
													
													<thead>
												
												<tr>
													<th>借据编号</th>
													<th>合同编号</th>
													<th>客户编号</th>									
													<th>还款类型</th>
													<th>还款金额</th>
													<th>申请时间</th>
													<th>申请机构</th>
													<th>操作</th>

												</tr>
											</thead>
													<tbody>														
											
											<c:forEach items="${afterLoanRepaymentList}" var="afterloanlist">
													<tr>
														<td>${afterloanlist.duebill_acct}</td>
														<td>${afterloanlist.con_acct}</td>
														<td>${afterloanlist.custid}</td>
														<td>${afterloanlist.reytype}</td>
														<td>${afterloanlist.repay_amount}</td>
														<td>${afterloanlist.create_date}</td>
														<td><span class="label label-sm label-warning">
														${afterloanlist.approvestatus}</span></td>
														<td>
														<!-- 列表按钮区域 -->
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
														<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${afterloanlist.re_id}')">查看</button>
														<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${afterloanlist.re_id}','${afterloanlist.approvestatus}')">编辑</button>
														<button type="button" class="btn btn-xs btn-primary" onclick="cancleEntity('${afterloanlist.re_id}','${afterloanlist.approvestatus}')">取消</button>
														<button type="button" class="btn btn-xs btn-primary" onclick="approveEntity('${afterloanlist.re_id}','${afterloanlist.approvestatus}')">提起审批</button>
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
				
