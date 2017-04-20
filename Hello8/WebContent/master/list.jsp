<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	caption {text-align: center; font-size: 25px; color: black;}
	table {width: 65% !important;}
</style>
</head><body>
<div align="center">
<table class="table table-hover">
	<caption>회원정보</caption>
		<tr>
			<th>아이디</th>
			<th>닉네임</th>
			<th>이메일</th>
			<th>모국어</th>
			<th>삭제여부</th>
			<th>점수</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="6">데이터가 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="member" items="${list}">
				<tr>
					<td>${member.id}</td>
					<td>${member.nickname}</td>
					<td>${member.email}</td>
					<td>${member.lang_name}</td>
					<td>${member.del}</td>
					<td>${member.score}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>
	<div align="center">
		<c:if test="${startPage > PAGEPERBLOCK }">
			<a href="listAction.do?pageNum=${endPage-PAGEPERBLOCK}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="listAction.do?pageNum=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < totPage }">
			<a href="listAction.do?pageNum=${startPage+PAGEPERBLOCK}">[다음]</a>
		</c:if>
	</div>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body></html>