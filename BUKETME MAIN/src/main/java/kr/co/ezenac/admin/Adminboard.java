package kr.co.ezenac.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

@WebServlet("/Adminboard.do")
public class Adminboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		VideoInfoDAO videoDAO = new VideoInfoDAO();
		List<VideoInfoVO> selectAllVideo = videoDAO.selectAllVideo();

		Map data = new HashMap();
		
		int listSize = selectAllVideo.size();
		
		String[][] videoArray = new String[listSize][5];
		
		for(int i=0;i<listSize;i++) {
			videoArray[i][0] = selectAllVideo.get(i).getImageFileName();
			videoArray[i][1] = selectAllVideo.get(i).getTitle();
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			Date openDate = selectAllVideo.get(i).getOpenDate();
			Date currentDate = new Date();
			
			if(openDate.after(currentDate)) {
				videoArray[i][2] = "공개 예정";
			}
			else {
				videoArray[i][2] = "공개";
			}
			
			String postDate = dateFormat.format(selectAllVideo.get(i).getPostDate());
			
			videoArray[i][3] = postDate;
			videoArray[i][4] = String.valueOf(selectAllVideo.get(i).getVideoHits());
			
		}
		
		data.put("videoArray", videoArray);
		data.put("listSize", listSize);
		
		request.getSession().setAttribute("selectVideoData", data);
		
		response.sendRedirect(request.getContextPath() +"/manager/adminboard.jsp");
	}
}
