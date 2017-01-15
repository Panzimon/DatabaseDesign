function validatehno(hno){
	if(!(/\d{1,5}$/.test(hno))||hno==0){
		document.getElementById("hno_msg").innerHTML = "<font color=\"red\">请输入有效数字</font>" ;
		return false;
	} else {
		document.getElementById("hno_msg").innerHTML = "<font color=\"green\">编号输入正确！</font>" ;
		return true;
	}
}
function validatename(name){
	if(name == ""||!(/[\u4E00-\u9FA5]+/.test(name))){
		document.getElementById("name_msg").innerHTML =  "<font color=\"red\">请输入有效中文医院名字</font>" ;
		return false ;
	} else {
		document.getElementById("name_msg").innerHTML = "<font color=\"green\">医院名字输入正确！</font>" ;
		return true ;
	}
}
function validateaddress(address){
	if(address == ""){
		document.getElementById("address_msg").innerHTML =  "<font color=\"red\">地址不能为空</font>" ;
		return false ;
	} else {
		document.getElementById("address_msg").innerHTML = "<font color=\"green\">地址输入正确！</font>" ;
		return true ;
	}
}
function validatetel(tel){
	if(!(/\d{3,13}$/.test(tel))){
		document.getElementById("tel_msg").innerHTML = "<font color=\"red\">请输入有效电话号码</font>" ;
		return false ;
	} else {
		document.getElementById("tel_msg").innerHTML = "<font color=\"green\">电话号码输入正确！</font>" ;
		return true ;
	}
}
function validatezipcode(zipcode){
	if(!(/\d{5}$/.test(zipcode))){
		document.getElementById("zipcode_msg").innerHTML = "<font color=\"red\">请输入有效邮编号码</font>" ;
		return false ;
	} else {
		document.getElementById("zipcode_msg").innerHTML = "<font color=\"green\">邮编号码输入正确！</font>" ;
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