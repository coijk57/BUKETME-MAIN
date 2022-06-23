package kr.co.ezenac.userRating;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

@WebServlet("/userRating2.do")
public class userRatingSevlet2 extends HttpServlet {
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
				
		String bad = request.getParameter("bad");
		
		userRatingDAO userRatingDAO =new userRatingDAO();
		
		//싫어요
		Map< String, Object > hateMap = new HashMap<>();
		hateMap.put("PROFILEREGISTERNUM", PROFILEREGISTERNUM);
		hateMap.put("VIDEONUM", VIDEONUM);
		hateMap.put("BAD", bad);
		
		System.out.println("PROFILEREGISTERNUM : " + PROFILEREGISTERNUM);
		System.out.println("VIDEONUM : " + VIDEONUM);
		System.out.println("BAD : " + bad);
				
		int hateResult = userRatingDAO.hateMap(hateMap);
		
		
		System.out.println("hateresult : " + hateResult);
		
		if (hateResult == 1)
		{
			// 정상 프로세스
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('이미 추천 되셨습니다')");
			script.println("history.back()");
			script.println("</script>");
			
		}
		else
		{
			// 비정상 & 오류
			System.out.println("비정상입니다.");
		}
		
		
	}
}
