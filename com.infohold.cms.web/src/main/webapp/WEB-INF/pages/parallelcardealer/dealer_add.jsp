<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/commonList.jsp"></jsp:include><!-- 引入公供js -->
<head>
<script type="text/javascript">
    //重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
    UEDITOR_CONFIG.UEDITOR_HOME_URL = './ueditor/';
    var _editor = UE.getEditor('position');
    _editor.ready(function () {
        //设置编辑器不可用
        //_editor.setDisabled();
        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
        _editor.hide();
        //侦听图片上传
        _editor.addListener('beforeInsertImage', function (t, arg) {
            //将地址赋值给相应的input
            $("#picture").attr("value", arg[0].src);
            //图片预览
            $("#preview").attr("src", arg[0].src);
        })
        //侦听文件上传
        _editor.addListener('afterUpfile', function (t, arg) {
            $("#file").attr("value", _editor.options.filePath + arg[0].url);
        })
    });
    //弹出图片上传的对话框
    function upImage() {
        var myImage = _editor.getDialog("map");
        myImage.open();
    }
    //弹出文件上传的对话框
    function upFiles() {
        var myFiles = _editor.getDialog("attachment");
        myFiles.open();
    }
</script>
</head>
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/padealer_save.do"
					method="post">
					<h3 class="header smaller lighter grey">经销商信息新增</h3>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id"> </label>
					</div>
<%-- 					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							经营品牌</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="carbrand" name="carbrand">
							<c:forEach items="${brandList}" var="list" varStatus="status">
	                        <option value="${list.id}-${list.brandNamecn}">${list.initial}-${list.brandNamecn}</option>
	               		    </c:forEach>
               		    </select>
						</div>
					</div> --%>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							所属机构</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="orgid" name="orgid">
							<c:forEach items="${orgList}" var="list" varStatus="status">
	                        <option value="${list.orgid}">${list.NAME}</option>
	               		    </c:forEach>
               		    </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							经销商全名 </label>
						<div class="col-sm-9">
							<input type="text" id="dealerName" name="dealerName" placeholder="请输入经销商全名 "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							联系电话</label>
						
						<div class="col-sm-9">
							<input type="text" id="telephone" name="telephone" placeholder="请输入联系电话 "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							经销商地址</label>
						<div class="col-sm-9">
							<input type="text" id="addr" name="addr" placeholder="请输入经销商地址 "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							经销商简介 </label>
						<div class="col-sm-9">
							<input type="text" id=description placeholder="请输入经销商简介"
								class="col-xs-10 col-sm-5" name="description" value="" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							五车专享特权 </label>
						<div class="col-sm-9">
						<select class="input-medium"  id="anchor" name="anchor">
							<c:forEach items="${resourcesList}" var="list" varStatus="status">
	                        <option value="${list.id}-${list.title}-${list.resourceName}">${list.resourceName }</option>
	               		    </c:forEach>
               		    </select>
               		    </div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							4s店地图</label>
						<div class="col-sm-9">
						<button class="btn btn-sm btn-primary" onclick="upImage();" type="button">添加地图信息</button>
								 <textarea name="position" id="position"></textarea>
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
		
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="goBack();">
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
		
		//上传文件控件
		$('#fileInput').ace_file_input({
			no_file:'空...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false
		});
		
		
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
	});
	
	function pictureupload(){
		
	}
	
	function subForm(){
/* 		if (!checkData('carbrand', '经营品牌', 'input')) {
			return;
		} */
		
		if (!checkData('anchor', '五车专享特权', 'input')) {
			return;
		}
		
		if (!checkData('dealerName', '经销商全名', 'input')) {
			return;
		}
		if (!checkData('dealerName', '经销商全名', 'illegal')) {
			return;
		}
		if (!limitCheck('dealerName', '经销商全名', 64)) {
			return;
		}
		
		if (!checkData('telephone', '联系电话', 'input')) {
			return;
		}
		if (!checkData('telephone', '联系电话', 'number')) {
			return;
		}
		if (!limitCheck('telephone', '联系电话', 11)) {
			return;
		}
		
		if (!checkData('addr', '经销商地址 ', 'input')) {
			return;
		}
		if (!checkData('description', '经销商简介 ', 'input')) {
			return;
		}
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/padealer_save.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					alert("保存成功！");
					window.location = "<%=path%>/mvc/padealer.do";
				}else{
					alert("保存失败:"+data.msg);
				}
			},
			error : function(msg) {
				alert("分配出错  " + msg);
			}
		});
	}
	function removeFile(obj){
		var param={};
		param["att_id"]=$(obj).data("attid");
		$.ajax( {
			type : "POST",
			url : "removeFile.do",
			data : param,
			async : false,
			success : function(flag) {
				if(flag){
					myalert("删除成功",initFileInput);
					$(obj).parents("label").remove();
					$("#fileUpLoadBtn").show();
				}else{
					myalert("删除失败",initFileInput);
				}
				
			},
			error : function(msg) {
				myalert("表单提交失败："+msg,initFileInput);
			}
		}); 
	}
	function initFileInput(){
		var html = "<div class=\"ace-file-input col-sm-12\" id=\"fileInputDiv\"> "+
		"<input type=\"file\" id=\"fileInput\" name=\"myfile\" class=\"ace-file-input col-sm-12\" onblur=\"clean()\"> "+
		"<div id=\"fileInput_font\" class=\"help-block red\" onclick=\"clean()\"></div></div>"; 
		$("#fileInputDiv").remove(); 
		$("#upload").html(html); 
		$('#fileInput').ace_file_input({
			no_file:'空...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false 
		}); 
		setHash('${pageContext.request.contextPath}');
	}
	function goBack(){
			window.location = "<%=path%>/mvc/padealer.do";
	}
	</script>
</body>
</html>
