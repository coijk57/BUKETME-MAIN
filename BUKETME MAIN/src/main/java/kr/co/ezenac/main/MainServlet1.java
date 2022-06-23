package kr.co.ezenac.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ezenac.profile.ProfileDAO;
import kr.co.ezenac.profile.ProfileVO;

@WebServlet("/MainProfileChoice.do")
public class MainServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MainServlet1() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		session.setAttribute("reload", true);
		session.setAttribute("profileRegisterNum", 2); //테스트를 위해 프로필 값을 임의로 세팅
		
		Object sessionProfile = session.getAttribute("profileRegisterNum");
		
		if(sessionProfile == null) {
			System.out.println("세션 만료");
			session.invalidate();
			response.sendRedirect(request.getContextPath() +"/login/login.jsp");
		}
		else {
			int profileRegisterNum = (int)sessionProfile;
			
			ProfileDAO dao = new ProfileDAO();
			
			List<ProfileVO> list = dao.profileNumSelect(profileRegisterNum);
			
			request.getSession().setAttribute("profile", list);
			
			//System.out.println("이미지 경로 : " + list.get(0).getProfileImageName() + ", 프로필명 : " + list.get(0).getProfileName());
		}
		
	}

}
