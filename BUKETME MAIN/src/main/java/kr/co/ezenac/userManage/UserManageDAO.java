package kr.co.ezenac.userManage;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.ezenac.orm04.MemberDAO;
import kr.co.ezenac.orm04.MemberVO;

public class UserManageDAO {
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

	public List<UserManageVO> selectAllManage() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<UserManageVO> list = session.selectList("mapper.userManage.selectAllManage");
		
		return list;
	}

	public void subCancel(String email) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		MemberDAO memberDAO = new MemberDAO();
		int registerNum = memberDAO.findRegisterNum(email);
		
		System.out.println("registerNum : " + registerNum);
		
		session.update("mapper.userManage.subCancel", registerNum);
		
		session.commit();
	}
}
