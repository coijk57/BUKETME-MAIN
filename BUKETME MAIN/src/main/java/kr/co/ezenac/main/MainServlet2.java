package kr.co.ezenac.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ezenac.likeMedia.LikeMediaDAO;
import kr.co.ezenac.likeMedia.LikeMediaVO;
import kr.co.ezenac.videoInfo.VideoInfoDAO;
import kr.co.ezenac.videoInfo.VideoInfoVO;

@WebServlet("/MainDataLoad.do")
public class MainServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MainServlet2() {
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
		
		session.setAttribute("videoReload", true);
		
		int profileRegisterNum = (int)session.getAttribute("profileRegisterNum");
		
		LikeMediaDAO likeDAO = new LikeMediaDAO();
		List<LikeMediaVO> likeList = likeDAO.selectLikeList(profileRegisterNum);
		
		String[] like = (likeList.get(0).getLikeCategoryNo()).split("_");
		
		VideoInfoDAO videoDAO = new VideoInfoDAO();
		List<VideoInfoVO> videoList = videoDAO.selectRecentVideo();
		List<VideoInfoVO> seriesTop10List = videoDAO.seriesTop10List();
		List<VideoInfoVO> movieTop10List = videoDAO.movieTop10List();
		List<VideoInfoVO> newContentsList = videoDAO.newContentsList();
		List<VideoInfoVO> likeVideoList = videoDAO.likeVideoList(like[0], like[1], like[2]);
		List<VideoInfoVO> watchingList = videoDAO.watchingVideoList(profileRegisterNum);
		
		request.getSession().setAttribute("recentVideo", videoList);
		request.getSession().setAttribute("seriesTop10List", seriesTop10List);
		request.getSession().setAttribute("movieTop10List", movieTop10List);
		request.getSession().setAttribute("newContentsList", newContentsList);
		request.getSession().setAttribute("likeVideoList", likeVideoList);
		request.getSession().setAttribute("watchingList", watchingList);
		
		System.out.println("reload video");
		
		response.sendRedirect(request.getContextPath() +"/UserMain/usermain.jsp");
		
	}
}
