<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
<body>
	<form action="${ path }/member/login.do" method="post">
		<div align="center">
			<table>
				<tr>
					<th colspan="2"><br><input type="text" name="id" required="required" autofocus="autofocus" placeholder="ID" class="form-control" maxlength="10"></th>
				</tr>
				<tr>
					<th colspan="2"><br><input type="password" name="password" required="required" placeholder="Password" class="form-control"  maxlength="10"></th>
				</tr>
				<tr>
					<td colspan="2" align="center"><br><button type="submit" class="btn btn-info">Login</button></td>
				</tr>
				<tr>
					<td align="center">
						<br><button type="button" class="btn btn-link" onclick="location.href='${ path }/member/findForm.jsp'">Forgot?</button><!-- <a href="findForm.jsp">Forgot?</a> -->
					</td>
					<td align="center">
						<br><button type="button" class="btn btn-link" onclick="location.href='${ path }/member/joinForm.do'">Sign up</button><!-- <a href="joinForm.jsp">Sign up</a> -->
					</td>
				</tr>
			</table>
			<c:if test="${ not empty result }">
				<font color="red" size="2">
					Please check id or password again.<br>
				</font>
			</c:if>
		</div>
	</form>
</body>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</html>