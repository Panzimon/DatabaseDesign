function validatepno(pno){
	if(!(/\d{1,5}/.test(pno))||pno==0){
		document.getElementById("pno_msg").innerHTML = "<font color=\"red\">请输入有效数字</font>" ;
		return false;
	} else {
		document.getElementById("pno_msg").innerHTML = "<font color=\"green\">编号输入正确！</font>" ;
		return true;
	}
}
function validatepname(pname){
	if(pname == ""||!(/[\u4E00-\u9FA5]+/.test(pname))){
		document.getElementById("pname_msg").innerHTML =  "<font color=\"red\">请输入有效中文名字</font>" ;
		return false ;
	} else {
		document.getElementById("pname_msg").innerHTML = "<font color=\"green\">姓名输入正确！</font>" ;
		return true ;
	}
}
function validatelastdate(lastdate){
	if(!(/\d{4}-\d{2}-\d{2}/.test(lastdate))){
		document.getElementById("lastdate_msg").innerHTML = "<font color=\"red\">日期输入错误！</font>" ;
		return false ;
	} else {
		document.getElementById("lastdate_msg").innerHTML = "<font color=\"green\">日期输入正确！</font>" ;
		return true ;
	}
}
function validateage(age){
	if(!(/\d{1,3}/.test(age))||age>=130){
		document.getElementById("age_msg").innerHTML = "<font color=\"red\">请重新输入年龄</font>" ;
		return false ;
	} else {
		document.getElementById("age_msg").innerHTML = "<font color=\"green\">年龄输入正确！</font>" ;
		return true ;
	}
}


function validate(f){
	return	validatepno(f.pno.value) && 
			validatepname(f.pname.value) && 
			validatelastdate(f.lastdate.value) && 
			validateage(f.age.value);
}