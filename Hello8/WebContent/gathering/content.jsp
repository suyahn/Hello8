<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="content.css">
</head>
<body>
	<form action="">
		<table align="center">

			<tr>
				<th colspan="2" align="center">${gathering.gsubject }</th>
			</tr>

			<tr>
				<td>writer : ${gathering.nickname }</td>
				<td align="right">Language : ${gathering.lang_name }</td>
			</tr>

			<tr>
				<th>views</th>
				<td>${gathering.greadcount }</td>
			</tr>

			<tr>
				<th>date</th>
				<td>${gathering.gdate }</td>
			</tr>

			<tr>
				<td colspan="2" class="c"><pre>${gathering.gcontent }</pre></td>
			</tr>

			<tr>
				<td colspan="2"><input type="button" value="list"
					onclick="location.href='list.do?pageNum=${pageNum}'"
					style="float: left"> <input type="button" value="modify"
					onclick="location.href='updateForm.do?pageNum=${pageNum}'"
					style="float: right"> <input type="button" value="delete"
					onclick="location.href='deleteForm.do?no=${no }'"
					style="float: right"></td>
			</tr>
		</table>
	</form>
</body>
</html>