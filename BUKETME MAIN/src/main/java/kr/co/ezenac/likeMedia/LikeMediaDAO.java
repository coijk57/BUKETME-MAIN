package kr.co.ezenac.likeMedia;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.ezenac.profile.ProfileVO;

public class LikeMediaDAO {
public static SqlSessionFactory sqlMapper = null;
	
	public static SqlSessionFactory getInstance() {
		if(sqlMapper == null) {
			String resource = "mybatis/SqlMapConfig.xml";	// 설정 정보를 읽은 후 DB와의 연동준비함.
			try {
				Reader reader = Resources.getResourceAsReader(resource);
				// 마이바티스를 이용하는 sqlMapper 객체를 가져옴
				sqlMapper = new SqlSessionFactoryBuilder().build(reader);
				reader.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return sqlMapper;
	}

	public List<LikeMediaVO> selectLikeList(int profileRegisterNum) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<LikeMediaVO> list = session.selectList("mapper.likeMedia.selectLikeList", profileRegisterNum);
		
		return list;
	}
}
