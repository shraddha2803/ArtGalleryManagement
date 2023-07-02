package com.servlet.submit;
import java.sql.*;
public class ConnectionProvider {
	public static Connection con;
	public static Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql:///dbmsproject","root","root123");
			return con;
		}
		catch(Exception e)
		{
			System.out.print(e);
			return null;
		}

	}
}
