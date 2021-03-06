<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../font/ckeditor_4.6.2_basic/ckeditor/ckeditor.js"></script>
</head>
<body>
	<form action="update.do" method="post" name="frm">
		<input type="hidden" name="fno" value="${fno}"> <input
			type="hidden" name="pageNum" value="${pageNum}">
		<div align="center">
			<h1>Update</h1>
			<table>
				<tr>
					<th>Subject</th>
					<td>
						<textarea rows="1" cols="50" name="fquestion" required="required" maxlength="33">${faq.fquestion}</textarea>
					</td>
				</tr>
				<tr>
					<th>Content</th>
					<td>
						<pre>
							<textarea rows="30" cols="50" name="fanswer" required="required" id="editor1"  maxlength="166">
								${faq.fanswer}
	    					</textarea>
	    					<script>
								CKEDITOR.replace('editor1', {
									toolbar : 'Basic',
									width : '100%',
									height : '200'
								});
							</script>
						</pre>
					</td>
				</tr>
				<tr>
					<th colspan="2" style="text-align:center;"><input type="submit" value="Confirm"></th>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>