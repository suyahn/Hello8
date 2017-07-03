<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 세션체크 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="content.css">
<script type="text/javascript">
	function Chk() {
		var chk = confirm("Do you really want to modify it?");
		if (chk) {
			frm.action = "update.do";
			frm.submit();
		}

	}
</script>
</head>
<body>
	<form onsubmit="return Chk()" name="frm">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="gno" value="${gathering.gno }">
		<table align="center">
			<tr>
				<th>Subject</th>
				<td><input type="text" name="gsubject"
					value="${gathering.gsubject }" required="required" maxlength="33"></td>
			</tr>

			<tr>
				<th>Writer</th>
				<td>${gathering.nickname }</td>
			</tr>

			<tr>
				<th>Language</th>
				<td>${gathering.lang_name }</td>
			</tr>
			
			<tr>
				<th>Gathering Date</th>
				<td><input type="date" name="ggdate" required="required"></td>
			</tr>


			<tr>
				<th>Content</th>
				<td align="left"><textarea rows="10" cols="70" name="gcontent"
						required="required" maxlength="166">${gathering.gcontent }</textarea></td>
			</tr>

			<tr>
				<th colspan="2"><input type="submit" value="confirm"> <input
					type="button" value="cancel" onclick="history.back()"></th>
			</tr>
		</table>
	</form>
</body>
</html>