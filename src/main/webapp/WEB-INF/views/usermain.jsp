<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피플게임 닷컴</title>
<jsp:include page="/resources/common/bootstrap.jsp"></jsp:include>
</head>

<style>
	.box{
	border: solid 1px black;
	width: 800px;
	height: 1200px;
	margin-top: 130px;
	margin-bottom: 40px;
	}
	.line{
	margin-top: 70px;
	height: 10px;
	border: 0;
	box-shadow: 0 10px 10px -10px #bbb inset;
	}
	
	.miniPhoto{
	border: solid 1px gray;
	margin-left: 12px;
	width: 190px;
	height: 150px;
	float: left;
	}
	.miniPhoto2{
	border: solid 1px gray;
	margin-left: 5px;
	width: 190px;
	height: 150px;
	float: left;
	}
	.miniPhoto3{
	border: solid 1px gray;
	margin-top: 5px;
	margin-left: 12px;
	width: 190px;
	height: 150px;
	float: left;
	}
	.miniPhoto4{
	border: solid 1px gray;
	margin-top: 5px;
	margin-left: 5px;
	width: 190px;
	height: 150px;
	float: left;
	}
</style>

<body>
<jsp:include page="/resources/common/navigation.jsp"></jsp:include>

<div class="row d-flex justify-content-center">
	<div class="box">
		<img src="/resources/${charList[0].CHAR_IMG}" width= "170px" height= "170px" style="float: left; margin-top: 30px; margin-left: 50px;">
			<div style="margin-top: 60px; margin-left: 250px;">
				<div style="font-size: 20px;">
					${charList[0].CHAR_NAME}
				</div>
					<div style="font-size: 15px;">
						<br>
						${charList[0].CHAR_AGE} 세 (${charList[0].CHAR_GENDER})
						<br>
						직업 :
					</div>
			</div>
			<div class="line"></div>
			<div style="border: solid 1px black; height: 270px; width: 200px; float: right; margin-right:50px; margin-top:50px;">아바타</div>
				<div style="test-align: center; margin-top:380px; margin-left:300px;">──── PHOTO ZONE ────</div>
				<!-- 포토 갤러리 1 -->
					<div class="miniPhoto">사진1</div>
					<div class="miniPhoto2">사진2</div>
					<div class="miniPhoto2">사진3</div>
					<div class="miniPhoto2">사진4</div>
					<br>
				<!-- 포토 갤러리 2 -->
					<div class="miniPhoto3">사진5</div>
					<div class="miniPhoto4">사진6</div>
					<div class="miniPhoto4">사진7</div>
					<div class="miniPhoto4">사진8</div>

	</div>
</div>

</body>

<script type="text/javascript">

</script>

</html>