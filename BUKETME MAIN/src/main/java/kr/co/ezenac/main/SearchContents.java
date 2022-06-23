package kr.co.ezenac.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.co.ezenac.videoInfo.VideoInfoDAO;
import kr.co.ezenac.videoInfo.VideoInfoVO;

@WebServlet("/SearchContents.do")
public class SearchContents extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchContents() {
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
		
		String video = request.getParameter("video");
		
		VideoInfoDAO dao = new VideoInfoDAO();
		List<VideoInfoVO> searchList = dao.searchList(video);
		
		JSONObject jsonData = new JSONObject();
		
		if(searchList.isEmpty()) {
			jsonData.put("search", false);
		}
		else {
			jsonData.put("search", true);
		}
		
		response.getWriter().write(jsonData.toJSONString());
		
		//System.out.println("search test");
	}
}
