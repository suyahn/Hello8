package service.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DiaryDao;
import dao.NoticeDao;
import model.Diary;
import model.Notice;
import service.CommandProcess;

public class Main implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		DiaryDao dd = DiaryDao.getInstance();
		List<Diary> diarylist = dd.popular();
		
		NoticeDao nd = NoticeDao.getInstance();
		List<Notice> noticelist = nd.main();
		
		request.setAttribute("diarylist", diarylist);
		request.setAttribute("noticelist", noticelist);
		return "/index.jsp?pgm=main";
	}
}