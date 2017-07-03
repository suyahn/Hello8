package service.gathering;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GatheringDao;
import dao.Gathering_ReplyDao;
import model.Gathering;
import model.Gathering_Reply;
import service.CommandProcess;

public class Content implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int gno = Integer.parseInt(request.getParameter("gno"));
		String pageNum = request.getParameter("pageNum");
		int lang_no = 0;

		if (request.getParameter("lang_no") != null)
			lang_no = Integer.parseInt(request.getParameter("lang_no"));

		GatheringDao gd = GatheringDao.getInstance();
		gd.greadCountUpdate(gno);
		Gathering gathering = gd.select(gno);

		// 현재 접속한 사람이 이 글을 쓴 당사자인지 아니면 마스터인지 알기 위해서
		HttpSession session = request.getSession();
		String id = null;
		String nickname = null;

		id = (String) session.getAttribute("id");
		String chkId = gd.checkId(gno);
		if (id != null)
			nickname = gd.checkNickname(id);

		int result = 0;

		if (id != null)
			if (id == "master" || id.equals(chkId))
				result = 1;
			else
				result = 0;

		Gathering_ReplyDao grd = Gathering_ReplyDao.getInstance();
		List<Gathering_Reply> list = grd.list(gno);

		if (list.size() > 0)
			request.setAttribute("list", list);

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("gathering", gathering);
		request.setAttribute("result", result);
		request.setAttribute("lang_no", lang_no);

		request.setAttribute("id", id);
		request.setAttribute("nickname", nickname);

		return "../gathering/content";
	}

}
