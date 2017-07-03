package service.gathering;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GatheringDao;
import model.Gathering;
import service.CommandProcess;

public class Write implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		String gsubject = request.getParameter("gsubject");
		String gcontent = request.getParameter("gcontent");

		// String lang_name = request.getParameter("lang_name");
		int lang_no = Integer.parseInt(request.getParameter("lang_no"));

		// 모임날짜
		Date ggdate = Date.valueOf(request.getParameter("ggdate"));

		GatheringDao gd = GatheringDao.getInstance();
		int gno = gd.insertNo();

		Gathering gathering = new Gathering();
		gathering.setGno(gno);
		gathering.setGsubject(gsubject);
		gathering.setId(id);
		gathering.setGcontent(gcontent);
		gathering.setLang_no(lang_no);
		gathering.setGgdate(ggdate);
		/* gathering.setLang_name(lang_name); */

		int result = gd.insert(gathering);

		request.setAttribute("result", result);

		return "../gathering/write";
	}

}
