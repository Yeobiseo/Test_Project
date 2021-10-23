<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="userList" value="${userList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>귀여운 게시판</title>
<jsp:include page="/resources/common/bootstrap.jsp"></jsp:include>
</head>
<style>
	.alink:link { color: black; text-decoration: none;}
	.alink:visited { color: black; text-decoration: none;}
	.alink:hover { color: black; text-decoration: none;}
	.postBox:hover { cursor: pointer; font-weight: 600;}
	.lineright {
	border-right: 1px solid black;
	width: 100%;
	height: 650px;
	 }

	.linetop {
	border-bottom: 1px solid black;
	margin-top: 10px;
	width: 100%;
	 }

	block{
	width: 100%;
	height: 500px;
	 }

	block.left {
	width: 60%;
	float: left;
	box-sizing: border-box;
	border-right: 1px solid black;
	 }

	block.right {
	width: 40%;
	float: right;
	box-sizing: border-box;
	}

	.navigation {
    width : 100%;
    height : 40px;
    border-bottom : 1px solid black;
    margin-top : 24px;
	}
	.mainpage {
    width : 100%;
    height : 720px;
    margin-top: 12px;
	}

	<%--회원가입 btn--%>
	.signbtn{
	position: absolute;
	padding: 40px 130px 40px 130px;
	margin-left: 100px;
	top:360px;
	background-color: rgba(0,0,0,0);
	border: none;
	}

	.signbtn:hover {
	cursor: pointer;
	}
</style>
<body>
<jsp:include page="/resources/common/navigation.jsp"></jsp:include> 
	<%-- 게시판 글 목록 --%>
	<div class="linetop" style="margin-top: 83px;"></div>
	<block>
		<block class="left">
			<h4 style="margin-left: 35px;">공지사항</h4>
			<div style="border-bottom: 3px solid gray; margin-left:37px; width: 70%"></div>
	 		<ul style="list-style: none; width: 70%;">
	 			<c:forEach var="item" items="${list}" begin="0">
	 		 	 	<li class="postBox" style="border-bottom: 1px solid gray; padding-bottom: 8px; padding-top: 5px;" onclick="postFunc(${item.NO});"><div>${item.TITLE}</div><div></div>${item.USER_ID} ｜ ${item.INSERT_DATE}</li>
	 		 	 </c:forEach>
	 		</ul>
    	</block>
		<block class="right">
		<c:if test="${userList eq null}">
			  <div style="position: relative;">
			  	<img src="resources/img/123.gif">
			  </div>
			  	<button onclick="signUp();" class="signbtn"></button>
		</c:if>
		<c:if test="${userList ne null}">
			<div align="center">
				<br id="createBr">
				<c:if test="${charYn[0].CHAR_YN ne 'X'}">
		    	<button id="createBtn" onclick="createFunc();">캐릭터생성</button><br>
		    	</c:if>
		  		<div id="createBox" style="display: none;"><h3>캐릭터생성</h3><h5>※ 캐릭터는 최대 2명까지 생성 가능</h5>
				<hr>
				<form action="/characterCreate.do" method="POST">
				    <input type="text" name="id" id="idValue" placeholder="캐릭터명" required="required">
				    <button type="button" onclick="idCheckFunc();">중복체크</button>
				    <br>
				    <div style="font-weight:600;">성별</div>
				    <input type="radio" name="gender" value="male" checked>
				    <label for="male">남</label>
				    <input type="radio" name="gender" value="female">
				    <label for="female">여</label>
				    <br><br>
				    <div style="font-weight:600;">성격(3개 까지 가능)</div>
				    <%-- 온순함(연인과 만날 확률 증가), 냉철함(연인을 만날 확률 감소) --%>
					<input type='radio' name='type1' value='1' required="required"/>온순함
					<input type='radio' name='type1' value='2'/>냉철함
					<br>
					<%-- 재력(돈을 얻을 확률 증가), 정력(자녀를 만들 확률 증가) --%>
					<input type='radio' name='type2' value='3' required="required"/>재력
					<input type='radio' name='type2' value='4'/>정력
					<br>
					<%-- 근력(배고픔 감소), 지능(공부 경험치 확률 증가) --%>
					<input type='radio' name='type3' value='5' required="required"/>근력
					<input type='radio' name='type3' value='6'/>지능
					<br><br>
					<button type="submit">생성</button>
				    <button type="button" onclick="cancelFunc();">취소</button>
			    </form>
				</div>
				<%-- 캐릭터 정보 --%>
				<div align="left" id="charListBox">
					<c:forEach var="item" items="${charList}" begin="0">
						<a href="/usermain.do?no=${item.CHAR_NO}" style="text-decoration:none; font-size: 18px;">
						<img src="/resources/${item.CHAR_IMG}" width="100px" height="100px" style="float: left; margin-right: 10px; margin-left: 30px;">
							<br>
						    	<div style="margin-top: 15px; margin-bottom: 50px;">${item.CHAR_NAME}</a> (${item.CHAR_GENDER})</div>
						    <br>
					</c:forEach>
				</div>
			</c:if>
		</block>
	</block>
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

	<%--캐릭터 생성 버튼--%>
	function createFunc() {
		document.getElementById("createBr").style.display = "none";
		document.getElementById("createBtn").style.display = "none";
		document.getElementById("charListBox").style.display = "none";
		document.getElementById("createBox").style.display = "block";
	}
	<%-- 캐릭터 취소 버튼 --%>
	function cancelFunc() {
		document.getElementById("createBr").style.display = "block";
		document.getElementById("createBox").style.display = "none";
		document.getElementById("charListBox").style.display = "block";
		document.getElementById("createBtn").style.display = "block";
	}

	<%--중복 체크--%>
	function idCheckFunc() {
		var id = document.getElementById('idValue').value;

		if(id.length == 0){
			alert('아이디를 입력하세요');
		} else {
			var xhr = new XMLHttpRequest();

			xhr.open('POST', '/idcheck.do');
			xhr.setRequestHeader('Content-Type', 'application/json');

			var data = {val: id};
			xhr.send(JSON.stringify(data));

			xhr.onreadystatechange = function() {
				if(xhr.readyState == xhr.DONE){
					if(xhr.status == 200 || xhr.status == 201){
						if(xhr.response == '1'){
							alert('이미 사용중인 아이디입니다.');
							flag = false;
						} else {
							alert('사용가능한 아이디입니다.');
							flag = true;
						}
					}
				}
			}
		}
	}

	function postFunc(no) {
		window.location.href="/post.do?no=" + no;
	}

</script>
</html>