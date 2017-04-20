package service.faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.FaqDao;
import model.Faq;
import service.CommandProcess;



public class UpdateForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	int fno=Integer.parseInt(request.getParameter("fno"));
		String pageNum = request.getParameter("pageNum");
		FaqDao fd = FaqDao.getInstance();
		Faq faq = fd.select(fno);

		request.setAttribute("fno", fno);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("faq", faq);
		return "updateForm";
	}
}
