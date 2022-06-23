package kr.co.ezenac.videoInfo;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.ezenac.category.CategoryDAO;
import kr.co.ezenac.category.CategoryVO;

public class VideoInfoDAO {
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
	
	public List<VideoInfoVO> selectRecentVideo() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.selectRecentVideo");
		
		return list;
	}
	
	public List<VideoInfoVO> seriesTop10List() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.selectSeriesTop10List");
		
		return list;
	}

	public List<VideoInfoVO> movieTop10List() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.selectMovieTop10List");
		
		return list;
	}

	public List<VideoInfoVO> newContentsList() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.newContentsList");
		
		return list;
	}

	public List<VideoInfoVO> likeVideoList(String like1, String like2, String like3) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		Map likeMap = new HashMap();
		
		likeMap.put("like1", like1);
		likeMap.put("like2", like2);
		likeMap.put("like3", like3);
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.likeVideoList", likeMap);
		
		return list;
	}
	
	public List<VideoInfoVO> watchingVideoList(int profileRegisterNum) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.watchingVideoList", profileRegisterNum);
		
		return list;
	}

	public List<VideoInfoVO> movieWatchingList(int profileRegisterNum) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.movieWatchingVideoList", profileRegisterNum);
		
		return list;
	}

	public List<VideoInfoVO> recentMovieList() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.recentMovieList");
		
		return list;
	}

	public List<VideoInfoVO> finWatchingVideoList(int profileRegisterNum) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.finWatchingVideoList", profileRegisterNum);
		
		return list;
	}

	public Map selectModalVideo(String imageFile) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> category = new HashMap<String, Object>();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.modalVideo", imageFile);
		data.put("modalVideo", list);
		
		String categoryno = list.get(0).getCategoryNo();
		String[] categorynoList = categoryno.split("_");
		category.put("categoryno", categorynoList);
		
		List<String> categoryName = session.selectList("mapper.category.selectCategoryName", category);
		data.put("categoryName", categoryName);
		
		String likecategoryno = list.get(0).getLikeCategoryNo();
		String[] likecategorynoList = likecategoryno.split("_");
		category.put("likecategoryno", likecategorynoList);
		
		List<String> likecategoryName = session.selectList("mapper.likeCategory.selectLikeCategoryName", category);
		data.put("likeCategoryName", likecategoryName);
		
		return data;
	}
	
	public Map movieCategoryList() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		Map data = new HashMap();
		//List videoData = new ArrayList();
		
		CategoryDAO categoryDAO = new CategoryDAO();
		List<CategoryVO> category = categoryDAO.selectAllNo();
		data.put("category", category);
		
		List test = new ArrayList();
		
		for(int i=0;i<category.size();i++) {
			int categoryNo = category.get(i).getCategoryNo();
		
			List<VideoInfoVO> list = session.selectList("mapper.videoInfo.movieCategoryList", categoryNo);
		  
			test.add(list);
		}
		
		data.put("movieCategoryList", test);
		
		return data;
	}

	public List<VideoInfoVO> openDate(int plus) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		Map date = new HashMap();
		
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH) + plus + 1;
		
		String set_year = year + "";
		String set_month = month + "";
		
		if(Integer.parseInt(set_month) < 10) {
			set_month = "0" + set_month;
		}
		
		String currentStartDate = set_year + set_month + "01";
		String currentEndDate = set_year + set_month + "31";
		
		date.put("currentStartDate", currentStartDate);
		date.put("currentEndDate", currentEndDate);
		
		//System.out.println("시작 : " + currentStartDate + ", 끝 : " + currentEndDate);
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.openDateList", date);
		
		return list;
	}

	public List<VideoInfoVO> testList(String category) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		VideoInfoDAO videoInfoDAO = new VideoInfoDAO();
		CategoryDAO categoryDAO = new CategoryDAO();
		int categoryNo = categoryDAO.selectNo(category).get(0).getCategoryNo();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.movieCategoryList", categoryNo);
		
		return list;
	}

	public List<VideoInfoVO> searchList(String video) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.searchList", video);
		
		return list;
	}

	public List<VideoInfoVO> selectMovieList(String category, String rating) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		CategoryDAO categoryDAO = new CategoryDAO();
		List<CategoryVO> categoryList = categoryDAO.selectNo(category);
		
		
		
		if(categoryList.isEmpty()) {
			return null;
		}
		
		int categoryNo = categoryList.get(0).getCategoryNo();
		
		
		System.out.println("카테고리 : " + categoryNo);
		
		/*
		 * System.out.println(category + ", " + rating + ", " + categoryNo);
		 * 
		 * //List<VideoInfoVO> list = new ArrayList<VideoInfoVO>();
		 * 
		 * if(rating.equals("추천순▼")) { String str = null; List<String> videoNum =
		 * session.selectList("mapper.videoInfo.selectMovieList1", categoryNo); for(int
		 * i=0;i<videoNum.size();i++) { System.out.println(videoNum.get(i).toString());
		 * //str[i] = videoNum.get(i).VIDEONUM; } } else if(rating.equals("평균평점 순▼")) {
		 * //list = session.selectList("mapper.videoInfo.selectMovieList2", categoryNo);
		 * }
		 */
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.selectMovieList3", categoryNo);
		
		//System.out.println("test : " + list);
		
		return list;
	}
	
	public List<VideoInfoVO> selectAllVideo() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.selectAllVideo");
		
		return list;
	}

	public List<VideoInfoVO> recentSeriesList() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.recentSeriesList");
		
		return list;
	}

	public List<VideoInfoVO> seriesWatchingList(int profileRegisterNum) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.seriesWatchingVideoList", profileRegisterNum);
		
		return list;
	}

	public Map seriesCategoryList() {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		Map data = new HashMap();
		
		CategoryDAO categoryDAO = new CategoryDAO();
		List<CategoryVO> category = categoryDAO.selectAllNo();
		data.put("category", category);
		
		List test = new ArrayList();
		
		for(int i=0;i<category.size();i++) {
			int categoryNo = category.get(i).getCategoryNo();
		
			List<VideoInfoVO> list = session.selectList("mapper.videoInfo.seriesCategoryList", categoryNo);
		  
			test.add(list);
		}
		
		data.put("seriesCategoryList", test);
		
		return data;
	}

	public List<VideoInfoVO> selectSeriesList(String category, String rating) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		CategoryDAO categoryDAO = new CategoryDAO();
		List<CategoryVO> categoryList = categoryDAO.selectNo(category);
		
		
		
		if(categoryList.isEmpty()) {
			return null;
		}
		
		int categoryNo = categoryList.get(0).getCategoryNo();
		
		
		System.out.println("카테고리 : " + categoryNo);
		
		/*
		 * System.out.println(category + ", " + rating + ", " + categoryNo);
		 * 
		 * //List<VideoInfoVO> list = new ArrayList<VideoInfoVO>();
		 * 
		 * if(rating.equals("추천순▼")) { String str = null; List<String> videoNum =
		 * session.selectList("mapper.videoInfo.selectMovieList1", categoryNo); for(int
		 * i=0;i<videoNum.size();i++) { System.out.println(videoNum.get(i).toString());
		 * //str[i] = videoNum.get(i).VIDEONUM; } } else if(rating.equals("평균평점 순▼")) {
		 * //list = session.selectList("mapper.videoInfo.selectMovieList2", categoryNo);
		 * }
		 */
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.selectSeriesList", categoryNo);
		
		//System.out.println("test : " + list);
		
		return list;
	}

	public Map selectContent(Object videoNum) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		Map parameter = new HashMap();
		parameter.put("select", videoNum);
		
		Map select = session.selectOne("mapper.videoInfo.selectByVideoNum", parameter);
		
		//CATEGORYNO : "1_10_14"
		String categoryno = select.get("CATEGORYNO").toString();
		String[] categorynoList = categoryno.split("_");
		parameter.put("categoryno", categorynoList);
		
		List<String> categoryName = session.selectList("mapper.category.selectCategoryName", parameter);
		select.put("categoryName", categoryName);
		
		/*
		 * String likeCategoryno = select.get("LIKECATEGORYNO").toString(); String[]
		 * likeCategorynoList = likeCategoryno.split("_");
		 * parameter.put("likeCategoryno", likeCategorynoList);
		 * 
		 * List<String> likeCategorynoName =
		 * session.selectList("mapper.likeCategory.selectLikeCategoryName", parameter);
		 * select.put("likeCategoryno", likeCategorynoName);
		 */
		
		return select;
	}

	public List<VideoInfoVO> recommendList(Object videoNum) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		Map parameter = new HashMap();
		parameter.put("select", videoNum);
		
		Map select = session.selectOne("mapper.videoInfo.selectByVideoNum", parameter);
		
		String categoryno = select.get("CATEGORYNO").toString();
		String[] categorynoList = categoryno.split("_");
		String category1 = categorynoList[1];
		String category2 = categorynoList[2];
		
		System.out.println("category : " + category1 + ", " + category2);
		
		parameter.put("category1", category1);
		parameter.put("category2", category2);
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.recommendList", parameter);
		
		return list;
	}

	public List<VideoInfoVO> playVideo(int videoNum) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		List<VideoInfoVO> list = session.selectList("mapper.videoInfo.playVideo", videoNum);
		
		return list;
	}
}
