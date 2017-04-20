package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommandProcess;

public class FindId implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		MemberDao md = MemberDao.getInstance();
		
		String id = md.findId(email);
		
		if (id == null || id.equals("")) {
			return "../member/findForm";
		} else {
			request.setAttribute("result", 1);
			request.setAttribute("id", id);
			return "../member/findIdResult";
		}
	}

}
