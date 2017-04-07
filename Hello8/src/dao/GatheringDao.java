package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Gathering;
import model.GetLang;

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
		int result = (int) session.selectOne("gatheringns.getTotal");
		System.out.println(result);
		return result;
	}

	public List<Gathering> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);

		return session.selectList("gatheringns.list", hm);
	}

	public List<GetLang> langlist(String id) {
		return session.selectList("getLangs.lang", id);
	}

	public int insert(Gathering gathering) {
		return session.insert("gatheringns.insert", gathering);
	}

	public int insertNo() {
		return (int) session.selectOne("gatheringns.insertNo");
	}

	public int contentUpdate(Gathering gathering) {
		return session.update("gatheringns.contentUpdate", gathering);
	}

	public Gathering selectContentforUpdate(String id) {
		return (Gathering) session.selectOne("gatheringns.selectContentforUpdate", id);
	}

	// content조회할때
	public Gathering select(int gno) {
		return (Gathering) session.selectOne("gatheringns.select", gno);
	}

	// content조회 시 조회수 올리기
	public void greadCountUpdate(int gno) {
		session.update("gatheringns.greadCountUpdate", gno);
	}

}
