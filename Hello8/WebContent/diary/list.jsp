<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {

		for (var i = 0; i < 9; i++) {

			if (langList.lang_no[i].selected) {
				frm.movie[i].value;
				document.write("나와");
				return true;
			}
		}
		

	}
</script>

</head>
<body>
	<c:set value="${number }" var="num" />
	<table align="center">
		<caption>
			<h2>Keeping a diary</h2>
		</caption>

		<form action="langList.do" method="post" name="langList">

			<tr>
				<th align="right" colspan="5">Language</th>
				<td><select name=lang_no size="1" required="required">
						<option value="0">All</option>
						<c:forEach var="language" items="${everyLang }">
							<option value="${language.lang_no }">${language.lang_name }</option>
						</c:forEach>
				</select><input type="submit" value="confirm" onclick="return chk();"></td>
			</tr>
		</form>

		<tr>
			<th align="center">No</th>
			<th width="100px" align="center">Subject</th>
			<th width="60px" align="center">Writer</th>
			<th width="60px" align="center">Language</th>
			<th align="center" align="center">Date</th>
			<th align="center">Views</th>
		</tr>
		<c:if test="${not empty list }">
			<c:forEach var="diary" items="${list }">
				<tr>
					<c:if test="${diary.ddel != 'y' }">
						<td align="center">${num}</td>
						<td align="center"><a
							href="content.do?dno=${diary.dno }&pageNum=${pageNum}">
								${diary.dsubject} </a></td>
						<td align="center">${diary.nickname}</td>
						<td align="center">${diary.lang_name}</td>
						<td align="center">${diary.ddate}</td>
						<td align="center">${diary.dreadcount}</td>

						<c:set value="${num-1 }" var="num" />
					</c:if>
				</tr>
			</c:forEach>
		</c:if>

		<c:if test="${empty list }">
			<tr>
				<th height="70" colspan="7">There is no registered writing.</th>
			</tr>
		</c:if>

		<tr>

			<th height="40" colspan="7"><input type="button"
				onclick="location.href='writeForm.do'" value="write"
				style="float: left">

				<div align="center">
					<c:if test="${startPage > PAGEPERBLOCK }">
						<a href="list.do?pageNum=${endPage - PAGEPERBLOCK}"> << prev </a>
					</c:if>

					<c:forEach var="i" begin="${startPage }" end="${endPage }">

						<a href="list.do?pageNum=${i }">[${i }] </a>

					</c:forEach>

					<c:if test="${endPage < totalPage }">

						<a href="list.do?pageNum=${startPage + PAGEPERBLOCK}"> next >>
						</a>

					</c:if>
				</div></th>
		</tr>

	</table>

</body>
</html>