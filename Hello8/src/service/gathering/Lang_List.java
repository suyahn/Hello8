package service.gathering;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GatheringDao;
import model.Gathering;
import model.Language;
import service.CommandProcess;

public class Lang_List implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int lang_no = Integer.parseInt(request.getParameter("lang_no"));

		final int ROWPERPAGE = 10;
		final int PAGEPERBLOCK = 10;
		String pageNum = request.getParameter("pageNum");

		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);

		GatheringDao gd = GatheringDao.getInstance();
		
		String lang_name = gd.getLangName(lang_no);
		
		int total = gd.getTotal2(lang_no);
		int startRow = (currentPage - 1) * ROWPERPAGE + 1;
		int endRow = startRow + ROWPERPAGE - 1;

		int totalPage = (int) Math.ceil((double) total / ROWPERPAGE);
		// int startPage = currentPage / 10 * PAGEPERBLOCK + 1;
		int startPage = currentPage - (currentPage - 1) % PAGEPERBLOCK;
		int endPage = startPage + PAGEPERBLOCK - 1;
		if (endPage > totalPage)
			endPage = totalPage;

		int number = total - startRow + 1;

		List<Gathering> list = gd.list2(startRow, endRow, lang_no);

		// 이상한 페이징을 바로잡아주기 위한.
		int num = (int) Math.ceil((double) currentPage / PAGEPERBLOCK);

		// 언어 받아오기
		List<Language> list_lang = gd.everyLang();
		request.setAttribute("list_lang", list_lang);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("total", total);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("number", number);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("num", num);
		
		request.setAttribute("lang_name", lang_name);
		request.setAttribute("lang_no", lang_no);

		return "../gathering/lang_list";
	}

}
