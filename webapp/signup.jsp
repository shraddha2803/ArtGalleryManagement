<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

  

form{
   
margin: 10px 500px 500px 10px;
border:deepskyblue;
 text-align: center;

}
.formContainer {
   padding: 16px;
}
.formContainer p{
   font-size: 28px;
}
body {
    font-family: Arial, Helvetica, sans-serif;
background-image: url("img3.png");
background-repeat: no-repeat;
background-size: cover;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #04AA;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */


.container {
padding: 16px;
width: 600px;
margin-top: 180px;
margin-left: 0px;
 
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
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
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
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

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>

</head>


<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    <h1 style=" text-align: center; margin-top: 50px;color: #eaeef1;">Sign In</h1>
     <div class="row">
      <div class="column" style="margin-left:00px;">
        <form action="UserloginServlet" method="post"> 
        <div class="container" >
             <label for="email"><b>email</b></label>
            <input type="text" placeholder="Enter email" name="email" required>
            <label for="password"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" required>
            <button type="submit">Login</button>
           </div>
            <div class="container" style="background-color:#f1f1f1;margin-top: 00px;">
            <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
          </div>
      </form>
      </div>


    <div class="column" >
        <div style="text-align: center;margin-top: 30%;margin-right:70px;background-color: #eaeef1;">
              <br>
            <h2  >New Customer?</h2>
            <p style="margin-left:10px ;text-align: left;">
                Create an account with us and you'll be able to:
            </p>

<ul class="new-customer" style="text-align: justify;">
    <li >Check out faster</li>
    <li >Save multiple shipping addresses</li>
    <li >Access your order history</li>
    <li >Track new orders</li>
    <li >Save items to your Wish List</li>
</ul>

       <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">SignUp</button>
            
        </div>
        

        <div id="id01" class="modal">
          
          <form action="submit" method="post" class="modal-content animate"  style="width: 700px " >
        
         
        <div class="formContainer">
        <h1>Sign Up Form</h1>
        <hr>
        <label for="name"><b>Name</b></label>
        <input type="text" placeholder="Enter Name" name="name" required>
        <label for="email"><b>Email</b></label>
        <input type="text" placeholder="Enter Email" name="email" required>
        <label for="password"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="password" required>
        <div>
        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancel">Cancel</button>
        <button type="submit" class="signup" onclick="">Sign Up</button>
        </div>
      
        </div>
                 <%String msg=request.getParameter("msg");
        	if("valid".equals(msg)){
        		
        	
        		%>
        		<h1>successfully Registered!!</h1>
<%} %>
<%
if("invalid".equals("msg"))
{
%>
<h1>something went wrong!Try Again!</h1>
<%} %>
        </form>
 
    </div>
</div>
</div>   
 
<script>
// Get the modal
var modal = document.getElementById('id01');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
function msg(){
	alert(1);
}
</script>

</body>
</html>
