package service.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiaryDao;
import model.Diary;
import model.Range;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * HttpSession session = request.getSession();
		 * session.setAttribute("id", "hello");
		 */

		int dno = Integer.parseInt(request.getParameter("dno"));

		String pageNum = request.getParameter("pageNum");

		DiaryDao dd = DiaryDao.getInstance();
		Diary diary = dd.select(dno);
		List<Range> everyRange = dd.everyRange();
		request.setAttribute("dno", dno);
		request.setAttribute("diary", diary);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("everyRange", everyRange);
		return "../diary/updateForm";
	}

}
