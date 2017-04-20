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

public class LanguageDao {
	private static LanguageDao instance = new LanguageDao();
	  private LanguageDao() {}
	  public static LanguageDao getInstance() {
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
	  
	public Language getNative_lang(String id) {
		// TODO Auto-generated method stub
		return (Language) session.selectOne("languagens.getNative_lang", id);
	}
	
	public List<Language> getInter_lang(String id) {
		List<Language> list = session.selectList("languagens.getInter_lang", id);
		return list;
	}
	  
	public List<Language> languageList() {
		// TODO Auto-generated method stub
		return session.selectList("languagens.list");
	}
	
	public String selectLanguage(int lang_no) {
		// TODO Auto-generated method stub
		return (String) session.selectOne("languagens.selectLang",lang_no);
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
