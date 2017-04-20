package service.gathering;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GatheringDao;
import service.CommandProcess;

public class Delete implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int gno = Integer.parseInt(request.getParameter("gno"));
		String pageNum = request.getParameter("pageNum");

		GatheringDao gd = GatheringDao.getInstance();
		int result = gd.contentDelete(gno);

		request.setAttribute("gno", gno);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);

		return "../gathering/delete";
	}

}
