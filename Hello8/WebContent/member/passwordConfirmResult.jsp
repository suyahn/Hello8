<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<c:if test="${ result > 0 }">
		<c:if test="${ mode == 1 }">
			<jsp:forward page="updateForm.jsp">
				<jsp:param value="${ member }" name="member"/>
				<jsp:param value="${ languageList }" name="languageList"/>
				<jsp:param value="${ native_lang }" name="native_lang"/>
				<jsp:param value="${ inter_lang }" name="inter_lang"/>
			</jsp:forward>
		</c:if>
		<c:if test="${ mode == 2 }">
			<script type="text/javascript">
				if (confirm("Are you sure??") == true){
			    	location.href="delete.do";
				}else{
					location.href = "myPage.do";
				}
			</script>
		</c:if>
	</c:if>
	<c:if test="${ result <= 0 }">
		<script type="text/javascript">
			alert("Wrong Password!");
			location.href = "myPage.do";
		</script>
	</c:if>
</body>
</html>