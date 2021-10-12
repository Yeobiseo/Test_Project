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
	<%--background: #8977ad;--%>
	 }
	 
	block.right {
	width: 40%;
	float: right;
	box-sizing: border-box;
	<%--background: #ece6cc;--%>
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
	<block>
	<block class="left">
			<div style="margin-top: 10px;" align="center">	
				<table border="1" width="90%" height="15" cellspacing="0">
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
     	</block>
     <block class="right">
	     <button id="createBtn" onclick="createFunc();">캐릭터생성</button>
	     <div id="createBox" style="display: none;">캐릭터생성
		     <hr>
		     <input type="text" placeholder="캐릭터명">
		     <button>중복체크</button>
		     <br>
		     성별
		     <br>
		     <input type="radio" name="gender" value="male" checked>
		     <label for="male">남</label>
		     <input type="radio" name="gender" value="female">
		     <label for="female">여</label>
		     <br><br>
		     성격(3개 까지 가능)<br><br>
		     <%-- 온순함(연인과 만날 확률 증가), 냉철함(연인을 만날 확률 감소) --%>
			 <input type='radio' name='type1' value='1'/>온순함
			 <input type='radio' name='type1' value='2'/>냉철함
			 <br>
			 <%-- 재력(돈을 얻을 확률 증가), 정력(자녀를 만들 확률 증가) --%>
			 <input type='radio' name='type2' value='3'/>재력
			 <input type='radio' name='type2' value='4'/>정력
			 <br>
			 <%-- 근력(배고픔 감소), 지능(공부 경험치 확률 증가) --%>
			 <input type='radio' name='type3' value='5'/>근력
			 <input type='radio' name='type3' value='6'/>지능
			 <br><br>
			 <button>생성</button>
		     <button onclick="cancelFunc();">취소</button>
		 </div>	
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

	function test() {
		window.location.href = "/test.do";
	}
	
	<%--캐릭터 생성 버튼--%>
	function createFunc() {
		document.getElementById("createBtn").style.display = "none";
		document.getElementById("createBox").style.display = "block";
	}
	function cancelFunc() {
		document.getElementById("createBox").style.display = "none";
		document.getElementById("createBtn").style.display = "block";
	}
</script>
</html>