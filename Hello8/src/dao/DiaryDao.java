package dao;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DiaryDao {
	private static DiaryDao instance = new DiaryDao();

	private DiaryDao() {

	}
	public static SqlSession session;
	static {
		try{
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMapper.openSession(true);
			reader.close();
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
