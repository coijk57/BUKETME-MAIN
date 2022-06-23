package kr.co.ezenac.main;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ezenac.videoInfo.VideoInfoDAO;
import kr.co.ezenac.videoInfo.VideoInfoVO;

@WebServlet("/CsconDataLoad.do")
public class MainServlet5 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MainServlet5() {
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
		
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(cal.YEAR);
		
		String set_year = year + "";
		
		String oneMonth = set_year + "." + monthPlus(1);
		String twoMonth = set_year + "." + monthPlus(2);
		String threeMonth = set_year + "." + monthPlus(3);
		
		
		VideoInfoDAO videoInfoDAO = new VideoInfoDAO();
		List<VideoInfoVO> oneMonthList = videoInfoDAO.openDate(1);
		List<VideoInfoVO> twoMonthList = videoInfoDAO.openDate(2);
		List<VideoInfoVO> threeMonthList = videoInfoDAO.openDate(3);
		
		request.getSession().setAttribute("oneMonthList", oneMonthList);
		request.getSession().setAttribute("twoMonthList", twoMonthList);
		request.getSession().setAttribute("threeMonthList", threeMonthList);
		request.getSession().setAttribute("oneMonth", oneMonth);
		request.getSession().setAttribute("twoMonth", twoMonth);
		request.getSession().setAttribute("threeMonth", threeMonth);
		
		System.out.println("reload cscon");
		
		response.sendRedirect(request.getContextPath() +"/UserMain/cscon.jsp");
	}
	
	public String monthPlus(int plus) {
		Calendar cal = Calendar.getInstance();
		
		int month = cal.get(cal.MONTH) + plus + 1;
		
		String set_month = month + "";
		
		if(Integer.parseInt(set_month) < 10) {
			set_month = "0" + set_month;
		}
		
		return set_month;
	}

}
