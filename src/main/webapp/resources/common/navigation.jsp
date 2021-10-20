<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="userList" value="${userList}" />
<style>
/* 	.topsl{
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
	}*/
	
</style>
<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
	    <div>
	      <form action="/login.do" method="post" style="margin-top: 0px;">
			<c:if test="${userList eq null}">
				<input type="text" name="id" required="required" value="${requestScope.inputId}" placeholder="아이디">
				<input type="password" name="pwd" required="required" placeholder="비밀번호">
				<button type="submit">로그인</button>
				<button type="button" onClick="signUp();">회원가입</button>
				<button type="button" onClick="test();" hidden="true">날씨</button>
			</c:if>
		</form>
		<c:if test="${userList ne null}">
			<a href="/mypage.do?id=${userList[0].USER_ID}">${userList[0].USER_ID}</a> 님 안녕하세요!
			<span>
				<button type="button" onClick="logout()">로그아웃</button>
				<button type="submit" onClick="posting()">글쓰기</button>
				<button type="button" onClick="test();">날씨</button>
			</span>
		</c:if>
		<%-- 로그인 상태표시 --%>
	    <a href="/" style="font-size: 35px; font-weight: 600;">두둥탁 피플!</a>
	    </div>
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
<%-- 내가 만든거 ㅠㅠ --%>
<%-- <header>
	<div style="margin-left: 2%;">
	${userList[0].USER_ID} 님 안녕하세요!
	</div>
	<div>
		<span style="font-size: 30px; margin-left: 2%;">두둥탁! 피플</span>
		<span style="float: right; margin-right: 5%;"><a>공지사항</a><a class="topsl">자유게시판</a><a class="topsl">이용방법</a><a class="topsl">QnA </a></span>
	</div>
</header> --%>