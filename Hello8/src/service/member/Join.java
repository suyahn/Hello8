package service.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Inter_langDao;
import dao.MemberDao;
import model.Inter_lang;
import model.Member;
import service.CommandProcess;

public class Join implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		int native_lang = Integer.parseInt(request.getParameter("native_lang"));
		String[] inter_langs = request.getParameterValues("inter_lang");
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		member.setNickname(nickname);
		member.setEmail(email);
		member.setLang_no(native_lang);
		MemberDao md = MemberDao.getInstance();
		int result_member = md.insert(member);
		int result_inter_lang = inter_langs.length; //0이면 insert 성공
		
		for(String str : inter_langs) {
			int lang_no = Integer.parseInt(str);
			Inter_lang inter_langObj = new Inter_lang();
			inter_langObj.setId(id);
			inter_langObj.setLang_no(lang_no);
			
			Inter_langDao ild = Inter_langDao.getInstance();
			result_inter_lang -= ild.insert(inter_langObj);
		}
		
		request.setAttribute("result_member", result_member);
		request.setAttribute("result_inter_lang", result_inter_lang);
		
		return "../member/join";
	}

}
