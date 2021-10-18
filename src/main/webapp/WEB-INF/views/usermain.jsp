<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목</title>
<jsp:include page="/resources/common/bootstrap.jsp"></jsp:include>
</head>

<style>
	.topsl{
	margin-left: 20px;
	}
	header{
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	height: 90px;
	padding: 1rem;
	color: white;
	background: #E3C4FF;
	font-weight: bold;
	display: block;
	justify-content: space-between;
	}
	.box{
	border: solid 1px black;
	width: 800px;
	height: 1200px;
	margin-top: 100px;
	margin-bottom: 40px;
	}

</style>

<body>
<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
      <div>${userList[0].USER_ID} 님 안녕하세요!<br><a href="/" style="font-size: 35px; font-weight: 600;">두둥탁 피플!</a></div>
    </div>
    <div class="mx-auto order-0">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#">공지사항</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">자유게시판</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">이용방법</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Q&A</a>
            </li>
        </ul>
    </div>
</nav>
<%-- 내가 만든거 ㅠㅠ --%> %>
<%-- <header>
	<div style="margin-left: 2%;">
	${userList[0].USER_ID} 님 안녕하세요!
	</div>
	<div>
		<span style="font-size: 30px; margin-left: 2%;">두둥탁! 피플</span>
		<span style="float: right; margin-right: 5%;"><a>공지사항</a><a class="topsl">자유게시판</a><a class="topsl">이용방법</a><a class="topsl">QnA </a></span>
	</div>
</header> --%>
	<div class="row d-flex justify-content-center">
		<div class="box">
			<img src="/resources/${charList[0].CHAR_IMG}" width= "170px" height= "170px" style="float: left; margin-top: 50px; margin-left: 50px;">
				<div style="margin-top: 105px; margin-left: 250px; font-size: 20px;">${charList[0].CHAR_NAME}
				<br>
				${charList[0].CHAR_AGE} 세 (${charList[0].CHAR_GENDER})</div>
		</div>
	</div>
</body>

<script type="text/javascript">

</script>

</html>