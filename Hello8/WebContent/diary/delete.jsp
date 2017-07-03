<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.DiaryDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<c:if test="${result >0 }">
		<script type="text/javascript">
			alert("Success");
			location.href = "list.do";
		</script>
	</c:if>
	
	<c:if test="${result<=0 }">
		<script type="text/javascript">
			alert("fail");
			location.href = "content.do?num=${num}";
		</script>
	</c:if>
</body>
</html>