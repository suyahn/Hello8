package service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LanguageDao;
import dao.MemberDao;
import model.Language;
import model.Member;
import service.CommandProcess;

public class PasswordConfirm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String password = request.getParameter("password");
		int mode = Integer.parseInt(request.getParameter("mode"));
		
		MemberDao md = MemberDao.getInstance();
		int result = md.loginChk(id, password); //성공 1, password 틀린 경우 0, id 없는 경우 -1
		
		if(result > 0) {
			if(mode == 1) {
				Member member = md.select(id);
				LanguageDao ld = LanguageDao.getInstance();
				List<Language> languageList = ld.languageList();
				/*Language native_lang = ld.getNative_lang(id);*/
				String lang = ld.selectLanguage(member.getLang_no());
				List<Language> inter_lang = ld.getInter_lang(id);

				request.setAttribute("member", member);
				request.setAttribute("languageList", languageList);
				request.setAttribute("native_lang", lang);
				request.setAttribute("inter_lang", inter_lang);
			}
			request.setAttribute("mode", mode);
		}
		request.setAttribute("result", result);
		return "../member/passwordConfirmResult";
	}

}
