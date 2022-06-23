package kr.co.ezenac.userRating;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/userRating3.do")
public class userRatingSevlet3 extends HttpServlet {
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
		
		//세션
		HttpSession session = request.getSession(); 
		
		Object PROFILEREGISTERNUM = session.getAttribute("profileRegisterNum");
		Object VIDEONUM = session.getAttribute("videoNum");
		
		String rating = request.getParameter("rating");
		
		System.out.println(PROFILEREGISTERNUM);
		System.out.println(VIDEONUM);
		System.out.println("들어온 스타" + rating);
		
		userRatingDAO userRatingDAO =new userRatingDAO();
		
		//별점
		Map< String, Object > starMap = new HashMap<>();
		
		starMap.put("PROFILEREGISTERNUM", PROFILEREGISTERNUM);
		starMap.put("VIDEONUM", VIDEONUM);
		starMap.put("RATING", rating);
		
		int starResult = userRatingDAO.starMap(starMap);
		
		System.out.println("나간 스타 값" + starResult);
		
		
	}
}