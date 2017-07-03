<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.Language, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script type="text/javascript">
	function chk() {
		if(frm.password.value != frm.password2.value) {
			alert("Please check password.");
			frm.password2.focus();
			frm.password2.value = "";
			return false;
		}
		
		var isChecked = false;
		for(var i = 0; i < frm.inter_lang.length; i++) {
			if(frm.inter_lang[i].checked) {
				isChecked = true;
				break;
			}
		}
		
		if(!isChecked) {
			alert("Choose your interesting language.\n\nYou can choose multiple.");
			return false;
		}
	}
	
	function languageChk() {
		for(var i = 0;i < frm.inter_lang.length; i++) {
			frm.inter_lang[i].disabled = false;
		}
		var lang_no = frm.native_lang.value;
		frm.inter_lang[lang_no - 1].disabled = true;
	}
</script>
</head>
<body>
	<div align="center">
		<h2>Modification</h2>
		<form action="update.do" method="post" name="frm" onsubmit="return chk()">
			<table>
				<tr><td>
					<div class="form-group">
						<label for="id">ID</label>
						<input type="text" class="form-control" value="${ member.id }" name="id" readonly="readonly">
					</div>
				</td></tr>
				<tr><td>
					<div class="form-group">
						<label for="password">Password</label>
						<input type="password" class="form-control" id="password" placeholder="Password" required="required" name="password"  maxlength="10">
					</div>
				</td></tr>
				<tr><td>
					<div class="form-group">
						<label for="password2">Password Check</label>
						<input type="password" class="form-control" id="password2" placeholder="Password Check" required="required" name="password2"  maxlength="10">
					</div>
				</td></tr>
				<tr><td>
					<div class="form-group">
						<label for="nickname">Nickname</label>
						<input type="text" class="form-control" id="nickname" placeholder="Nickname"  readonly="readonly" name="nickname" value="${ member.nickname }">
					</div>
				</td></tr>
				<tr><td>
					<div class="form-group">
						<label for="email">Email</label>
						<input type="email" class="form-control" id="email" placeholder="Email"  readonly="readonly" name="email" value="${ member.email }">
					</div>
				</td></tr>
				<tr><td>
					<div class="form-group">
						<label>Native Language</label>
						<select class="form-control" name="native_lang" required="required" onchange="languageChk()">
							<c:forEach var="lang" items="${ languageList }">
								<c:if test="${ lang.lang_name == native_lang }">
									<option value="${ lang.lang_no }" selected="selected">${ lang.lang_name }</option>
								</c:if>
								<c:if test="${ lang.lang_name != native_lang }">
									<option value="${ lang.lang_no }">${ lang.lang_name }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</td></tr>
				<tr><td>
					<div class="form-group">
						<label>Interesting Language</label><br>
						<%
							List<Language> languageList = (List<Language>)request.getAttribute("languageList");
							List<Language> inter_lang = (List<Language>)request.getAttribute("inter_lang");
							int index = 0;
							
							for(Language lang : languageList) {
								if(index < inter_lang.size() && inter_lang.get(index).getLang_no() == lang.getLang_no()) {
						%>
						<label class="checkbox-inline">
							<input type="checkbox" value="<%= lang.getLang_no() %>" name="inter_lang" checked="checked"><%= lang.getLang_name() %>
						</label>
						<%
									index++; 
								} else {
						%>
						<label class="checkbox-inline">
							<input type="checkbox" value="<%= lang.getLang_no() %>" name="inter_lang"><%= lang.getLang_name() %>
						</label>
						<%
								}
							}
						%>
					</div>
				</td></tr>
				<tr><td align="center">
					<button type="submit" class="btn btn-info">Modify</button>
				</td></tr>
			</table>
		</form>
	</div>
</body>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</html>