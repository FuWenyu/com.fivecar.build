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
				<th>客户编号</th>
				<th>客户名称</th>
				<th>证件类型</th>
				<th>证件号码</th>
				<th>创建日期</th>
				<th>维护日期</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${perCustomerList}" var="perCustomerList">
				<tr>
					<td><a href="javascript:viewEntity('${perCustomerList.id}')">${perCustomerList.cust_id}</a>
					</td>
					<td>${perCustomerList.cust_name}</td>
					<td><fmt:message key='per_id_type.${perCustomerList.cert_type}' /></td>
					<td>${perCustomerList.cert_no}</td>
					<td>${perCustomerList.create_date}</td>
					<td>${perCustomerList.update_date}</td>
					<c:if test="${perCustomerList.cust_status !=4}">
						<td><fmt:message key='cust_status.${perCustomerList.cust_status}' /></td>
					</c:if>
					<c:if test="${perCustomerList.cust_status ==4}">
						<td title="${perCustomerList.cust_replyexp}" data-rel="tooltip"><fmt:message key='cust_status.${perCustomerList.cust_status}' /></td>
					</c:if>
					<td>
						<div class="btn-group">
							<c:if test="${perCustomerList.cust_status ==3}">
								<button class="btn btn-sm btn-primary" onclick="editEntity('${perCustomerList.id}');" type="button">维护</button>
							</c:if>													
							<button class="btn btn-sm btn-primary" onclick="yingxiang('${perCustomerList.id}');" type="button">上传影像</button>
						   <c:if test="${perCustomerList.cust_status ==1||perCustomerList.cust_status ==4}">
						  	  <button class="btn btn-sm btn-primary" onclick="shangchuanbulu('${perCustomerList.id}');" type="button">发起补录</button>
							</c:if>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
		<div class="row">
			<div class="col-sm-4">
				
			</div>
			 <jsp:include page="../../common/page.jsp"></jsp:include>
	    </div>
    </div>
</div>
<script type="text/javascript">
	jQuery(function($){
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		}); 
		$('[data-rel=tooltip]').tooltip();
		$('[data-rel=popover]').popover({html:true});
	});
</script>