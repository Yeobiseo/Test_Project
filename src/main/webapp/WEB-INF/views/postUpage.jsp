<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/postUpdate.do" method="post">
		<input type="text" name="title" value="${list[0].TITLE}"><br>
		<textarea rows="30" cols="80" name="content">${list[0].CONTEST}</textarea>
		<br>
		<button type="submit">확인</button>
		<button type="button" onClick="back()">뒤로가기</button>
		<input type="hidden" value="${list[0].NO}" name="no">
	</form>
</body>
</html>