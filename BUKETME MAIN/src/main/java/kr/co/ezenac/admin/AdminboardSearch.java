package kr.co.ezenac.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.co.ezenac.videoInfo.VideoInfoDAO;
import kr.co.ezenac.videoInfo.VideoInfoVO;

@WebServlet("/AdminboardSearch.do")
public class AdminboardSearch extends HttpServlet {
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
		
		String title = request.getParameter("title");
		
		//System.out.println(title);
		
		VideoInfoDAO dao = new VideoInfoDAO();
		List<VideoInfoVO> searchList = dao.searchList(title);
		
		JSONObject jsonData = new JSONObject();
		String status = null;
		
		if(searchList.isEmpty()) {
			jsonData.put("search", false);
		}
		else {
			jsonData.put("search", true);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			Date openDate = searchList.get(0).getOpenDate();
			Date currentDate = new Date();
			
			if(openDate.after(currentDate)) {
				status = "공개 예정";
			}
			else {
				status = "공개";
			}
			
			String postDate = dateFormat.format(searchList.get(0).getPostDate());
			
			jsonData.put("ImageFileName", searchList.get(0).getImageFileName());
			jsonData.put("Title", searchList.get(0).getTitle());
			jsonData.put("Status", status);
			jsonData.put("PostDate", postDate);
			jsonData.put("VideoHits", searchList.get(0).getVideoHits());
		}
		
		response.getWriter().write(jsonData.toJSONString());
	}
}
