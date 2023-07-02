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

@WebServlet("/ArtistloginServlet")
public class ArtistloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=	request.getParameter("email");
		String password=request.getParameter("password");
		HttpSession session =request.getSession();
		int z=0;
		PrintWriter out=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql:///dbmsproject","root","root123");
			Statement st=con.createStatement();
			//PreparedStatement ps=con.prepareStatement("select* from artist where email = ? and password = ?");
			//ps.setString(1, email);
			//ps.setString(2, password);
			//ResultSet rs=ps.executeQuery();
			
			ResultSet rs=st.executeQuery("select* from artist where email = '"+email+"' and password ='"+password+"'");

			while(rs.next()) {
				z=1;
				session.setAttribute("email", email);
				response.sendRedirect("artistpage.jsp");
				//	RequestDispatcher dispatcher=request.getRequestDispatcher("artistpage.jsp");
				//dispatcher.forward(request, response);
			}
			 if(z==0) {
//				out.println("<font color=red size=18>Login Failed!!");
//				out.println("<a href=artistlogin.html>TRY AGAIN!!");
//				request.setAttribute("status", "failed");
				response.sendRedirect("artistlogin.jsp?msg=notexist");
			}
			 
			}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("main.jsp?msg=invalid");

		}
		
	}

}
