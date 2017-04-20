<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Hello8</title>
<link rel="stylesheet" type="text/css" href="temp/common2.css">
</head>
<body>
	<%-- <table>
		<tr>
			<td colspan="2" class="header">
				<jsp:include page="temp/header.jsp"/>
			</td>
		</tr>
		<tr>
			<td class="mainArticle">
				<c:if test="${not empty param.pgm}">
					<jsp:include page="${param.pgm}.jsp" />
				</c:if>
				<c:if test="${empty param.pgm}">
					<jsp:include page="main/main.jsp" />
				</c:if>
			</td>
			<td class="memberArticle">
				<c:if test='${not empty session.getAttribute("id")}'>
					<jsp:forward page="member/loginSuccess.do" />
				</c:if>
				<c:if test='${empty session.getAttribute("id")}'>
					<jsp:include page="member/loginForm.jsp" />
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="footer">
				<jsp:include page="temp/footer.jsp"/>
			</td>
		</tr>
	</table> --%>
	
	<header><jsp:include page="temp/header.jsp"/></header>
	<div class="mainArticle">
		<c:if test="${not empty param.pgm}">
			<jsp:include page="${param.pgm}"/>
		</c:if>
		<c:if test="${empty param.pgm}">
			<jsp:include page="main/main.jsp"/>
		</c:if>
	</div>
	<div class="memberArticle">
		<c:if test='${not empty session.getAttribute("id")}'>
			<jsp:forward page="member/loginSuccess.do"/>
			<!-- <script type="text/javascript">
				location.href="member/loginSuccess.do";
			</script> -->
		</c:if>
		<c:if test='${empty session.getAttribute("id")}'>
			<jsp:include page="member/loginForm.jsp"/>
		</c:if>
	</div>
	<footer><jsp:include page="temp/footer.jsp"/></footer>
</body>
</html>