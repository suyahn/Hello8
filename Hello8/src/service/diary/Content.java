package service.diary;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiaryDao;
import model.Diary;
import service.CommandProcess;

public class Content implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		String pageNum = request.getParameter("pageNum");

		DiaryDao dd = DiaryDao.getInstance();
		dd.dreadCountUpdate(dno);
		Diary diary = dd.select(dno);

		/* System.out.println("dno : " + diary.getDno()); */

		request.setAttribute("dno", dno);

		request.setAttribute("pageNum", pageNum);

		request.setAttribute("diary", diary);

		return "../diary/content";
	}
}
