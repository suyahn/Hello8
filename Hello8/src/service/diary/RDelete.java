package service.diary;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Diary_ReplyDao;
import service.CommandProcess;

public class RDelete implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	
		int dno = Integer.parseInt(request.getParameter("dno"));
		String pageNum = request.getParameter("pageNum");
		int drno = Integer.parseInt(request.getParameter("drno"));

		Diary_ReplyDao grd = Diary_ReplyDao.getInstance();
		grd.delete(drno);

		request.setAttribute("dno", dno);
		request.setAttribute("pageNum", pageNum);

		return "../diary/rwrite";
	}

}
