package service.gathering;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Gathering_ReplyDao;
import model.Gathering_Reply;
import service.CommandProcess;

public class RWrite implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		
		int gno = Integer.parseInt(request.getParameter("gno"));
		String id = request.getParameter("sessionId");
		String grcontent = request.getParameter("grcontent");
		String pageNum = request.getParameter("pageNum");
		int grno = 0, temp_step = 0;
		
		Gathering_ReplyDao grd = Gathering_ReplyDao.getInstance();
		int number = grd.insertNo(); // 새로 저장될 댓글의 grno

		/*if (request.getParameter("grno") != null) {
			Gathering_Reply gathering_reply = new Gathering_Reply();
			int ref = Integer.parseInt(request.getParameter("ref"));
			int re_step = Integer.parseInt(request.getParameter("re_step"));
			int re_level = Integer.parseInt(request.getParameter("re_level"));
			
			gathering_reply.setRef(ref);
			gathering_reply.setRe_step(re_step);
			gathering_reply.setRe_level(re_level);
			
			temp_step = grd.sqlStep(gathering_reply);
			
			
		} else {*/
			Gathering_Reply gathering_reply = new Gathering_Reply();
			gathering_reply.setGno(gno);
			gathering_reply.setId(id);
			gathering_reply.setGrcontent(grcontent);

			
			gathering_reply.setGrno(grno);

			grd.insert(gathering_reply);
		/*}*/
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
