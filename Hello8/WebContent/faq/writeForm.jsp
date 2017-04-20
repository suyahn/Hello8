<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html><html><head><title>A Simple Page with CKEditor</title><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../font/ckeditor_4.6.2_basic/ckeditor/ckeditor.js"></script>
</head>
<body>
<form action="write.do" method="post">
	
<table><caption>Write</caption>
	<tr><th>Subject</th><td><textarea rows="1" cols="50" name="fquestion" 
		required="required"></textarea></td></tr> 
    <tr><th>Content</th><td><textarea rows="30" cols="50" 
    	name="fanswer" id="editor1" required="required"></textarea>
    	<script>
    CKEDITOR.replace('editor1', {toolbar:'Basic',width:'100%',height:'200'});
    </script>
    	</td></tr>
    <tr><th colspan="2"><input type="submit" value="Confirm"></th></tr>
</table></form></body></html>