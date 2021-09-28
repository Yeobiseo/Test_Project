<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="userList" value="${userList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>귀여운 게시판</title>
</head>
<body>
	<form action="/login.do" method="post">
		<c:if test="${userList eq null}">
			<input type="text" name="id" required="required">
			<input type="password" name="pwd" required="required">
			<button type="submit">로그인</button>
			<button type="button" onClick="signUp();">회원가입</button>
			<button type="button" onClick="test();">날씨</button>
		</c:if>
	</form>
	
	<%-- 로그인 상태표시 --%>
	<div style="margin-bottom:15px;">
		<c:if test="${userList ne null}">
					${userList[0].USER_ID} 님 안녕하세요!
			<span>
				<button type="button" onClick="logout()">로그아웃</button>		
				<button type="submit" onClick="posting()">글쓰기</button>
			</span>
		</c:if>
	</div>
	
	<%-- 게시판 글 목록 --%>
		<table border="1" width="50%" height="15" cellspacing="0">
            <thead> 	
                <tr align="center" bgcolor="white">
                    <th>제목</th>
                    <th>작성자</th>
                    <th>시간</th>
                </tr>
            </thead>
            <tbody>
			<c:forEach var="item" items="${list}" begin="0">
                <tr align="center" bgcolor="white">
					<td><a href="/post.do?no=${item.NO}">${item.TITLE}</a></td>
                    <td>${item.USER_ID}</td>
                    <td>${item.INSERT_DATE}</td>
                </tr>
			</c:forEach>
            </tbody>
        </table>
</body>
<script type="text/javascript">
	function signUp() {
		window.location.href = "/signUp.do";
	}

	function logout() {
		window.location.href = "/logout.do";
	}
	
	function posting() {
		window.location.href = "/posting.do";
	}
	
	function test() {
		window.location.href = "/test.do";
	}
</script>
</html>