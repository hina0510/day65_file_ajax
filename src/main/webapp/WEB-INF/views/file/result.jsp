<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:forEach var="dto" items="${list }">
		id : ${dto.id }<br>
		name : ${dto.name }<br>
		imgName : ${dto.imgName }
		<img src="download?file=${dto.imgName }" width="100" height="100"><br>
		<a href="download?file=${dto.imgName }">${dto.imgName }</a>
		<br>
		<a href="delete?file=${dto.imgName }&id=${dto.id}">삭제</a><br>
		<a href="modify_view?file=${dto.imgName }&id=${dto.id}">수정</a><br>
		<hr>
	</c:forEach>
	<a href="form">업로드로 이동</a>
</body>
</html>