package kr.co.ezenac.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ezenac.category.CategoryDAO;
import kr.co.ezenac.category.CategoryVO;
import kr.co.ezenac.profile.ProfileDAO;
import kr.co.ezenac.profile.ProfileVO;
import kr.co.ezenac.videoInfo.VideoInfoDAO;
import kr.co.ezenac.videoInfo.VideoInfoVO;

@WebServlet("/MovieDataLoad.do")
public class MainServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MainServlet3() {
        super();
    }

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
			List<VideoInfoVO> recentMovieList = videoDAO.recentMovieList();
			List<VideoInfoVO> movieWatchingList = videoDAO.movieWatchingList(profileRegisterNum);
			Map movieCategoryList = videoDAO.movieCategoryList();
			
			//System.out.println("test0 : " + movieCategoryList.get("movieCategoryList"));
			
			
			request.getSession().setAttribute("recentMovieList", recentMovieList);
			request.getSession().setAttribute("movieWatchingList", movieWatchingList);
			request.getSession().setAttribute("movieCategoryList", movieCategoryList);
			
			System.out.println("reload movie");
			
			response.sendRedirect(request.getContextPath() +"/UserMain/movie.jsp");
		}
	}
}
