<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<div id="sample-table-2_wrapper" class="dataTables_wrapper"role="grid">
	<table id="sample-table-2"
		class="table table-striped table-bordered table-hover dataTable"
		aria-describedby="sample-table-2">
		<thead>
								<tr>
									<th>引入编号</th>
									<th>引入客户名称</th>
									<th>引入客户类别</th>
									<th>引入人名称</th>
									<th>引入起始日期</th>
									<th>引入到期日期</th>
									<th>引入状态</th>
									<th>操作</th>
								</tr>
		</thead>
		<tbody>
			<c:forEach items="${customerLinkList}" var="customerLinkEntity">
									<tr>
										<td>${customerLinkEntity.yrbh}</td>
										<td>${customerLinkEntity.custname}</td>
										<td>${customerLinkEntity.name_}</td>
										<td>${yrrmc}</td>
										<td>${customerLinkEntity.yrqsrq}</td>
										<td>${customerLinkEntity.yrdqrq}</td>
										<td>
										<c:if test="${customerLinkEntity.yrzt=='0'}">生效</c:if>
										<c:if test="${customerLinkEntity.yrzt=='1'}">注销</c:if>
										</td>
					<td>
						<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${customerBlackListEntity.xh}')">编辑</button>
												<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${customerBlackListEntity.xh}')">查看</button>
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