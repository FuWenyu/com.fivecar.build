	var hashH = "";
	var bodyHeight = "";
	var showHeight = "";
	var showModalId = "";
	
	function setHash(contextPath) {
		bodyHeight = $("#iframe_body").height();
		showHeight = bodyHeight;
		//alert("bodyHeight:     "+bodyHeight);
		//alert(showModalId);
		if(showModalId != "") {
			//alert("showModalId    	"+$(showModalId).height());
			if($(showModalId).height() > bodyHeight) {
				showHeight = $(showModalId).height()+5;
			}
		}
		
		if(showHeight == hashH) {
			return;
		}
		
		hashH = showHeight;
		
		//处理子门户请求时url的问题(上线时需要设置为ip地址)
		var params = window.location.search;
		var index = params.indexOf('sp_flag',100);
		if(index != -1) {
			if(params.substr(index + 7,1) == 1)
				contextPath = "http://10.172.73.35:8080/com.infohold.sp.web";
		}
		var url = contextPath+"/mvc/handleIfame.do#"+hashH;
		//alert(url);
		$("#iframeDiv").html('<iframe id="hiddenIframe" name="hiddenIframe" src="'+url+'" width="0" height="0" style="display:none;"></iframe>');
	};

	
function showModal(obj){
	var id = obj.attr("id");
	//alert(obj.prop("outerHTML"));
	//将html代码加载至iframe外的modal_area区域
	$(window.document).find("#modal_area").append(obj.prop("outerHTML"));
	//赋值
	/*alert(option[i]);
	for(var i=0;i<option.length;i++){
		alert(option[i]);
	}*/
	//显示模态块
	$(window.document).find("#"+id).modal({
		keyboard:false,
		backdrop:false,
		show:true
	});
	//背景至灰
	$(window.document).find("body").addClass("modal-open").append("<div class=\"modal-backdrop fade in\"></div>");
};

function hideModal(){
	/*var id = $(obj).closest(".modal").attr("id");
	alert($("#"+id).prop("outerHTML"));
	$("#"+id).modal("hide");*/
	/*$("#modal_area").html("");
	$(document.body).removeClass("modal-open");
	$(document.body).find("div").remove(".modal-backdrop");*/
	
	$(window.document).find("#modal_area").html("");
	$(window.document).find("body").removeClass("modal-open");
	$(window.document).find("body").find("div").remove(".modal-backdrop");
};

//异步加载页面
function ajaxLoadPage(areaId,url,param){
	$.post(url, param, function(result) {
		$(areaId).html(result).hide().fadeIn('fast');
		setHash(param);
	});
}
//异步加载页面
function ajaxMenuLoadPage(areaId,url){
	/*$.post(url, function(result) {
		$(areaId).html(result).hide().fadeIn('fast');
	});*/
	$("#loadMainContent").attr("src", url);
}

//保存后跳转页面
function f_alert(path,exp,url){
	if("success"==exp){
		alert("恭喜你,操作成功!");
	}else{
		alert(exp);
	}
	if(null==url || ""==url ){
	}else{
		var toURL=path+"/mvc/"+url;
		window.location = toURL;
	}
}

//提示框
function cms_alert(param,exp,fromurl,tourl){
	$.post(fromurl, param, function(result) {
		if(exp == "success"){
			alert("恭喜你,操作成功!");
			window.location = tourl
		}else{
			alert(exp);
		}
		$(areaId).html(result).hide().fadeIn('fast');
		setHash(param);
	});
//	var array=url.split("&");
//	var param="";
//	if(array.length>1){
//		for(var i=0;i<array.length;i++){
//			param=param+array[i]+",";
//		}
//		param=param.substring(0,param.length-1);
//	}else{
//		param=url;
//	}
//	window.location = path+"/mvc/forwardTo.do?exp="+exp+"&url="+param;
}

//自定义confirm控件
function kj_confirm(message){
	$( "#dialog-confirm p" ).text(message);
	$( "#dialog-confirm" ).removeClass('hide').dialog({
		resizable: false,
		modal: true,
		title: "提示",
		title_html: true,
		buttons: [
			{
				html: "确定",
				"class" : "btn btn-xs",
				click: function() {
					$( this ).dialog( "close" );
					//alert("点击确定");
					return "true";
				}
			}
			,
			{
				html: "取消",
				"class" : "btn btn-xs",
				click: function() {
					$( this ).dialog( "close" );
					//alert("点击取消");
					return "false";
				}
			}
		]
	});
}

