function validaterno(rno){
	if(!(/\d{1,5}/.test(rno))){
		document.getElementById("rno_msg").innerHTML ="<font color=\"red\">������1-5λ���֣�лл��</font>" ;
		return false ;
	} else {
		document.getElementById("rno_msg").innerHTML = "<font color=\"green\">����������ȷ��</font>" ;
		return true ;
	}
}
function validateloc(loc){
	if(loc == ""){
		document.getElementById("loc_msg").innerHTML = "<font color=\"red\">����¥������Ϊ�գ�</font>" ;
		return false ;
	} else {
		document.getElementById("loc_msg").innerHTML =  "<font color=\"green\">����¥��������ȷ��</font>" ;
		return true ;
	}
}
function validateaval(aval){
	if(aval == "��" || aval == "��"){
		document.getElementById("aval_msg").innerHTML = "<font color=\"green\">��Ϣ������ȷ��</font>" ;
		return true ;
	} else {
		document.getElementById("aval_msg").innerHTML = "<font color=\"red\">�������Ƿ���࣡</font>" ;
		return false ;
	}
}
function validate(f){
	return	validaterno(f.rno.value) && 
			validateloc(f.loc.value) && 
			validateaval(f.aval.value);
}