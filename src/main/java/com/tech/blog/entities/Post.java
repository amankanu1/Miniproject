package com.tech.blog.entities;

import java.sql.*;

public class Post {

    private int pid;
    private String productname;
    private String smallcontent;
    private String pic;
    
    private Timestamp pdate;
    private int catid;
    private int userId;
    private int price;
    
   public Post() {
	   
   }

public Post(int pid, String productname, String smallcontent, String pic, Timestamp pdate, int catid, int userId, int price) {
	super();
	this.pid = pid;
	this.productname = productname;
	this.smallcontent = smallcontent;
	this.pic = pic;
	this.pdate = pdate;
	this.catid = catid;
	this.userId = userId;
	this.price = price;
}

public Post(String productname, String smallcontent, String pic, Timestamp pdate, int catid, int userId,int price) {
	super();
	this.productname = productname;
	this.smallcontent = smallcontent;
	this.pic = pic;
	this.pdate = pdate;
	this.catid = catid;
	this.userId = userId;
	this.price = price;
}

public int getPid() {
	return pid;
}

public void setPid(int pid) {
	this.pid = pid;
}

public String getProductname() {
	return productname;
}

public void setProductname(String productname) {
	this.productname = productname;
}

public String getSmallcontent() {
	return smallcontent;
}

public void setSmallcontent(String smallcontent) {
	this.smallcontent = smallcontent;
}

public String getPic() {
	return pic;
}

public void setPic(String pic) {
	this.pic = pic;
}

public Timestamp getPdate() {
	return pdate;
}

public void setPdate(Timestamp pdate) {
	this.pdate = pdate;
}

public int getCatid() {
	return catid;
}

public void setCatid(int catid) {
	this.catid = catid;
}

public int getUserId() {
	return userId;
}

public void setUserId(int userId) {
	this.userId = userId;
}
public int getPrice() {
	return price;
}

public void setPrice(int price) {
	this.price = price;
}

	
}

   