<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<fieldset style="width: 500px">
			<legend align="left">Language</legend>

			<a href="list.do">All</a>

			<c:forEach var="lang" items="${list_lang }">

				<a href="lang_list.do?lang_no=${lang.lang_no }">${lang.lang_name }</a>

			</c:forEach>
		</fieldset>

		<%-- <fieldset>
			<legend>Language</legend>

			<label>All</label> <input type="checkbox" name="lang" value="0">

			<c:forEach var="lang" items="${list_lang }">
				<label>${lang.lang_name }</label>
				<input type="checkbox" name="lang" value="${lang.lang_no }">
			</c:forEach>

			<p>
				<input type="button" value="search" onclick="list.do">
			</p>
		</fieldset> --%>

	</form>

	<h1 align="center">${lang_name }에 대한 검색 결과</h1>

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

						<td><a
							href="content.do?gno=${gathering.gno }&pageNum=${pageNum}">
								${gathering.gsubject } </a></td>
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
			<th colspan="7"><input type="button"
				onclick="location.href='writeForm.jsp'" value="write"
				style="float: left">

				<div align="center">
					<c:if test="${startParge > PAGEPERBLOCK }">
						<c:if test="${endPage == totalPage }">
							<a href="lang_list.do?pageNum=${(num * PAGEPERBLOCK) -10 }&lang_no=${lang_no }">
								<< prev </a>
						</c:if>

						<c:if test="${endPage != totalPage }">
							<a href="lang_list.do?pageNum=${endPage - PAGEPERBLOCK }&lang_no=${lang_no }">
								<< prev </a>
						</c:if>
					</c:if>

					<c:forEach var="i" begin="${startPage }" end="${endPage }">

						<a href="lang_list.do?pageNum=${i }&lang_no=${lang_no }">[${i }] </a>

					</c:forEach>

					<c:if test="${endPage < totalPage }">

						<a href="lang_list.do?pageNum=${startPage + PAGEPERBLOCK}&lang_no=${lang_no }"> next >>
						</a>

					</c:if>
				</div></th>
		</tr>
	</table>


</body>
</html>