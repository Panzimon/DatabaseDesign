function validatedeptno(deptno){
	if(!(/\d{1,5}/.test(deptno))){
		document.getElementById("deptno_msg").innerHTML ="<font color=\"red\">请输入1-5位数字，谢谢！</font>" ;
		return false ;
	} else {
		document.getElementById("deptno_msg").innerHTML = "<font color=\"green\">部门编号输入正确！</font>" ;
		return true ;
	}
}
function validatedeptname(deptname){
	if(deptname == ""){
		document.getElementById("deptname_msg").innerHTML = "<font color=\"red\">部门名称不能为空！</font>" ;
		return false ;
	} else {
		document.getElementById("deptname_msg").innerHTML =  "<font color=\"green\">部门名称输入正确！</font>" ;
		return true ;
	}
}
function validatedeptloc(deptloc){
	if(deptloc == ""){
		document.getElementById("deptloc_msg").innerHTML = "<font color=\"red\">位置不能为空！</font>" ;
		return false ;
	} else {
		document.getElementById("deptloc_msg").innerHTML = "<font color=\"green\">位置输入正确！</font>" ;
		return true ;
	}
}
function validate(f){
	return	validatedeptno(f.deptno.value) && 
			validatedeptname(f.deptname.value) && 
			validatedeptloc(f.deptloc.value);
}