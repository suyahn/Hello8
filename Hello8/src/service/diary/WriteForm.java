package service.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiaryDao;
import dao.MemberDao;
import model.Language;
import model.Range;
import service.CommandProcess;

public class WriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		/*	int dno = Integer.parseInt(request.getParameter("dno"));
		DiaryDao dd = DiaryDao.getInstance();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String chkId = dd.checkId(dno);
		String nickname = dd.checkNickname(id);

		List<Language> everyLang = dd.everyLang();
		List<Range> everyRange = dd.everyRange();
		request.setAttribute("everyLang", everyLang);
		request.setAttribute("everyRange", everyRange);
		request.setAttribute("id", id);
		request.setAttribute("nickname", nickname);*/
		
		/*System.out.println("id:"+id);
		System.out.println("nickname:"+nickname);*/
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		MemberDao md = MemberDao.getInstance();
		String nickname = md.getNickName(id);
		
		DiaryDao dd = DiaryDao.getInstance();
		List<Language> everyLang = dd.everyLang();
		List<Range> everyRange = dd.everyRange();
		
		request.setAttribute("nickname", nickname);
		request.setAttribute("everyLang", everyLang);
		request.setAttribute("everyRange", everyRange);
		

		return "../diary/writeForm";
	}

}
