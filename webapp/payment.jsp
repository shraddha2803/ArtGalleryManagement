<%@page import="java.sql.*" %>
<%@page import="com.servlet.submit.ConnectionProvider" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Payment</title>
<script >
if(window.history.forward(1)!=null){
	window.history.forward(1);
}
</script>
<style>

    body {
  font-family: "Open Sans", sans-serif;
  line-height: 1.25;
  background-color: #0080FF;
}

a
{
	text-decoration: none;
}
.sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
}

table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 100%;
  /*margin-left: 5%;*/
  table-layout: fixed;
}

table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}

table tr {
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.3em;
  }
  
  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
  }
  
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
  
  table td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: right;
  }
  
  table td::before {
    /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  table td:last-child {
    border-bottom: 0;
  }
}

/*Header Css*/
* {box-sizing: border-box;}
    
    body {
      margin: 0;
      font-family: Arial, Helvetica, sans-serif;
    }
    

/*footer*/
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color:#ccc;
   color:black;
   text-align: center;
}





.input-style {
  width: 90%;
  padding: 12px 20px;
  margin-left:5%;
  box-sizing: border-box;
  border: none;
  background-color:white;
  color: black;
  font-size: 16px;
}

input[type=text]:focus, textarea:focus,button:focus{
  outline: 4px solid orange;
  background-color:rgb(224, 255, 219);     /* oranges! yey */
}

.button {
  background-color: aqua;
  border: none;
  color: black;
  padding: 12px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  margin-left:5%;
  font-size: 16px;
  width: 90%;
   border-radius: 25px;
}

.button:hover {
  background-color: #555555;
  color: white;
}

hr
{
	width: 90%
}
h3
{
	text-align: center;
	color: white;
}
.alert
{
	color:yellow;
}

.profile-style
{
	border-style: dotted;
	
}

.left-div
{
	width: 50%;
	display:inline-block;
}

.right-div
{
	float:right;
	width: 50%;
	display:inline-block;
}
</style>
</head>
<body>

<%String email=session.getAttribute("email").toString(); %>
<%
int total=0;
int sno=0;
try{
	Connection con=ConnectionProvider.getConnection();
	Statement st=con.createStatement();
	
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"'and address is NULL");
while(rs1.next()){
	total=rs1.getInt(1);
}

%>


<br>
<table>
<thead>

          <tr>
          <th scope="col"><a href="mycart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
              
 <%
 	ResultSet rs=st.executeQuery(" select artwork.artname,artwork.type,cart.price,cart.total,cart.quantity,cart.email from artwork inner join cart on artwork.artname=cart.productName and cart.email='"+email+"' and cart.address is NULL;"); 
while(rs.next()){
 %>
          <tr>
          
              <%sno=sno+1; %>
        <td><%out.println(sno); %></td>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(3) %> </td>
           <td><%=rs.getString(4) %></td>
           <td><%=rs.getString(5) %></td>
         
            </tr>
         <%}
	ResultSet rs2=st.executeQuery("select* from signup1 where email='"+email+"'");
	while(rs2.next()){
		
		%>
		
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="paymentAction.jsp" method="post">

 <div class="left-div">
 <h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=rs2.getString(4)%>" placeholder="enter address" >
 </div>




<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 <select class="input-style" name="paymentMethod">
 
 <option value="COD">Cash on Delivery</option>
  
 <option value="onlline">Online Payment</option>
  
 
 
 </select>
</div>

<div class="right-div">
<input class="input-style" type="text" name="transactionId" value="<%=rs2.getString(4)%>" placeholder="enter Transaction ID" >

<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobileNo" value="<%=rs2.getString(4)%>" placeholder="enter Mobile number " >

</div>

<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="submit">Proceed to Generate Bill</button>
<i class='far fa-arrow-alt-circle-right'></i>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
}}catch(Exception e){
	System.out.println(e);}
%>

      <br>
      <br>
      <br>

</body>
</html>