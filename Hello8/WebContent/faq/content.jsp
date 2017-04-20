<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="faqcommon.css">
</head><body>
<table><caption>FAQ</caption>
	<tr><th width="100">Question</th><td>${faq.fquestion}</td></tr>
	<tr><th>Answer</th><td>${faq.fanswer}</td></tr>
    
</table>
<a href="updateForm.do?fno=${fno}&pageNum=${pageNum}">modify</a> 
<a href="delete.do?fno=${faq.fno}">delete</a>
<a href="listAction.do?pageNum=${pageNum}">faq list</a> 

</body>
</html>