package service.gathering;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Gathering_ReplyDao;
import service.CommandProcess;

public class RDelete implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int gno = Integer.parseInt(request.getParameter("gno"));
		String pageNum = request.getParameter("pageNum");
		int grno = Integer.parseInt(request.getParameter("grno"));

		Gathering_ReplyDao grd = Gathering_ReplyDao.getInstance();
		grd.DeleteReply(grno);

		request.setAttribute("gno", gno);
		request.setAttribute("pageNum", pageNum);

		return "../gathering/rwrite";
	}

}
