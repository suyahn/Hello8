package service.diary;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiaryDao;
import model.Diary;
import service.CommandProcess;

public class Update implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		DiaryDao dd = DiaryDao.getInstance();
		int dno = dd.insertNo();
		String dsubject = request.getParameter("dsubject");
		String id = "hello";
		String dcontent = request.getParameter("dcontent");
		int rno = Integer.parseInt(request.getParameter("rno"));

		Diary diary = new Diary();
		diary.setDno(dno);
		diary.setDsubject(dsubject);
		diary.setId(id);
		diary.setDcontent(dcontent);
		diary.setRno(rno);

		int result = dd.update(diary);
		request.setAttribute("result", result);

		return "../diary/update";
	}

}
