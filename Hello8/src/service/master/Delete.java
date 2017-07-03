package service.master;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Inter_langDao;
import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class Delete implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");

		Inter_langDao ild = Inter_langDao.getInstance();
		int resultIld = ild.delete(id);

		MemberDao md = MemberDao.getInstance();
		int resultMd = md.delete(id);
		
		return "../master/indexList";
	}

}
