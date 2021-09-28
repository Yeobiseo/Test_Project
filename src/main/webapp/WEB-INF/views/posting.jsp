<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<form action="/postingMv.do" method="post">
		<input type="text" name="title">
		<br>
		<textarea rows="30" cols="80" name="content"></textarea>
		<br>
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