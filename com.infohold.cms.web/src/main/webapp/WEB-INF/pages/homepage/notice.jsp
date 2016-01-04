<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<div class="widget-box transparent">
	<div class="widget-header widget-header-flat">
		<h4 class="lighter">
			<i class="icon-bell orange"></i>
			公告
		</h4>

		<div class="widget-toolbar">
			<a href="#">
				<c:if test="${page.pageNo > 1 }">
				<i class="icon-double-angle-left" onclick="movePage('${page.pageNo-1}')"></i>
				</c:if>
				&nbsp;&nbsp;&nbsp;
				<c:if test="${page.pageNo+1 <= page.totalPageCount }">
					<i class="icon-double-angle-right" onclick="movePage('${page.pageNo+1}')"></i>
				</c:if>
				<%-- <c:if test="${page.pageNo <= 1 }">
					<li class="prev disabled"><a href="#"
						onclick=""> <i
							class="icon-double-angle-left">上一页 </i>
					</a></li>
				</c:if>
				<c:if test="${page.pageNo > 1 }">
					<li class="prev"><a href="#"
						onclick="movePage('${page.pageNo-1}');"> <i
							class="icon-double-angle-left">上一页 </i>
					</a></li>
				</c:if>																					
				<c:if test="${page.pageNo+1 <= page.totalPageCount }">
					<li class="next "><a href="#"
						onclick="movePage('${page.pageNo+1}');"> <i
							class="icon-double-angle-right">下一页</i></a></li>
				</c:if>
				<c:if test="${page.pageNo+1 > page.totalPageCount }">
					<li class="next disabled"><a href="#"
						onclick=""> <i
							class="icon-double-angle-right">下一页</i></a></li>
				</c:if>	 --%>
			</a>
		</div>
	</div>

	<div class="widget-body">
		<div class="widget-main no-padding" >
			<table class="table table-bordered table-striped">
				<thead class="thin-border-bottom">
					<tr>
						<th width="80%">
							<i class="icon-caret-right blue"></i>
							标题
						</th>
			
						<th width="20%">
							<i class="icon-caret-right blue"></i>
							时间
						</th>
					</tr>
				</thead>
				<tbody>
					<input type="hidden" id="pageNo" name="pageNo" value="${page.pageNo }" />
					<c:forEach items="${noticelist}" var="noticelist">
						<tr>
							<td><a href="#" onclick="showNotice('${noticelist.id_}')">${noticelist.title}</a></td>
							<td>
								<span class="label label-info arrowed-right arrowed-in">${noticelist.create_date}</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- /widget-main -->
	</div><!-- /widget-body -->
</div>
<script type="text/javascript">
	jQuery(function($) {

		
	});
	function movePage(pageNo){
		var url = "homePage_notice.do";
		var param = {};
		param["pageNo"] = pageNo;
		$.post(url, param, function(result) {		
			$("#homepage_notice").html(result);
			setHash('${pageContext.request.contextPath}');
		});	
	};	
</script>

