function selectOne(obj) {
	var objCheckBox = document.getElementsByName("checkbox");
	document.getElementById("checkboxAll").checked = false;
	for ( var i = 0; i < objCheckBox.length; i++) {
		if (objCheckBox[i] != obj) {
			objCheckBox[i].checked = false;
		} else {
			objCheckBox[i].checked = true;
		}
	} 
	document.getElementById("checkboxID").value=obj.value;
};
function selectAll(obj) {
	var check=document.getElementById("checkboxAll").checked;	
		if (check) {
			document.getElementById("checkboxID").value="";
		} 
};