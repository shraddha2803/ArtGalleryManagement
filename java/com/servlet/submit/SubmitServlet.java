package com.servlet.submit;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//of customer
@WebServlet("/submit")

public class SubmitServlet extends HttpServlet{

     private static final String Insert_Query="INSERT INTO SIGNUP1(NAME,EMAIL,PASSWORD) VALUES(?,?,?)";
    
     
protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
	//super.doGet(request, resp);
	//collecting data from form
	RequestDispatcher dispatcher=null;
	PrintWriter pw = response.getWriter();
	//response.setContentType("text/html");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	HttpSession session =request.getSession();

	//String name=request.getParameter("name");
//	System.out.println("Name: "+name);
//	System.out.println("email: "+email);
//	System.out.println("password: "+password);
	
	//loading jdbc server
	
	Connection con=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		 con=DriverManager.getConnection("jdbc:mysql:///dbmsproject?useSSL=false","root","root123");
		// Statement st=con.createStatement();
		 	PreparedStatement ps=con.prepareStatement(Insert_Query);
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,password);
		int count=ps.executeUpdate();
		response.sendRedirect("home.jsp?msg=valid");
		//request.getRequestDispatcher("signup.jsp");
		if(count==0) {
			pw.println("record not submitted");
			request.setAttribute("status", "failed");
		}
		else {
			session.setAttribute("email", email);
			//pw.println("record submitted");
			request.setAttribute("status", "success");
		}
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}catch(SQLException se) {
		pw.println(se.getMessage());
		se.printStackTrace();
		
	}catch(Exception e) {
		response.sendRedirect("signup.jsp?msg=invalid");
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
	
	
	//creating the connection
	
}

//protected void doPost(HttpServletRequest request,HttpServletResponse resp) throws ServletException, IOException {
//doGet(request,resp);
//	
//}
	
	
}
