package service.diary;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Diary_ReplyDao;
import dao.MemberDao;
import model.Diary_Reply;
import service.CommandProcess;

public class RWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		String id = request.getParameter("id");
		String drcontent = request.getParameter("drcontent");
		String pageNum = request.getParameter("pageNum");
		int drno = 0;
			/*int temp_step = 0;*/

		Diary_ReplyDao drd = Diary_ReplyDao.getInstance();
		drno = drd.insertNo();// 새로 저장될 댓글의 drno

		/*
		 * if (request.getParameter("grno") != null) { diary_Reply diary_reply =
		 * new diary_Reply(); int ref =
		 * Integer.parseInt(request.getParameter("ref")); int re_step =
		 * Integer.parseInt(request.getParameter("re_step")); int re_level =
		 * Integer.parseInt(request.getParameter("re_level"));
		 * 
		 * diary_reply.setRef(ref); diary_reply.setRe_step(re_step);
		 * diary_reply.setRe_level(re_level);
		 * 
		 * temp_step = grd.sqlStep(diary_reply);
		 * 
		 * 
		 * } else {
		 */
		Diary_Reply diary_reply = new Diary_Reply();
		diary_reply.setDno(dno);
		diary_reply.setId(id);
		diary_reply.setDrcontent(drcontent);

		
		diary_reply.setDrno(drno);
		drd.insert(diary_reply);
		
		MemberDao md = MemberDao.getInstance();
		md.updateScore(id, 1);
		
		/* } */
		/*
		 * if (result > 0) {
		 * response.setContentType("text/html;charset=euc-kr"); PrintWriter out;
		 * try { out = response.getWriter(); out.println("1"); out.close();
		 * 
		 * } catch (IOException e) { } }
		 * 
		 */
		request.setAttribute("dno", dno);
		request.setAttribute("pageNum", pageNum);
		
		return "../diary/rwrite";
	}

}