//自定义alert控件
function kj_alert(message){
	//e.preventDefault();
	$( "#dialog-alert p" ).text(message);
	$( "#dialog-alert" ).removeClass('hide').dialog({
		resizable: false,
		modal: true,
		title: "提示",
		title_html: true,
		buttons: [
			{
				html: "确定",
				"class" : "btn btn-xs",
				click: function() {
					$( this ).dialog( "close" );
				}
			}
		]
	});
}
function checkOption(id, value) {
	var $this = $("#" + id);
	var options = value;
	$this.closest("form").find(".help-block").remove();
	if ($this.val() == '-1') {
		$this
				.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;请选择["
						+ options + "] ！</div>");
		return false;
	}
	return true;
}
function checkCheckBox(value,name) { 
	var falg = 0; 
	$("input[name='"+value+"']:checkbox").each(function () { 
		if ($(this).is(':checked')) { 
			falg += 1; 
		} 
	}); 
	if (falg > 0) 
		return true; 
	else 
		alert("["+name + "] 是必选项！");
		return false; 
	} 
function checkData(id, value, flag) {
	var dataid = document.getElementById(id).value;
	var options = value;
	var $this = $("#" + id);
	$this.closest("form").find(".help-block").remove();
	if ((flag == "input") & dataid.length == 0) {
		$this.focus();
		$this.after("<div class=\"help-block  red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["+ options + "] 是必填项！</div>");
		//alert("["+options + "] 是必填项！");
		return false;
	}

	if ((flag == "number") & isNaN(dataid)) {
		$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["+ options + "] 必须为数字！");
		$this.focus();
		//alert("["+options + "] 必须为数字！");
		return false;
	}

	if ((flag == "space") & dataid.indexOf(' ') >= 0) {
		/*$this
				.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
						+ options + "] 不允许存在空格！");*/
		$this.focus();
		alert("["+options + "] 不允许存在空格！");
		return false;
	}
	
	if (flag == "pinLength" & dataid.length != 6) {
		$this.focus();
		$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
						+ options + "] 长度不足6位！");
		//alert("["+options + "] 长度不足6位！");
		return false;
	}
	if (flag == "length_Four" & dataid.length != 4) {
		$this.focus();
		$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
						+ options + "] 长度应为4位！");
		return false;
	}
	if (flag == "length_Six" & dataid.length != 6) {
		$this.focus();
		$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
						+ options + "] 长度应为6位！");
		return false;
	}
	if (flag == "length_Sixteen" & dataid.length != 16) {
		$this.focus();
		$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
						+ options + "] 长度应为16位！");
		return false;
	}
	if (flag == "length_Eleven" & dataid.length != 11) {
		$this.focus();
		$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
						+ options + "] 长度应为11位！");
		return false;
	}
	if (flag == "length_tel" & (dataid.length < 8 | dataid.length > 12)) {
		$this.focus();
		$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
						+ options + "] 长度应大于8位，小于12位！");
		return false;
	}
	if (flag == "length_custName" & dataid.length > 20) {
		$this.focus();
		$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
						+ options + "] 长度应小于20位！");
		return false;
	}
	if (flag == "checkIdCard" & !checkIdCard(id)) {
		$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp; 身份证号错误,请重新输入!");
		$this.focus();
		//alert("["+options + "]身份证号输入错误,请重新输入!");
		return false;
	}
	if (flag == "checkOrgcode" & !check_orgcode(id)) {
		$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp; 组织机构代码不正确!");
		$this.focus();
		//alert("["+options + "]身份证号输入错误,请重新输入!");
		return false;
	}
	if (flag == "chinese") {
		// regExp=/[\u4E00-\u9FA5]/g;
		regExp = /[^\x00-\xff]/g;
		if (regExp.test(dataid) == true) {
			/*$this
					.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
							+ options + "] 不允许使用汉字！");*/
			$this.focus();
			alert("["+options + "] 不允许使用汉字！");
			return false;
		}
	}

	if (flag == "illegal") {
		// fibdn = new Array
		// ("'","[","]",".",":",";","-","+",">","<","*","%","#","$","}","{","~","`","!","￥","|","/","?","&","^","(",")");
		fibdn = new Array(" ", "'", "[", "]", ":", ";", "-", ".", "+", ">",
				"<", "*", "%", "#", "$", "}", "{", "~", "`", "!", "￥", "|",
				"/", "?", "&", "^", "(", ")");
		for (i = 0; i < fibdn.length; i++) {
			for (j = 0; j < dataid.length; j++) {
				temp1 = dataid.charAt(j);
				temp2 = fibdn[i];
				if (temp1 == temp2) {
					$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
									+ options + "] 含有非法字符，只能是数字,字母或者下划线！");
					return false;
				}
			}
		}
	}
	if (flag == "check_char") {
		fibdn = new Array(" ", "'", "[", "]", ":", ";", "-", ".", "+", ">","@",
				"<", "*", "%", "#", "$", "}", "{", "~", "`", "!", "￥", "|",
				"/", "?", "&", "^", "(", ")");
		for (i = 0; i < fibdn.length; i++) {
			for (j = 0; j < dataid.length; j++) {
				temp1 = dataid.charAt(j);
				temp2 = fibdn[i];
				if (temp1 == temp2) {
					$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
									+ options + "] 含有非法字符！");
					return false;
				}
			}
		}
	}
	
	if(flag == "illegalHG"){
		for (i = 0; i < dataid.length; i++) {
			temp1 = dataid.charAt(i);
			if(isNaN(temp1) & temp1 != "-" ){
				$this.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
						+ options + "] 含有非法字符,只能是数字或者-！");
				return false;
				}
			}
	}
	return true;
}

