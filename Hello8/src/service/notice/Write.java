package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.NoticeDao;
import model.Notice;
import service.CommandProcess;

public class Write implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {request.setCharacterEncoding("utf-8");
		} catch (Exception e){System.out.println(e.getMessage());} 
		String nsubject=request.getParameter("nsubject");
		String ncontent=request.getParameter("ncontent");
		NoticeDao nd = NoticeDao.getInstance();
		Notice notice=new Notice();
		int nno = nd.getMaxNno();
		notice.setNsubject(nsubject);
		notice.setNcontent(ncontent);
		notice.setNno(nno);
		int result  = nd.insert(notice);
		request.setAttribute("result", result);
		
		return "../notice/write";
	}

}
