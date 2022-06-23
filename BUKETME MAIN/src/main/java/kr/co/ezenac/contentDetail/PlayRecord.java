package kr.co.ezenac.contentDetail;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ezenac.videoRecord.VideoRecordDAO;

@WebServlet("/PlayRecord.do")
public class PlayRecord extends HttpServlet {
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
		
		Map data = new HashMap();
		
		String playTime = request.getParameter("playTime");
		
		Object profileNum = session.getAttribute("profileRegisterNum");
		Object videoNum = session.getAttribute("videoNum");
		
		data.put("playTime", playTime);
		data.put("profileNum", profileNum);
		data.put("videoNum", videoNum);
		
		//System.out.println("프로필 : " + profileNum + ", 비디오 : " + videoNum +", 재생시간 : " + playTime);
		
		VideoRecordDAO videoRecordDAO = new VideoRecordDAO();
		videoRecordDAO.playRecord(data);
	}
}
