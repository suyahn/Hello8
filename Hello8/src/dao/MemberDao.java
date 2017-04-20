package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Language;
import model.Member;

public class MemberDao {
	private static MemberDao instance = new MemberDao();

	private MemberDao() {
	}

	public static MemberDao getInstance() {
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

	public int loginChk(String id, String password) {
		int result = 0; // 성공 1, password 틀린 경우 0, id 없는 경우 -1

		String dbPass = (String) session.selectOne("memberns.loginChk", id);

		if (dbPass == null || dbPass.equals("")) { // id 없는 경우 -1
			result = -1;
		} else if (password.equals(dbPass)) { // 성공 1
			result = 1;
		} else { // password 틀린 경우 0
			result = 0;
		}
		return result;
	}
	
	public String getNickName(String id) {
		return (String) session.selectOne("memberns.getNickname", id);
	}

	public int getScore(String id) {
		int result = (int) session.selectOne("memberns.getScore", id);
		return result;
	}

	public String getGrade(String id) {
		int grade = (int) session.selectOne("memberns.getGrade", id);
		String strGrade = "";
		
		switch (grade) {
		case 1:
			strGrade = "Professor";
			break;
		case 2:
			strGrade = "University Student";
			break;
		case 3:
			strGrade = "High School Student";
			break;
		case 4:
			strGrade = "Middle School Student";
			break;
		case 5:
			strGrade = "Elementary School Student";
			break;
		case 6:
			strGrade = "Baby";
			break;
		default:
			break;
		}
		
		return strGrade;
	}

	public String findId(String email) {
		return (String) session.selectOne("memberns.findId", email);
	}
	
	public String findPassword(String id, String email) {
		String dbId = (String) session.selectOne("memberns.findId", email);
		String password = "";

		if (id.equals(dbId)) {
			password = (String) session.selectOne("memberns.findPassword", id);
		}
		
		return password;
	}

	public int checkId(String id) {
		// TODO Auto-generated method stub
		int result = 0;
		String str = (String) session.selectOne("memberns.checkId", id);
		if (str != null) { // id 중복된거 있음.
			result = 1;
		}
		return result;
	}
	
	public int checkNickname(String nickname) {
		// TODO Auto-generated method stub
		int result = 0;
		String str = (String) session.selectOne("memberns.checkNickname", nickname);
		if (str != null) { // 중복된거 있음.
			result = 1;
		}
		return result;
	}
	
	public int checkEmail(String email) {
		// TODO Auto-generated method stub
		int result = 0;
		String str = (String) session.selectOne("memberns.checkEmail", email);
		if (str != null) { // 중복된거 있음.
			result = 1;
		}
		return result;
	}

	public int insert(Member member) {
		return (int) session.insert("memberns.insert", member);
	}

	public Member select(String id) {
		Member member = (Member) session.selectOne("memberns.select", id);
		return member;
	}

	public int update(Member member) {
		int result = session.update("memberns.update", member);
		return result;
	}

	public int getTotal() {
		return (int) session.selectOne("memberns.getTotal");
	}

	public List<Member> list(int startRow, int endRow) {
		HashMap<String, Integer> hashMap = new HashMap<>();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		return session.selectList("memberns.list", hashMap);
	}
	
	// public int delete(String id) {
	// int result = session.update("memberns.delete", id);
	// return result;
	// }
	//
}
