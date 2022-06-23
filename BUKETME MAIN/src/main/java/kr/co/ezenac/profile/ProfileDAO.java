package kr.co.ezenac.profile;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.ezenac.orm04.MemberDAO;

public class ProfileDAO {
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
	
	public int selectMaxProfileNum() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		int maxid = session.selectOne("mapper.profile.selectMaxProfileNum");
		
		return maxid;
	}
	
	public List<ProfileVO> profileSelect(String email) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		MemberDAO memDAO = new MemberDAO();
		
		int registerNum = memDAO.findRegisterNum(email);
		
		List<ProfileVO> list = session.selectList("mapper.profile.selectProfile", registerNum);
		
		return list;
	}
	
	public List<ProfileVO> profileNumSelect(int profileRegisterNum) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<ProfileVO> list = session.selectList("mapper.profile.selectProfileNum", profileRegisterNum);
		
		return list;
	}

	public int insertProfile(ProfileVO profileVO) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		int result = session.insert("mapper.profile.insertProfile", profileVO);
		session.commit();
		
		return result;
	}
}
