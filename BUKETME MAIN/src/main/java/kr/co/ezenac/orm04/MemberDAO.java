package kr.co.ezenac.orm04;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {

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
	
	
	public int selectMaxRegisterNum() {
		sqlMapper = getInstance();
		// 실제 member.xml의 SQL문을 호출하는 데 사용되는 SqlSession 객체를 가져옴
		SqlSession session = sqlMapper.openSession();
		// 여러 개의 레코드를 조회하므로 selectList() 메서드에 실행하고자하는 SQL문의 id를 인자로 전달함
		int maxid = session.selectOne("mapper.member.selectMaxRegisterNum");
		return maxid;
	}
	
	public boolean isExistsEmail(String email) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		int count = session.selectOne("mapper.member.countByEmail", email);
		if(count >= 1) {
			return true;
		}
		return false;
	}

	public int insertMember(MemberVO memberVO) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		int result = session.insert("mapper.member.insertMember", memberVO);
		session.commit();  // 수동 커밋이므로 반드시 commit() 메서드 호출하여 반영해야함
		return result;
	}
	
	public int updateMembership(int memCode, String email) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		Map updateMap = new HashMap();
		
		updateMap.put("memCode", memCode);
		updateMap.put("email", email);
		
		int result = session.update("mapper.member.updateMember", updateMap);
		session.commit();
		
		return result;
	}
	
	public int findRegisterNum(String email) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		int registerNum = session.selectOne("mapper.member.findRasiterNum", email);
		
		return registerNum;
	}
	
	public List<MemberVO> selectAllUser() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<MemberVO> list = session.selectList("mapper.member.selectAllUser");
		
		return list;
	}
}






