// 判断日期类型是否为YYYY-MM-DD格式的类型
function IsYYYYMMDD(id, value) {
	var str = document.getElementById(id).value;
	var $this = $("#" + id);
	if (str.length != 0) {
		var reg = /^(?:(?:(?:(?:(?:1[6-9]|[2-9][0-9])?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))()(?:0?2\1(?:29)))|(?:(?:(?:1[6-9]|[2-9][0-9])?[0-9]{2})()(?:(?:(?:0?[13578]|1[02])\2(?:31))|(?:(?:0?[13-9]|1[0-2])\2(?:29|30))|(?:(?:0?[1-9])|(?:1[0-2]))\2(?:0?[1-9]|1[0-9]|2[0-8]))))$/;
		if (!reg.test(str)) {
			$this
					.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
							+ value + "] 请输入正确的日期格式！");
			return false;
		}
	}
	return true;
}
function IsYYMM(id, value) {
	var str = document.getElementById(id).value;
	var $this = $("#" + id);
	if (str.length != 0) {
		var reg = /^(0\d|1[0-2])\d{2}$/
		// var reg=/^\d{2}((0[1-9])|(1[0-2]))$/
		if (!reg.test(str)) {
			$this
					.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
							+ value + "] 请输入正确的日期格式！");
			return false;
		}
	}
	return true;
}

function limitCheck(id, value, limitLength) {
	var textarea = document.getElementById(id).value;
	var num = 0;
	var $this = $("#" + id);
	for (var i = 0; i < textarea.length; i++) {
		if (textarea.charCodeAt(i) > 127 || textarea.charCodeAt(i) < 0)
			num += 3;
		else
			num++;
	}
	if (num > limitLength) {
		$this
				.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;["
						+ value + "] 长度超出输入上限！");
		return false;
	}
	return true;
}

function checkIdCard(id) {
	var $this = $("#" + id);
	var id_no = $this.val();
	$this.closest("form").find(".help-block").remove();
	// 检验身份证号
	// 检验18位身份证号的最后一位以及出生年月
	if (id_no.length == 18) {
		var a_idCard = id_no.split("");
		// 两检验方法均为检验通过：true，失败：false
		if (!check18IdCard(a_idCard) || !checkIdCardBirthday(id_no, 18)) {
			//$this.focus();
			/*$this
					.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;身份证号输入错误,请重新输入!</div>");*/
			//alert("身份证号输入错误,请重新输入!");
			return false;
		}
	}
	// 检验15位身份证号的出生年月
	if (id_no.length == 15) {
		if (!checkIdCardBirthday(id_no, 15)) {
			/*$this
			.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;身份证号输入错误,请重新输入!</div>");*/
		//	alert("身份证号输入错误,请重新输入!");
			return false;
		}
	}
	// 非15位和18位的身份证号
	if (id_no.length != 18 && id_no.length != 15) {
		//$this.focus();
		/*$this
		.after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;身份证号输入错误,请重新输入!</div>");*/
		//alert("身份证号输入错误,请重新输入!");
		return false;
	}

	return true;
}

