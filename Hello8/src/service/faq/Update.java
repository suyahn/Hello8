package service.faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FaqDao;
import model.Faq;
import service.CommandProcess;


public class Update implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {request.setCharacterEncoding("utf-8");
		} catch (Exception e){System.out.println(e.getMessage());} 
		//try catch 쓰는 이유는 오류가 발생했을 때 오류를 알려주라고
		String pageNum = request.getParameter("pageNum");
		int fno=Integer.parseInt(request.getParameter("fno"));
		String fquestion=request.getParameter("fquestion");
		String fanswer=request.getParameter("fanswer");
		Faq faq =new Faq();
		faq.setFno(fno);
		faq.setFquestion(fquestion);
		faq.setFanswer(fanswer);
		FaqDao fd = FaqDao.getInstance();
		int result  = fd.update(faq); 		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		return "../faq/update";
	}
}
