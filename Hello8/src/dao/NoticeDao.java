package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;
import model.Notice;

public class NoticeDao {
	private static NoticeDao instance = new NoticeDao();

	private NoticeDao() {
	}

	public static NoticeDao getInstance() {
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

	public int delete(int nno) {
		return session.update("noticens.delete", nno);
	}

	public int update(Notice notice) {
		return session.update("noticens.update", notice);
	}

	public int insert(Notice notice) {
		return session.insert("noticens.insert", notice);
	}

	public int getTotal() {
		return (int) session.selectOne("noticens.getTotal");
	}

	public List<Notice> list(int startRow, int endRow) {
		HashMap<String, Integer> hashMap = new HashMap<>();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		return session.selectList("noticens.list", hashMap);
		// selectlist는 리스트를 가져와서 selectlist라고 함
		// noticens는 notice.xml에서 mapper namespace="noticens"를 지정을 해서 불러온거 근데
		// xml은 query를 불러오라고 명령할 수 있어 그래서 정보를 받아오거나 insert delete update
	}

	public int getMaxNno() {
		return ((int) session.selectOne("noticens.getMaxNno"));
		// selectone은 값을 가져올 때 조회하는 것
		// 공지글 중에 하나를 가져옴 그래서 selectone
		// resulttype은 return(int)의 int

	}

	public void readcountUpdate(int nno) {
		session.update("noticens.readcountUpdate", nno);
		// 숫자를 증감하는 것이기 때문에 update라고 정했다고 함
		// void가 없으면 ex)return(notice) 형변환을 해줘야 하지만 있으면 안해줘도 됨
	}

	public Notice select(int num) {
		return (Notice) session.selectOne("noticens.select", num);
		// void가 없으면 ex)return(notice) 형변환을 해줘야 하지만 있으면 안해줘도 됨
	}
}