<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.servlet.submit.ConnectionProvider" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
 
  <title>ArtGallery Project</title>
<style>

select.art {
  width: 50%; /* Full width */
  padding: 12px 20px; /* Padding */
  margin: 5px 10px 5px 300px; /* Margin */
  display: inline-block; /* Display as inline-block */
  border: 1px solid #ccc; /* Border */
  border-radius: 4px; /* Rounded corners */
  box-sizing: border-box; /* Box-sizing */
  font-size: 16px; /* Font size */
}

select.art:focus {
  outline: none; /* Remove outline on focus */
  border-color: #4CAF50; /* Green border on focus */
}

.option {
  background-color: white; /* Background color */
  color: black; /* Text color */
}

.drawing{
    align: center;
    display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
  .center input[type=text]{
     width: 400px;
     height: 25px;
     box-shadow: black;
  }


.topnav{
  list-style-type: none;
  margin: 0;
  padding: 2px 2px;
  overflow: hidden;
  background-color:white;


}


.topnav a{
  float:left;
  display: block;
  color: black;
  text-align: center;
  padding: 12px 120px;
  text-decoration: none;
}


.topnav a:hover{


     color: grey;
     cursor: pointer;
     text-decoration: underline;


}

.dropbtn {
  background-color: red;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}


.dropdown {
  position: relative;
 
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: white;
  max-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}


.dropdown:hover .dropdown-content {display: block;}


.dropdown:hover .dropbtn {background-color: #3e8e41;}


.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: inline;
}


.container {
  position: relative;
  text-align: center;
  color: white;
}


.center{
    margin-left: 480px;
}


.sidenav {
  height: 100%;
  width: 0px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color:white;
  opacity:1;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}




.material-symbols-outlined {
  font-variation-settings:
   
  'FILL' 5,
  'wght' 300,
  'GRAD' 2,
  'opsz' 48
  'wdth' 500,
}



ul {
  list-style-type: none;
 margin-left:220px;
 margin-right:250px;
  padding: 0;
  overflow: hidden;
  background-color: white;;
  color: rgb(105, 120, 155);;
}

li {
  float: left;
}

li a {
  display: block;
  color: background-color: rgb(105, 120, 155);;
  text-align: center;
  padding: 10px 10px;
  text-decoration: none;
}

li a:hover {
  background-color: white;
}
 
button {
  background-color: hsl(206, 41%, 32%);; /* Green background */
  color: white; /* White text */
  padding: 12px 24px; /* Padding */
  border: none; /* No border */
  border-radius: 8px; /* Rounded corners */
  font-size: 16px; /* Font size */
  cursor: pointer; /* Cursor on hover */
}

button:hover {
  background-color: skyblue; /* Darker green on hover */
}


</style>
</head>



<body style="background-color: #a4b1d1;">
  <div class="container">
    <img src="back2.jpg" height="65" style="width:100%; background-color: rgb(105, 120, 155);">
    <div class="centered"><h1>Art Gallery</h1>
     
    </div>

  </div>

 
   
<div class="menu" style="margin-top:05px;">
              

<div class="topnav sticky" style="background-color: #a4b1d1;">
    <ul>
        <li >
 
             <%String email=session.getAttribute("email").toString(); %>
            <li><a href="#"><%out.println(email); %> <i class='fas fa-user-alt'></i></a></li>
        <li> <a href="mycart.jsp" ><i class='fas fa-cart-arrow-down'></i>MyCart</a></li>
        <li>
        <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a></li>
        
     </ul>
</div>

</div>
  <form action="DisplayServlet" method="post">
     
           <label for="drawing"><h3 style="width:167px;margin-left:620px;margin-top:05px;background-color:rgb(64, 86, 136);padding:5px;color:white">  Search by art type:</h3></label>
<select name="drawing" id="drawing" class="art" >
    <div class="option">
  <option value="Painting" class="option">Painting</option>
  <option value="Sketch" class="option">Sketch</option>
  <option value="Mandala " selected class="option">Mandala</option>
  <option value="Warali " class="option">Warali</option>
</div>
</select>
     
           
            <button type="submit" >SEARCH</button>
     
     
     </form>
     
    <br>
   



 
  <img src="sky.png" width="320" height="350" style="margin-left:70px;">
  <img src="EiffelTower.jpg" width="330" height="350">
  <img src="maditativeMandala.jpg" width="330" height="350">
  <img src="w2.png" width="330" height="350">
   
 


   <table style="width: 80%; margin-left:110px;">
    <tr style=" background-color:rgb(64, 86, 136);" >
      <th align="center" style="color:white">About Us</th>
      <th align="center" style="color:white">Contact Us</th>
    </tr>
    <tr>
      <td align="center" style="width: 50%;">Our website is E-commerce website which helps artists to showcase<br> there talent and encourages them to work on it.<br>And the artwork is globally visible to all the customers who want to buy it. </td>
      <td align="center" style="width: 50%;"> Phone no.- +91 9376412391<br>Telephone no.-24018<br>Address-flat no.2,Raja appartment,kothrud,pune<br>Email- <a href="mailto:abc@gmail.com">abc@gmail.com</a> </td>
     
     
    </tr>
   </table>
 
  
    
   

     
</body>
</html>















