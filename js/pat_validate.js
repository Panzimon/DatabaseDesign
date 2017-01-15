function validatepno(pno){
	if(!(/\d{1,5}/.test(pno))||pno==0){
		document.getElementById("pno_msg").innerHTML = "<font color=\"red\">��������Ч����</font>" ;
		return false;
	} else {
		document.getElementById("pno_msg").innerHTML = "<font color=\"green\">���������ȷ��</font>" ;
		return true;
	}
}
function validatepname(pname){
	if(pname == ""||!(/[\u4E00-\u9FA5]+/.test(pname))){
		document.getElementById("pname_msg").innerHTML =  "<font color=\"red\">��������Ч��������</font>" ;
		return false ;
	} else {
		document.getElementById("pname_msg").innerHTML = "<font color=\"green\">����������ȷ��</font>" ;
		return true ;
	}
}
function validatelastdate(lastdate){
	if(!(/\d{4}-\d{2}-\d{2}/.test(lastdate))){
		document.getElementById("lastdate_msg").innerHTML = "<font color=\"red\">�����������</font>" ;
		return false ;
	} else {
		document.getElementById("lastdate_msg").innerHTML = "<font color=\"green\">����������ȷ��</font>" ;
		return true ;
	}
}
function validateage(age){
	if(!(/\d{1,3}/.test(age))||age>=130){
		document.getElementById("age_msg").innerHTML = "<font color=\"red\">��������������</font>" ;
		return false ;
	} else {
		document.getElementById("age_msg").innerHTML = "<font color=\"green\">����������ȷ��</font>" ;
		return true ;
	}
}


function validate(f){
	return	validatepno(f.pno.value) && 
			validatepname(f.pname.value) && 
			validatelastdate(f.lastdate.value) && 
			validateage(f.age.value);
}