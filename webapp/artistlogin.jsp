<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ArtistLogin</title>

<style>
     * {
   box-sizing: border-box;
   }
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
   .column {
 float: left;
 width: 50%;
 padding: 10px;
 height: 300px; /* Should be removed. Only for demonstration */
  } 
* Clear floats after the columns */
  .row:after {
 content: "";
 display: table;
 clear: both;
 }

body {
	    background-image: url("pic1.png");
background-repeat: no-repeat;
background-size: cover;
}

.wrapper {
    margin-right: 50px;
	max-width: 600px;
	margin: 0 auto;
}

ol {
	list-style: none;
	padding: 0;
}

li + li {
	margin-top: 1rem;
}

li {
	display: flex;
	align-items: center;
	gap: 1rem;
	background: aliceblue;
	padding: 1.5rem;
	border-radius: 1rem;
	width: calc(100% - 2rem);
	box-shadow: 0.25rem 0.25rem 0.75rem rgb(0 0 0 / 0.1);
}

li::before {
	counter-increment: list-item;
	content: counter(list-item);
	font-size: 3rem;
	font-weight: 700;
	width: 2em;
	height: 2em;
	background: black;
	flex: 0 0 auto;
	border-radius: 50%;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
}

form{
   
   margin: 10px 500p;
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
  background-color: #fefefe;
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


   
<div class="row" style="margin:10px;height: 80%;">
    <div class="column"  >
<h1 style=" text-align: centre; margin-top: 60px;text-decoration: wavy; margin-left: 120px;margin-right: 100px; color: #242425;background-color: #fefefe;">Sell ArtWork online with us</h1>
        <div style="text-align: center;margin-bottom:20px;margin-top: 10px;margin-left:90px;margin-right:90px;background-color: #fefefe;">
            <br>
            <h2 style="color: rgb(20, 20, 20);" >SELL YOUR ART</h2>
            
            <p style="text-align: center; ">
                Create an account with us
            </p>
            <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Register Now</button>
<br>
<p>Already have an account?</p>
  <br>
  

  <h3>LOGIN HERE</h3>
<form action="ArtistloginServlet" method="post">
<div class="container" >
  <label for="email"><b>email</b></label>
  <input type="text" placeholder="Enter email" name="email" required>
  <label for="password"><b>Password</b></label>
  <input type="password" placeholder="Enter Password" name="password" required>
    
  <button type="submit">Login</button>
 </div>
  <div class="container" style="background-color:#e5ebed2d;margin-top: 00px;">
  <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
  
</div>
</form>
        </div>

    </div>
<div class="column" >
    <div class="wrapper">
        <h1 style="color: white;">How to sell your Artwork Online ?</h1>
        <ol role="list">
        <li><span><h3>Register with us</h3> </span>Register with us by filling the basic information. </li>
          <li><span><h3>Upload your artwork </h3></span>Once you register and pay registration fee, click on 'Upload Product'. Upload all your artworks one by one, with filling up the necessary information.</li>    
        <li><span><h3>Order placed by Buyer</h3> </span>  Once you receive an order, you just need to pack the painting & courier to us. After quality verification, we will courier painting to the buyer.</li>           
        <li><span><h3>Payemet to Artist</h3>  </span>Once we confirm delivery to buyer, you will receive your payment within 10 to 15 days, in the bank account mentioned by you in your profile. </li>            </ol>
              </div>
   
			</div>

			<div id="id01" class="modal">
			  
			  <form action="register" method="post" class="modal-content animate"  style="width: 700px;">
			
			 
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
			<button type="submit" class="signup" >Sign Up</button>
		</div>     
	</div> 
	         </form>	
		    
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
		</script>
		
</body>
</html>