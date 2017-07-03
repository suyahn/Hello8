<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="${ path }/temp/common12.css">
</head>
<body>
	<%-- <header><jsp:include page="temp/header.jsp"/></header> --%>
	<div id="mainArticle">
		<c:if test="${not empty param.pgm}">
			<jsp:include page="${ param.pgm }"></jsp:include>
			<%-- <jsp:forward page="${ param.pgm }"></jsp:forward> --%>
		</c:if>
		<c:if test="${empty param.pgm}">
			<script type="text/javascript">
				location.href="${ path }/main.do"
			</script>
			<%-- <jsp:include page="main.jsp"></jsp:include> --%>
		</c:if>
	</div>
	<%-- <div class="memberArticle">
		<c:if test='${not empty id}'>
			<jsp:include page="member/loginSuccess.jsp"/>
		</c:if>
		<c:if test='${empty id }'>
			<jsp:include page="member/loginForm.jsp"/>
		</c:if>
	</div> --%>
	<%-- <footer><jsp:include page="temp/footer.jsp"/></footer> --%>
	
	
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
</body>
</html>