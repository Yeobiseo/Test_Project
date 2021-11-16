<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<jsp:include page="/resources/common/bootstrap.jsp"></jsp:include>
</head>

<style>

</style>

<body>
<jsp:include page="/resources/common/navigation.jsp"></jsp:include> 
<div class="accordion" id="accordionExample" style="margin-top: 83px;">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          회원가입은 어떻게 하나요?
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
        회원가입은 <a href="/signUp.do">여기</a>에서 진행 하실 수 있습니다.
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          캐릭터가 더 이상 생성이 안됩니다.
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
        캐릭터는 최대 <b>2</b>명 까지 만드실 수 있습니다.
      </div>
    </div>
  </div>
</div>
</body>

<script type="text/javascript">

</script>

</html>