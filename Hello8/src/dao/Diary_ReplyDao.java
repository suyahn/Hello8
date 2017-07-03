package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Diary_Reply;

public class Diary_ReplyDao {
	private static Diary_ReplyDao instance = new Diary_ReplyDao();

	private Diary_ReplyDao() {

	}

	public static Diary_ReplyDao getInstance() {
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

	public List<Diary_Reply> list(int dno) {

		return session.selectList("diary_replyns.list",dno);

	}

	public int insert(Diary_Reply diary_reply) {
		return session.insert("diary_replyns.insert", diary_reply);

	}

	public Diary_Reply select(int drno) {
		return (Diary_Reply) session.selectOne("diary_replyns.select", drno);
	}

	public int update(Diary_Reply diary_reply) {
		return session.update("diary_replyns.update", diary_reply);
	}

	public int delete(int drno) {
		return session.update("diary_replyns.delete", drno);
	}

	public int insertNo() {
		return (int) session.selectOne("diary_replyns.insertNo");
	}

	public int getTotal(){
		int result = (int) session.selectOne("diary_replyns.getTotal");
		return result;
		
	}
}
