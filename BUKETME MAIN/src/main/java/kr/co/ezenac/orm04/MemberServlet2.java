package kr.co.ezenac.orm04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ezenac.membership.MembershipDAO;

@WebServlet("/signup2.do")
public class MemberServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MemberServlet2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		
		String email = (String) session.getAttribute("email");
		
		/* int memCode = Integer.parseInt(request.getParameter("memCode")); */ 
		String memCode_str = request.getParameter("memCode"); 
		int memCode = Integer.parseInt(memCode_str);
		
		System.out.println("email: " + email + ", memCode: " + memCode);
		
		
		MemberDAO dao = new MemberDAO();
		  
		int updateMembership = dao.updateMembership(memCode, email);
		
		PrintWriter out = response.getWriter();
		
		if(updateMembership == 1) {
			System.out.println("성공");
			out.print("success");
		}
		else {
			System.out.println("실패");
			out.print("fail");
		}
		
		
		/* response.sendRedirect(request.getContextPath() +"/login/payInfo.jsp"); */
	}
}
