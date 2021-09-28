<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="/signupMv.do" method="post" onsubmit="return confirm();">
		<div style="margin-bottom: 5px;">
			<input type="text" name="id" id="idValue" placeholder="아이디">
			<button type="button" onclick="idCheckFunc();">중복체크</button>
		</div>
		<div>
			<input type="password" name="pwd" id="pwdValue" placeholder="비밀번호">
			<button type="submit">확인</button>
			<button type="button" onClick="back()">뒤로가기</button>
		</div>
	</form>
</body>
<script type="text/javascript">

	var flag = false;

	function back() {
		window.history.back();
	}

	function idCheckFunc() {
		var id = document.getElementById('idValue').value;

		if(id.length == 0){
			alert('아이디를 입력하세요');
		} else {
			var xhr = new XMLHttpRequest();

				xhr.open('POST', '/idcheck.do');
				xhr.setRequestHeader('Content-Type', 'application/json');

				var data = {val: id};
				xhr.send(JSON.stringify(data));

				xhr.onreadystatechange = function() {
					if(xhr.readyState == xhr.DONE){
						if(xhr.status == 200 || xhr.status == 201){
							if(xhr.response == '1'){
								alert('이미 사용중인 아이디입니다.');
								flag = false;
							} else {
								alert('사용가능한 아이디입니다.');
								flag = true;
							}
						}
					}
				}
		}
	}

	function confirm() {
		var id = document.getElementById('idValue').value;
		var pwd = document.getElementById('pwdValue').value;

		if(id.length == 0 || pwd.length == 0){
			alert('아이디와 비밀번호를 입력하세요');
			return false;
		} else {
			if(flag == false){
				alert('아이디 중복체크를 하세요');
				return false;
			} else return true;
		}
	}

</script>
</html>