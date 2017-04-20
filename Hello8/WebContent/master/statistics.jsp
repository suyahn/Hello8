<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	caption {text-align: center; font-size: 25px; color: black;}
	table {width: 65% !important;}
</style>
</head>
<body>
<div align="center">
 <table class="table table-hover">
 	<caption>Diary Statistics</caption>
 	<tr>
 		<th>Language</th>
 		<th>Sum</th>
 	</tr>
 	<c:forEach var="st" items="${list}"> <!-- set attribute로 넘어온 list가 items에 있는 list -->
 		<tr>
 			<td>${st.lang_name}</td>
 			<td>${st.count}</td>
 		</tr>
 	</c:forEach>
 </table></div>
</body>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</html>
<!-- var=list안에있는 statistics인데 이름이 st로 붙임 -->
<!-- for each는 리스트(EX)영어 2/ 중국어 5/ 한국어 1/ 독일어 2 )에 있는 st를 하나씩 계속 전달전달전달(EX)영어 2) -->