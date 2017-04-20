package service.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.SimpleEmail;

import dao.MemberDao;
import service.CommandProcess;

public class FindPassword implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		String id = request.getParameter("id");
		String email = request.getParameter("email");

		MemberDao md = MemberDao.getInstance();
		String password = md.findPassword(id, email);

		if (password == null || password.equals("")) {
			return "../member/findForm";
		} else {
			String subject = "Hello8 - We send you temporary password!";
			String msg = "Your password is " + password + "."; 

			SimpleEmail se = new SimpleEmail();
			se.setHostName("smtp.naver.com");
			se.setSmtpPort(465);
			se.setAuthenticator(new DefaultAuthenticator("hello8master", "hello8master!"));

			try {
				se.setSSLOnConnect(true);
				se.addTo(email);
				se.setFrom("hello8master@naver.com");
				se.setSubject(subject);
				se.setMsg(msg);
				se.send();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return "../member/loginForm";
		}
	}

}
