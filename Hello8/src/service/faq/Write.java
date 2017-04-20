package service.faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.FaqDao;
import model.Faq;
import service.CommandProcess;


public class Write implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {request.setCharacterEncoding("utf-8");
		} catch (Exception e){System.out.println(e.getMessage());} 
		String fquestion=request.getParameter("fquestion");
		String fanswer=request.getParameter("fanswer");
		FaqDao fd = FaqDao.getInstance();
		Faq faq=new Faq();
		int fno = fd.getMaxFno();
		faq.setFquestion(fquestion);
		faq.setFanswer(fanswer);
		faq.setFno(fno);
		int result  = fd.insert(faq);
		request.setAttribute("result", result);
		
		return "../faq/write";
	}

}
