package kr.co.ezenac.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ezenac.videoInfo.VideoInfoDAO;
import kr.co.ezenac.videoInfo.VideoInfoVO;

import org.json.simple.JSONObject;

@WebServlet("/MainModal.do")
public class MainModal extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MainModal() {
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
		
		String imageFile = request.getParameter("imageFileName");
		VideoInfoDAO dao =new VideoInfoDAO();
		Map data = dao.selectModalVideo(imageFile);
		
		JSONObject jsonData = new JSONObject();
		
		List<VideoInfoVO> list = (List<VideoInfoVO>) data.get("modalVideo");

		jsonData.put("videoNum", list.get(0).getVideoNum());
		jsonData.put("categoryName", data.get("categoryName"));
		jsonData.put("likeCategoryName", data.get("likeCategoryName"));
		jsonData.put("VIDEOFILENAME", list.get(0).getVideoFileName());
		jsonData.put("CONTENTS", list.get(0).getContents());
		jsonData.put("ACTORS", list.get(0).getActors());
		
		response.getWriter().write(jsonData.toJSONString());
	}
}
