package kr.co.ezenac.contentDetail;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ezenac.videoInfo.VideoInfoDAO;
import kr.co.ezenac.videoInfo.VideoInfoVO;

@WebServlet("/RecommedData.do")
public class RecommedData extends HttpServlet {
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
		
		//session.setAttribute("videoNum", 1);
		
		Object videoNum = session.getAttribute("videoNum");
		
		VideoInfoDAO videoInfoDAO = new VideoInfoDAO();
		List<VideoInfoVO> recommendList = videoInfoDAO.recommendList(videoNum);
		
		System.out.println("recommendList : " + recommendList);
		
		request.getSession().setAttribute("recommendList", recommendList);
		
		response.sendRedirect(request.getContextPath() +"/UserMain/ContentDetail.jsp");
	}
}