package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Gathering_Reply;

public class Gathering_ReplyDao {
	private static Gathering_ReplyDao instance = new Gathering_ReplyDao();

	private Gathering_ReplyDao() {

	}

	public static Gathering_ReplyDao getInstance() {
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
		return (int) session.selectOne("gathering_replyns.getTotal");
	}

	public List<Gathering_Reply> list(int gno) {
		return session.selectList("gathering_replyns.list", gno);
	}

	public int insert(Gathering_Reply gathering_reply) {
		return session.insert("gathering_replyns.insert", gathering_reply);
	}

	public int insertNo() {
		return (int) session.selectOne("gathering_replyns.insertNo");
	}

	public void UpdateReply(Gathering_Reply gathering_reply) {
		session.update("gathering_replyns.UpdateReply", gathering_reply);
	}

	public void DeleteReply(int grno) {
		session.update("gathering_replyns.DeleteReply", grno);
	}

	public Gathering_Reply select(int grno) {
		return (Gathering_Reply) session.selectOne("gathering_replyns.select", grno);
	}

	public int sqlStep(Gathering_Reply gathering_reply) {
		return (int) session.selectOne("gathering_replyns.sqlStep", gathering_reply);
	}

	/*
	 * public List<Gathering_Reply> list(int startRow, int endRow) {
	 * HashMap<String, Integer> hm = new HashMap<>(); hm.put("startRow",
	 * startRow); hm.put("endRow", endRow);
	 * 
	 * return session.selectList("gathering_replyns.list", hm); }
	 */
}
