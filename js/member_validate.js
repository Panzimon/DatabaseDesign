function validateMid(mid){
	if(/\w+/.test(mid)||/[\u4E00-\u9FA5]+/.test(mid)){
		document.getElementById("mid_msg").innerHTML =  "<font color=\"green\">�˺�������ȷ��</font>" ;
		return true ;
	} else {
		document.getElementById("mid_msg").innerHTML = "<font color=\"red\">�˺Ų���Ϊ�գ�</font>" ;
		return false ;
	}
}

function validatePassword(password){
	if(!(/\w+/.test(password))){
		document.getElementById("password_msg").innerHTML = "<font color=\"red\">��¼���벻��Ϊ�գ�</font>" ;
		return false ;
	} else {
		document.getElementById("password_msg").innerHTML = "<font color=\"green\">��¼����������ȷ��</font>" ;
		return true ;
	}
}
function validateConf(conf){
	if(document.getElementsByName("password")[0].value != conf){
		document.getElementById("conf_msg").innerHTML ="<font color=\"red\">������������벻һ�£�</font>" ;
		return false ;
	} else {
		document.getElementById("conf_msg").innerHTML ="<font color=\"green\">������֤ͨ����</font>" ;
		return true ;
	}
}

function validatenickname(name){
	if(/\w+/.test(name)||/[\u4E00-\u9FA5]+/.test(name)){
		document.getElementById("nickname_msg").innerHTML = "<font color=\"green\">�û���������ȷ��</font>" ;
		return true ;
	} else {
		document.getElementById("nickname_msg").innerHTML = "<font color=\"red\">�û���������Ϊ�գ�</font>" ;
		return false ;
	}
}

function validatesafestring(name){
	if(/\w+/.test(name)||/[\u4E00-\u9FA5]+/.test(name)){
		document.getElementById("safestring_msg").innerHTML = "<font color=\"green\">�ܱ���������ȷ��</font>" ;
		return true ;
	} else {
		document.getElementById("safestring_msg").innerHTML = "<font color=\"red\">�ܱ��𰸲�����Ϊ�գ�</font>" ;
		return false ;
	}
}

function validatesafequestion(name){
	if(/\w+/.test(name)||/[\u4E00-\u9FA5]+/.test(name)){
		document.getElementById("safequestion_msg").innerHTML = "<font color=\"green\">�ܱ�����������ȷ��</font>" ;
		return true ;
	} else {
		document.getElementById("safequestion_msg").innerHTML = "<font color=\"red\">�ܱ����ⲻ����Ϊ�գ�</font>" ;
		return false ;
	}
}

function validate(f){
	return	validateMid(f.mid.value) && 
			validatePassword(f.password.value) && 
			validateConf(f.password.value) && 
			validateNickname(f.nickname.value) &&
			validatesafestring(f.safestring.value) &&
			validatesafequestion(f.safequestion.value);
}
