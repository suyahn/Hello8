package service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LanguageDao;
import dao.MemberDao;
import model.Language;
import service.CommandProcess;

public class JoinForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		LanguageDao ld = LanguageDao.getInstance();
		List<Language> list = ld.languageList();
		request.setAttribute("languageList", list);
		
		return "../member/joinForm";
	}

}
