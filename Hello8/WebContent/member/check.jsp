<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*"%>
<%
	String flag = request.getParameter("flag");
	MemberDao md = MemberDao.getInstance();
	int result = 0;
	String str = "";
	
	if(flag.equals("id")) {
		String id = request.getParameter("id");
		result = md.checkId(id); //1이면 중복 존재
	} else if(flag.equals("nickname")) {
		String nickname = request.getParameter("nickname");
		result = md.checkNickname(nickname);
	} else if(flag.equals("email")) {
		String email = request.getParameter("email");
		result = md.checkEmail(email);
	}
	
	if(result > 0) {
		str = "YES";
		out.print(str);
	} else {
		str = "NO";
		out.print(str);
	}
%>