package kr.co.ezenac.contentDetail;

import java.io.IOException;
import java.util.HashMap;
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
import kr.co.ezenac.videoRecord.VideoRecordDAO;
import kr.co.ezenac.videoRecord.VideoRecordVO;

@WebServlet("/PlayContent.do")
public class PlayContent extends HttpServlet {
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
		
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html;charset=utf-8");
		
		int videoNum = Integer.parseInt(request.getParameter("videoNum"));
		
		Map data = new HashMap();
		
		Object profileNum = session.getAttribute("profileRegisterNum");
		
		data.put("profileNum", profileNum);
		data.put("videoNum", videoNum);
		
		System.out.println("videoNum : " + videoNum);
		
		VideoInfoDAO videoInfoDAO = new VideoInfoDAO();
		List<VideoInfoVO> play = videoInfoDAO.playVideo(videoNum);
		
		VideoRecordDAO videoRecordDAO = new VideoRecordDAO();
		List<VideoRecordVO> recordList = videoRecordDAO.recordCheck(data);
		
		request.getSession().setAttribute("play", play);
		request.getSession().setAttribute("recordList", recordList);
	}
}
