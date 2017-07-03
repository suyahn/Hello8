package service.faq;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FaqDao;
import model.Faq;
import service.CommandProcess;

public class UserList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		FaqDao fd = FaqDao.getInstance();
		List<Faq> list = fd.list();
		
		request.setAttribute("list",list);
		return "../index.jsp?pgm=faq/userlist";
	}

}
