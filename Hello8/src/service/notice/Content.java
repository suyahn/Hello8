package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FaqDao;
import dao.NoticeDao;
import model.Faq;
import model.Notice;
import service.CommandProcess;

public class Content implements CommandProcess  {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int nno=Integer.parseInt(request.getParameter("nno"));
		String pageNum = request.getParameter("pageNum");
		NoticeDao nd = NoticeDao.getInstance();
		nd.readcountUpdate(nno);
		Notice notice = nd.select(nno);
		
		
		request.setAttribute("nno", nno);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("notice", notice);
		
		return "content";
	}

}
