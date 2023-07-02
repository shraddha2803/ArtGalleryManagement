package com.servlet.submit;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//of artist
@WebServlet("/register")

public class RegisterServlet extends HttpServlet{

	
     private static final String Insert_Query="INSERT INTO ARTIST(NAME,EMAIL,PASSWORD) VALUES(?,?,?)";
     
protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
	RequestDispatcher dispatcher=null;
	PrintWriter pw = response.getWriter();
	//response.setContentType("text/html");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	//String name=request.getParameter("name");
//	System.out.println("Name: "+name);
////	System.out.println("email: "+email);
////	System.out.println("password: "+password);
//	
	//loading jdbc server
	HttpSession session =request.getSession();
	//creating the connection
	Connection con=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///dbmsproject","root","root123");
		PreparedStatement ps=con.prepareStatement(Insert_Query);
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,password);
		int count=ps.executeUpdate();
		//dispatcher=request.getRequestDispatcher("artistlogin.html");
		if(count==0) {
			//pw.println("record not submitted");
			response.sendRedirect("artistlogin.jsp");

			request.setAttribute("status", "failed");
		}
		else {
			//pw.println("record submitted");
			session.setAttribute("email", email);
			response.sendRedirect("artistpage.jsp");

			request.setAttribute("status", "success");
		}
	}catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	}
	catch(SQLException se) {
		pw.println(se.getMessage());
		se.printStackTrace();
		
	}catch(Exception e) {
		pw.println(e.getMessage());
		e.printStackTrace();
	}finally {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	pw.close();
}

	
	
}
