package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class LoginSuccess implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		MemberDao md = MemberDao.getInstance();
		String nickname = md.getNickName(id);
		int score = md.getScore(id);
		String grade = md.getGrade(id);
		
		request.setAttribute("nickname", nickname);
		request.setAttribute("score", score);
		request.setAttribute("grade", grade);
		
		return "/index.jsp";
	}

}
