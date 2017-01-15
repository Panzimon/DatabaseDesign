function validateMid(mid){
	if(/\w+/.test(mid)||/[\u4E00-\u9FA5]+/.test(mid)){
		document.getElementById("mid_msg").innerHTML =  "<font color=\"green\">账号输入正确！</font>" ;
		return true ;
	} else {
		document.getElementById("mid_msg").innerHTML = "<font color=\"red\">账号不能为空！</font>" ;
		return false ;
	}
}

function validatePassword(password){
	if(!(/\w+/.test(password))){
		document.getElementById("password_msg").innerHTML = "<font color=\"red\">登录密码不能为空！</font>" ;
		return false ;
	} else {
		document.getElementById("password_msg").innerHTML = "<font color=\"green\">登录密码输入正确！</font>" ;
		return true ;
	}
}
function validateConf(conf){
	if(document.getElementsByName("password")[0].value != conf){
		document.getElementById("conf_msg").innerHTML ="<font color=\"red\">两次输入的密码不一致！</font>" ;
		return false ;
	} else {
		document.getElementById("conf_msg").innerHTML ="<font color=\"green\">密码验证通过！</font>" ;
		return true ;
	}
}

function validatenickname(name){
	if(/\w+/.test(name)||/[\u4E00-\u9FA5]+/.test(name)){
		document.getElementById("nickname_msg").innerHTML = "<font color=\"green\">用户名输入正确！</font>" ;
		return true ;
	} else {
		document.getElementById("nickname_msg").innerHTML = "<font color=\"red\">用户名不允许为空！</font>" ;
		return false ;
	}
}

function validatesafestring(name){
	if(/\w+/.test(name)||/[\u4E00-\u9FA5]+/.test(name)){
		document.getElementById("safestring_msg").innerHTML = "<font color=\"green\">密保答案输入正确！</font>" ;
		return true ;
	} else {
		document.getElementById("safestring_msg").innerHTML = "<font color=\"red\">密保答案不允许为空！</font>" ;
		return false ;
	}
}

function validatesafequestion(name){
	if(/\w+/.test(name)||/[\u4E00-\u9FA5]+/.test(name)){
		document.getElementById("safequestion_msg").innerHTML = "<font color=\"green\">密保问题输入正确！</font>" ;
		return true ;
	} else {
		document.getElementById("safequestion_msg").innerHTML = "<font color=\"red\">密保问题不允许为空！</font>" ;
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
