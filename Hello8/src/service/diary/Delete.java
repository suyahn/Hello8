package service.diary;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiaryDao;
import service.CommandProcess;

public class Delete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		DiaryDao dd = DiaryDao.getInstance();
		int result = dd.delete(dno);

		request.setAttribute("result", result);
		
		return "../diary/delete";
	}

}
