package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.NoticeDao;
import service.CommandProcess;

public class Delete implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int nno=Integer.parseInt(request.getParameter("nno"));
		NoticeDao nd = NoticeDao.getInstance();
		int result  = nd.delete(nno);
		request.setAttribute("result", result);
		return "../notice/delete";
	}

}
