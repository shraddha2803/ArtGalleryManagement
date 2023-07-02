<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
     <%@page import="com.servlet.submit.Artdto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
List<Artdto> list=(ArrayList<Artdto>)request.getAttribute("list");
%>



<div align="centre">

<table>
<tr>

<th>artname</th>
<th>price</th>
<th>type</th>
<th>artby</th>
<th>image</th>

<tr>
<%
for(Artdto dto : list){%>
<tr>
<td><%=dto.getArtname() %></td>
<td><%=dto.getPrice() %></td>
	<td><%=dto.getType() %></td>
	<td><%=dto.getArtby() %></td>
	<td><img src="<%=dto.getArtimage()%>"height="50px"></td>
</tr>

<% }%>

</table>

</div>

</body>
</html>