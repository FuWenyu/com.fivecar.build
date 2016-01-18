
<html>
<head>
<script type="text/javascript" src="http://www.w3school.com.cn/jquery/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("button").click(function(){
	if($("#tupian").attr("src")=="http://pic26.nipic.com/20121223/9252150_195341264315_2.jpg")
		$("#tupian").attr("src","http://pic1.nipic.com/2008-09-08/200898163242920_2.jpg");
	else
		$("#tupian").attr("src","http://pic26.nipic.com/20121223/9252150_195341264315_2.jpg");
  });
});
</script>
</head>
<body>
<img id="tupian" src="http://pic26.nipic.com/20121223/9252150_195341264315_2.jpg" style="width:200px;height:150px;background:cover;"/>
<button>切换</button>
</body>
</html>
