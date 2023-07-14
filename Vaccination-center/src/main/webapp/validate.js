/**
 * 
 */
function validateRegister(){
	let email=document.register.email.value;
	let password=document.register.password.value;
	let name=document.register.name.value;
	let flag=true;
	if(email==""){
		document.getElementById("email").innerText="Email is a required field";
		flag=false;
	}
	else{
		document.getElementById("email").innerText="";
	}
	if(password==""){
		document.getElementById("password").innerText="password is a required field";
		flag=false;
	}
	else{
		document.getElementById("password").innerText="";
	}
	if(name==""){
		document.getElementById("name").innerText="name is a required field";
		flag=false;
	}
	else{
		document.getElementById("name").innerText="";
	}
	console.log(email+password+name+flag)
	if(flag){
		sendRequest(name,email,password);
	}
}

function sendRequest(name,email,password){
	console.log("enetered into sendrequest");
	var xhr=new XMLHttpRequest();
	//request type, reqname,enabler of the config
	xhr.open("POST","/registerAdmin",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.onreadystatechange=function(){
		if(xhr.readyState==XMLHttpRequest.DONE&&xhr.status==200){
			
		}
	};
	xhr.send("email="+email+"&name="+name+"&password="+password);
}

