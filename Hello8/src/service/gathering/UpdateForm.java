package service.gathering;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GatheringDao;
import model.Gathering;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int gno = Integer.parseInt(request.getParameter("gno"));
		String pageNum = request.getParameter("pageNum");

		GatheringDao gd = GatheringDao.getInstance();
		Gathering gathering = gd.select(gno);

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("gathering", gathering);

		return "../gathering/updateForm";
	}

}
