<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="masterCheck.jsp" %>
<c:if test="${ empty list }">
	<jsp:forward page="statistics.do"></jsp:forward>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="Chart.js"></script>
<style type="text/css">
	caption {text-align: center; font-size: 25px; color: black;}
	table {width: 65% !important;}
</style>
</head>
<body>
	<div class="col-md-6" style="display: inline-block">
		<div class="topleft" style="text-align: center; margin-left: 200px; float: left;">
			<h2 class="sectiontext">Diary Statistics</h2>
			<br>
			<canvas id="myChart" width="400" height="400"></canvas>
		</div>
	</div>
	<div class="col-md-6" style="display: inline-block">
		<table class="table table-hover">
			<caption>Diary Statistics</caption>
			<tr>
				<th>Language</th>
				<th>Sum</th>
			</tr>
			<c:forEach var="st" items="${list}">
				<!-- set attribute로 넘어온 list가 items에 있는 list -->
				<tr>
					<td>${st.lang_name}</td>
					<td>${st.count}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
<script type="text/javascript">
	var ctx = document.getElementById("myChart");
	var lang_name = new Array();
	var count = new Array();
	
	<c:forEach var="list" items="${ list }">
		lang_name.push("${list.lang_name}");
		count.push("${list.count}");
	</c:forEach>
		
	var data = {
		    labels: lang_name,
		    datasets: [
		        {
		            data: count,
		            backgroundColor: [
		                "#FFC3C2",
		                "#E89197",
		                "#A0CAFA",
		                "#376EA7",
		                "#FFCF00",
		                "#7BC18E",
		                "#DEBCE8",
		                "#ECDEBC"
		            ],
		            hoverBackgroundColor: [
		            	"#FFC3C2",
		                "#E89197",
		                "#A0CAFA",
		                "#376EA7",
		                "#FFCF00",
		                "#7BC18E",
		                "#DEBCE8",
		                "#ECDEBC"
		            ]
		        }]
		};
	var myDoughnutChart = new Chart(ctx, {
	    type: 'doughnut',
	    data: data,
	    options:  {
	        animation:{
	            animateScale:true
	        }
	    }
	});
</script>
</body>
</html>