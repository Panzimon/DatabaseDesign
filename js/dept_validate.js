function validatedeptno(deptno){
	if(!(/\d{1,5}/.test(deptno))){
		document.getElementById("deptno_msg").innerHTML ="<font color=\"red\">������1-5λ���֣�лл��</font>" ;
		return false ;
	} else {
		document.getElementById("deptno_msg").innerHTML = "<font color=\"green\">���ű��������ȷ��</font>" ;
		return true ;
	}
}
function validatedeptname(deptname){
	if(deptname == ""){
		document.getElementById("deptname_msg").innerHTML = "<font color=\"red\">�������Ʋ���Ϊ�գ�</font>" ;
		return false ;
	} else {
		document.getElementById("deptname_msg").innerHTML =  "<font color=\"green\">��������������ȷ��</font>" ;
		return true ;
	}
}
function validatedeptloc(deptloc){
	if(deptloc == ""){
		document.getElementById("deptloc_msg").innerHTML = "<font color=\"red\">λ�ò���Ϊ�գ�</font>" ;
		return false ;
	} else {
		document.getElementById("deptloc_msg").innerHTML = "<font color=\"green\">λ��������ȷ��</font>" ;
		return true ;
	}
}
function validate(f){
	return	validatedeptno(f.deptno.value) && 
			validatedeptname(f.deptname.value) && 
			validatedeptloc(f.deptloc.value);
}