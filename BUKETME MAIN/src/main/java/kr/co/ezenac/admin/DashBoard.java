package kr.co.ezenac.admin;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ezenac.orm04.MemberDAO;
import kr.co.ezenac.orm04.MemberVO;
import kr.co.ezenac.userManage.UserManageDAO;
import kr.co.ezenac.userManage.UserManageVO;

@WebServlet("/DashBoard.do")
public class DashBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		MemberDAO memberDAO = new MemberDAO();
		List<MemberVO> selectAllUser = memberDAO.selectAllUser();
		
		UserManageDAO manageDAO = new UserManageDAO();
		List<UserManageVO> selectAllManage = manageDAO.selectAllManage();
		
		int listSize = selectAllUser.size();
		
		String[][] userArray = new String[listSize][3];
		
		for(int i=0;i<listSize;i++) {
			userArray[i][0] = selectAllUser.get(i).getEmail();
			
			int memCode = selectAllUser.get(i).getMemCode();
			
			switch(memCode) {
				case 1: userArray[i][1] = "베이직"; break;
				case 2: userArray[i][1] = "스탠다드"; break;
				case 3: userArray[i][1] = "프리미엄"; break;
			}
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			String available_date = dateFormat.format(selectAllManage.get(i).getAvailable_date());
			
			if(selectAllManage.get(i).getSubscriptionstatus().equals("구독해지")) {
				userArray[i][2] = "0";
			}
			else if(selectAllManage.get(i).getSubscriptionstatus().equals("구독중")) {
				Date currentDate = new Date();
				String current = dateFormat.format(currentDate);
				Date firstDate;
				try {
					firstDate = dateFormat.parse(current);
					Date secondDate = dateFormat.parse(available_date);
					
					long diff = firstDate.getTime() - secondDate.getTime();
					
					long calDate = diff / (24*60*60*1000);
					
					calDate = Math.abs(calDate);
					
					userArray[i][2] = String.valueOf(calDate);
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		
		request.getSession().setAttribute("userArray", userArray);
		
		response.sendRedirect(request.getContextPath() +"/manager/adminDashBoard.jsp");
	}
}
