<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>귀여운 날씨</title>
</head>
<body>
	<table border="1" width="70%" height="15" cellspacing="0">
           <thead> 	
               <tr align="center" bgcolor="white">
                   <th>도시명</th>
                   <th>테마</th>
                   <th>여행지</th>
                   <th>추천장소</th>
                   <th>배아파지수</th>
               </tr>
           </thead>
           <tbody>
		<c:forEach var="item" items="${list}" begin="0">
               <tr align="center" bgcolor="white">
                   <td>${item.courseAreaName}</td>
                   <td>${item.thema}</td>
                   <td>${item.courseName}</td>
                   <td>${item.spotName}</td>
                   <td>${item.fdIndex}</td>
               </tr>
		</c:forEach>
           </tbody>
       </table>
</body>
</html>