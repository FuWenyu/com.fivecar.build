<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>新信贷管理系统</title>
<meta charset="utf-8" />

</head>
<body>
	<script type="text/javascript">
//获取执行利率
function get_rat_exe_coe(){
	
	var rat_int_val = document.getElementById("rat_int_val").value;//基准利率
	var rat_exe_coe = document.getElementById("rat_exe_coe").value;//执行利率变动系数
	var rat_exe_cha = document.getElementById("rat_exe_cha").value;//执行利率变动方式
	if((rat_int_val!=null&&rat_int_val!="")&&(rat_exe_coe!=null&&rat_exe_coe!="")&&(rat_exe_cha!=null&&rat_exe_cha!="")){
		if(rat_exe_cha==1){
			var rat_int_val=parseFloat(rat_int_val);
			rat_exe_val= parseFloat(rat_int_val+(rat_int_val*(rat_exe_coe/100))).toFixed(5);
			document.getElementById("rat_exe_val").value=rat_exe_val;
		}else{
			var rat_int_val=parseFloat(rat_int_val);
			var rat_exe_coe=parseFloat(rat_exe_coe);
			rat_exe_val= parseFloat(rat_int_val+rat_exe_coe).toFixed(5);
			document.getElementById("rat_exe_val").value=rat_exe_val;
		}
		
	get_rat_ove_coe();
	get_rat_emb_coe();
	}else{
		document.getElementById("rat_exe_val").value='';
	}
}
//获取逾期利率
function get_rat_ove_coe(){
	var rat_exe_val = document.getElementById("rat_exe_val").value;//执行利率
	var rat_ove_coe = document.getElementById("rat_ove_coe").value;//逾期利率变动系数
	var rat_ove_cha = document.getElementById("rat_ove_cha").value;//逾期利率变动方式
	if((rat_exe_val!=null&&rat_exe_val!="")&&(rat_ove_coe!=null&&rat_ove_coe!="")&&(rat_ove_cha!=null&&rat_ove_cha!="")){
		
		if(rat_ove_cha==1){
			
			var rat_exe_val=parseFloat(rat_exe_val);
			rat_ove_val= parseFloat(rat_exe_val+(rat_exe_val*(rat_ove_coe/100))).toFixed(5);
			document.getElementById("rat_ove_val").value=rat_ove_val;
		}else{
		
			var rat_exe_val=parseFloat(rat_exe_val);
			var rat_ove_coe=parseFloat(rat_ove_coe);
			
			rat_ove_val= parseFloat(rat_exe_val+rat_ove_coe).toFixed(5);
			
			document.getElementById("rat_ove_val").value=rat_ove_val;
		}
		
	}else{
		document.getElementById("rat_ove_val").value='';
	}	
}

//获取挪用利率
function get_rat_emb_coe(){
	var rat_exe_val = document.getElementById("rat_exe_val").value;//执行利率
	var rat_emb_coe = document.getElementById("rat_emb_coe").value;//逾期利率变动系数
	var rat_emb_cha = document.getElementById("rat_emb_cha").value;//逾期利率变动方式
	if((rat_exe_val!=null&&rat_exe_val!="")&&(rat_emb_coe!=null&&rat_emb_coe!="")&&(rat_emb_cha!=null&&rat_emb_cha!="")){
	
		if(rat_emb_cha==1){
			
			var rat_exe_val=parseFloat(rat_exe_val);
			rat_emb_val= parseFloat(rat_exe_val+(rat_exe_val*(rat_emb_coe/100))).toFixed(5);
			document.getElementById("rat_emb_val").value=rat_emb_val;
		}else{
		
			var rat_exe_val=parseFloat(rat_exe_val);
			var rat_emb_coe=parseFloat(rat_emb_coe);
			
			rat_emb_val= parseFloat(rat_exe_val+rat_emb_coe).toFixed(5);
		
			document.getElementById("rat_emb_val").value=rat_emb_val;
		}
		
	}else{
		document.getElementById("rat_emb_val").value='';
	}	
}
</script>