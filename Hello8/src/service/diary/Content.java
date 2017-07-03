package service.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiaryDao;
import dao.Diary_ReplyDao;
import model.Diary;
import model.Diary_Reply;
import service.CommandProcess;

public class Content implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		String pageNum = request.getParameter("pageNum");

		DiaryDao dd = DiaryDao.getInstance();
		dd.dreadCountUpdate(dno);
		Diary diary = dd.select(dno);
		Diary_ReplyDao drd = Diary_ReplyDao.getInstance();
		List<Diary_Reply> list = drd.list(dno);

		if (list.size() > 0)
			request.setAttribute("list", list);
		request.setAttribute("dno", dno);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("diary", diary);
		
		
		return "../diary/content";
	}
}
