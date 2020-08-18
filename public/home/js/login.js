var Login={
	login_url:'./index.php?g=home&m=user&a=userLogin',
	reg_url:'./index.php?g=home&m=user&a=userReg',
	loginout_url:'./index.php?g=home&m=user&a=logout',
	forget_url:'./index.php?g=home&m=user&a=forget',
	captcha_url:'./index.php?g=home&m=user&a=getCaptcha',
	code_url:'./index.php?g=home&m=user&a=getCode',
	dombody:$("body"),
	type:'login',
	checkPhone:/^0?1[3|4|5|7|8|9][0-9]\d{8}$/,
	checkPass:/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$/,
	interval_reg:null,
	interval_forget:null,
	dologin:function(){
		var username = $("#login-username").val();
		if(!username || username == ""){
			alert("请输入用户名");
			return false;
		}
		var password = $("#login-password").val();
		if(!password || password == ""){
			alert("请输入密码");
			return false;
		}
		$.ajax({
			url: Login.login_url,
			data: {mobile:username,pass:password},
			type: "GET",
			dataType: "jsonp",
			jsonp: "callback",
			cache: !1,
			success:function(data){
				if(data && data.errno ==0){
					window.location.reload();
				}else{
					alert("用户名或密码错误");
					return !1;
				}
				
			}
		})
		
	},
	doreg:function(){
		var username = $("#reg-username").val();
		if(!username || username == ""){
			alert("请输入用户名");
			return false;
		}
		var password1 = $("#reg-password1").val();
		if(!password1 || password1 == ""){
			alert("请输入密码");
			return false;
		}
		var password2 = $("#reg-password2").val();
		if(!password2 || password2 == ""){
			alert("请确认密码");
			return false;
		}if(password1 != password2){
			alert("两次密码不一致");
			return false;
		}
    if(password1 != password2){
      alert("两次密码不一致");
      return false;
    }
    var cerNo = $("#reg-username3").val();
    if(cerNo == ""){
      alert("请输入身份证号");
      return false;
    }
		$.ajax({
			url: Login.reg_url,
			data: {mobile:username,pass:password1,cer_no:cerNo},
			type: "GET",
			dataType: "jsonp",
			jsonp: "callback",
			cache: !1,
			success:function(data){
				if(data && data.errno ==0){
					alert("注册成功");
					window.location.reload();//页面刷新
				}else{
					alert(data.errmsg);
					return !1;
				}
			},
			error:function(data){
				alert(data.errno)
				alert("注册1失败");
				return !1;
			}
		})				
	},
	logout:function(){
		$.ajax({
			url: Login.loginout_url,
			data: {},
			type: "GET",
			dataType: "jsonp",
			jsonp: "callback",
			cache: !1,
			success:function(data){
				if(data && data.errno ==0){
					window.location.reload();
				}else{
					alert("退出登录失败");
					return !1;
				}
				
			}
		})		
		
	},
}

