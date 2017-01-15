function validaterno(rno){
	if(!(/\d{1,5}/.test(rno))){
		document.getElementById("rno_msg").innerHTML ="<font color=\"red\">请输入1-5位数字，谢谢！</font>" ;
		return false ;
	} else {
		document.getElementById("rno_msg").innerHTML = "<font color=\"green\">房号输入正确！</font>" ;
		return true ;
	}
}
function validateloc(loc){
	if(loc == ""){
		document.getElementById("loc_msg").innerHTML = "<font color=\"red\">所属楼区不能为空！</font>" ;
		return false ;
	} else {
		document.getElementById("loc_msg").innerHTML =  "<font color=\"green\">所属楼区输入正确！</font>" ;
		return true ;
	}
}
function validateaval(aval){
	if(aval == "是" || aval == "否"){
		document.getElementById("aval_msg").innerHTML = "<font color=\"green\">信息输入正确！</font>" ;
		return true ;
	} else {
		document.getElementById("aval_msg").innerHTML = "<font color=\"red\">请输入是否空余！</font>" ;
		return false ;
	}
}
function validate(f){
	return	validaterno(f.rno.value) && 
			validateloc(f.loc.value) && 
			validateaval(f.aval.value);
}