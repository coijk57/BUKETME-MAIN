package kr.co.ezenac.orm04;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import kr.co.ezenac.orm04.MemberVO;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/signup.do")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그 나옴");
		doHandle(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그 나옴2");
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		MemberVO memberVO = new MemberVO();
		
		boolean checkEmail = dao.isExistsEmail(request.getParameter("email"));
		
		  if(checkEmail) {
			  out.println("<script>alert('이미 등록된 이메일 입니다.');</script>");
			  System.out.println("이미 등록된 이메일 입니다.");
			  return;
		  }
		  
		  HttpSession session = request.getSession(); 
		  session.setAttribute("email", request.getParameter("email"));
		  
		  int maxId = dao.selectMaxRegisterNum();
		  
		  memberVO.setRegisterNum(maxId+1); memberVO.setManagerCheck(0);
		  memberVO.setEmail(request.getParameter("email"));
		  memberVO.setPassword(request.getParameter("password"));
		  memberVO.setPhoneNum(request.getParameter("phoneNumber"));
		  memberVO.setName(request.getParameter("name"));
		  int year = Integer.parseInt(request.getParameter("year"));
		  int month = Integer.parseInt(request.getParameter("month"));
		  int day = Integer.parseInt(request.getParameter("day"));
		  
		  memberVO.setGender("남자");
		  memberVO.setInstrument("태블릿");
		  memberVO.setMemCode(1);
		  memberVO.setBirthday(Date.valueOf(LocalDate.of(year, month, day)));
		  memberVO.setJoinDate(Date.valueOf(LocalDate.now()));
		  //memberVO.setBirthday(null); //memberVO.setBirthday(year + "-" + month + "-" + day)
		  
		  int result = dao.insertMember(memberVO);
		  
		  System.out.println(result);
		  
		  
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/Membership.do");
		dispatcher.forward(request, response);
		
		
	}

}






















