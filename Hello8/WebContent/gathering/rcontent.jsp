<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
	<!-- 게시글 출력 -->
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

			<tr>
				<td colspan="2"><input type="button" value="list"
					onclick="location.href='list.do?pageNum=${pageNum}'"
					style="float: left"> <!--<input type="button" value="modify"
					onclick="location.href='updateForm.do?pageNum=${pageNum}&gno=${gathering.gno }'"
					style="float: right"> <input type="button" value="delete"
					onclick="DelChk()" style="float: right">--></td>
			</tr>


			<%-- <c:if test="${result == 1 }">
				<tr>
					<td colspan="2"><input type="button" value="list"
						onclick="location.href='list.do?pageNum=${pageNum}'"
						style="float: left"> <input type="button" value="modify"
						onclick="location.href='updateForm.do?pageNum=${pageNum}&gno=${gathering.gno }'"
						style="float: right"> <input type="button" value="delete"
						onclick="location.href='deleteForm.do?gno=${gathering.gno }'"
						style="float: right"></td>
				</tr>
			</c:if>

			<c:if test="${result == 0 }">
				<tr>
					<td colspan="2"><input type="button" value="list"
						onclick="location.href='list.do?pageNum=${pageNum}'"
						style="float: left"></td>
				</tr>
			</c:if> --%>

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

	<!-- 코멘트 출력 -->
	<div id="comment" align="center">
		<table>
			<!-- 로그인 상태일 때만 댓글을 달 수 있다. -->
			<%-- 	<c:if test="${session.setgetAtteribute('id') != null}"> --%>

			<tr>
				<!-- 댓글 입력창 -->
					<input type="hidden" value="hello" name="sessionId"> <input
						type="hidden" name="gno" value="${gathering.gno }">
					<td>
						<div>
							${nickname }
						</div>
					</td>

					<td>
						<div>
							<textarea name="grcontent" rows="4" cols="70" disabled="disabled"> </textarea>
						</div>
					</td>

					<td> 
						<div>
							<input type="submit" value="confirm" disabled="disabled">
						</div>
					</td>

				</form>

			</tr>

			<%-- </c:if> --%>


			<c:if test="${not empty list}">
				<c:forEach var="gathering_reply" items="${list }">

					<tr>
						<td colspan="2">${gathering_reply.nickname }(${gathering_reply.grdate })</td>
					</tr>

					<!-- 수정할 때 -->
					<form name="writeForm_reply" action="rupdate.do">
						<input type="hidden" name="gno" value="${gathering.gno }">
						<input type="hidden" name="grno" value="${thegrno }">
						<c:if test="${thegrno == gathering_reply.grno }">
							<tr>
								<td colspan="2"><textarea name="grcontent" rows="4"
										cols="70" maxlength="166">${gathering_reply.grcontent }</textarea>
									<div>
										<input type="submit" value="confirm"> <input
											type="button" value="cancel" onclick="history.go(-1)">
									</div></td>
							</tr>
						</c:if>
					</form>
					
					<c:if test="${thegrno != gathering_reply.grno }">
						<tr>
							<td colspan="2"><pre>${gathering_reply.grcontent }</pre></td>
						</tr>
					</c:if>
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