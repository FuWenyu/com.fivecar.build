<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
	<jsp:include page="../../common/commonList.jsp"></jsp:include>
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<div class="tabbable" id="tabbale">
				<input type="hidden" id="id" name="id" value="${map.id}">
				<input type="hidden" id="viewtype" name="viewtype" value="${map.viewtype}">
				<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
					<ul class="nav nav-tabs" id="myTab">
						<li class="active"><a data-toggle="tab" href="#" data-name="corcustomer"> 企业客户信息
						</a></li>
		
						<li class=""><a data-toggle="tab" href="#" data-name="yingxiang"> 影像信息
						</a></li>
		
						<!-- <li class=""><a data-toggle="tab" href="#" data-name="loanReport"> 贷前调查报告
						</a></li> -->
					</ul>
					<div class="tab-content">
						<div id="tabContent" class="tab-pane active">
							<!-- tabContent异步加载区域 -->
						</div>
					</div>
				</div>
				<!-- PAGE CONTENT ENDS -->
			</div>
		</div>
	</div>
<script type="text/javascript">
jQuery(function($) {
	var id = document.getElementById("id").value;
	var viewtype = document.getElementById("viewtype").value;
	param='${pageContext.request.contextPath}';
	ajaxLoadPage("#tabContent","<%=path%>/mvc/corCustomer_get.do?id="+id+"&viewtype="+viewtype+"&viewOrEdit=view&pageNo="+$("#pageNo").val(),param);
	$("#tabbale a").on("click",function(){
		if($(this).parent().hasClass("active")){
			return false;
		}
		var tabName=$(this).attr("data-name");
		param='${pageContext.request.contextPath}';
		if(tabName == 'corcustomer'){
			ajaxLoadPage("#tabContent","<%=path%>/mvc/corCustomer_get.do?id="+id+"&viewtype="+viewtype+"&viewOrEdit=view&pageNo="+$("#pageNo").val(),param);
		}else if(tabName == 'yingxiang'){
			ajaxLoadPage("#tabContent","<%=path%>/mvc/forwardToYingXiang.do?transId="+id+"&moban=cust&opRight=1",param);
		}else{
			return false;
		}
		
	});
});
</script>
</body>
</html>
