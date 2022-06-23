package kr.co.ezenac.contentDetail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import kr.co.ezenac.videoInfo.VideoInfoDAO;

@WebServlet("/ContentDetail.do")
public class ContentDetailSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final PrintWriter Script = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf8");

		HttpSession session = request.getSession(); 
		
		//session.setAttribute("videoNum", 1);
		
		 String select = request.getParameter("select"); 
		
		//Object select = session.getAttribute("videoNum");
		
		ContentDetailDAO ContentDetailDAO =new ContentDetailDAO();
		VideoInfoDAO videoInfoDAO = new VideoInfoDAO();
		
		Map data = videoInfoDAO.selectContent(select);
		
		
		JSONObject jsonData = new JSONObject(data);
		
		response.getWriter().write(jsonData.toJSONString());
	}
}








