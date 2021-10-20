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
.box{
	border: solid 1px black;
	width: 800px;
	height: 1200px;
	margin-top: 130px;
	margin-bottom: 40px;
	}
</style>

<body>
<jsp:include page="/resources/common/navigation.jsp"></jsp:include>

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