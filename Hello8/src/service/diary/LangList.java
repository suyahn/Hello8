package service.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiaryDao;
import model.Diary;
import model.Language;
import service.CommandProcess;

public class LangList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		final int ROWPERPAGE = 10;
		final int PAGEPERBLOCK = 10;
		String pageNum = request.getParameter("pageNum");

		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);

		DiaryDao dd = DiaryDao.getInstance();
		int lang_no = Integer.parseInt(request.getParameter("lang_no"));
		int total = 0;
		if (lang_no == 0) {
			total = dd.getTotal();
		} else {
			total = dd.getTotal2(lang_no);
		}
		int startRow = (currentPage - 1) * ROWPERPAGE + 1;
		int endRow = startRow + ROWPERPAGE - 1;

		int totalPage = (int) Math.ceil((double) total / ROWPERPAGE);
		// int startPage = currentPage / 10 * PAGEPERBLOCK + 1;
		int startPage = currentPage - (currentPage - 1) % PAGEPERBLOCK;
		int endPage = startPage + PAGEPERBLOCK - 1;
		if (endPage > totalPage)
			endPage = totalPage;

		int number = total - startRow + 1;

		List<Diary> list2 = dd.langList(startRow, endRow, lang_no);
		List<Diary> list = dd.list(startRow, endRow);
		List<Language> everyLang = dd.everyLang();

		if (lang_no == 0) {

			request.setAttribute("everyLang", everyLang);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("total", total);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("number", number);
			request.setAttribute("list", list);
			request.setAttribute("totalPage", totalPage);

			return "../diary/list";

		} else {

			request.setAttribute("everyLang", everyLang);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("total", total);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("number", number);
			request.setAttribute("list2", list2);
			request.setAttribute("totalPage", totalPage);

			return "../diary/langList";
		}

	}
}
