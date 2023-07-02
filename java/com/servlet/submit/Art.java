package com.servlet.submit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.SQLException;
import java.util.*;



public class Art {
	private static final long serialVersionUID = 1L;
	private static final String display="SELECT * FROM artwork where type = ?";
	public List<Artdto> getArt(String type ) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		List<Artdto> list=new ArrayList<Artdto>();
		Artdto dto=null;
		
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql:///dbmsproject","root","root123");
				ps=con.prepareStatement(display);
				ps.setString(1,type);
				rs=ps.executeQuery();
				while(rs.next()) {
					dto=new Artdto();
					dto.setArtname(rs.getString(1));
					dto.setType(rs.getString(2));
					dto.setPrice(rs.getDouble(3));
					dto.setArtimage(rs.getString(4));
					dto.setArtby(rs.getString(5));

					list.add(dto);
		
					
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
			
			return list;}
			
			
			
		

		
		
		
		
		

		
		
		
	}