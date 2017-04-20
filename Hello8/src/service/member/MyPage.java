package service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiaryDao;
import dao.GatheringDao;
import dao.LanguageDao;
import dao.MemberDao;
import dao.NoticeDao;
import model.Language;
import model.Member;
import service.CommandProcess;

public class MyPage implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		System.out.println("lno : " + member.getLang_no());
		
		DiaryDao dd = DiaryDao.getInstance();
		int diarySum = dd.getTotalById(id);
		GatheringDao gd = GatheringDao.getInstance();
		int gatheringSum = gd.getTotalById(id);
		
		LanguageDao ld = LanguageDao.getInstance();
		String lang = ld.selectLanguage(member.getLang_no());
/*		Language native_lang = ld.getNative_lang(id); */
		List<Language> inter_lang = ld.getInter_lang(id);
		
		String grade = md.getGrade(id);
		
		request.setAttribute("member", member);
		request.setAttribute("diarySum", diarySum);
		request.setAttribute("gatheringSum", gatheringSum);
		request.setAttribute("native_lang", lang);
		request.setAttribute("inter_langs", inter_lang);
		request.setAttribute("grade", grade);
		
		return "../member/myPage";
	}

}
