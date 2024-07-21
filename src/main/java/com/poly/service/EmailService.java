package com.poly.service;

import javax.servlet.ServletContext;

import com.poly.entity.User;

public interface EmailService {

	void sendEmail(ServletContext contex, User recipient, String type);
}
