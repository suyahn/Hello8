<%@page import="model.Inter_lang"%>
<%@page import="dao.Inter_langDao"%>
<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao md = MemberDao.getInstance();
	Inter_langDao ild = Inter_langDao.getInstance();
	Member member = new Member();
	Inter_lang il = new Inter_lang();
	
	for(int i = 1; i <= 300; i++) {
		member.setId("member" + i);
		member.setPassword("123");
		member.setNickname("member" + i);
		member.setEmail("member" + i + "@naver.com");
		int num = (int) (Math.random() * 8) + 1;
		member.setLang_no(num);
		md.insert(member);
		
		num = (int) (Math.random() * 8) + 1;
		il.setId(member.getId());
		il.setLang_no(num);
		ild.insert(il);
	}
%>
입력완료