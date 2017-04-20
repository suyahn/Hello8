<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script type="text/javascript">
	function cl() {
		opener.frm.id.value = "${ id }";
		window.close();
	}
</script>
</head>
<body>
	<div align="center">
		<c:if test="${ result == 1 }">
			<h4>"${ id }" is already existed.</h4>
			<h4>Please write another ID.</h4>
			<form>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="ID" required="required" name="id" autofocus="autofocus">
					<button type="submit" class="btn btn-info">ID Check</button>
				</div>
			</form>
		</c:if>
		<c:if test="${ result == 0 }">
			<h3>Available ID.</h3>
			<button type="button" class="btn btn-default" onclick="cl()">Close</button>
		</c:if>
	</div>
</body>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</html>