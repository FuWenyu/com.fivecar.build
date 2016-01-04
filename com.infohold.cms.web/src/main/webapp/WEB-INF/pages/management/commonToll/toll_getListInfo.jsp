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
								<th>收费编号</th>
								<th>收费类型</th>
								<th>交易类别</th>
								<th>付费账号</th>
								<th>客户名称</th>
								<th>客户类型</th>
								<th>收费金额</th>
								<th>收费日期</th>
								<th>收费状态</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${rsList}" var="rsList">
							<tr>
								<td>${rsList.toll_id}</td>
								<td>
									<c:if test="${rsList.toll_type  == '10001'}">票据结算手续费收入</c:if>
									<c:if test="${rsList.toll_type  == '10002'}">国内贸易融资手续费收入</c:if>
									<c:if test="${rsList.toll_type  == '10003'}">银行承兑汇票手续费收入</c:if>
									<c:if test="${rsList.toll_type  == '10004'}">人民币担保业务手续费收入</c:if>
									<c:if test="${rsList.toll_type  == '20001'}">代收手续费分润</c:if>
								</td>
								<td>
									<c:if test="${rsList.trade_type  == '1'}">现金</c:if>
									<c:if test="${rsList.trade_type  == '2'}">转账</c:if>
								</td>
								<td>${rsList.toll_acct}</td>
								<td>${rsList.cust_name}</td>
								<td>
									<c:if test="${rsList.khlx  == '1'}">企业客户</c:if>
									<c:if test="${rsList.khlx  == '2'}">个人客户</c:if>
								</td>
								<td>${rsList.toll_amount}</td>
								<td>${rsList.create_date}</td>
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
										<c:if test="${rsList.status  == '1'}">
											<button class="btn btn-sm btn-primary" onclick="editEntity('${rsList.toll_id}');"
												type="button">修改</button>
											<button class="btn btn-sm btn-primary" onclick="toll_account('${rsList.toll_id}');"
												type="button">入账审批</button>
										</c:if>
										<button class="btn btn-sm btn-primary" onclick="viewEntity('${rsList.toll_id}');"
												type="button">查看</button>
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