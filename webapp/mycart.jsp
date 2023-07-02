

<%@page import="java.sql.*" %>

<%@page import="com.servlet.submit.ConnectionProvider" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>My Cart</title>

<style>
   * {
   box-sizing: border-box;
   }
      .column {
 float: left;
 width: 50%;
 padding: 10px;
 height: 300px; /* Should be removed. Only for demonstration */
  } 
select.input-style {
  width: 100%; /* Full width */
  padding: 12px 20px; /* Padding */
  margin: 8px 0; /* Margin */
  display: inline-block; /* Display as inline-block */
  border: 1px solid #ccc; /* Border */
  border-radius: 4px; /* Rounded corners */
  box-sizing: border-box; /* Box-sizing */
  font-size: 16px; /* Font size */
}

select.input-style:focus {
  outline: none; /* Remove outline on focus */
  border-color: #4CAF50; /* Green border on focus */
}

.option {
  background-color: white; /* Background color */
  color: black; /* Text color */
}
body {
    font-family: Arial, Helvetica, sans-serif;
background-image: url("water.jpg");
background-repeat: no-repeat;
background-size: cover;

}


h3

{

color: yellow;

text-align: center;

}

.alert{

color:blue;

}


#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}
#customers tr:nth-child(odd){background-color: #e3e7fa;}
#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
background-color:rgb(64, 86, 136);
  color: white;
}

.button {
  background-color:rgb(64, 86, 136);
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}


form{
   
   margin: 00px 500px;
   border:deepskybl;
	text-align: center;
   
   }
   .formContainer {
	  padding: 16px;
   }
   .formContainer p{
	  font-size: 28p
   }

   .modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
  
  
}

/* Modal Content/Box */
.modal-content {
  background-color:#e3e7fa;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

   input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}


.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}


@media screen and (max-width: 300px) {
  span.password {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}

li:nth-child(even) {
	flex-direction: row-reverse;
	background: lavender;
	margin-right: -2rem;
	margin-left: 2rem;
}
.container {
  padding: 10px;
width: 400px;
margin-top: 2px;
margin-left: 80px;
 

}
.formContainer {
   padding: 10px;
}
.formContainer p{
   font-size: 28px;
}


</style>



</head>

<body>

<div style="color: white; text-align: center;margin-top:39px; font-size: 30px;"><h2>MY CART</h2></div>


<%String email=session.getAttribute("email").toString(); %>

<%

String msg=request.getParameter("msg");

if("invalid".equals(msg)){%>

<h3 class="alert"></h3>


<% }%>

<%

if("exist".equals(msg))

{%>

<h3 class="alert">Product already in cart,Quantity Increased Successfully!</h3>



<% }%>

<%

if("added".equals(msg))

{%>

<h3 class="alert">Product Successfully Added to cart!</h3>

<%} %>




   
<div class="row" style="margin:10px;height: 80%;">
    <div class="column"  >


<table id="customers" style="margin-top:50px;">

<thead>

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

<tr>




</tr>

</thead>

<thead>

<tr>


<th scope="col">Sr no.</th>

<th scope="col">ArtWork Name</th>

<th scope="col">Category</th>

<th scope="col"><i class="fa fa-inr"></i> price</th>


<th scope="col">Sub Total</th>

<th scope="col">Quantity</th>


</tr>

</thead>

<tbody>




<%

ResultSet rs=st.executeQuery("select artwork.artname,artwork.type,cart.price,cart.total,cart.quantity from artwork inner join cart on artwork.artname=cart.productName and email='"+email+"' and address is NULL;");

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
  <div scope="col" class="button" style="margin-left:290px; margin-top:23px;">Total: <i class="fa fa-inr"></i> <%out.println(total); %></div>
  
  
</div>

<div class="column"  >

 <form action="paymentAction.jsp" method="post" class="modal-content animate"  style="width: 700px; margin-top:50px;" >
        
         
        <div class="formContainer">
        <h2>Delivery Details</h2>
        <hr>
        <label for="address"><b>Address</b></label>
        <input type="text" placeholder="Enter Address"  name="address" required>
        <label for="way of payment"><b>Way of Payment</b></label>
       <br>
<br>
        <select class="input-style" name="paymentMethod" >

    <div class="option">
  <option value="COD">Cash on Delivery</option>

<option value="onlline">Online Payment</option>
  
</div>

</select>
<br>
<br>
<label for="transactionid"><b>EnterTransaction Id</b></label>
  <input  type="text" placeholder="Transaction Id"  name="transactionId"  >
        
              <label for="mobileno"><b>Enter Mobile Number</b></label>
        <input type="text" placeholder="Enter mobile no"  name="mobileno" required>
  
        
        
        
        <div>

<button id="orderButton"style="width:auto;"class="button" type="submit" style="text-decoration:none ">Place Order</button>
        </div>
      
        </div>
</form>
     
</div>
</div>
<%
}}catch(Exception e){
	System.out.println(e);}
%>





<br>

<br>

<br>



<div id="orderModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Thank you for your order!</p>
  </div>
</div>



<script>

//Get the modal
var modal = document.getElementById("orderModal");

// Get the button that opens the modal
var btn = document.getElementById("orderButton");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}


</script>


  


</body>

</html>























