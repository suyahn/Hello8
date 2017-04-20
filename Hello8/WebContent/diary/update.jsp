<%@page import="dao.DiaryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.Diary"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="diary" class="model.Diary"></jsp:useBean>
	<jsp:setProperty property="*" name="diary" />
	<%
		String pageNum = request.getParameter("pageNum");
		DiaryDao dd = DiaryDao.getInstance();
		int result = dd.update(diary);
		if (result > 0) {
	%>

	<script type="text/javascript">
		alert("Success");
		location.href = "list.do?pageNum=<%=pageNum%>";
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