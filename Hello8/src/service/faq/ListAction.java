package service.faq;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.FaqDao;
import model.Faq;
import service.CommandProcess;

public class ListAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		final int ROWPERPAGE = 10;
		final int PAGEPERBLOCK = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		FaqDao fd = FaqDao.getInstance();
		int total   = fd.getTotal();  
		int startRow  = (currentPage - 1)*ROWPERPAGE + 1;
		int endRow  = startRow + ROWPERPAGE - 1; 
		int number  = total - startRow + 1;
		List<Faq> list = fd.list(startRow,endRow);
		int totPage = (int)Math.ceil((double)total/ROWPERPAGE);
		int startPage = currentPage - (currentPage - 1)%PAGEPERBLOCK;
		int endPage   = startPage + PAGEPERBLOCK - 1;
		if (endPage > totPage) endPage = totPage;

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("total", total);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("number", number);
		request.setAttribute("list", list);
		request.setAttribute("totPage", totPage);
		
		return "../faq/list";
	}

}
