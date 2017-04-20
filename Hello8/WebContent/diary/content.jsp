<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type="hidden" name="dno" value="${diary.dno }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table align="center">
		<caption>
			<h2>Diary</h2>
		</caption>
		<tr>
			<th align="left" width="70px">Subject</th>
			<td colspan="3">${diary.dsubject }</td>
		</tr>

		<tr>
			<th align="left" width="70px">Writer</th>
			<td align="left">${diary.nickname }</td>

			<th align="right">Language</th>
			<td align="left">${diary.lang_name }</td>
		</tr>

		<tr>
			<th align="left" width="70px">Views</th>
			<td>${diary.dreadcount }</td>
			<th align="right">Date :</th>
			<td>${diary.ddate }</td>
		</tr>

		<tr>
			<td colspan="4" width="400px"><pre>${diary.dcontent }</pre></td>
		</tr>

		<tr>
			<td colspan="4"><input type="button" value="list"
				onclick="location.href='list.do?pageNum=${pageNum}'"
				style="float: left"> <input type="button" value="modify"
				onclick="location.href='updateForm.do?dno=${dno}&pageNum=${pageNum}'"
				style="float: right"> <input type="button" value="delete"
				onclick="location.href='delete.do?dno=${dno}'" style="float: right">
			</td>
		</tr>
	</table>

</body>
</html>