package kr.co.ezenac.userRating;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class userRatingDAO {
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



	
//	public int likeMap(Map<String, Object> likeMap) {
//		
//			conn = this.getConnection();
//			StringBuffer query = new StringBuffer();
//			
//			int PROFILEREGISTERNUM = (int) likeMap.get("profileregisternum");
//			int videonum = (int) likeMap.get("videonum");
//			int likeint = (int) likeMap.get("like");
//			
//			int rst = -1;
//			
//			try {
//				
////				PROFILEREGISTERNUM = (int) likeMap.get("profileregisternum");
////				videonum = (int) likeMap.get("videonum");
////				likeint = (int) likeMap.get("like");
//				
//				// 1. USERRATING 테이블 조회해서 있는지 없는지 확인
//				query.append("SELECT PROFILEREGISTERNUM,VIDEONUM,LIKES FROM USERRATING WHERE (PROFILEREGISTERNUM = ? AND VIDEONUM = ?  AND LIKES = ?)");
//				pstmt = conn.prepareStatement(query.toString());
//				
//				pstmt.setInt(1, PROFILEREGISTERNUM);
//				pstmt.setInt(2, videonum);
//				pstmt.setInt(3, likeint);
//				
//				rs = pstmt.executeQuery();
//
//				System.out.println(rs);
//				
//				// 2. 있으면 돌려보내기(1), 없으면 LIKE 돌려 올리기(1)
//				if (rs == null)
//				{
//					
//					
//					if (rs != null)
//					{
//						// 없으면 저장 - > 정상 저장 되었으면
//						query.append("UPDATE USERRATING SET LIKES = LIKES + 1 WHERE (PROFILEREGISTERNUM = ? AND VIDEONUM = ?)");
//						
//						pstmt = conn.prepareStatement(query.toString());
//						pstmt.setInt(1, PROFILEREGISTERNUM);
//						pstmt.setInt(2, videonum);
//						
//						rs = pstmt.executeQuery();
//						
//						rst = 2;
//					}
//					else
//					{
//						// 정상적으로 저장이 안됨
//						// => 디비에 값이 중복 되거나
//						rst = -1;
//					}
//				}
//				else
//				{
//					rst = 1;
//				}
//				
//			} catch (SQLException e) {
//				e.printStackTrace();
//			} finally {
//				this.close(conn, pstmt, null);
//			}
//			return rst;
//		}
	
	
	
	
	//좋아요 1 값 내리고 올리고 인서트 까지
	public int likeMap(Map<String, Object> likeMap) {
		
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		Object PROFILEREGISTERNUM = likeMap.get("PROFILEREGISTERNUM");
		Object VIDEONUM = likeMap.get("VIDEONUM");
		Object LIKES = likeMap.get("likeint");
		
		Map likeHashMap = new HashMap();
		
		likeHashMap.put("PROFILEREGISTERNUM", PROFILEREGISTERNUM);
		likeHashMap.put("VIDEONUM", VIDEONUM);
		likeHashMap.put("LIKES", LIKES);
		
		session.update("mapper.userRating.mergeContentDetailLike", likeHashMap);
		session.commit();
		
		int rst = 0;
		return rst;
	}
	
	
	
	//싫어요 1 값 내리고 올리고 인서트 까지
	public int hateMap(Map<String, Object> hateMap) {
		
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		Object PROFILEREGISTERNUM = hateMap.get("PROFILEREGISTERNUM");
		Object VIDEONUM = hateMap.get("VIDEONUM");
		Object BAD = hateMap.get("BAD");
		
		Map hateHashMap = new HashMap();
		
		hateHashMap.put("PROFILEREGISTERNUM", PROFILEREGISTERNUM);
		hateHashMap.put("VIDEONUM", VIDEONUM);
		hateHashMap.put("BAD", BAD);
		
		session.update("mapper.userRating.mergeContentDetailBAD", hateHashMap);
		session.commit();
		
		int rst = 1;
		return rst;
	}
	
	//싫어요 1 값 내리고 올리고 인서트 까지
		public int starMap(Map<String, Object> starMap) {
			
			sqlMapper = getInstance();
			SqlSession session = sqlMapper.openSession();
			
			Object PROFILEREGISTERNUM = starMap.get("PROFILEREGISTERNUM");
			Object VIDEONUM = starMap.get("VIDEONUM");
			Object RATING = starMap.get("RATING");
			
			Map starHashMap = new HashMap();
			
			starHashMap.put("PROFILEREGISTERNUM", PROFILEREGISTERNUM);
			starHashMap.put("VIDEONUM", VIDEONUM);
			
			Map starSelect = session.selectOne("mapper.userRating.selectStar", starHashMap);
			
//			session.update("mapper.userRating.mergeContentDetailRATING", starHashMap);
//			session.commit();
			int rst = 2;
			
			if (starSelect != null)
			{
				/*
				 * starHashMap.put("PROFILEREGISTERNUM", PROFILEREGISTERNUM);
				 * starHashMap.put("VIDEONUM", VIDEONUM);
				 */
				starHashMap.put("RATING", RATING);
				
				// 있으면 좋아요 -1 업데이트
				int	likeSelect2 = session.update("mapper.userRating.updateStar", starHashMap);
				session.commit();
				
				int	rst2 = 3;
			}
			
			 else {
				 
					/*
					 * starHashMap.put("PROFILEREGISTERNUM", PROFILEREGISTERNUM);
					 * starHashMap.put("VIDEONUM", VIDEONUM);
					 */
				starHashMap.put("RATING", RATING);
				
				// 없으면 레지스트,비디오,좋아요 1씩 올리기
				int likeSelect3 = session.update("mapper.userRating.mergeContentDetailRATING", starHashMap);
				session.commit();
				 
				 int rst3 = 4;
				}
			 
		
			return rst;
		}
	
	
	
	
	
	
}
