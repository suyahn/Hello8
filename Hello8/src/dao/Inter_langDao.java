package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Inter_lang;
import model.Language;

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
	  
	public int insert(Inter_lang inter_langObj) {
		int result= session.insert("languagens.insert", inter_langObj);
		List<Language> list = session.selectList("languagens.getInter_lang", "hello");
		
		for(Language lg : list) {
			System.out.println("inset한 뒤에 바로! 랭귀지 네임 : " + lg.getLang_name());
		}
		return result;
	}
	
	public int delete(String id) {
		// TODO Auto-generated method stub
		return session.delete("languagens.delete", id);
	}
}
