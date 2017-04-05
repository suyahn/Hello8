package dao;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Inter_langDao {
	private static Inter_langDao instance = new Inter_langDao();
	  private Inter_langDao() {}
	  public static Inter_langDao getInstance() {
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
