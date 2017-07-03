package service.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiaryDao;
import model.Diary;
import model.Language;
import service.CommandProcess;

public class ListAction implements CommandProcess {
	/* (non-Javadoc)
	 * @see service.CommandProcess#requestPro(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		DiaryDao dd = DiaryDao.getInstance();
		HttpSession session = request.getSession();
		/* session.setAttribute("id", "hello"); */
		String id = (String) session.getAttribute("id");
		/* String nickname = dd.checkNickname(id); */

		final int ROWPERPAGE = 10;
		final int PAGEPERBLOCK = 10;
		String pageNum = request.getParameter("pageNum");

		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);

		int total = 0, startRow = 0, endRow = 0, totalPage = 0;
		int startPage = 0, endPage = 0, number = 0;
		List<Diary> list = null;
		List<Diary> publicList = null;

		int lang_no = 0;
		String lang_name = null;
		String test = request.getParameter("lang_no"); 
		
		int numBlock = 0;
		
		/* if는 모든 리스트를 뿌려줄때 lang_no 선택없이 All  */
		if (test == null || test.equals("") || test.equals("0")) {
			
			if(id == null || id.equals("")){
				/*아이디 없는 public보기일때 페이징*/
				total= dd.pbGetTotal();
			}else{/*아이디가 있을때 페이징*/
				total = dd.getTotal();
			}
				
			startRow = (currentPage - 1) * ROWPERPAGE + 1;
			endRow = startRow + ROWPERPAGE - 1;

			totalPage = (int) Math.ceil((double) total / ROWPERPAGE);
			// int startPage = currentPage / 10 * PAGEPERBLOCK + 1;
			startPage = currentPage - (currentPage - 1) % PAGEPERBLOCK;
			endPage = startPage + PAGEPERBLOCK - 1;
			if (endPage > totalPage)
				endPage = totalPage;

			number = total - startRow + 1;
			/* 아이디가 없을 때 public */
			if (id == null || id.equals("")) {
				publicList = dd.pbList(startRow, endRow);
			} else {
				/*아이디가 있을때 멤버만보기 까지 보여줌*/
				list = dd.list(startRow, endRow);
			}
			
			numBlock = (int) Math.ceil((double) currentPage / PAGEPERBLOCK);

		} else { /* 언어별 리스트를 뿌려줄때 */
			lang_no = Integer.parseInt(request.getParameter("lang_no"));
			lang_name = dd.getLangName(lang_no);
			if(id == null || id.equals("")){
				/*아이디 없는 public보기일때 언어별 페이징*/
				total= dd.pbGetTotal2(lang_no);
			}else{/*아이디가 있을때 언어별페이징*/
				total = dd.getTotal2(lang_no);
			}
			
			startRow = (currentPage - 1) * ROWPERPAGE + 1;
			endRow = startRow + ROWPERPAGE - 1;

			totalPage = (int) Math.ceil((double) total / ROWPERPAGE);
			// int startPage = currentPage / 10 * PAGEPERBLOCK + 1;
			startPage = currentPage - (currentPage - 1) % PAGEPERBLOCK;
			endPage = startPage + PAGEPERBLOCK - 1;
			if (endPage > totalPage)
				endPage = totalPage;

			number = total - startRow + 1;
			/* 아이디가 없을 때 public 언어별로 보여줄때 */
			if (id == null || id.equals("")) {
				publicList = dd.pbLangList(startRow, endRow, lang_no);
			} else {
				/*아이디가 있을때 멤버만보기 까지 보여줌 언어*/
				list = dd.langList(startRow, endRow, lang_no);
			}
			numBlock = (int) Math.ceil((double) currentPage / PAGEPERBLOCK);
		}
		List<Language> list_lang = dd.everyLang();

		request.setAttribute("list_lang", list_lang);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("ROWPERPAGE", ROWPERPAGE);
		request.setAttribute("PAGEPERBLOCK", PAGEPERBLOCK);
		request.setAttribute("total", total);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("number", number);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("lang_name", lang_name);
		request.setAttribute("lang_no", lang_no);
		request.setAttribute("id", id);
		request.setAttribute("publicList", publicList);
		request.setAttribute("numBlock", numBlock);
		/* request.setAttribute("nickname", nickname); */

		return "../diary/list";
	}
}
