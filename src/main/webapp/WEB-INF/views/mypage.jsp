<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
${userList[0].USER_ID}님의 글 목록
<br><br>
가입일: ${info[0].INSERT_DATE}
<table border="1" width="30%" height="15" cellspacing="0">
            <thead>
                <tr align="center" bgcolor="white">
                    <th>제목</th>
                    <th>시간</th>
                </tr>
            </thead>
            <tbody>
			<c:forEach var="item" items="${list}" begin="0">
                <tr align="center" bgcolor="white">
					<td><a href="/post.do?no=${item.NO}">${item.TITLE}</a></td>
                    <td>${item.INSERT_DATE}</td>
                </tr>
			</c:forEach>
            </tbody>
        </table>
        <button style='margin-top:10px;' type='button' onClick='back();'>뒤로가기</button>
        <button onClick="post();">공지사항 작성</button>
</body>
<script type="text/javascript">
	function back(){
		window.history.back();
	}
	
	function post(){
		window.location.href='/posting.do';
	}
</script>
</html>