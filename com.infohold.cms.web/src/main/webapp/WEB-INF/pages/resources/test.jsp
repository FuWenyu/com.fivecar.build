<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script src="ueditor/ueditor.config.js" type="text/javascript" charset="utf-8"></script>
<script src="ueditor/ueditor.config.js/ueditor.all.min.js" type="text/javascript" charset="utf-8"></script>
<!-- 当然还要引入jquery  -->


<script type="text/javascript">
var editor;
var _editor;
$(function() {
     editor = UE.getEditor('myEditor', {
         initialFrameWidth: 800,
         initialFrameHeight: 300,
     });


    //重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
    _editor = UE.getEditor('upload_ue');
    _editor.ready(function () {
        //设置编辑器不可用
        _editor.setDisabled();
        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
        _editor.hide();
        //侦听图片上传
        _editor.addListener('beforeInsertImage', function (t, arg) {
            //将地址赋值给相应的input,只去第一张图片的路径
            $("#picture").attr("value", arg[0].src);
            //图片预览
            $("#preview").attr("src", arg[0].src);
        })
        //侦听文件上传，取上传文件列表中第一个上传的文件的路径
        _editor.addListener('afterUpfile', function (t, arg) {
            $("#file").attr("value", _editor.options.filePath + arg[0].url);
        })
    });
});    
//弹出图片上传的对话框
function upImage() {
    var myImage = _editor.getDialog("insertimage");
    myImage.open();
}
//弹出文件上传的对话框
function upFiles() {
    var myFiles = _editor.getDialog("attachment");
    myFiles.open();
}
</script>
</head>


<body>
<script type="text/plain" id="myEditor"></script>
<script type="text/plain" id="upload_ue"></script>              
调用的页面： 
<input type="text" id="picture" name="cover" /><a href="javascript:void(0);" onclick="upImage();">上传图片</a>
<input type="text" id="file" /><a href="javascript:void(0);" onclick="upFiles();">上传文件</a>
</body>
</html>