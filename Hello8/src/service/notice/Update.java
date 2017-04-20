package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.NoticeDao;
import model.Notice;
import service.CommandProcess;



public class Update implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {request.setCharacterEncoding("utf-8");
		} catch (Exception e){System.out.println(e.getMessage());} 
		//try catch 쓰는 이유는 오류가 발생했을 때 오류를 알려주라고
		String pageNum = request.getParameter("pageNum");
		int nno=Integer.parseInt(request.getParameter("nno"));
		String nsubject=request.getParameter("nsubject");
		String ncontent=request.getParameter("ncontent");
		Notice notice =new Notice();
		notice.setNno(nno);
		notice.setNsubject(nsubject);
		notice.setNcontent(ncontent);
		NoticeDao nd = NoticeDao.getInstance();
		int result  = nd.update(notice); 		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		return "../notice/update";
	}
}
