package kr.co.ezenac.profile;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProfileSelectAll.do")
public class ProfileServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ProfileServlet1() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		ProfileDAO dao = new ProfileDAO();
		HttpSession session = request.getSession();
		
		session.setAttribute("email", "rwg3070@naver.com"); //데스크를 위한 세션 등록
		
		String email = (String) session.getAttribute("email");
		
		List<ProfileVO> list = dao.profileSelect(email);
		
		int registerNum = list.get(0).getRegisterNum();
		int memCode = list.get(0).getMemCode();
		Boolean createCheck = true;
		
		session.setAttribute("registerNum", registerNum);
		session.setAttribute("memCode", memCode);
		
		if(memCode == 1) {
			if(list.size() >= 1) {
				createCheck = false;
			}
		}
		else if(memCode == 2) {
			if(list.size() >= 2) {
				createCheck = false;
			}
		}
		else if(memCode == 3) {
			if(list.size() >= 4) {
				createCheck = false;
			}
		}
		
		request.getSession().setAttribute("profile", list);
		request.getSession().setAttribute("createCheck", createCheck);
		
		response.sendRedirect(request.getContextPath() +"/login/profileChoice.jsp");
	}
}
