package service.gathering;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Gathering_ReplyDao;
import model.Gathering_Reply;
import service.CommandProcess;

public class RUpdate implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int gno = Integer.parseInt(request.getParameter("gno"));
		String grcontent = request.getParameter("grcontent");
		String pageNum = request.getParameter("pageNum");
		int grno = Integer.parseInt(request.getParameter("grno"));

		System.out.println("gno : " + gno);
		System.out.println("grcontent : " + grcontent);

		Gathering_ReplyDao grd = Gathering_ReplyDao.getInstance();
		Gathering_Reply gathering_reply = new Gathering_Reply();
		gathering_reply.setGrcontent(grcontent);
		gathering_reply.setGrno(grno);

		System.out.println("grno : " + grno);

		grd.UpdateReply(gathering_reply);

		/*
		 * if (result > 0) {
		 * response.setContentType("text/html;charset=euc-kr"); PrintWriter out;
		 * try { out = response.getWriter(); out.println("1"); out.close();
		 * 
		 * } catch (IOException e) { } }
		 * 
		 */

		request.setAttribute("gno", gno);
		request.setAttribute("pageNum", pageNum);

		return "../gathering/rwrite";
	}

}
