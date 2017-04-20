package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommandProcess;

public class CheckId implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		MemberDao md = MemberDao.getInstance();
		int result = md.checkId(id); //1이면 중복된 아이디 존재
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		return "../member/checkId";
	}

}
