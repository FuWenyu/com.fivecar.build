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
								<th>产品代码</th>
								<th>产品名称</th>
								<th>产品类型</th>
								<th>币种</th>
								<th>担保方式</th>
								<th>还款方式</th>
								<th>产品状态</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${rsList}" var="rsList">
							<tr>
								<td>${rsList.pro_code}</td>
								<td>${rsList.pro_name}</td>
								<td><fmt:message key="pro_type.${rsList.pro_type}" /></td>
								<td><fmt:message key="currency_type.${rsList.cny}" /></td>
								<td>${rsList.guarantee_type_name}</td>
								<td>${rsList.repay_type_name}</td>
								<td>
									<c:if test="${rsList.status  == '1'}">启用</c:if>
									<c:if test="${rsList.status  == '0'}">停用</c:if>
								</td>	
								<td>
									<div class="btn-group">
										<button class="btn btn-sm btn-primary" onclick="editEntity('${rsList.pro_code}');"
											type="button">修改</button>
										<c:if test="${rsList.status  == '1'}">
											<button class="btn btn-sm btn-primary" onclick="stopEntity('${rsList.pro_code}');"
												type="button">停用</button>
										</c:if>
										<c:if test="${rsList.status  == '0'}">
											<button class="btn btn-sm btn-primary" onclick="useEntity('${rsList.pro_code}');"
												type="button">启用</button>
										</c:if>
										<button class="btn btn-sm btn-primary" onclick="viewEntity('${rsList.pro_code}');"
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