<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</style>
<link rel="stylesheet" type="text/css" href="">
</head>
<body>
	<a href="lala.jsp"><h1 align="center">Gathering</h1></a>

	<form action="list.do">
		<div align="center" style="width: 910px">
			<div align="right">
				<select name="lang_no">
					<option value="0">All</option>

					<c:forEach var="lang" items="${list_lang }">
						<c:if test="${lang.lang_no == lang_no }">
							<option value="${lang.lang_no }" selected="selected">${lang.lang_name }</option>
						</c:if>

						<c:if test="${lang.lang_no != lang_no }">
							<option value="${lang.lang_no }">${lang.lang_name }</option>
						</c:if>
					</c:forEach>
				</select> <input type="submit" value="confirm">
			</div>
		</div>
	</form>

	<c:set value="${number }" var="num" />

	<table align="center">
		<tr>
			<th>no</th>
			<th>language</th>
			<th width="200px">subject</th>
			<th>writer</th>
			<th>date</th>
			<th>views</th>
		</tr>

		<c:if test="${not empty list }">
			<c:forEach var="gathering" items="${list }">

				<tr>
					<c:if test="${gathering.gdel != 'y' }">
						<td align="center">${num}</td>
						<!-- 여기 컬럼 확인 후 수정 -->
						<td>[${gathering.lang_name }]</td>

						<c:if test="${not empty lang_no }">
							<td><a
								href="content.do?gno=${gathering.gno }&pageNum=${pageNum}&lang_no=${lang_no}">
									${gathering.gsubject } </a></td>
						</c:if>

						<c:if test="${empty lang_no }">
							<td><a
								href="content.do?gno=${gathering.gno }&pageNum=${pageNum}">
									${gathering.gsubject } </a></td>
						</c:if>

						<td>${gathering.nickname }</td>
						<td>${gathering.ggdate }</td>
						<td align="center">${gathering.greadcount }</td>
				</tr>

				<c:set value="${num-1 }" var="num" />
		</c:if>
		</c:forEach>
		</c:if>

		<c:if test="${empty list}">

			<tr>
				<th colspan="7">There is no registered writing.</th>
			</tr>

		</c:if>

		<tr>
			<th colspan="7">
			
			<% 
				String id = (String) session.getAttribute("id");
				if(id != null) {
			%>
			<input type="button" onclick="location.href='writeForm.do'" 
				value="write" style="float: left">
			<%
				}
			%>

			<%-- 	<div align="center">
					<c:if test="${startParge > PAGEPERBLOCK }">
						<c:if test="${endPage == totalPage }">
							<a href="list.do?pageNum=${(num - 2) * PAGEPERBLOCK + 10}"> <<
								prev </a>
						</c:if>

						<c:if test="${endPage != totalPage }">
							<a href="list.do?pageNum=${endPage - PAGEPERBLOCK }"> << prev
							</a>
						</c:if>
					</c:if>

					<c:forEach var="i" begin="${startPage }" end="${endPage }">

						<a href="list.do?pageNum=${i }">[${i }] </a>

					</c:forEach>

					<c:if test="${endPage < totalPage }">

						<a href="list.do?pageNum=${startPage + PAGEPERBLOCK}"> next >>
						</a>

					</c:if>
				</div> --%>
				<div align="center">
					<c:if test="${startPage > PAGEPERBLOCK }">
						<c:if test="${ endPage == totalPage }">
							<a
								href="list.do?pageNum=${ (numBlock - 2) * PAGEPERBLOCK + 10 }"><< prev</a>
						</c:if>
						<c:if test="${ endPage != totalPage }">
							<a href="list.do?pageNum=${ endPage - PAGEPERBLOCK }"><< prev</a>
						</c:if>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="list.do?pageNum=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${endPage < totalPage }">
						<a href="list.do?pageNum=${startPage+PAGEPERBLOCK}">next >></a>
					</c:if>
				</div>
			</th>
		</tr>
	</table>


</body>
</html>