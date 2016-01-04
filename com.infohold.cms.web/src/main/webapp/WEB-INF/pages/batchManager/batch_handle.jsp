<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en"> 
	<head>
	<meta charset="utf-8" />
	<!-- basic styles -->
	<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="<%=path%>/css/font-awesome.min.css" />
	<link rel="stylesheet" href="<%=path%>/css/ace-fonts.css" />
	<link rel="stylesheet" href="<%=path%>/css/ace.min.css" />
	<link rel="stylesheet" href="<%=path%>/css/ace-rtl.min.css" />
	<link rel="stylesheet" href="<%=path%>/css/ace-skins.min.css" />
	<link rel="stylesheet" href="<%=path%>/css/datepicker.css" />
	<link rel="stylesheet" href="<%=path%>/css/bootstrap-timepicker.css" />
	<link rel="stylesheet" href="<%=path%>/css/daterangepicker.css" />
	<link rel="stylesheet" href="<%=path%>/css/jquery-ui-1.10.3.full.min.css" />
	<script src="<%=path%>/js/ace-extra.min.js"></script>
	</head>
	<!-- 该页面为iframe嵌套页面，以下代码用于计算iframe高度，不允许修改：
			<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">onbeforeunload="updateFlag();"
			<div id="iframeDiv" style="display:none"></div>
			<div class="page-content" id="loadPageContent">
	-->
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')" onbeforeunload="updateFlag();">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<%-- <c:if test="${flag==2 }">
			<div>对不起，此页面已被访问，暂不能访问！</div>
		</c:if>
		<c:if test="${flag==1 }"> --%>
		<div class="row">
			<div class="col-xs-12">
			<form class="col-xs-12" action="#"method="post" id = "form1">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
				<table id="sample-table-2"
					class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2">
					<thead>
						<tr>
							<th><div align="center">序号</div></th>
							<th><div align="center">步骤</div></th>
							<th><div align="center">执行时间</div></th>
							<th><div align="center">结束时间</div></th>
							<th><div align="center">状态</div></th>
						</tr>
					</thead>

					<tbody>
			             <c:forEach items="${batchList}" var="batchList">
			             <input type="hidden" id="n${batchList.batch_no }" value="${batchList.batch_no }" />
				         	<tr align="center">
				         		<td align='center'>${batchList.batch_no}</td>
				         		<td align='center'>${batchList.batch_name}</td>
				         		<td align='center'><div id ="s${batchList.batch_no}">${batchList.start_date} ${batchList.start_time}</div></td>
				         		<td align='center'><div id ="e${batchList.batch_no}">${batchList.end_date} ${batchList.end_time}</div></td>
				         		</td>
				         		 <td><div id ="a${batchList.batch_no}">
				         			<c:if test='${batchList.batch_status=="0" }'> <input type="hidden" name = "no" value="${batchList.batch_no }" /><font color="#428bca">初始状态！</font></c:if>
				         			<c:if test='${batchList.batch_status=="2" }'><font color="#428bca">成功！</font></c:if>
					         		<c:if test='${batchList.batch_status=="3" }'><input type="hidden" name = "failNo" value="${batchList.batch_no }" /><font color="#428bca">失败！</font></c:if></div>
				         		</td>
				         	</tr>
				         </c:forEach>
				      </tbody>
				</table>
					<div class="row">
						<div class="col-sm-4">
							<div class="btn-group">
								<input  id="start1" class="btn btn-sm btn-primary" type="button" onclick="start();" value="启动"></input>
							</div>
						</div>
					</div>
				</div>																
				</form>
			</div>
		</div>
		<%-- </c:if> --%>
	</div>
	<script type="text/javascript">
		window.jQuery|| document.write("<script src='<%=path%>/js/jquery-2.0.3.min.js'>" + "<"+"script>");
	</script>
	<script type="text/javascript">
		var $assets = "assets";//this will be used in fuelux.tree-sampledata.js
	</script>
	<script type="text/javascript">
		if ("ontouchend" in document)
			document.write("<script src='<%=path%>/js/jquery.mobile.custom.min.js'>" + "<"+"script>");
	</script>
	<script src="<%=path%>/js/bootstrap.min.js"></script>
	<script src="<%=path%>/js/typeahead-bs2.min.js"></script>
	<script src="<%=path%>/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="<%=path%>/js/jquery-ui-1.10.3.full.min.js"></script>
	<script src="<%=path%>/js/jquery.ui.touch-punch.min.js"></script>
	<script src="<%=path%>/js/jquery.slimscroll.min.js"></script>
	<script src="<%=path%>/js/jquery.easy-pie-chart.min.js"></script>
	<script src="<%=path%>/js/jquery.sparkline.min.js"></script>
	<script src="<%=path%>/js/flot/jquery.flot.min.js"></script>
	<script src="<%=path%>/js/flot/jquery.flot.pie.min.js"></script>
	<script src="<%=path%>/js/flot/jquery.flot.resize.min.js"></script>
	<script src="<%=path%>/js/ace-elements.min.js"></script>
	<script src="<%=path%>/js/ace.min.js"></script>
	<script src="<%=path%>/js/fuelux/data/fuelux.tree-sampledata.js"></script>
	<script src="<%=path%>/js/ajaxfileupload.js"></script>
	<script src="<%=path%>/js/fuelux/fuelux.tree.min.js"></script>
	<script src="<%=path%>/js/jquery.maskedinput.min.js"></script>
	<script src="<%=path%>/js/jquery.validate.min.js"></script>
	<script src="<%=path%>/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="<%=path%>/js/date-time/bootstrap-timepicker.min.js"></script>
	<script src="<%=path%>/js/date-time/moment.min.js"></script>
	<script src="<%=path%>/js/date-time/daterangepicker.min.js"></script>
	<script src="<%=path%>/js/bootbox.min.js"></script>
	<script src="<%=path%>/js/bootstrap-wysiwyg.min.js"></script>
	<script src="<%=path%>/js/markdown/markdown.min.js"></script>
	<script src="<%=path%>/js/markdown/bootstrap-markdown.min.js"></script>
	<script src="<%=path%>/js/jquery.hotkeys.min.js"></script>
	<script src="<%=path%>/js/jquery.dataTables.min.js"></script>
	<script src="<%=path%>/js/jquery.dataTables.bootstrap.js"></script>
	<script src="<%=path%>/js/framework_menu.js"></script>
	<script src="<%=path%>/js/framework_pubFunction.js"></script>
	<script src="<%=path%>/js/framework_form.js"></script>
	<script src="<%=path%>/js/framework_modal.js"></script>
	<script type="text/javascript">
		var no = document.getElementsByName("no");
		var failNo = document.getElementsByName("failNo");
		function start(){
			if(failNo.length!=0){
				alert("批处理失败，请联系运维人员进行处理！");
				return false;
			}
			document.getElementById("start1").disabled="disabled";
			setInterval(function(){
				$.ajax( {
					type : "POST",
					url : "batch_getStatusList.do",
					async : false,
					success : function(obj) {
						$(obj).each(function(index){
							if(obj[index].batch_status==2){
								$("#a"+obj[index].batch_no).html("<font color='#428bca'>成功！</font>");
								$("#s"+obj[index].batch_no).html(obj[index].start_date+" "+obj[index].start_time);
								$("#e"+obj[index].batch_no).html(obj[index].end_date+" "+obj[index].end_time);
							}else if(obj[index].batch_status==1){
								$("#a"+obj[index].batch_no).html("<font color='#428bca'>运行中！</font>");
								$("#s"+obj[index].batch_no).html(obj[index].start_date+" "+obj[index].start_time);
							}else if(obj[index].batch_status==3){
								$("#a"+obj[index].batch_no).html("<font color='#428bca'>失败！</font>");
								window.location="<%=path%>/mvc/batch_getList.do";
							}
						});
					},
					error : function(msg) {
						alert("操作失败: " + msg);
						return false;
					}
				});
			},5000);
			$.post("<%=path%>/mvc/batch_start.do?no="+no[0].value, function(result) {
				if(result.reCode=="success"){
					alert("跑批成功！状态恢复到初始状态！");
				}else{
					alert("跑批失败！");
				}
				window.location="<%=path%>/mvc/batch_getList.do";
			});
		}
		
		<%-- function pass(no){+no[0].value
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/batch_editStatus.do?type=pass&no="+no,
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.reCode == "success"){
						alert("操作成功！");
						window.location="<%=path%>/mvc/batch_getList.do";
					}else{
						alert("操作失败！"+data.expMsg);
					}
				},
				error : function(msg) {
					alert("操作出错  " + msg);
				}
			});
		}
		function reSet(no){
			if(no==undefined){
				no="";
			}
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/batch_editStatus.do?type=reSet&no="+no,
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.reCode == "success"){
						alert("操作成功！");
						window.location="<%=path%>/mvc/batch_getList.do";
					}else{
						alert("操作失败！"+data.expMsg);
					}
				},
				error : function(msg) {
					alert("操作出错  " + msg);
				}
			});
		} --%>
		
	</script>
	</body>
</html>