package service.master;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiaryDao;
import dao.StatisticsDao;
import service.CommandProcess;

public class Statistics implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//commandprocess가 부모인데 부모는 메소드(메소드는 명령문 같은 거임 dao에서 insert gettotal update delete 등등 얘네 다 메소드임)
		//requestpro도 메소드야 근데 부모가 메소드를 구현을 안해놨어 interface는 메소드를 구현을 안해 자식들이 그래서
		//메소드를 구현을 해줘야하는데 그 이유는 컨트롤러에서 다이름을 부르면 복잡해서 commandprocess만 부르는 거야
		
		/*StatisticsDao sd = StatisticsDao.getInstance();*/
		DiaryDao dd = DiaryDao.getInstance();
		//StatisticsDao의 instance = new StatisticsDao();인데 이렇게 써서 여기서 instance는 dao라는 객체를 생성해서
		//그 객체를 불러오라고 시켰음
		List<model.Statistics> list = dd.statistics();
		//그리고 dao의  public List<Statistics> statistics() {의 list를 받아옴
		request.setAttribute("list", list);
		//마지막으로 jsp로 넘어갈 때 받아온 list를 가지고 같이 넘어가라고 한거임
		return "../master/statistics";
	}

}
