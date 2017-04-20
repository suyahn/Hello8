package service.member;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.MemberDao;
import service.CommandProcess;

public class Login implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDao md = MemberDao.getInstance();
		int result = md.loginChk(id, password); //성공 1, password 틀린 경우 0, id 없는 경우 -1
		
		HttpSession session = request.getSession();
		if(result > 0) {
			session.setAttribute("id", id);
			
			String nickname = md.getNickName(id);
			int score = md.getScore(id);
			String grade = md.getGrade(id);
			
			request.setAttribute("nickname", nickname);
			request.setAttribute("score", score);
			request.setAttribute("grade", grade);
			
//			return "../member/loginSuccess";
		} else {
			request.setAttribute("result", result);
//			return "../member/loginForm";
		}
		return "../index";
	}

}
