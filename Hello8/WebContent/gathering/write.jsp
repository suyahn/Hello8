<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("Success");
			location.href = "list.do";
		</script>

	</c:if>

	<c:if test="${result <= 0 }">
		<script type="text/javascript">
			alret("Fail");
			history.go(-1);
		</script>

	</c:if>
</body>
</html>