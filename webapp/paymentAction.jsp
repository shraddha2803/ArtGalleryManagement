
    <%@page import="java.sql.*" %>
<%@page import="com.servlet.submit.ConnectionProvider" %>


<% String email=session.getAttribute("email").toString();
String address=request.getParameter("address");

String mobileno=request.getParameter("mobileno");
String PaymentMethod=request.getParameter("paymentMethod");
String TransactionId=request.getParameter("transactionId");
String status="bill";

try{

Connection con=ConnectionProvider.getConnection();

Statement st=con.createStatement();


PreparedStatement ps=con.prepareStatement("update signup1 set address=?,mobileno=?,PaymentMethod=?,TransactionId=? where email=?");
ps.setString(1, address);
ps.setString(2,mobileno );
ps.setString(3, PaymentMethod);
ps.setString(4, TransactionId);
ps.setString(5, email);
ps.executeUpdate();

PreparedStatement ps1=con.prepareStatement("update cart set address=? where email=? and address is NULL");

ps1.setString(1, address);
ps1.setString(2, email);
ps1.executeUpdate();

//ps1.setString(1, address);
response.sendRedirect("home.jsp");

}
catch(Exception e){
	System.out.println(e);
}

%>

