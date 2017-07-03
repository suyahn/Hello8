<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="common.css">
</head><body>
	<div align="center">
		<table>
			<caption>NOTICE</caption>
			<tr>
				<th width="100">Subject</th>
				<td>${notice.nsubject}</td>
			</tr>
			<tr>
				<th>Count</th>
				<td>${notice.nreadcount}</td>
			</tr>
			<tr>
				<th>Date</th>
				<td>${notice.ndate}</td>
			</tr>
			<tr>
				<th>Content</th>
				<td><pre>${notice.ncontent}</pre></td>
			</tr>
			<tr>
				<td colspan="2">
					<c:set var="id" value='<%=session.getAttribute("id")%>'></c:set>
					<c:if test="${ id eq 'master'}">
						<button onclick='location.href="updateForm.do?nno=${nno}&pageNum=${pageNum}"'>modify</button>
						<button onclick='location.href="delete.do?nno=${notice.nno}"'>delete</button>
					</c:if>
					<button onclick='location.href="listAction.do?pageNum=${pageNum}"'>notice list</button>				
				</td>
			</tr>
		</table>
	</div>
</body>
</html>