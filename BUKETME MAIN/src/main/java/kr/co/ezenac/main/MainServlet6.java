package kr.co.ezenac.main;

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

@WebServlet("/MyconDataLoad.do")
public class MainServlet6 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MainServlet6() {
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
		
		System.out.println("reload mycon");
		
		VideoInfoDAO videoDAO = new VideoInfoDAO();
		List<VideoInfoVO> finWatchingList = videoDAO.finWatchingVideoList(profileRegisterNum);
		
		request.getSession().setAttribute("finWatchingList", finWatchingList);
		
		response.sendRedirect(request.getContextPath() +"/UserMain/mycon.jsp");
	}

}
