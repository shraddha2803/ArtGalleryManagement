package com.servlet.submit;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UserloginServlet")
public class UserloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int z=0;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=	request.getParameter("email");
		String password=request.getParameter("password");
		HttpSession session =request.getSession();
		
		PrintWriter out=response.getWriter();
		//RequestDispatcher dispatcher=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql:///dbmsproject","root","root123");
			
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select* from signup1 where email = '"+email+"' and password ='"+password+"'");
			//PreparedStatement ps=con.prepareStatement("select* from signup1 where gmail = ? and password = ?");
			//ps.setString(1, email);
			//ps.setString(2, password);
			//ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				z=1;
				session.setAttribute("email", email);
				response.sendRedirect("home.jsp");
				//RequestDispatcher dispatcher=request.getRequestDispatcher("home.jsp");
				//dispatcher.forward(request, response);
				//session.setAttribute("name", rs.getString("name"));
				//=dispatcher=request.getRequestDispatcher("signup.html");
			}
			if(z==0) {
				response.sendRedirect("signup.jsp?msg=notexitst");
			}
//			else {
//				out.println("<font color=red size=18>Login Failed!!");
//				out.println("<a href=signup.html>TRY AGAIN!!");
//				request.setAttribute("status", "failed");
//				//dispatcher=request.getRequestDispatcher("signup.html");
//			}
			//dispatcher.forward(request, response);
		}catch(Exception e) {
		
			e.printStackTrace();
			response.sendRedirect("main.jsp?msg=invalid");
		}
		
		//doGet(request, response);
	}

}
