<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function DelChk() {
		var chk = confirm("Do you really want to delete it?");
		if (chk) {
			frm.action = "delete.do";
			frm.submit();
		}
	}
</script>

</head>
<body>
	<form onsubmit="return DelChk()" name="frm">
		<input type="hidden" name="dno" value="${diary.dno }"> <input
			type="hidden" name="pageNum" value="${pageNum }">
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
				<td colspan="4" width="400px"><div style="width:400px; border: 0.5px solid gray;">${diary.dcontent }</div></td>
			</tr>

			<tr>
				<c:if test="${id == diary.id }">
					<td colspan="4"><input type="button" value="list"
						onclick="location.href='list.do?pageNum=${pageNum}'"
						style="float: left"> <input type="button" value="modify"
						onclick="location.href='updateForm.do?dno=${dno}&pageNum=${pageNum}&rno=${diary.rno}'"
						style="float: right"> <input type="button" value="delete"
						onclick="DelChk()" style="float: right"></td>
				</c:if>
			</tr>
			<%-- <tr>
				<td colspan="2"><input type="button" value="list"
					onclick="location.href='list.do?pageNum=${pageNum}'"
					style="float: left"> 
					
					<c:if test="${session.getAttribute('id').equals('master')||session.getAttribute('id').equals(gathering.id)}">

						<input type="button" value="modify"
							onclick="location.href='updateForm.do?pageNum=${pageNum}&gno=${gathering.gno }'"
							style="float: right">
						<input type="button" value="delete"
							onclick="location.href='deleteForm.do?gno=${gathering.gno }'"
							style="float: right">
					</c:if></td>
			</tr> --%>
		</table>
	</form>

	<div id="comment" align="center">
		<table>

			<c:if test="${not empty id }">
				<tr>

					<form name="writeForm_reply" action="rwrite.do">
						<input type="hidden" value="${id }" name="id"> <input
							type="hidden" name="dno" value="${diary.dno }">
						<td>
						
							<div>${nickname }</div>
						</td>

						<td>
							<div>
								<textarea name="drcontent" rows="4" cols="70"></textarea>
							</div>
						</td>

						<td>
							<div>
								<input type="submit" value="confirm">
							</div>
						</td>

					</form>

				</tr>
			</c:if>

			<c:if test="${not empty list}">
				<c:forEach var="diary_reply" items="${list }">

					<tr>
						<td>${diary_reply.nickname }(${diary_reply.drdate })</td>
						<td align="right"><c:if test="${id == diary_reply.id }">
								<input type="button" value="modify"
									onclick="location.href='rcontent.do?pageNum=${pageNum}&dno=${diary.dno }&drno=${diary_reply.drno }'">
								<input type="button" value="delete"
									onclick="location.href='rdelete.do?pageNum=${pageNum}&dno=${diary.dno }&drno=${diary_reply.drno }'">
							</c:if></td>
					</tr>

					<tr>
						<td colspan="2"><pre>${diary_reply.drcontent }</pre></td>
					</tr>

				</c:forEach>
			</c:if>

			<c:if test="${empty list}">

				<tr>
					<th colspan="7">There is no registered comment.</th>
				</tr>

			</c:if>


		</table>
	</div>

</body>
</html>