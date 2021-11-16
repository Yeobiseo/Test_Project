<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<jsp:include page="/resources/common/bootstrap.jsp"></jsp:include>
</head>

<style>
	body{
	background-image: url('resources/img/BGI.jpeg');
	}
	.alink:link { color: black; text-decoration: none;}
	.alink:visited { color: black; text-decoration: none;}
	.alink:hover { color: black; text-decoration: none;}
	.postBox:hover { cursor: pointer; font-weight: 600;}
</style>

<body>
<jsp:include page="/resources/common/navigation.jsp"></jsp:include>
	<div style="margin-top: 83px;">
		<div class="left">
			<br>
			<h4 style="margin-left: 35px;">자유게시판</h4>
			<div style="border-bottom: 3px solid gray; margin-left:37px; width: 70%"></div>
	 		<ul style="list-style: none; width: 70%;">
	 			<c:forEach var="item" items="${list}" begin="0">
	 		 	 	<li class="postBox" style="border-bottom: 1px solid gray; padding-bottom: 8px; padding-top: 5px;" onclick="postFunc(${item.NO});"><div>${item.TITLE}</div><div></div>${item.USER_ID} ｜ ${item.INSERT_DATE}</li>
	 		 	 </c:forEach>
	 		</ul>
    	</div>
	</div>
</body>

<script type="text/javascript">
	function postFunc(no) {
		window.location.href="/post.do?no=" + no;
	}
</script>

</html>