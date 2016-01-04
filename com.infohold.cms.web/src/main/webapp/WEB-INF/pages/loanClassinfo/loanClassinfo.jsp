<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/commonList.jsp"></jsp:include>
<body id="iframe_body"
	onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display: none"></div>
	<div class="page-content" id="loadPageContent">
		<!-- 行开始 -->
		<div class="row">
			<div class="col-xs-12">
				<!-- 查询条件begin -->
				<form class="form-horizontal" id="queryForm" name="queryForm"
					action="#" method="post">
					<input class="hidden" type="text" id="tradeCode" name="tradeCode"
						data-min="2" data-max="20" value="T36001" />
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-1"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 客户名称</label>
							<div class="col-sm-4">
								<input type="text" id="cust_name" class="col-xs-10 col-sm-5"
									name="cust_name" value="" />
							</div>
							<div class="col-md-0"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 借据编号</label>
							<div class="col-sm-4">
								<input type="text" id="duebill_id" class="col-xs-10 col-sm-5"
									name="duebill_id" value="" />
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="space-3"></div>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-1"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="times"> 时间区间</label>
							<div class="col-sm-4">
								<input type="text" id="times"
									class="date-range-picker col-xs-10 col-sm-5" name="times"
									readonly />
							</div>
							<div class="col-md-0"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2">分类结果</label>
							<div class="col-sm-4">
								<select name="curr_level_manual" id="curr_level_manual"
									class="col-xs-10 col-sm-5 abc">
									<option value="">请选择...</option>
									<option value=1>正常</option>
									<option value=2>关注</option>
									<option value=3>次级</option>
									<option value=4>可疑</option>
									<option value=5>损失</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group">
							<label class="col-sm-10 control-label no-padding-right"
								for="form-field-2"> </label>
							<div class="col-sm-1">
								<button class="btn btn-sm btn-primary" type="button"
									onclick="querySubmit();">查询</button>
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<!-- /row 横线-->
					<div class="page-header"></div>
				</form>
				<!-- 查询条件end -->
				<div class="row" id="result">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div id="qryContent">
							<div class="table-responsive">
								<table id="sample-table-2"
									class="table table-striped table-bordered table-hover dataTable"
									aria-describedby="sample-table-2">
									<thead>
										<tr>
											<th>借据编号</th>
											<th>客户名称</th>
											<th>预分类贷款余额(元)</th>
											<th>上期分类结果</th>
											<th>本期预分类结果</th>
											<th>当前分类结果</th>
											<th>创建日期</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${contractList}" var="contractList">
											<tr>
												<td>${contractList.duebill_id}</td>
												<td>${contractList.cust_name}</td>
												<td>${contractList.balance}</td>
												<td><c:if test="${contractList.last_level==1}">正常</c:if>
													<c:if test="${contractList.last_level==2}">关注</c:if> <c:if
														test="${contractList.last_level==3}">次级</c:if> <c:if
														test="${contractList.last_level==4}">可疑</c:if> <c:if
														test="${contractList.last_level==5}">损失</c:if></td>
												<td><c:if test="${contractList.curr_level_batch==1}">正常</c:if>
													<c:if test="${contractList.curr_level_batch==2}">关注</c:if>
													<c:if test="${contractList.curr_level_batch==3}">次级</c:if>
													<c:if test="${contractList.curr_level_batch==4}">可疑</c:if>
													<c:if test="${contractList.curr_level_batch==5}">损失</c:if>
												</td>
												<td><c:if test="${contractList.curr_level_manual==1}">正常</c:if>
													<c:if test="${contractList.curr_level_manual==2}">关注</c:if>
													<c:if test="${contractList.curr_level_manual==3}">次级</c:if>
													<c:if test="${contractList.curr_level_manual==4}">可疑</c:if>
													<c:if test="${contractList.curr_level_manual==5}">损失</c:if>
												</td>
												<td>${contractList.create_date}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div id="sample-table-2_wrapper" class="dataTables_wrapper"
									role="grid">
									<div class="row">
										<!-- 分页 -->
										<jsp:include page="../common/page.jsp"></jsp:include>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 行结束-->
		</div>
		<script type="text/javascript">
			jQuery(function($) {
				$('.date-range-picker').daterangepicker().prev().on(
						ace.click_event, function() {
							$(this).next().focus();
						});

				$(window).resize(function() {
					setHash('${pageContext.request.contextPath}');
				});
			});
			jQuery(function($) {
				$('.date-picker').datepicker({
					autoclose : true
				}).next().on(ace.click_event, function() {
					$(this).prev().focus();
				});
			});
			function querySubmit() {
				var param = $("#queryForm").serialize();
				param += "&qry_type=qry";
				$.post("loanClass_getList.do", param, function(result) {
					$("#qryContent").html(result).hide();
					$("#qryContent").fadeIn('fast');
					setHash('${pageContext.request.contextPath}');
				});

			}
		</script>
</body>
</html>
