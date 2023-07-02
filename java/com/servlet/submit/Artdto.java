package com.servlet.submit;

public class Artdto {
	private String artname;
	private double price;
	private String type;
	private String artby;
	private String artimage;
	
	public String getArtimage() {
		return artimage;
	}
	public void setArtimage(String artimage) {
		this.artimage = artimage;
	
	}
	public String getArtname() {
	
	return artname;
	
	}
	
	public void setArtname(String artname) {
		this.artname = artname;
	}
	
	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getArtby() {
		return artby;
	}
	public void setArtby(String artby) {
		this.artby = artby;
	}
	
	
	

}
