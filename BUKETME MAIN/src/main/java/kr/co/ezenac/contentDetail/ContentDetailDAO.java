package kr.co.ezenac.contentDetail;

import java.io.IOException;
import java.io.Reader;
import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ContentDetailDAO {

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
	
	public Map selectContent1(String videonum) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		Map parameter = new HashMap();
		parameter.put("select", videonum);
		
		Map select = session.selectOne("mapper.contentDetail.selectcontentDetailAllByVideonum", parameter);
		
		//CATEGORYNO : "1_10_14"
		String categoryno = select.get("CATEGORYNO").toString();
		String[] categorynoList = categoryno.split("_");
		parameter.put("categoryno", categorynoList);
		
		List<String> categoryName = session.selectList("mapper.contentDetail.selectCategoryName",parameter);
		select.put("categoryName", categoryName);
		
		String likeCategoryno = select.get("LIKECATEGORYNO").toString();
		String[] likeCategorynoList = likeCategoryno.split("_");
		parameter.put("likeCategoryno", likeCategorynoList);
		
		List<String> likeCategorynoName = session.selectList("mapper.contentDetail.selectLikecategoryName", parameter);
		select.put("likeCategoryno", likeCategorynoName);
		
		return select;
	}
	

}
