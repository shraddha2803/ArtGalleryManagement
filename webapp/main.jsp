<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <style>
.button {
  background-color: #c4cbee; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 30px;
  margin: 4px 2px;
  cursor: pointer;
  width: 200px;
}
body {
    font-family: Arial, Helvetica, sans-serif;
background-image: url("crtv.jpg");
background-repeat: no-repeat;
background-size: cover;

}

.quote {
  width:70%;
  background-color: #50548a;
  padding: 20px;
  border-radius: 10px;
 margin-left:182px;
 margin-top:50px;
  text-align: center;
  box-shadow: 3px 3px 5px rgba(0,0,0,0.3);
}

.quote b {
  color: #c2c9eb;
  font-family: 'Montserrat', sans-serif;
  font-size: 55px;
  font-weight: bold;
  text-shadow: 1px 1px #ffffff;
}

    </style>

</head>

<body>

<div class="menu" style="margin:50px;margin-left:550px;">

<ul>
<button class="button" ><a href="signup.jsp">Customer</a></button><br><br><br>

<button class="button"><a href="artistlogin.jsp">Artist</a></button>

</ul>
</div>
<div class="quote">
  <b>"Explore a world of endless imagination and inspiration, where every stroke of the brush and every splash of color is a window into the artist's soul."</b>
</div>

</body>

</html>