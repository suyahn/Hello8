<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ empty list }">
	<jsp:forward page="userlist.do"></jsp:forward>	
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	#accordion {
		margin-top: 10px;
		margin-left: 145px;
	}
	h1 {
		font-size: 45px;
	}
</style>
</head>
<body>
	<h1 align="center">FAQ</h1>
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="width:80%;">
		<c:forEach var="list" items="${list}"><!--  foreach를 쓸 때 목록을 불러올 때는 items를 써야 함 -->
	  <div class="panel panel-default">
	    <div class="panel-heading" role="tab" id="h${list.fno}">
	      <h4 class="panel-title">
	        <a role="button" data-toggle="collapse"  data-parent="#accordion" aria-expanded="false" aria-controls="c${list.fno}" href="#c${ list.fno }">
	          <font style="font-size:21px;">${list.fquestion}</font>
	        </a>
	      </h4>
	    </div>
	    <div id="c${list.fno}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="h${list.fno}">
	      <div class="panel-body">
	        ${list.fanswer}
	      </div>
	    </div>
	  </div>
	  </c:forEach>
	</div>
</body>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</html>