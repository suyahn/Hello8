<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<form action="update.do" method="post">
		<input type="hidden" name="dno" value="${diary.dno }"> <input
			type="hidden" name="pageNum" value="${pageNum }"> 
		<table align="center">
			<caption>
				<h2>Revising a diary</h2>
			</caption>
			<tr>
				<th align="center">Subject</th>
				<td colspan="3"><input type="text" name="dsubject"
					required="required" size="35" value="${diary.dsubject }"></td>
			</tr>

			<tr>
				<th align="center">Writer</th>
				<td align="left" width="50px">${diary.nickname }</td>

				<th align="right">Language</th>
				<td align="left" colspan="2">${diary.lang_name }</td>
			</tr>
			<tr>
				<td colspan="4"><pre>
							<textarea rows="10" cols="60" name="dcontent" required="required">${diary.dcontent }</textarea>
						</pre></td>

			</tr>

			<tr>
				<th align="center">Privacy bounds</th>
				<td><select name="rno" size="1" required="required">
						<c:forEach var="range" items="${everyRange}">
							<c:if test="${range.rno == rno }">
								<option value="${range.rno }" selected="selected">${range.rname }</option>
							</c:if>
							<c:if test="${range.rno != rno }">
								<option value="${range.rno }">${range.rname }</option>
							</c:if>
						</c:forEach>
				</select>
				</td>
				<th colspan="2" align="right"><input type="submit"
					value="confirm"></th>
			</tr>

		</table>
	</form>
</body>
</html>