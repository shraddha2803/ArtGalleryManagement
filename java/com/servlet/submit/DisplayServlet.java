package com.servlet.submit;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mysql.cj.xdevapi.Statement;

@WebServlet("/DisplayServlet")
public class DisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			RequestDispatcher dispatcher=null;
	        Art dao=null;
		   String type=request.getParameter("drawing");
			HttpSession session =request.getSession();
//String email=request.getParameter("email");
dao=new Art();
List<Artdto> list=dao.getArt(type);

	request.setAttribute("list", list);
	//session.setAttribute("email", email);
	 dispatcher=request.getRequestDispatcher("DisplayDetail.jsp");
	
	dispatcher.forward(request, response);
	
	
   }
				
				
				
}