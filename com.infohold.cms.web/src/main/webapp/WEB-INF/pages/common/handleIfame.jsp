<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="bootstrap grid sizing" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="Expires" content="Mon, 26 Jul 1997 05:00:00 GMT"></meta>
		<meta http-equiv="Last-Modified" content="Sat, 10 Nov 1997 09:08:07 GMT"></meta>
		<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate"></meta>
		<meta http-equiv="Pragma" content="no-cache" />
	</head>
	<body>
		<script type="text/javascript">
		function pseth() {
			var iObj = parent.parent.document.getElementById("loadMainContent");//alert(window.location);
			var locationHash = window.location.hash;
			if(locationHash.indexOf("?") != -1) {
				var params = locationHash.split("?");
				/*var param = params[1].split("&");
				var logout = false;
				var logoutparam = "";
				
				for(var i=0;i<param.length;i++) {
					var temppm = param[i].split("=");
					var paramname = temppm[0];
					var paramvalue = temppm[1];

					if(paramname == "logouturl" && paramvalue == "1") {
						logout = true;
						break;
					}
					
					if(logoutparam == "") {
						logoutparam = param[i];
					}else {
						logoutparam = logoutparam + "&" + param[i];
					}
				}

				if(logout == true) {
					parent.parent.location.href = "http://10.172.51.6:8080/timesportalsso/login?"+params[1];
					return;
				}*/
				if(params[0].split("#")[1] <= 670){
					params[0].split("#")[1] = "#"+670;
				}
				iObj.style.height = params[0].split("#")[1]+"px";
			}else {
				if(locationHash.split("#")[1] <= 670){
					locationHash = "#"+670;
				}
				iObj.style.height = locationHash.split("#")[1]+"px";
			}
		}
		
		pseth();
		</script>
	</body>
</html>
