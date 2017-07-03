<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="">
</head>
<body>
	<form action="write.do" method="post">
		<table align="center">
			<tr>
				<th>Subject</th>
				<td><input type="text" name="gsubject" required="required"
					autofocus="autofocus" maxlength="33"></td>
			</tr>

			<tr>
				<th>Language</th>
				<td><select name="lang_no">
						<c:forEach var="list" items="${langlist }">
							<option value="${list.lang_no }">${list.lang_name }</option>
						</c:forEach>
				</select></td>
			</tr> 
			
			<tr>
				<th>Gathering Date</th>
				<td><input type="date" name="ggdate" required="required" ></td>
			</tr>

			<tr>
				<th>Content</th>
				<td><textarea rows="10" cols="70" name="gcontent"
						required="required" maxlength="166"></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="confirm"> <input
					type="button" value="cancel" onclick="history.back()"></th>
			</tr>
		</table>
	</form>
</body>
</html>