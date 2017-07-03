<%
	String path = request.getContextPath();
	String id = (String) session.getAttribute("id");
	if (id == null || id.equals("")) {
		response.sendRedirect( path + "/member/loginForm.jsp");
		return;
	}
%>