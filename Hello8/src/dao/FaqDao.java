package dao;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FaqDao {
	private static FaqDao instance = new FaqDao();
	  private FaqDao() {}
	  public static FaqDao getInstance() {
		  return instance;
	  }
	  private static SqlSession session;
	  static {
	    try {
	      Reader reader = 
	    	Resources.getResourceAsReader("configuration.xml");
	      SqlSessionFactory sqlMapper = 
	    		 new SqlSessionFactoryBuilder().build(reader); 
	      session = sqlMapper.openSession(true);
	      reader.close(); 
	    } catch (IOException e) {
	      System.out.println(e.getMessage());
	    }
	  }
}