<%@page import="com.servlet.submit.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
if("admin@gmail.com".equals(email) && "admin".equals(password))
{
     session.setAttribute("email",email);
     response.sendRedirect("home.jsp");
}
else
{
	int z;
	z=0;
	try
	{
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select *from artist where email='"+email+"'and password = '"+password+"'");
		while(rs.next())
		{
			z=1;
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}
		if(z==0){
			
			response.sendRedirect("login.jsp?msg=notexist");
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}
}
%>