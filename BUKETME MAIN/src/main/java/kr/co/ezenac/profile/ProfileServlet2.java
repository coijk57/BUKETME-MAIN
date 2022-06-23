package kr.co.ezenac.profile;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProfileCreate.do")
public class ProfileServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProfileServlet2() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		HttpSession session = request.getSession();
		ProfileDAO dao = new ProfileDAO();
		ProfileVO vo = new ProfileVO();

		int maxId = dao.selectMaxProfileNum();
		String profileName = request.getParameter("profileName");
//		String profileImageName = request.getParameter("profileNameImageName");
		String profileImageName = "../img/man.png";
		int registerNum = (int)session.getAttribute("registerNum");
		int memCode = (int) session.getAttribute("memCode");
		

		System.out.println("프로필 번호 : " + (maxId+1) + ", 프로필명 : " + profileName + ", 프로필 이미지 : " + profileImageName + ", 회원번호 : "
				+ (int) session.getAttribute("registerNum") + ", 멤버십 : " + (int) session.getAttribute("memCode"));

		vo.setProfileRegisterNum(maxId + 1);
		vo.setRegisterNum(registerNum);
		vo.setMemCode(memCode);
		vo.setProfileImageName(profileImageName);
		vo.setProfileName(profileName);

		
		int result = dao.insertProfile(vo);
		
		if(result == 1) {
			System.out.println("프로필 생성 성공");
		
			
			ServletContext context = getServletContext(); RequestDispatcher dispatcher =
			context.getRequestDispatcher("/ProfileSelectAll.do");
			dispatcher.forward(request, response);
			 
		  
		}
		 
	}
}
