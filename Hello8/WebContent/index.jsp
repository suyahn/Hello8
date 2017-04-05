<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Hello8</title>
<link rel="stylesheet" type="text/css" href="temp/common.css">
</head>
<body>
	<header><jsp:include page="temp/header.jsp"/></header>
	<article>
		<c:if test="${not empty param.pgm}">
			<jsp:include page="${param.pgm}.jsp"/>
		</c:if>
		<c:if test="${empty param.pgm}">
			<jsp:include page="main/main.jsp"/>
		</c:if>
	</article>
	<footer><jsp:include page="temp/footer.jsp"/></footer>
</body>
</html>