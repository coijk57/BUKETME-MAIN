package kr.co.ezenac.membership;

import java.awt.image.RescaleOp;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

@WebServlet("/Membership.do")
public class MembershipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MembershipServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MembershipDAO dao = new MembershipDAO();
		List<MembershipVO> list = dao.membershipSelect();
		
		HttpSession session = request.getSession();
		session.setAttribute("email", "abc@gmail.com"); //데스크를 위한 세션 등록
		
		request.getSession().setAttribute("membership", list);
		
		response.sendRedirect(request.getContextPath() +"/login/membership.jsp");
	}

}
