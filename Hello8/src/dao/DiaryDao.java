package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Diary;
import model.Language;
import model.Range;
import model.Statistics;

public class DiaryDao {
	private static DiaryDao instance = new DiaryDao();

	private DiaryDao() {

	}

	public static DiaryDao getInstance() {
		return instance;
	}

	public static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMapper.openSession(true);
			reader.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public int getTotal() {
		int result = (int) session.selectOne("diaryns.getTotal");
		return result;
	}

	public int getTotal2(int lang_no) {
		int result = (int) session.selectOne("diaryns.getTotal2", lang_no);
		return result;
	}

	public int pbGetTotal() {
		int result = (int) session.selectOne("diaryns.pbGetTotal");
		return result;
	}

	public int pbGetTotal2(int lang_no) {
		int result = (int) session.selectOne("diaryns.pbGetTotal2", lang_no);
		return result;
	}
	public List<Diary> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);

		return session.selectList("diaryns.list", hm);

	}

	public List<Diary> pbList(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);

		return session.selectList("diaryns.publiclist", hm);

	}

	public List<Diary> langList(int startRow, int endRow, int lang_no) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("lang_no", lang_no);

		return session.selectList("diaryns.list2", hm);
	}

	public List<Diary> pbLangList(int startRow, int endRow, int lang_no) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("lang_no", lang_no);

		return session.selectList("diaryns.publiclist2", hm);
	}

	public Diary select(int dno) {
		return (Diary) session.selectOne("diaryns.select", dno);
	}

	public int update(Diary diary) {
		return session.update("diaryns.update", diary);
	}

	public int delete(int dno) {
		return session.update("diaryns.delete", dno);
	}

	public int insert(Diary diary) {
		return session.insert("diaryns.insert", diary);
	}

	public int insertNo() {
		return (int) session.selectOne("diaryns.insertNo");
	}

	public void dreadCountUpdate(int dno) {
		session.update("diaryns.dreadCountUpdate", dno);
	}

	public List<Language> everyLang() {
		return session.selectList("languagens.everylang");
	}

	public List<Range> everyRange() {
		return session.selectList("rangens.everyRange");
	}

	public int getTotalById(String id) {
		return (int) session.selectOne("diaryns.getTotalById", id);
	}

	public List<Diary> popular() {
		return session.selectList("diaryns.popular");
	}

	public List<Statistics> statistics() {
		return session.selectList("statisticsns.statistics");
	}

	public String getLangName(int lang_no) {

		return (String) session.selectOne("diaryns.getLangName", lang_no);

	}

	public String checkId(int dno) {
		return (String) session.selectOne("diaryns.checkId", dno);
	}

	public String checkNickname(String id) {
		return (String) session.selectOne("diaryns.checkNickname", id);
	}

}
