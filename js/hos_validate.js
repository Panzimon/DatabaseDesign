function validatehno(hno){
	if(!(/\d{1,5}$/.test(hno))||hno==0){
		document.getElementById("hno_msg").innerHTML = "<font color=\"red\">��������Ч����</font>" ;
		return false;
	} else {
		document.getElementById("hno_msg").innerHTML = "<font color=\"green\">���������ȷ��</font>" ;
		return true;
	}
}
function validatename(name){
	if(name == ""||!(/[\u4E00-\u9FA5]+/.test(name))){
		document.getElementById("name_msg").innerHTML =  "<font color=\"red\">��������Ч����ҽԺ����</font>" ;
		return false ;
	} else {
		document.getElementById("name_msg").innerHTML = "<font color=\"green\">ҽԺ����������ȷ��</font>" ;
		return true ;
	}
}
function validateaddress(address){
	if(address == ""){
		document.getElementById("address_msg").innerHTML =  "<font color=\"red\">��ַ����Ϊ��</font>" ;
		return false ;
	} else {
		document.getElementById("address_msg").innerHTML = "<font color=\"green\">��ַ������ȷ��</font>" ;
		return true ;
	}
}
function validatetel(tel){
	if(!(/\d{3,13}$/.test(tel))){
		document.getElementById("tel_msg").innerHTML = "<font color=\"red\">��������Ч�绰����</font>" ;
		return false ;
	} else {
		document.getElementById("tel_msg").innerHTML = "<font color=\"green\">�绰����������ȷ��</font>" ;
		return true ;
	}
}
function validatezipcode(zipcode){
	if(!(/\d{5}$/.test(zipcode))){
		document.getElementById("zipcode_msg").innerHTML = "<font color=\"red\">��������Ч�ʱ����</font>" ;
		return false ;
	} else {
		document.getElementById("zipcode_msg").innerHTML = "<font color=\"green\">�ʱ����������ȷ��</font>" ;
		return true ;
	}
}


function validate(f){
	return	validatehno(f.hno.value) && 
			validatename(f.name.value) && 
			validateaddress(f.address.value) && 
			validatetel(f.tel.value) && 
			validatezipcode(f.zipcode.value);
}