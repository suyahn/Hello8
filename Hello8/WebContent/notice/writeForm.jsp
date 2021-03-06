<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../font/ckeditor_4.6.2_basic/ckeditor/ckeditor.js"></script>
</head>
<body>
	<form action="write.do" method="post">
		<div align="center">
			<h1>Write</h1>
			<table>
				<tr>
					<th>Subject</th>
					<td>
						<textarea rows="1" cols="50" name="nsubject" required="required" maxlength="33"></textarea>
					</td>
				</tr>
				<tr>
					<th>Content</th>
					<td>
						<textarea cols="80" name="ncontent" rows="10" required="required" id="editor1" maxlength="166"></textarea>
						<script>
							CKEDITOR.replace('editor1', {
								toolbar : 'Basic',
								width : '100%',
								height : '200'
							});
						</script>
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