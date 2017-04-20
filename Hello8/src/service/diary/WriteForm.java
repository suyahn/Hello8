package service.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiaryDao;
import model.Language;
import model.Range;
import service.CommandProcess;

public class WriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		session.setAttribute("id", "hello");
		String id = (String) session.getAttribute("id");

		DiaryDao dd = DiaryDao.getInstance();
		List<Language> everyLang = dd.everyLang();
		List<Range> everyRange = dd.everyRange();
		request.setAttribute("everyLang", everyLang);
		request.setAttribute("everyRange", everyRange);
		

		return "../diary/writeForm";
	}

}
