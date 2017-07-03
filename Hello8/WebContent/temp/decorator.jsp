<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><decorator:title default="Welcome Hello8"/></title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${ path }/temp/common13.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('ul.nav li.dropdown').hover(function() {
			$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
		}, function() {
			$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
		});
	});
</script>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<decorator:head/>
			<nav class="navbar navbar-default">
			  <div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="${ path }/index.jsp"><img alt="logo" src="${ path }/images/logo.png" width="38"></a>
			    </div>
			
			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			        <li class=""><a href="${ path }/diary/index.jsp">Diary<!-- <span class="sr-only">(current)</span> --></a></li>
			        <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gathering<span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="${ path }/gathering/lala.jsp">Gathering</a></li>
			           	<li><a href="${ path }/gatheringCalendar/index.jsp">Calendar</a></li>
			          </ul>
			        </li>
			       <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Customer Center<span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="${ path }/notice/index.jsp">Notice</a></li>
			            <c:if test="${ id ne 'master' }">
			            	<li><a href="${ path }/faq/userIndex.jsp">FAQ</a></li>
			            </c:if>
			            <c:if test="${ id eq 'master' }">
			            	<li><a href="${ path }/faq/masterIndex.jsp">FAQ</a></li>
			            </c:if>
			          </ul>
			        </li>
			      </ul>
			      <ul class="nav navbar-nav navbar-right">
			      	<c:if test="${ empty id }">
			      		<li><a><button type="button" class="btn btn-info" onclick="location.href='${ path }/member/loginForm.jsp'">Login</button></a></li>
			      	</c:if>
			      	<c:if test="${ not empty id }">
						<li>
						<%
							String id = (String) session.getAttribute("id");
							MemberDao md = MemberDao.getInstance();
							String nickname = md.getNickName(id);
							String grade = md.getGrade(id);
							int score = md.getScore(id);
						%>
			      			<a>Welcome <font color="#17B8F0"><%= nickname %></font> !! (<%= grade %> / <%= score %>)</a>
			      		</li>
			      			<c:if test="${ id eq 'master' }">
			      				<li class="dropdown">
			          				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin Page<span class="caret"></span></a>
			          				<ul class="dropdown-menu">
			            				<li><a href="${ path }/master/indexList.jsp">Manage</a></li>
			            				<li><a href="${ path }/master/indexStatistics.jsp">Statistics</a></li>
			            				<li><a href="${ path }/member/myPage.do">My Page</a></li>
			          				</ul>
			        			</li>
			      			</c:if>
			      			<c:if test="${ id ne 'master' }">
			      				<li><a><button type="button" class="btn btn-link" onclick="location.href='${ path }/member/myPage.do'">My Page</button></a></li>
			      			</c:if>
			      		<li>
							<a><button type="button" class="btn btn-info" onclick="location.href='${ path }/member/logout.do'">Log out</button></a>
			      		</li>
			      	</c:if>
			      </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
		</div>
		<div id="content">
			<decorator:body/>
		</div>
		
		<div id="footer" align="right">
			ⓒ2017 Hello8
		</div>
	</div>
</body>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</html>