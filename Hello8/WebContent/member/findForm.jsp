<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
   <div class="container" align="center">
     <ul id="myTab" class="nav nav-tabs" role="tablist">
       <li role="presentation" class="active"><a href="#id" id="id-tab" role="tab" data-toggle="tab" aria-controls="id" aria-expanded="true">Find ID</a></li>
       <li role="presentation"><a href="#password" id="password-tab" role="tab" data-toggle="tab" aria-controls="password" aria-expanded="false">Find Password</a></li>
     </ul>
     <div id="myTabContent" class="tab-content">
       <div role="tabpanel" class="tab-pane fade active in" id="id" aria-labelledby="id-tab">
       	<br><br>
        <form action="${ path }/member/findId.do" method="post">
			<table>
				<tr>
					<td>
						<input type="email" name="email" required="required" placeholder="Email" autofocus="autofocus" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<br>
						<button type="submit" class="btn btn-info">Confirm</button>
						<button type="button" class="btn btn-default" onclick="location.href='loginForm.jsp'">Login</button>
					</td>
				</tr>
			</table>
		</form>
       </div>
       <div role="tabpanel" class="tab-pane fade" id="password" aria-labelledby="password-tab">
      	<br><br>
         <form action="${ path }/member/findPassword.do" method="post">
			<table>
				<tr>
					<td>
						<input type="text" name="id" required="required" placeholder="ID" class="form-control">
					</td>
				</tr>
				<tr>
					<td>
						<br>
						<input type="email" name="email" required="required" placeholder="Email" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<br>
						<button type="submit" class="btn btn-info">Send</button>
						<button type="button" class="btn btn-default" onclick="location.href='loginForm.jsp'">Login</button>
					</td>
				</tr>
			</table>
		</form>
       </div>
     </div>
   </div>
</body>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</html>