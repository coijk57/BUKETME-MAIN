package kr.co.ezenac.main;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ezenac.videoInfo.VideoInfoDAO;
import kr.co.ezenac.videoInfo.VideoInfoVO;

@WebServlet("/SeriesDataLoad.do")
public class MainServlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Object sessionProfile = session.getAttribute("profileRegisterNum");
		
		if(sessionProfile == null) {
			System.out.println("세션 만료");
			session.invalidate();
			response.sendRedirect(request.getContextPath() +"/login/login.jsp");
		}
		else {
			int profileRegisterNum = (int)sessionProfile;
			
			VideoInfoDAO videoDAO = new VideoInfoDAO();
			List<VideoInfoVO> recentSeriesList = videoDAO.recentSeriesList();
			List<VideoInfoVO> seriesWatchingList = videoDAO.seriesWatchingList(profileRegisterNum);
			Map seriesCategoryList = videoDAO.seriesCategoryList();
			
			//System.out.println("test0 : " + movieCategoryList.get("movieCategoryList"));
			
			
			request.getSession().setAttribute("recentSeriesList", recentSeriesList);
			request.getSession().setAttribute("seriesWatchingList", seriesWatchingList);
			request.getSession().setAttribute("seriesCategoryList", seriesCategoryList);
			
			System.out.println("reload series");
			
			response.sendRedirect(request.getContextPath() +"/UserMain/series.jsp");
		}
	}
}
