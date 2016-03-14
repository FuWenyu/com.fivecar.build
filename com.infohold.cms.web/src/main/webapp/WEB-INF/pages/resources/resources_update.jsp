<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/commonList.jsp"></jsp:include><!-- 引入公供js -->
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/pictureAddSave.do"
					method="post">
					<h3 class="header smaller lighter grey">图文信息修改</h3>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id"> </label>
					</div>
					<input id="id" type="hidden" class="" name="id" value="${resource.id}" />	
					<input id="purpose1" type="hidden" class="" name="purpose1" id="purpose1"   value="${resource.purpose}-${resource.purposeName}" />
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							资源名称 </label>
						
						<div class="col-sm-9">
							<input type="text" id="resourceName" name="resourceName" placeholder="请输入资源名称 "
								class="col-xs-10 col-sm-5"
								value="${resource.resourceName}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							标题</label>
						
						<div class="col-sm-9">
							<input type="text" id="title" name="title" placeholder="请输入资源标题 "
								class="col-xs-10 col-sm-5"
								value="${resource.title}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							资源用途</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="purpose" name="purpose">
                                <option value="">-请选择-</option> 
								<option value="homepage-首页">首页</option>
								<option value="ssss-4s店优惠">4s店优惠</option>
								<option value="parallel-平行进口车优惠">平行进口车优惠</option>
								<option value="map-地图信息">地图信息</option>
							</select>
						</div>
					</div>
 					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							连接图文 </label>
						<div class="col-sm-9">
						 <textarea name="key" id="myEditor">${resource.resource}</textarea>
							<script type="text/javascript">
							UEDITOR_CONFIG.UEDITOR_HOME_URL = './ueditor/';
							UE.getEditor('myEditor');
							</script>
						</div> 
					</div> 
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
		
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="javascript:window.location = '<%=path%>/mvc/resources.do?type=cms';">
								<i class="icon-reply bigger-110"></i> 返回
							</button>
						</div>
					</div>
				</form>
				<!-- PAGE CONTENT ENDS -->
				</div>
			</div>
		</div>
	
	<script type="text/javascript">
	
	jQuery(function($) {
		var purpose1 = document.getElementById('purpose1').value;
		checkOption('purpose',purpose1);
	});
		function subForm() {
			if (!checkData('title', '标题', 'input')) {
				return;
			}
			if (!checkData('resourceName', '资源名称 ', 'input')) {
				return;
			}
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/resources_editSave.do",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						alert("保存成功！");
						window.location = "<%=path%>/mvc/resources.do";
					}else{
						alert("保存失败:"+data.msg);
					}
				},
				error : function(msg) {
					alert("分配出错  " + msg);
				}
			});
		}
		function checkOption(id,value)
		{
			var select = document.getElementById(id);
			var options = select.options;
			for(var i= 0;i<options.length;i++)
			{
				if(options[i].value == value)
				{
					options[i].selected = true;
					break;
				}
			}
		}
	</script>
</body>
</html>
