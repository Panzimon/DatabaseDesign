function validatedocno(docno){
	if(!(/\d{1,5}/.test(docno))){
		document.getElementById("docno_msg").innerHTML ="<font color=\"red\">������1-5λ���֣�лл��</font>" ;
		return false ;
	} else {
		document.getElementById("docno_msg").innerHTML = "<font color=\"green\">ҽ�����������ȷ��</font>" ;
		return true ;
	}
}
function validatename(name){
	if(name == ""){
		document.getElementById("name_msg").innerHTML = "<font color=\"red\">��������Ϊ�գ�</font>" ;
		return false ;
	} else {
		document.getElementById("name_msg").innerHTML =  "<font color=\"green\">����������ȷ��</font>" ;
		return true ;
	}
}
function validateworktime(worktime){
	if(worktime == ""){
		document.getElementById("worktime_msg").innerHTML = "<font color=\"red\">����ʱ�䲻��Ϊ�գ�</font>" ;
		return false ;
	} else {
		document.getElementById("worktime_msg").innerHTML = "<font color=\"green\">����ʱ��������ȷ��</font>" ;
		return true ;
	}
}
function validate(f){
	return	validatedocno(f.docno.value) && 
			validatename(f.name.value) && 
			validateworktime(f.worktime.value);
}