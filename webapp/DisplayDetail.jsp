<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.servlet.submit.ConnectionProvider" %>


     <%@page import="java.util.*"%>
     <%@page import="com.servlet.submit.Artdto"%>

     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  


<title>Details</title>
<style>
     
        .heading{
            background-image:linear-gradient(red,yellow);
             text-align: center;
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




div.polaroid {
 
  background-color: white;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  margin-bottom: 35px;
 
}


div.container {
  text-align: center;
  padding: 10px 20px;
}


#myImg {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}


#myImg1 {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

/* The Modal (background) */



/* Caption of Modal Image */
#caption {
  margin: auto;
  display: block;
  width: 100%;
  max-width: 700px;
  text-align: center;
  color: black;
  padding: 8px 0;
  height: 10px;
}


/* Add Animation */
.modal-content, #caption {  
  -webkit-animation-name: zoom;
  -webkit-animation-duration: 0.6s;
  animation-name: zoom;
  animation-duration: 0.6s;
}


@-webkit-keyframes zoom {
  from {-webkit-transform:scale(0)}
  to {-webkit-transform:scale(1)}
}


@keyframes zoom {
  from {transform:scale(0)}
  to {transform:scale(1)}
}


/* The Close Button */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color:black;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}


.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}


/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .modal-content {
    width: 100%;
  }
}


.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: inline;
}


.cont {
  position: relative;
  text-align: center;
  color: white;
}
.alert
{
	color:blue;
}
 
         
        </style>





</head>





<body style="background-color: #a4b1d1;">

   <div class="cont">
    <img src="back2.jpg" height="100" style="width:100%;">
    <div class="centered"><h1>ART WORKS</h1>
    
    </div>
     
    </div>
   <br>
   <br>
   
    
    

 




<table>
<thead>




<row>
<%
List<Artdto> list=(ArrayList<Artdto>)request.getAttribute("list");
%>

<%int counter=0; %>


  <%
for(Artdto dto : list){%>


<%counter++; %>

 <%if(counter!=4) {%>

      <div class="column" style="text-size:15px;">
            <div class="polaroid" style="width: 300px;">
              <img id="myImg" src="<%=dto.getArtimage()%>"class="image" width="300" height="300">

              <div class="container" ><%=dto.getArtname() %><br>Price- Rs <%=dto.getPrice() %><br>Artist- <a href="mailto:<%=dto.getArtby() %>"><%=dto.getArtby() %></a>
              <br>
          <h3><a href="cart.jsp?productName=<%=dto.getArtname()%>">Add to cart</a></h3>
                
              </div>
            </div>
      </div>
          
<%}else{%>
<br>
<%counter=0; %>
<%} %>




<%} %>

</row>


      </table>
      

</body>
  </html>