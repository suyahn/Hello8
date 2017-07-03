package service.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiaryDao;
import dao.Diary_ReplyDao;
import model.Diary;
import model.Diary_Reply;
import service.CommandProcess;

public class RContent implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		int drno = Integer.parseInt(request.getParameter("drno"));
		String pageNum = request.getParameter("pageNum");

		DiaryDao dd = DiaryDao.getInstance();
		dd.dreadCountUpdate(dno);
		Diary diary = dd.select(dno);

		/*
		 * // 현재 접속한 사람이 이 글을 쓴 당사자인지 아니면 마스터인지 알기 위해서 HttpSession session =
		 * request.getSession(); String id = (String)
		 * session.getAttribute("id"); String chkId = gd.checkId(gno); int
		 * result = 0;
		 * 
		 * if (id == "master" || id == chkId) result = 1; else result = 0;
		 */

		Diary_ReplyDao drd = Diary_ReplyDao.getInstance();
		List<Diary_Reply> list = drd.list(dno);
		

		if (list.size() > 0)
			request.setAttribute("list", list);
		System.out.println("RContent list:"+list.size());
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("diary", diary);
		request.setAttribute("thedrno", drno);
		/*
		 * request.setAttribute("result", result);
		 */
		return "../diary/rcontent";
	}

}
