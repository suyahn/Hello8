package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import model.Notice;
import service.CommandProcess;


public class UpdateForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	int nno=Integer.parseInt(request.getParameter("nno"));
		String pageNum = request.getParameter("pageNum");
		NoticeDao nd = NoticeDao.getInstance();
		Notice notice = nd.select(nno);

		request.setAttribute("nno", nno);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("notice", notice);
		return "updateForm";
	}
}
