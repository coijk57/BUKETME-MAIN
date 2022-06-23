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

@WebServlet("/userRating.do")
public class userRatingSevlet extends HttpServlet {
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
		
		String likeint = request.getParameter("like");
		
		userRatingDAO userRatingDAO =new userRatingDAO();
		
		//좋아요
		Map< String, Object > likeMap = new HashMap<>();
		likeMap.put("PROFILEREGISTERNUM", PROFILEREGISTERNUM);
		likeMap.put("VIDEONUM", VIDEONUM);
		likeMap.put("likeint", likeint);
		
		System.out.println("PROFILEREGISTERNUM : " + PROFILEREGISTERNUM);
		System.out.println("VIDEONUM : " + VIDEONUM);
		System.out.println("likeint : " + likeint);
		
		int likeResult = userRatingDAO.likeMap(likeMap);
			
		System.out.println("likeresult : " + likeResult);
		
		
		if (likeResult == 0)
		{
			// 비정상 & 오류
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('이미 추천 되셨습니다')");
			script.println("history.back()");
			script.println("</script>");
			
		}
		else
		{
			// 정상 프로세스
			PrintWriter script = response.getWriter();
			
			System.out.println("비정상입니다.");
		}
		
		
		//String hate = request.getParameter("hate");
		
		
	}
}