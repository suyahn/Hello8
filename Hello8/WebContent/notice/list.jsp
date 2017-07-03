<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
caption {
	text-align: center;
	font-size: 25px;
	color: black;
}

table {
	width: 65% !important;
}
</style>
</head>
<body>
	<div align="center">
		<table class="table">
			<c:set value="${number}" var="num"></c:set>
			<caption>Notice</caption>
			<tr>
				<th>no</th>
				<th width="50%">subject</th>
				<th>date</th>
				<th width="10%">count</th>
			</tr>
			<c:if test="${not empty list}">
				<c:forEach var="notice" items="${list}">
					<!-- items의 list는 listaction의 list를 넘겨준 애 -->
					<tr>
						<td>${num}</td>
						<c:if test="${notice.ndel!='y'}">
							<td><a
								href="content.do?nno=${notice.nno}&pageNum=${pageNum}">
									${notice.nsubject}</a></td>
							<td>${notice.ndate}</td>
							<td>${notice.nreadcount}</td>
						</c:if>
						<c:set var="num" value="${num - 1}"></c:set>
					</tr>
					<!--num은 가상번호 ex 1 2 3 4 5 6 7 8 ~ 거꾸로 하면 9에서 1을 빼야하니깐 8 그리고 1빼서 7 등등  -->
				</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<th colspan="7">nothing</th>
				</tr>
			</c:if>
			<tr>
				<th colspan="4"><c:set var="id"
						value='<%=session.getAttribute("id")%>'></c:set> <c:if
						test="${ id eq 'master'}">
						<input type="button" onclick="location.href='writeForm.jsp'"
							value="write" style="float: left">
					</c:if>
					<div align="center">
						<c:if test="${startPage > PAGEPERBLOCK }">
							<a href="listAction.do?pageNum=${endPage-PAGEPERBLOCK}">[before]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<a href="listAction.do?pageNum=${i }">[${i}]</a>
						</c:forEach>
						<c:if test="${endPage < totPage }">
							<a href="listAction.do?pageNum=${startPage+PAGEPERBLOCK}">[next]</a>
						</c:if>
					</div></th>
			</tr>
		</table>
	</div>
</body>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</html>