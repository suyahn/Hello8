<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.DiaryDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int dno = Integer.parseInt(request.getParameter("dno"));
		DiaryDao dd = DiaryDao.getInstance();
		int result = dd.delete(dno);
		if (result > 0) {
	%>
	<script type="text/javascript">
		alert("Success");
		location.href = "list.do";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("Fail");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>