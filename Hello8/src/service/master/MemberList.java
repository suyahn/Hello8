package service.master;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.MemberDao;
import model.Member;
import service.CommandProcess;
public class MemberList implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		final int ROWPERPAGE = 10;
		final int PAGEPERBLOCK = 10;	
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		MemberDao md = MemberDao.getInstance();
		int total = md.getTotal();
		int startRow = (currentPage - 1) * ROWPERPAGE + 1 ;
		int endRow = startRow + ROWPERPAGE - 1 ;		
		List<Member> list = md.list(startRow, endRow);	
		int totPage = (int)Math.ceil((double)total/ROWPERPAGE);
		int startPage = currentPage/10 * PAGEPERBLOCK +1;
		int endPage = startPage + PAGEPERBLOCK - 1;
		if (endPage > totPage) endPage = totPage;
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("PAGEPERBLOCK", PAGEPERBLOCK);
		request.setAttribute("list", list);
		request.setAttribute("totPage", totPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		return "../master/list";
	}
}