package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommandProcess;

public class CheckEmail implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		MemberDao md = MemberDao.getInstance();
		int result = md.checkEmail(email); //1이면 중복된 email 존재
		
		request.setAttribute("result", result);
		request.setAttribute("email", email);
		return "../member/checkEmail";
	}

}
