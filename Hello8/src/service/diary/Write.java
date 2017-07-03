package service.diary;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiaryDao;
import dao.MemberDao;
import model.Diary;
import service.CommandProcess;

public class Write implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		String dsubject = request.getParameter("dsubject");
		String dcontent = request.getParameter("dcontent");
		int rno = Integer.parseInt(request.getParameter("rno"));

		int lang_no = Integer.parseInt(request.getParameter("lang_no"));

		DiaryDao dd = DiaryDao.getInstance();
		int dno = dd.insertNo();

		Diary diary = new Diary();
		diary.setDno(dno);
		diary.setDsubject(dsubject);
		diary.setId(id);
		diary.setDcontent(dcontent);
		diary.setLang_no(lang_no);// 언어
		diary.setRno(rno);// 공개범위

		int result = dd.insert(diary);
		
		MemberDao md = MemberDao.getInstance();
		md.updateScore(id, 10);

		request.setAttribute("result", result);

		return "../diary/write";

	}

}
