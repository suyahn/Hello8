package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Inter_langDao;
import dao.MemberDao;
import service.CommandProcess;

public class Delete implements CommandProcess {
   public String requestPro(HttpServletRequest request, HttpServletResponse response) {
      HttpSession session = request.getSession();
	  String id = (String) session.getAttribute("id");
	  
	  Inter_langDao ild = Inter_langDao.getInstance();
	  int resultIld = ild.delete(id);
	  
      MemberDao md = MemberDao.getInstance();
      int resultMd  = md.delete(id);
      
      
      if(resultMd > 0 && resultIld > 0) {
    	  session.invalidate();
      }
      
      request.setAttribute("result", resultMd);
      return "../member/delete";
   }

}