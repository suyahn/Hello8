package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommandProcess;

public class CheckNickname implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String nickname = request.getParameter("nickname");
		MemberDao md = MemberDao.getInstance();
		int result = md.checkNickname(nickname); //1이면 중복된 닉네임 존재
		
		request.setAttribute("result", result);
		request.setAttribute("nickname", nickname);
		return "../member/checkNickname";
	}

}
