<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="/signupMv.do" method="post">
		<input type="text" name="id">
		<input type="password" name="pwd">
		<button type="submit">확인</button>
		<button type="button" onClick="back()">뒤로가기</button>
	</form>
</body>
<script type="text/javascript">
	function back() {
		window.history.back();
	}
</script>
</html>