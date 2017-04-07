package service.gathering;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GatheringDao;
import model.Gathering;
import service.CommandProcess;

public class Content implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int gno = Integer.parseInt(request.getParameter("gno"));
		String pageNum = request.getParameter("pageNum");
		
		GatheringDao gd = GatheringDao.getInstance();
		gd.greadCountUpdate(gno);
		Gathering gathering = gd.select(gno);

		System.out.println("lang : " + gathering.getLang_name());
		
		request.setAttribute("gno", gno);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("gathering", gathering);

		return "content";
	}

}
