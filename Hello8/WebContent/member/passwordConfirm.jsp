<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:if test="${ empty param.mode }">
	<jsp:forward page="myPage.do"></jsp:forward>
</c:if>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
<body>
	<form action="passwordConfirm.do" method="post">
		<input type="hidden" value="${ param.mode }" name="mode">
		<div align="center">
			<table>
				<tr>
					<th><h4>Please write your password.</h4></th>
				</tr>
				<tr>
					<td><br><input type="password" name="password" required="required" autofocus="autofocus" placeholder="Password" class="form-control"></td>
				</tr>
				<tr>
					<td align="center">
						<br>
						<button type="submit" class="btn btn-info">
							<c:if test="${ param.mode == 1 }">Modification</c:if>
							<c:if test="${ param.mode == 2 }">Withdrawal</c:if>
						</button>
						<button type="button" class="btn btn-default" onclick="location.href='myPage.do'">My Page</button>
					</td>			
				</tr>
			</table>
		</div>
	</form>
</body>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</html>