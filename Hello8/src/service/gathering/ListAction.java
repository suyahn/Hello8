package service.gathering;

/*import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GatheringDao;
import model.Gathering;
import model.Language;

public class ListAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String[] lang = request.getParameterValues("lang");
		int[] lang_no = new int[lang.length];
		int[] lang_no2 = null;
		
		for(int i =0; i<lang.length; i++) 
			lang_no[i] = Integer.parseInt(lang[i]);

		GatheringDao gd = GatheringDao.getInstance();
		int total = 0;

		for (int i = 0; i < lang.length; i++) {
			if (lang_no[i] == 0 || lang[i] == null) {
				total = gd.getTotal();
				break;
			}

			total += gd.getTotal2(lang[i]);
		}

		final int ROWPERPAGE = 10;
		final int PAGEPERBLOCK = 10;
		String pageNum = request.getParameter("pageNum");

		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);

		int startRow = (currentPage - 1) * ROWPERPAGE + 1;
		int endRow = startRow + ROWPERPAGE - 1;

		int totalPage = (int) Math.ceil((double) total / ROWPERPAGE);
		// int startPage = currentPage / 10 * PAGEPERBLOCK + 1;
		int startPage = currentPage - (currentPage - 1) % PAGEPERBLOCK;
		int endPage = startPage + PAGEPERBLOCK - 1;
		if (endPage > totalPage)
			endPage = totalPage;

		int number = total - startRow + 1;
		
		List<Gathering> list;

		for (int i = 0; i < lang.length; i++) {
			if (lang_no[i] == 0) {
				list = gd.list(startRow, endRow);
				break;
			} else 
				lang_no2[i] = lang_no[i];
		}
		
		if(lang_no2.length > 0) {
			list = gd.list2(startRow, endRow, lang_no2);
		}

		// 이상한 페이징을 바로잡아주기 위한.
		int num = (int) Math.ceil((double) currentPage / PAGEPERBLOCK);

		// 언어 받아오기
		List<Language> list_lang = gd.everyLang();
		request.setAttribute("list_lang", list_lang);

		System.out.println(list_lang.size());

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("total", total);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("number", number);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("num", num);

		return "list";
	}

}
*/

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GatheringDao;
import model.Gathering;
import model.Language;
import service.CommandProcess;

public class ListAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		final int ROWPERPAGE = 10;
		final int PAGEPERBLOCK = 10;
		String pageNum = request.getParameter("pageNum");

		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);

		GatheringDao gd = GatheringDao.getInstance();
		
		int total = gd.getTotal();
		int startRow = (currentPage - 1) * ROWPERPAGE + 1;
		int endRow = startRow + ROWPERPAGE - 1;

		int totalPage = (int) Math.ceil((double) total / ROWPERPAGE);
		// int startPage = currentPage / 10 * PAGEPERBLOCK + 1;
		int startPage = currentPage - (currentPage - 1) % PAGEPERBLOCK;
		int endPage = startPage + PAGEPERBLOCK - 1;
		if (endPage > totalPage)
			endPage = totalPage;

		int number = total - startRow + 1;

		List<Gathering> list = gd.list(startRow, endRow);

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

		return "../gathering/list";
	}

}
