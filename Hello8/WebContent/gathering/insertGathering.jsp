<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dao.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="dao.GatheringDao"%>
<%@page import="model.Gathering"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Gathering gathering = new Gathering();
	GatheringDao gd = GatheringDao.getInstance();
	MemberDao md = MemberDao.getInstance();
	
	for(int i = 1; i <= 300; i++) {
		int gno = gd.insertNo();
		gathering.setGno(gno);
		gathering.setGsubject("gathering" + i);
		gathering.setId("member" + i);
		gathering.setGcontent("gathering" + i);
		
		Member member = md.select("member" + i);
		int lang_no = member.getLang_no();
		
		gathering.setLang_no(lang_no);
		int num = (int) (Math.random() * 31) + 1;
		String date = "2018-01-" + num;
		Date dt = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		java.sql.Date sqlDate = new java.sql.Date(dt.getTime());
		gathering.setGgdate(sqlDate);
		gd.insert(gathering);
	}
%>
입력완료