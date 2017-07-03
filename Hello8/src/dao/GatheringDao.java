package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Gathering;
import model.Language;

public class GatheringDao {
	private static GatheringDao instance = new GatheringDao();

	private GatheringDao() {

	}

	public static GatheringDao getInstance() {
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
		return (int) session.selectOne("gatheringns.getTotal");
	}

	public List<Gathering> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);

		return session.selectList("gatheringns.list", hm);
	}

	public List<Language> langlist(String id) {
		return session.selectList("languagens.langlist", id);
	}

	public int insert(Gathering gathering) {
		return session.insert("gatheringns.insert", gathering);
	}

	public int insertNo() {
		return (int) session.selectOne("gatheringns.insertNo");
	}

	// 내용 수정
	public int contentUpdate(Gathering gathering) {
		int result = session.update("gatheringns.contentUpdate", gathering);
		return result;
	}

	/*
	 * // 업데이트 폼에 필요한 애들을 부르는 것 public Gathering selectContentforUpdate(String
	 * id) { return (Gathering)
	 * session.selectOne("gatheringns.selectContentforUpdate", id); }
	 */

	// content조회할때, content, update에 다 사용
	public Gathering select(int gno) {
		return (Gathering) session.selectOne("gatheringns.select", gno);
	}

	// content조회 시 조회수 올리기
	public void greadCountUpdate(int gno) {
		session.update("gatheringns.greadCountUpdate", gno);
	}

	public String checkId(int gno) {
		return (String) session.selectOne("gatheringns.checkId", gno);
	}

	public int contentDelete(int gno) {
		session.update("gatheringns.contentDeleteReply", gno);
		return session.update("gatheringns.contentDelete", gno);
	}

	public List<Language> everyLang() {
		return session.selectList("languagens.list");
	}

	public List<Gathering> list2(int startRow, int endRow, Integer lang_no) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("lang_no", lang_no);

		return session.selectList("gatheringns.list2", hm);
	}

	public void deletePGathering() {
		session.update("gatheringns.deletePGathering");
	}

	public int getTotal2(int lang_no) {
		return (int) session.selectOne("gatheringns.getTotal2", lang_no);
	}

	public String getLangName(int lang_no) {
		return (String) session.selectOne("gatheringns.getLangName", lang_no);
	}

	public List<Gathering> theList(int year, int month) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("year", year);
		hm.put("month", month);

		return session.selectList("gatheringns.allList", hm);
	}

	public int getTotalById(String id) {
		// TODO Auto-generated method stub
		return (int) session.selectOne("gatheringns.getTotalById", id);
	}

	public String checkNickname(String id) {
		return (String) session.selectOne("gatheringns.checkNickname", id);
	}

	// 날짜가 지난 리스트까지 다 받아서 달력에 뿌려주자!
	public List<Gathering> selectGathering() {
		return session.selectList("gatheringns.selectGathering");
	}
}
