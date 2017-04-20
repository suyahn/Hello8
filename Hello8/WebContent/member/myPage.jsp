<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:if test="${ empty member }">
	<jsp:forward page="myPage.do"></jsp:forward>
</c:if>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<style type="text/css">
	.summary th, tr { text-align: center; padding: 25px; }
	.summary th { font-size: 20px; }
	.summary td { font-size: 18px; }
</style>
</head>
<body>
	<div class="panel panel-info" align="center">
		<div class="panel-heading">
			<h2 class="panel-title">${ member.nickname }'s Summary</h2>
		</div>
		<div class="panel-body">
			<table class="summary">
				<tr><th>Total</th><th>Diary</th><th>Gathering</th></tr>
				<tr>
					<td>${ diarySum + gatheringSum }</td><td><a>${ diarySum }</a></td><td><a>${ gatheringSum }</a></td>
				</tr>
			</table>
		</div>
	</div>

	<div class="panel panel-info" align="center">
		<div class="panel-heading">
			<h2 class="panel-title">${ member.nickname }'s Information</h2>
		</div>
		<div class="panel-body">
			<table class="table">
				<tr>
					<th>ID</th>
					<td>${ member.id }</td>
				</tr>
				<tr>
					<th>Nickname</th>
					<td>${ member.nickname }</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>${ member.email }</td>
				</tr>
				<tr>
					<th>Score</th>
					<td>${ member.score }</td>
				</tr>
				<tr>
					<th>Grade</th>
					<td>${ grade }</td>
				</tr>
				<tr>
					<th>Native Language</th>
					<td>${ native_lang }</td>
				</tr>
				<tr>
					<th>Interesting Language</th>
					<td><c:forEach var="inter_lang" items="${ inter_langs }">
								${ inter_lang.lang_name }<br>
						</c:forEach></td>
				</tr>
				<tr>
					<th>Registration Date</th>
					<td>${ member.reg_date }</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info"
							onclick="location.href='passwordConfirm.jsp?mode=1'">Modification</button>
						<button type="submit" class="btn btn-info"
							onclick="location.href='passwordConfirm.jsp?mode=2'">Withdrawal</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</html>