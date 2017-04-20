package service.gathering;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GatheringDao;
import dao.Gathering_ReplyDao;
import model.Gathering;
import model.Gathering_Reply;
import service.CommandProcess;

public class RContent implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int gno = Integer.parseInt(request.getParameter("gno"));
		int grno = Integer.parseInt(request.getParameter("grno"));
		String pageNum = request.getParameter("pageNum");

		GatheringDao gd = GatheringDao.getInstance();
		gd.greadCountUpdate(gno);
		Gathering gathering = gd.select(gno);

		/*// 현재 접속한 사람이 이 글을 쓴 당사자인지 아니면 마스터인지 알기 위해서
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String chkId = gd.checkId(gno);
		int result = 0;

		if (id == "master" || id == chkId)
			result = 1;
		else
			result = 0;*/

		Gathering_ReplyDao grd = Gathering_ReplyDao.getInstance();
		List<Gathering_Reply> list = grd.list(gno);
		System.out.println(list.size());

		if (list.size() > 0)
			request.setAttribute("list", list);

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("gathering", gathering);
		request.setAttribute("thegrno", grno);
/*		request.setAttribute("result", result);
*/
		return "../gathering/rcontent";
	}

}
