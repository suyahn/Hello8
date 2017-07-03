<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
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
	width: 45% !important;
	margin: 30px;
}

#left, #right {
	width: 50%;
}
</style>
</head>
<body>
	<div align="left">
		<table class="table table-hover" align="left" id="left">
			<c:set value="1" var="num"></c:set>
			<caption>Best Diary</caption>
			<tr>
				<th>no</th>
				<th>language</th>
				<th>subject</th>
				<th>date</th>
				<th>count</th>
			</tr>
			<c:if test="${not empty diarylist}">
				<c:forEach var="diary" items="${diarylist}">
					<!-- items의 list는 listaction의 list를 넘겨준 애 -->
					<tr>
						<td>${num}</td>
						<td>${diary.lang_name}</td>
						<td><a href="${ path }/diary/content.do?dno=${diary.dno}">
								${diary.dsubject}</a></td>
						<td>${diary.ddate}</td>
						<td>${diary.dreadcount}</td>
						<c:set var="num" value="${num + 1}"></c:set>
					</tr>
					<!--num은 가상번호 ex 1 2 3 4 5 6 7 8 ~ 거꾸로 하면 9에서 1을 빼야하니깐 8 그리고 1빼서 7 등등  -->
				</c:forEach>
			</c:if>
			<c:if test="${empty diarylist }">
				<tr>
					<th colspan="7">nothing</th>
				</tr>
			</c:if>
		</table>
			<table class="table table-hover" align="right" id="right">
				<c:set value="1" var="num"></c:set>
				<caption>Notice</caption>
				<tr>
					<th width="5%">no</th>
					<th align="right">subject</th>
					<th width="15%">date</th>
					<th width="5%">count</th>
				</tr>
				<c:if test="${not empty noticelist}">
					<c:forEach var="notice" items="${noticelist}">
						<!-- items의 list는 listaction의 list를 넘겨준 애 -->
						<tr>
							<td>${num}</td>
							<td><a href="notice/content.do?nno=${notice.nno}">
									${notice.nsubject}</a></td>
							<td>${notice.ndate}</td>
							<td>${notice.nreadcount}</td>
							<c:set var="num" value="${num + 1}"></c:set>
						</tr>
						<!--num은 가상번호 ex 1 2 3 4 5 6 7 8 ~ 거꾸로 하면 9에서 1을 빼야하니깐 8 그리고 1빼서 7 등등  -->
					</c:forEach>
				</c:if>
				<c:if test="${empty noticelist }">
					<tr>
						<th colspan="7">nothing</th>
					</tr>
				</c:if>
			</table>
		</div>
		<!-- Latest compiled and minified JavaScript -->
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
			integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
			crossorigin="anonymous"></script>
</html>