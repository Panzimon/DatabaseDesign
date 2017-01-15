function validatedocno(docno){
	if(!(/\d{1,5}/.test(docno))){
		document.getElementById("docno_msg").innerHTML ="<font color=\"red\">请输入1-5位数字，谢谢！</font>" ;
		return false ;
	} else {
		document.getElementById("docno_msg").innerHTML = "<font color=\"green\">医生编号输入正确！</font>" ;
		return true ;
	}
}
function validatename(name){
	if(name == ""){
		document.getElementById("name_msg").innerHTML = "<font color=\"red\">姓名不能为空！</font>" ;
		return false ;
	} else {
		document.getElementById("name_msg").innerHTML =  "<font color=\"green\">姓名输入正确！</font>" ;
		return true ;
	}
}
function validateworktime(worktime){
	if(worktime == ""){
		document.getElementById("worktime_msg").innerHTML = "<font color=\"red\">工作时间不能为空！</font>" ;
		return false ;
	} else {
		document.getElementById("worktime_msg").innerHTML = "<font color=\"green\">工作时间输入正确！</font>" ;
		return true ;
	}
}
function validate(f){
	return	validatedocno(f.docno.value) && 
			validatename(f.name.value) && 
			validateworktime(f.worktime.value);
}