package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Inter_langDao;
import dao.LanguageDao;
import dao.MemberDao;
import model.Inter_lang;
import model.Member;
import service.CommandProcess;

public class Update implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		int native_lang = Integer.parseInt(request.getParameter("native_lang"));
		System.out.println("native_lang= "+native_lang);
		String[] inter_langs = request.getParameterValues("inter_lang");
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		member.setNickname(nickname);
		member.setEmail(email);
		member.setLang_no(native_lang);
		
		MemberDao md = MemberDao.getInstance();
		md.update(member);
		
		LanguageDao ild = LanguageDao.getInstance();
		int a= ild.delete(id);
		System.out.println("a= "+a);
		if (a > 0)
			for(String str : inter_langs) {
				int lang_no = Integer.parseInt(str);
				Inter_lang inter_langObj = new Inter_lang();
				inter_langObj.setId(id);
				inter_langObj.setLang_no(lang_no);
				
				int result = ild.insert(inter_langObj);
				System.out.println("result = " + result);
			}
		return "../member/updateResult";
	}

}