/**
 * 判断身份证号码为18位时最后的验证位是否正确
 * 
 * @param a_idCard
 *            身份证号码数组
 * @return
 */
function check18IdCard(a_idCard) {
	var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ]; // 加权因子
	var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ]; // 身份证验证位值.10代表X
	var sum = 0; // 声明加权求和变量
	if (a_idCard[17].toLowerCase() == 'x')
		a_idCard[17] = 10; // 将最后位为x的验证码替换为10方便后续操作
	for (var i = 0; i < 17; i++) {
		sum += Wi[i] * a_idCard[i]; // 加权求和
	}
	var valCodePosition = sum % 11; // 得到验证码所位置
	if (a_idCard[17] == ValideCode[valCodePosition]) {
		return true;
	} else
		return false;
}

/**
 * 验证身份证号码中的生日是否是有效生日
 * 
 * @param idCard
 *            18位/15位书身份证字符串
 * @return
 */
function checkIdCardBirthday(idCard, sizeFlag) {
	if (sizeFlag == 18) {
		var year = idCard.substring(6, 10);
		var month = idCard.substring(10, 12);
		var day = idCard.substring(12, 14);
	} else if (sizeFlag == 15) {
		var year = idCard.substring(6, 8);
		var month = idCard.substring(8, 10);
		var day = idCard.substring(10, 12);
	}
	var temp_date = new Date(year, parseFloat(month) - 1, parseFloat(day));
	// 这里用getFullYear()获取年份，避免千年虫问题
	if (temp_date.getFullYear() == parseFloat(year)
			&& temp_date.getMonth() == parseFloat(month) - 1
			&& temp_date.getDate() == parseFloat(day))
		return true;
	else
		return false;
}

function toHomePage(url){
	//重置面包屑
	$("#breadCrumb").html("");
	$("#breadCrumb").prepend("<li><i class=\"icon-home home-icon\"></i> <a href=\"#\" onclick=\"toHomePage('"+url+"');\">首页</a></li>");
	//清楚menuTree选中样式
	$("#menuTree li").each(function(index){
		if($(this).hasClass("open")){
			$(this).removeClass("open");
		}
		if($(this).hasClass("active")){
			$(this).removeClass("active");
		}
	});
	//收起所有打开的ul下的li标签
	$("#menuTree ul").each(function(index){
		$(this).css("display","none");
	});
	ajaxMenuLoadPage('#loadPageContent',url);
}


/**
 * 校验组织机构代码校验
 * @param
 * @return
 */
function check_orgcode(id)
{
	var $this = $("#" + id);
	var tempValue = $this.val();
	$this.closest("form").find(".help-block").remove();
	var reg = /(\d|[A-Z]){8}-\w{1}/;
	if(tempValue!="" && tempValue!=null)
	{
		if(tempValue.length>10){
			return false;
		}
		var r = tempValue.match(reg);
		if(r==null){
			return false;
		}
		var num = tempValue.substr(0,8);
		var n = new Array();
		for(i=0;i<=7;i++){
			n[i] = num.substring(i,i+1);
			if(n[i].charCodeAt(0)>=65){
				n[i]=n[i].charCodeAt(0)-55;
			}
		}
		var check = 11 -((n[0]*3+n[1]*7+n[2]*9+n[3]*10+n[4]*5+n[5]*8+n[6]*4+n[7]*2)%11);
		if(check == 10){
			check = 'X'
		}
		if(check == 11){
			check = '0'
		}
		var tempcheck = tempValue.substr(9,1);
		if(check != tempcheck)
		{
			return  false;
		}
	}
	return true;
}




















