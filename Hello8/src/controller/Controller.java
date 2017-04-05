package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CommandProcess;

@WebServlet(urlPatterns="*.do", initParams={@WebInitParam(name="config",value="/WEB-INF/command.properties")})
//config의 값으로 /WEB-INF/command.properties에 있는걸 가져와라.

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<>();
	
	public void init(ServletConfig config) throws ServletException { //doGet이나 doPost 실행전에 먼저 실행한다. destory는 tomcat이 죽으면 실행됨
	   	String props = config.getInitParameter("config"); //현재 props에는 command.properties가 들어있다.
	   	Properties pr = new Properties(); //Properties는 Map을 구현한 클래스로 key=값으로 구성된다.
	    FileInputStream f = null;
	    
	    try {
	          String configFilePath = config.getServletContext().getRealPath(props);
	          //props에 들어 있는 /WEB-INF/command.properties의 실제 주소를 configFilePath에 넣음.
	          //실제 주소는 .metadata밑에 복잡하게 있음
	          f = new FileInputStream(configFilePath);
	          pr.load(f);
	          //pr에는 command.properties file의 데이터가 들어오게 된다.
	     } catch (IOException e) { 
	    	 throw new ServletException(e);
	     } finally {
	          if (f != null) {
	        	  try { 
	        		  f.close(); 
	        	  } catch(IOException ex) {}
	          }
	     }
	    
	     Iterator<Object> keyIter = pr.keySet().iterator(); //key를 set으로 가져와서 iterator 호출. Properties 클래스는 Map을 구현함.
	     while(keyIter.hasNext()) { //message.do가 있음.
	          String command = (String)keyIter.next();  //command에 message.do가 들어옴.
	          String className = pr.getProperty(command); //className에는 service.Message 문자열이 들어온다. 
	          try {
	               Class<?> commandClass = Class.forName(className); //commandClass에 service밑에 있는 Message 클래스를 불러온다.
	               Object commandInstance = commandClass.newInstance(); //Message 객체를 생성한다.
	               commandMap.put(command, commandInstance); //map의 key에 message.do를, 값에 Message객체를 집어 넣는다.
	          } catch (Exception e) {
	               throw new ServletException(e);
	          }
	     }
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
	    CommandProcess com = null;
	    try { 
	    	String command = request.getRequestURI();
	    	command = command.substring(request.getContextPath().length()+1); 
	        com = (CommandProcess)commandMap.get(command); //Message객체를 가져와서 CommandProcess로 Upcasting 
	        //CommandProcess com = new Message();랑 같은 뜻.
	        //부모 = new 자식();해서 부모에게 있는 메소드를 호출하면 자식 메소드가 실행된다.
	        view = com.requestPro(request, response); //자식 클래스인 Message의 requestPro가 호출된다.
	    } catch(Throwable e) { 
	    	throw new ServletException(e); 
	    } 
	    RequestDispatcher dispatcher = request.getRequestDispatcher(view + ".jsp");
	    dispatcher.forward(request, response);
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		request.setCharacterEncoding("utf-8");
    		doGet(request, response);
	}
}