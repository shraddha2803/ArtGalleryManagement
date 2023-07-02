<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.servlet.submit.ConnectionProvider" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
 
<title>Art submit</title>
<style>

body {
    font-family: Arial, Helvetica, sans-serif;
background-image: url("crt.jpg");
background-repeat: no-repeat;
background-size: cover;



}

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
    .Neon {
    font-family: sans-serif;
    font-size: 14px;
    color: #494949;
    position: relative;
   


}
.Neon * {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.Neon-input-dragDrop {
    display: block;
    width: 343px;
    height: 150px;
    margin: 0 auto 25px auto;
    margin-top: 100px;
    padding: 25px;
    color: #8d9499;
    color: #97A1A8;
    background: #fff;
    border: 2px dashed #C8CBCE;
    text-align: center;
    -webkit-transition: box-shadow 0.3s, border-color 0.3s;
    -moz-transition: box-shadow 0.3s, border-color 0.3s;
    transition: box-shadow 0.3s, border-color 0.3s;
}
.Neon-input-dragDrop .Neon-input-icon {
    font-size: 48px;
    margin-top: -10px;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
.Neon-input-text h3 {
    margin: 0;
    font-size: 18px;
}
.Neon-input-text span {
    font-size: 12px;
}
.Neon-input-choose-btn.blue {
    color: #008BFF;
    border: 1px solid #008BFF;
}
.Neon-input-choose-btn {
    display: inline-block;
    padding: 8px 14px;
    outline: none;
    cursor: pointer;
    text-decoration: none;
    text-align: center;
    white-space: nowrap;
    font-size: 12px;
    font-weight: bold;
    color: #8d9496;
    border-radius: 3px;
    border: 1px solid #c6c6c6;
    vertical-align: middle;
    background-color: #fff;
    box-shadow: 0px 1px 5px rgba(0,0,0,0.05);
    -webkit-transition: all 0.2s;
    -moz-transition: all 0.2s;
    transition: all 0.2s;
}
    .art{
        height: 40px;
        width: 270px;
    }


     #name{
        height: 40px;
        width: 270px;
    }

   #aname{
     height: 40px;
     width: 270px;
 }
     #price{
        height: 40px;
        width: 270px;
    }


    .column {
          float: left;
           width: 23%;
            padding: 3px;
        }


/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}



.alert
{
	color:Blue;
}



@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px; witdh:300px;}
}
   


.material-symbols-outlined {
  font-variation-settings:
   
  'FILL' 5,
  'wght' 300,
  'GRAD' 2,
  'opsz' 48
  'wdth' 500,
}

.option{
width:120px;}


ul {
  list-style-type: none;
 margin-left:200px;
 margin-right:250px;
  padding: 0;
  overflow: hidden;
  background-color: rgb(105, 120, 155);
  color:white;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: white;
}
 



</style>
</head>


<body>
<%String email=session.getAttribute("email").toString(); %> 


<div class="menu" style="margin:50px;margin-left:50px;">
              

<div class="topnav sticky">
    <ul>
        <li >
        
    
            <li><a href=""><%out.println(email); %> <i class='fas fa-user-alt'></i></a></li>
          </li>
        <li >
        <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a></li>
        
       
        
     </ul>
</div>

</div>



<% String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product added successfully!</h3>

<%} %>
<% 
if("wrong".equals(msg))
{
%>
<h3 class="alert">Something went wrong!</h3>

<%} %>


    <h1>Sell your Artwork here</h1>

    <form action="ArtworkServlet" method="post" enctype="multipart/form-data">
    <div class="row">
        
         <div class="column">
     <label for="fname"><h3>Description about atwork:</h3></label>
    <input type="text" id="name" name="artname" placeholder="Name of art...">
     </div>
   
   
   
     <div class="column">
    <label for="price"><h3>Enter the price:</h3></label>
    <input type="text" id="price" name="price" placeholder="Enter the price...">
</div>



   <div class="column">
    <label for="drawing"><h3>Enter the art type:</h3></label>
<select name="drawing" id="drawing" class="art">
    <div class="option">
  <option value="Painting" class="option">Painting</option>
  <option value="Sketch" class="option">Sketch</option>
  <option value="Mandala " selected class="option">Mandala</option>
  <option value="Warali " class="option">Warali</option>
</div>
</select>
        </div>



</div>

<div class="column">
 <input type="file" id="myFile" name="artimage">

</div>

<button type="submit">Upload</button>
</form>

  
  




</body>
</html>












