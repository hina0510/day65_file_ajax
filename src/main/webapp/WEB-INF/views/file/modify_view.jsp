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
		<form action="modify" method="post" enctype="multipart/form-data">
			<input type="text" name="id" readonly value=${dto.id }><br>
			<input type="text" name="name" value=${dto.name }><br>
			<input type="file" name="file" value=${dto.imgName }><br>
			<input type="submit" value="전송"><br>
		</form>
	</c:forEach>
	
</body>
</html>