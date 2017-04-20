package service.gathering;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GatheringDao;
import model.Gathering;
import service.CommandProcess;

public class Update implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		// 수정한 글을 저장해보자~
		Gathering gathering1 = new Gathering();

		String gsubject = request.getParameter("gsubject");
		String gcontent = request.getParameter("gcontent");
		int gno = Integer.parseInt(request.getParameter("gno"));
		String pageNum = request.getParameter("pageNum");
		
		gathering1.setGsubject(gsubject);
		gathering1.setGcontent(gcontent);
		gathering1.setGno(gno);

		GatheringDao gd = GatheringDao.getInstance();
		int result = gd.contentUpdate(gathering1);

		/*// 글 수정 후 content로 돌아가기 위해 id에 의한 nickname과 lang_name을 받아오려고!
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int gno = Integer.parseInt(request.getParameter("gno"));
		String pageNum = request.getParameter("pageNum");

		Gathering gathering2 = gd.select(gno);*/
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("gno", gno);

		return "../gathering/update";
	}

}
