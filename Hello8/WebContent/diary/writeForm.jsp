<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form action="write.do" method="post">
		<table align="center">
			<caption>
				<h2>Keeping a diary</h2>
			</caption>
			<tr>
				<th>Subject</th>
				<td colspan="3"><input type="text" name="dsubject"
					required="required" size="35" maxlength="33"></td>
			</tr>
			<tr>
				<th>Writer</th>
				<td>
					${nickname}
				</td>
				<th>Language</th>
				<td><select name=lang_no size="1" required="required">
						<c:forEach var="language" items="${everyLang }">
							<option value="${language.lang_no }">${language.lang_name }</option>
						</c:forEach>
				</select></td>

			</tr>
			<tr>
				<td colspan="4" width="400px">
						<textarea rows="10" cols="60" maxlength="166" name="dcontent" required="required"></textarea>
					</td>
			</tr>
			<tr>
				<th>Privacy bounds</th>
				<td><select name="rno" size="1" required="required">
						<c:forEach var="range" items="${everyRange }">
							<option value="${range.rno}">${range.rname }</option>
						</c:forEach>
				</select></td>

				<th colspan="2" align="right"><input type="submit"
					value="confirm" style="float: right"></th>
			</tr>
		</table>
	</form>
</body>
</html>