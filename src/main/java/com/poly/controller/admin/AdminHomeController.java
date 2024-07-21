package com.poly.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.dao.VideoDao;
import com.poly.dao.VideoDao2;
import com.poly.dao.impl.VideoDaoImpl;
import com.poly.dao.impl.VideoDaoImpl2;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.UserService;
import com.poly.service.VideoService;
import com.poly.service.impl.UserServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet({"/admin/home"})
public class AdminHomeController extends HttpServlet{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3394960476277604550L;
	private VideoService videoService = new VideoServiceImpl();

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Video> videos = videoService.findAll();
		req.setAttribute("videos", videos);
		
		
		req.getRequestDispatcher("/views/admin/videomanager.jsp").forward(req, resp);

		
		
	}

	

	




}
