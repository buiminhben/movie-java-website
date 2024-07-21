package com.poly.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.VideoDao;
import com.poly.dao.impl.VideoDaoImpl;
import com.poly.entity.Video;
import com.poly.service.VideoService;
import com.poly.service.impl.VideoServiceImpl;



@WebServlet({"/admin/video","/admin/video/edit/*","/admin/video/create","/admin/video/update","/admin/video/delete"})
public class AdminVideoController extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5029001508789258477L;
	
	private VideoService videoDao = new VideoServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		Video video = new Video();
		String uri = req.getRequestURI();
		List<Video> videos = videoDao.findAll();
		
		  if (uri.contains("edit")) {
	            // edit
	            String href = uri.substring(uri.lastIndexOf("/") + 1);
	            if (href != null && !href.isEmpty()) {
	                video = videoDao.findByHref(href);
	            }
	        } else if (uri.contains("create")) {
	            // create
	            try {
	                BeanUtils.populate(video, req.getParameterMap());
	                videoDao.create(video);
	                req.setAttribute("message", "Create success");
	            } catch (Exception e) {
	                req.setAttribute("message", "Create fail");
	            }
	        } else if (uri.contains("update")) {
	            // update
	            try {
	                BeanUtils.populate(video, req.getParameterMap());
	                videoDao.update(video);
	                req.setAttribute("message", "Update success");
	            } catch (Exception e) {
	                req.setAttribute("message", "Update fail");
	            }
	        } else if (uri.contains("delete")) {
	            // delete
	            try {
	                String href = req.getParameter("href");
	                if (href != null && !href.isEmpty()) {
	                	videoDao.delete(href); // Thay đổi để xóa bằng href
	                    req.setAttribute("message", "Delete success");
	                } else {
	                    req.setAttribute("message", "Delete fail: Missing id");
	                }
	            } catch (Exception e) {
	                req.setAttribute("message", "Delete fail");
	            }
	        }
		  
		  // Cập nhật danh sách items sau mỗi thao tác và chuyển hướng đến trang JSP
		  req.setAttribute("form", video);
		  req.setAttribute("items", videoDao.findAll());
		  
		  req.getRequestDispatcher("/views/admin/videomanager.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String value = req.getParameter("active");
		boolean isActive = value !=null && value.equals(true);

       
    	Video video = new Video();
    	video.setHref(req.getParameter("href"));
    	video.setTitle(req.getParameter("title"));
    	
    	video.setIsActive(isActive);

	

	
	  
    
    // Kiểm tra loại thao tác và thực hiện tương ứng
    String uri = req.getRequestURI();
    if (uri.contains("create")) {
        try {
            videoDao.create(video);
            req.setAttribute("message", "Create success");
        } catch (Exception e) {
            req.setAttribute("message", "Create fail");
        }
    } else if (uri.contains("update")) {
        try {
        	videoDao.update(video);
            req.setAttribute("message", "Update success");
        } catch (Exception e) {
            req.setAttribute("message", "Update fail");
        }
    } else if (uri.contains("delete")) {
        try {
            String href = req.getParameter("href");
            if (href != null && !href.isEmpty()) {
            	videoDao.delete(href);
                req.setAttribute("message", "Delete success");
            } else {
                req.setAttribute("message", "Delete fail: Missing id");
            }
        } catch (Exception e) {
            req.setAttribute("message", "Delete fail");
        }
    }
    
    // Cập nhật danh sách items và chuyển hướng đến trang JSP
    req.setAttribute("form", video);
    req.setAttribute("items", videoDao.findAll());
    req.getRequestDispatcher("/views/admin/videomanager.jsp").forward(req, resp);
	}
}
