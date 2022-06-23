package kr.co.ezenac.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.co.ezenac.videoInfo.VideoInfoDAO;
import kr.co.ezenac.videoInfo.VideoInfoVO;

@WebServlet("/SeriesSelect.do")
public class SeriesSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
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
		
		String category = request.getParameter("category");
		String rating = request.getParameter("rating");
		
		System.out.println("category : " + category + ", rating : " + rating);
		
		VideoInfoDAO dao = new VideoInfoDAO();
		List<VideoInfoVO> selectSeriesList = dao.selectSeriesList(category, rating);
		
		request.getSession().setAttribute("selectSeriesList", selectSeriesList);
		
		System.out.println("선택박스 작동 : " + selectSeriesList);
		
		JSONObject jsonData = new JSONObject();
		
		List<String> img = new ArrayList<String>();
		
		for(int i=0;i<selectSeriesList.size();i++) {
			img.add(selectSeriesList.get(i).getImageFileName());
		}
		
		jsonData.put("imgArray", img);
		jsonData.put("ArraySize", selectSeriesList.size());
		
		response.getWriter().write(jsonData.toJSONString());
		
	}
}
