<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ result == 0 }">
		<script type="text/javascript">
			alert("아이디 또는 비밀번호를 다시 확인하세요.\n등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${ result < 0 }">
		<script type="text/javascript">
			alert("아이디 또는 비밀번호를 다시 확인하세요.\n등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
			history.go(-1);
		</script>		
	</c:if>
</body>
</html>