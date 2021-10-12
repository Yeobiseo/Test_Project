<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="userList" value="${userList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>귀여운 게시판</title>
</head>
<style>
	.lineright {
	border-right: 1px solid black;
	width: 50%;
	height: 650px;
	 }
	 
	.linetop {
	border-bottom: 1px solid black;
	margin-top: 10px;
	width: 100%;
	 }
	 
	b{
	width: 100%;
	height: 500px;
	 }

	b.left {
	width: 40%;
	float: left;
	box-sizing: border-box;
	background: #8977ad;
	 }
	 
	b.right {
	width: 60%;
	float: right;
	box-sizing: border-box;
	background: #ece6cc;
	}
</style>
<body>
	<form action="/login.do" method="post">
		<c:if test="${userList eq null}">
			<input type="text" name="id" required="required" value="${requestScope.inputId}" placeholder="아이디">
			<input type="password" name="pwd" required="required" placeholder="비밀번호">
			<button type="submit">로그인</button>
			<button type="button" onClick="signUp();">회원가입</button>
			<button type="button" onClick="test();">날씨</button>
		</c:if>
	</form>

	<%-- 로그인 상태표시 --%>
	<div class="linetop">
		<c:if test="${userList ne null}">
					<a href="/mypage.do?id=${userList[0].USER_ID}">${userList[0].USER_ID}</a> 님 안녕하세요!
			<span>
				<button type="button" onClick="logout()">로그아웃</button>
				<button type="submit" onClick="posting()">글쓰기</button>
				<button type="button" onClick="test();">날씨</button>
			</span>
		</c:if>
	</div>
	<%-- 게시판 글 목록 --%>
	<b>
	<b class="left">
		 <%-- <div class="lineright"> --%>
			<div style="margin-top: 10px;">	
				<table border="1" width="100%" height="15" cellspacing="0">
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
	        </div>
        <%--</div>--%>
     </b>
     <b class="right">
     오른쪽
     </b>
     </b>
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