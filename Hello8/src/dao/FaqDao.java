package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Faq;
import model.Notice;

public class FaqDao {
	private static FaqDao instance = new FaqDao();

	private FaqDao() {
	}

	public static FaqDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMapper.openSession(true);
			reader.close();
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}

	public int getTotal() { // total을 얻어와
		return (int) session.selectOne("faqns.getTotal");
	}

	public List<Faq> list(int startRow, int endRow) {
		HashMap<String, Integer> hashMap = new HashMap<>();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		return session.selectList("faqns.list", hashMap);
	}

	public List<Faq> list() {
		return session.selectList("faqns.userlist");

	}

	public Faq select(int fno) {
		return (Faq) session.selectOne("faqns.select", fno);

	}

	public int getMaxFno() {
		return ((int) session.selectOne("faqns.getMaxFno"));

	}

	public int insert(Faq faq) {
		return session.insert("faqns.insert", faq);
	}

	public int update(Faq faq) {
		return session.update("faqns.update", faq);

	}

	public int delete(int fno) {
		return session.update("faqns.delete", fno);
	}
}