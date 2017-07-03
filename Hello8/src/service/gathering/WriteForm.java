package service.gathering;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GatheringDao;
import model.Language;
import service.CommandProcess;

public class WriteForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		GatheringDao gd = GatheringDao.getInstance();
		List<Language> langlist = gd.langlist(id);

		request.setAttribute("langlist", langlist);

		return "../gathering/writeForm";
	}

}
