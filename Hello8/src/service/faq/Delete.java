package service.faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FaqDao;
import service.CommandProcess;


public class Delete implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int fno=Integer.parseInt(request.getParameter("fno"));
		FaqDao fd = FaqDao.getInstance();
		int result  = fd.delete(fno);
		request.setAttribute("result", result);
		return "../faq/delete";
	}

}
