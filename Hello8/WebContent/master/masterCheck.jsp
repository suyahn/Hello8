<%
	String path = request.getContextPath();
	String id = (String) session.getAttribute("id");
	if (id == null || id.equals("") || !id.equals("master") ) {
		response.sendRedirect(path + "/member/loginForm.jsp");
		return;
	}
%>