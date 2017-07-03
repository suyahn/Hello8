package service.diary;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Diary_ReplyDao;
import model.Diary_Reply;
import service.CommandProcess;

public class RUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		String drcontent = request.getParameter("drcontent");
		String pageNum = request.getParameter("pageNum");
		int drno = Integer.parseInt(request.getParameter("drno"));

		Diary_ReplyDao drd = Diary_ReplyDao.getInstance();
		Diary_Reply diary_reply = new Diary_Reply();
		diary_reply.setDrcontent(drcontent);
		diary_reply.setDrno(drno);

		drd.update(diary_reply);

		request.setAttribute("dno", dno);
		request.setAttribute("pageNum", pageNum);
		System.out.println("RUdate drno: "+drno);
		return "../diary/rwrite";
	}

}
