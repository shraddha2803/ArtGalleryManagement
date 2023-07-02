<%@page import="java.sql.*" %>
<%@page import="com.servlet.submit.ConnectionProvider" %>
<%
String email=session.getAttribute("email").toString();
String artname=request.getParameter("productName");
int quantity=1;
double price=0;
double ptotal=0,ctotal=0;
int z=0;
try{
	Connection con=ConnectionProvider.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from artwork where artname='"+artname+"'");
	while(rs.next()){
		price=rs.getDouble(3);
		ptotal=price;
		
	}

	ResultSet rs1=st.executeQuery("select *from cart where productName='"+artname+"' and email='"+email+"' and address is NULL");
while(rs1.next()){
ctotal=rs1.getDouble(4);
ctotal=ctotal+ptotal;
quantity=rs1.getInt(3);
quantity=quantity+1;
z=1;                                          //already product present increase value
}
if(z==1){
	
	st.executeUpdate("update cart set total='"+ctotal+"',quantity='"+quantity+"' where  productName='"+artname+"' and  email='"+email+"' and address is NULL");
response.sendRedirect("mycart.jsp?msg=exist");
}
if(z==0){                            //adding new product to cart
 	PreparedStatement ps=con.prepareStatement("insert into cart(productName,price,quantity,total,email) values(?,?,?,?,?)");

	ps.setString(1, artname);

	ps.setDouble(2, price);
	ps.setInt(3, quantity);
	ps.setDouble(4, ptotal);
	ps.setString(5, email);
	ps.executeUpdate();
	response.sendRedirect("mycart.jsp?msg=added");
}				

}
catch(Exception e){
	
	System.out.println(e);
	response.sendRedirect("mycart.jsp?msg=invalid");

}

%>
