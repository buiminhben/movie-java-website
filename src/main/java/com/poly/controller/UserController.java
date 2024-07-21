package com.poly.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constant.SessionAttr;
import com.poly.entity.User;
import com.poly.service.EmailService;
import com.poly.service.UserService;
import com.poly.service.impl.EmailServiceImpl;
import com.poly.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/login", "/logout", "/register", "/forgotPass","/changePass" })
public class UserController extends HttpServlet {

	/**
	 * 
	 */
//	kiểm tra xem phiên bản serialize tương thích với deserialize không
	private static final long serialVersionUID = 1L;

	// khai báo 1 biến userService bằng 1 đối tượng của lớp UserServiceImpl
	/*
	 * userService tham chiếu đến UserServiceImpl, và sử dụng các phương thức của
	 * UserServiceImpl để thực hiện các thao tác với dữ liệu người dùng.
	 */
	private UserService userService = new UserServiceImpl();
	private EmailService emailService = new EmailServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath(); // localhost:8080/asmJava4/login >>> path= "/login"

		switch (path) {
		case "/login":
			doGetLogin(req, resp);
			break;

		case "/register":
			doGetRegister(req, resp);
			break;
		case "/logout":
			doGetLogout(session, req, resp);
			break;
		case "/forgotPass":
			doGetForgotPass(req, resp);
			break;

		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		tạo một phiên cho người dùng, và req lấy thông tin từ client(trình duyệt web).
		HttpSession session = req.getSession();
		String path = req.getServletPath(); // localhost:8080/asmJava4/login >>> path= "/login"
		switch (path) {
		case "/login":
			doPostLogin(session, req, resp);
			break;
		case "/register":
			doPostRegister(session, req, resp);
			break;
		case "/forgotPass":
			doPostForgotPass(req, resp);
			break;
		case "/changePass":
			doPostChangePass(session, req, resp);
			break;

		}
	}

	private void doGetForgotPass(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/views/user/forgot-pass.jsp").forward(req, resp);

	}

	private void doGetLogout(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IOException {
//		xóa thông tin người dùng được lưu vào phiên (session) SessionAttr.CURRENT_USER. 	
		session.removeAttribute(SessionAttr.CURRENT_USER);
//		 chuyển hướng  từ servlet hiện tại	đến một trang khác
		resp.sendRedirect("index");
	}

	private void doGetRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/user/register.jsp").forward(req, resp);

	}

	private void doGetLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/user/login.jsp").forward(req, resp);

	}

	private void doPostLogin(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IOException {
//		 truy xuất giá trị của tham số "username" người dùng đã nhập vào trong form.
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		User user = userService.login(username, password);

		if (user != null) {
//			thông tin người dùng được lưu vào phiên (session) với khóa là SessionAttr.CURRENT_USER. 
			session.setAttribute(SessionAttr.CURRENT_USER, user);

			resp.sendRedirect("index");

		} else {
			resp.sendRedirect("login");
		}

	}

	private void doPostRegister(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
//		 truy xuất giá trị của tham số "username" người dùng đã nhập vào trong form.
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		User user = userService.create(username, password, email);

		if (user != null) {
			emailService.sendEmail(getServletContext(), user, "welcome");

//			thông tin người dùng được lưu vào phiên (session) với khóa là SessionAttr.CURRENT_USER. 
			session.setAttribute(SessionAttr.CURRENT_USER, user);

			resp.sendRedirect("index");

		} else {
			resp.sendRedirect("register");
		}

	}

	private void doPostForgotPass(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json");
		String email = req.getParameter("email");
		User userWithNewPass = userService.resetPassword(email);

		if (userWithNewPass != null) {
			emailService.sendEmail(getServletContext(), userWithNewPass, "forgot");
			resp.setStatus(204);
		} else {
			resp.setStatus(400);
		}
	}

	private void doPostChangePass(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("application/json");
		String currentPass = req.getParameter("currentPass");
		String newPass = req.getParameter("newPass");

		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);

		if (currentUser.getPassword().equals(currentPass)) {
			currentUser.setPassword(newPass);
			User updatedUser = userService.update(currentUser);
			
			if (updatedUser != null) {
				session.setAttribute(SessionAttr.CURRENT_USER, updatedUser);
				resp.setStatus(204);
			} else {
				resp.setStatus(400);

			}
		}
	}
}
