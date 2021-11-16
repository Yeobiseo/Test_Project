<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<form action="postUpage.do" method="post">
		제목: ${list[0].TITLE} &nbsp; 작성자: ${list[0].USER_ID}
		<br><br>
		${list[0].CONTEST}
		<br><br>
		<button type="button" onClick="back()">뒤로가기</button>
		<c:if test='${list[0].USER_ID eq sessionScope.userId}'>
		<button type="button" onClick="del()">삭제</button>
		<button type="submit" onClick="update()">수정</button>
		</c:if>
		<input type="hidden" name="no" value="${list[0].NO}">
		<hr>
	</form>
		<c:forEach var="item" items="${reply}" begin="0">
			${item.RECONTENT} ${item.USER_ID} ${item.INSERT_DATE} <c:if test='${item.USER_ID eq sessionScope.userId}'><button type='button' onClick='re_del("${item.RE_NO}");'>삭제</button></c:if>
			<br>
		</c:forEach>
		<form action="replyInsert.do" method="post" onsubmit="return insert1();">
		<span><input type="text" name="recontent" placeholder="댓글입력" style="width: 250px; height: 20px; margin-right: 10px;" required="required"><button type="submit">등록</button></span>
		<input type="hidden" name="no" value="${list[0].NO}">
		</form>
		
		<hr>
</body>
<script type="text/javascript">
	function back() {
		window.history.back();
	}
	function del() {
		window.location.href = "/postDel.do?no=" + '${list[0].NO}';
	}
	function insert1() {
		if('${sessionScope.userId}'.length > 0){
			return true;
		} else {
			alert('로그인 후 이용해주세요.');
			window.location.href = "/";
			return false;
		}
	}
	function re_del(no) {
		window.location.href = "/reDel.do?no=" + no + "&post=" + '${list[0].NO}';
	}
	
</script>
</html>