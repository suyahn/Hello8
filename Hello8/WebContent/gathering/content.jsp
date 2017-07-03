<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="content.css">
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
	<a href="lala.jsp"><h1 align="center">Gathering</h1></a>
	
	<form onsubmit="return DelChk()" name="frm">

		<input type="hidden" name="pageNum" value="${pageNum }"> <input
			type="hidden" name="gno" value="${gathering.gno }">
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
				<th>gatehring date</th>
				<td>${gathering.ggdate }</td>
			</tr>

			<tr>
				<th>written date</th>
				<td>${gathering.gdate }</td>
			</tr>

			<tr>
				<td colspan="2" class="c"><pre>${gathering.gcontent }</pre></td>
			</tr>

			<%-- <tr>
				<td colspan="2"><input type="button" value="list"
					onclick="location.href='list.do?pageNum=${pageNum}&lang_no=${lang_no }'"
					style="float: left"> <input type="button" value="modify"
					onclick="location.href='updateForm.do?pageNum=${pageNum}&gno=${gathering.gno }'"
					style="float: right"> <input type="button" value="delete"
					onclick="DelChk()" style="float: right"></td>
			</tr> --%>


			<c:if test="${result == 1 }">
				<tr>
					<td colspan="2"><input type="button" value="list"
						onclick="location.href='list.do?pageNum=${pageNum}'"
						style="float: left"> <input type="button" value="modify"
						onclick="location.href='updateForm.do?pageNum=${pageNum}&gno=${gathering.gno }'"
						style="float: right"> <input type="button" value="delete"
					onclick="DelChk()" style="float: right"></td>
				</tr>
			</c:if>

			<c:if test="${result == 0 }">
				<tr>
					<td colspan="2"><input type="button" value="list"
						onclick="location.href='list.do?pageNum=${pageNum}'"
						style="float: left"></td>
				</tr>
			</c:if>

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
					<input type="hidden" value="${id }" name="sessionId"> <input
						type="hidden" name="gno" value="${gathering.gno }">
					<td>
						<div>
							${nickname }
						</div>
					</td>

					<td>
						<div>
							<textarea name="grcontent" rows="4" cols="70"> </textarea>
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
				<c:forEach var="gathering_reply" items="${list }">

					<tr>
						<td>${gathering_reply.nickname }(${gathering_reply.grdate })</td>
						<td align="right">
							
							<c:if test="${id == gathering_reply.id }">
							
							<%-- <input type="button" value="reply"
							onclick="location.href='rwriteForm.do?pageNum=${pageNum}&gno=${gathering.gno }&grno=${gathering_reply.grno }'"> --%>
							
							<input type="button" value="modify"
							onclick="location.href='rcontent.do?pageNum=${pageNum}&gno=${gathering.gno }&grno=${gathering_reply.grno }&nickname=${nickname }'">
							<input type="button" value="delete"
							onclick="location.href='rdelete.do?pageNum=${pageNum}&gno=${gathering.gno }&grno=${gathering_reply.grno }'">
							
							</c:if>
						</td>
					</tr>

					<tr>
						<td colspan="2"><pre>${gathering_reply.grcontent }</pre></td>
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