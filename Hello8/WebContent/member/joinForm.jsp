<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:if test="${ empty languageList }">
	<jsp:forward page="joinForm.do"></jsp:forward>
</c:if>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#idChk').click(function() {
			if(!frm.id.value) {
				alert("Please write ID.");
				frm.id.focus();
				return false;
			}
			$.ajax({
				type : "POST",
				url : "check.jsp",
				data : {
					"id" : $('#id').val(),
					"flag" : 'id'
				},
				success : function(data) {
					if($.trim(data) == "YES") {
						$('#idMsg').html('<font color="#d9534f">It is already existed.</font>');
						$("#idHidden").val('N');
					} else {
						$('#idMsg').html('<font color="#5cb85c">Available.</font>');
						$("#idHidden").val('Y');
					}
				}
			});
		});
		$('#nicknameChk').click(function() {
			if(!frm.nickname.value) {
				alert("Please write Nickname.");
				frm.nickname.focus();
				return false;
			}
			$.ajax({
				type : "POST",
				url : "check.jsp",
				data : {
					"nickname" : $('#nickname').val(),
					"flag" : 'nickname'
				},
				success : function(data) {
					if($.trim(data) == "YES") {
						$('#nicknameMsg').html('<font color="#d9534f">It is already existed.</font>');
						$("#nicknameHidden").val('N');
					} else {
						$('#nicknameMsg').html('<font color="#5cb85c">Available.</font>');
						$("#nicknameHidden").val('Y');
					}
				}
			});
		});
		$('#emailChk').click(function() {
			if(!frm.email.value) {
				alert("Please write Email.");
				frm.email.focus();
				return false;
			}
			$.ajax({
				type : "POST",
				url : "check.jsp",
				data : {
					"email" : $('#email').val(),
					"flag" : 'email'
				},
				success : function(data) {
					if($.trim(data) == "YES") {
						$('#emailMsg').html('<font color="#d9534f">It is already existed.</font>');
						$("#emailHidden").val('N');
					} else {
						$('#emailMsg').html('<font color="#5cb85c">Available.</font>');
						$("#emailHidden").val('Y');
					}
				}
			});
		});
	});
	
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
		
		if($("#idHidden").val() == 'N') {
			alert("Please check ID duplication");
			$("#idChk").focus();
			return false;
		}
		
		if($("#nicknameHidden").val() == 'N') {
			alert("Please check Nickname duplication");
			$("#nicknameChk").focus();
			return false;
		}
		
		if($("#emailHidden").val() == 'N') {
			alert("Please check Email duplication");
			$("#emailChk").focus();
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
		<h2>Sign up</h2>
		<form action="join.do" method="post" name="frm" onsubmit="return chk()">
			<table>
				<tr><td>
					<div class="form-group">
						<label for="id">ID</label>
						<input type="text" class="form-control" id="id" placeholder="ID" required="required" name="id" maxlength="10">
						<!-- <button type="button" class="btn btn-default" onclick="return idChk()">ID Check</button> -->
						<button type="button" class="btn btn-default" id="idChk">ID Check</button>
						<span id="idMsg"></span>
						<input type="hidden" value="N" id="idHidden">
					</div>
				</td></tr>
				<tr><td>
					<div class="form-group">
						<label for="password">Password</label>
						<input type="password" class="form-control" id="password" placeholder="Password" required="required" name="password" maxlength="10">
					</div>
				</td></tr>
				<tr><td>
					<div class="form-group">
						<label for="password2">Password Check</label>
						<input type="password" class="form-control" id="password2" placeholder="Password Check" required="required" name="password2" maxlength="10">
					</div>
				</td></tr>
				<tr><td>
					<div class="form-group">
						<label for="nickname">Nickname</label>
						<input type="text" class="form-control" id="nickname" placeholder="Nickname" required="required" name="nickname" maxlength="10">
						<!-- <button type="button" class="btn btn-default" onclick="return nicknameChk()">Nickname Check</button> -->
						<button type="button" class="btn btn-default" id="nicknameChk">Nickname Check</button>
						<span id="nicknameMsg"></span>
						<input type="hidden" value="N" id="nicknameHidden">
					</div>
				</td></tr>
				<tr><td>
					<div class="form-group">
						<label for="email">Email</label>
						<input type="email" class="form-control" id="email" placeholder="Email" required="required" name="email" maxlength="20">
						<!-- <button type="button" class="btn btn-default" onclick="return emailChk()">Email Check</button> -->
						<button type="button" class="btn btn-default" id="emailChk">Email Check</button>
						<span id="emailMsg"></span>
						<input type="hidden" value="N" id="emailHidden">
					</div>
				</td></tr>
				<tr><td>
					<div class="form-group">
						<label>Native Language</label>
						<select class="form-control" name="native_lang" required="required" onchange="languageChk()">
							<c:forEach var="lang" items="${ languageList }">
								<option value="${ lang.lang_no }">${ lang.lang_name }</option>
							</c:forEach>
						</select>
					</div>
				</td></tr>
				<tr><td>
					<div class="form-group">
						<label>Interesting Language</label><br>
						<c:set var="cnt" value="1"/>
						<c:forEach var="lang" items="${ languageList }">
							<c:if test="${ cnt > 4 }"><c:set var="cnt" value="1"/><br></c:if>
							<label class="checkbox-inline">
								<input type="checkbox" value="${ lang.lang_no }" name="inter_lang">${ lang.lang_name }
							</label>
							<c:set var="cnt" value="${ cnt + 1 }"/>
						</c:forEach>
						</div>
				</td></tr>
				<tr><td align="center">
					<button type="submit" class="btn btn-info">Sign up</button>
				</td></tr>
			</table>
		</form>
	</div>
</body>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</html>