package com.servlet.submit;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
@WebServlet("/ArtworkServlet")
public class ArtworkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

    private static final String Insert_Query="INSERT INTO ARTWORK(ARTNAME,type,price,artimage,artby) VALUES(?,?,?,?,?)";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	RequestDispatcher dispatcher=null;
	HttpSession session =request.getSession();
	String artby=session.getAttribute("email").toString();
	PrintWriter pw = response.getWriter();
Part file=request.getPart("artimage");
String imageFileName=file.getSubmittedFileName();
String uploadPath="C:/Users/Shradha_PC/eclipse-workspace/HtmlToDb/src/main/webapp/"+imageFileName;  // upload path where we have to upload our actual image

		String artname=	request.getParameter("artname");
		String price=request.getParameter("price");
		String type=request.getParameter("drawing");
		//String artby=request.getParameter("artby");
		
		try {
		FileOutputStream fos=new FileOutputStream (uploadPath);
		InputStream is=file.getInputStream();
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
fos.close();		
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		Connection con=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///dbmsproject","root","root123");
			PreparedStatement ps=con.prepareStatement(Insert_Query);
			ps.setString(1,artname);
			ps.setString(2,type);
			ps.setString(3,price);
			ps.setString(4,imageFileName);
			ps.setString(5,artby);
			
			int count=ps.executeUpdate();
			dispatcher=request.getRequestDispatcher("artistpage.html");
			if(count==0) {
				//pw.println("record not submitted");
				response.sendRedirect("artistpage.jsp?msg=wrong");

				request.setAttribute("status", "failed");
			}
			else {
				//pw.println("record submitted");
				
				response.sendRedirect("artistpage.jsp?msg=done");
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
   
	
	
	
	
	
