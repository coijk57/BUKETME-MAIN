package kr.co.ezenac.videoRecord;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class VideoRecordDAO {
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
	
	public int selectMaxRecordNum() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		int maxid = session.selectOne("mapper.videoRecord.selectMaxRecordNum");
		
		return maxid;
	}

	public void playRecord(Map data) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		//System.out.println("프로필 : " + data.get("profileNum") + ", 비디오 : " + data.get("videoNum") +", 재생시간 : " + data.get("playTime"));
		List<VideoRecordVO> recordCheck = recordCheck(data);
		
		if(recordCheck.size() == 0) {
			int recordNum = selectMaxRecordNum();
			data.put("recordNum", recordNum);
			
			session.insert("mapper.videoRecord.insertRecord", data);
			session.commit();
			System.out.println("기록 생성");
		}
		else {
			session.update("mapper.videoRecord.updateRecord", data);
			session.commit();
			System.out.println("기록 업데이트");
		}
	}

	public List<VideoRecordVO> recordCheck(Map data) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoRecordVO> list = session.selectList("mapper.videoRecord.recordCheck", data);
		
		return list;
	}
}
