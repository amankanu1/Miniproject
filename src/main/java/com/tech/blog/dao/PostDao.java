/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Cart;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String q = "select * from Ctable";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String Cname = set.getString("Cname");
                String description = set.getString("description");
                Category c = new Category(cid, Cname, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {

            String q = "insert into Ptable(productname,smallcontent,pic,catid,userId,price) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getProductname());
            pstmt.setString(2, p.getSmallcontent());
            
            pstmt.setString(3, p.getPic());
            pstmt.setInt(4, p.getCatid());
            pstmt.setInt(5, p.getUserId());
            pstmt.setInt(6, p.getPrice());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

//    get all the posts
   public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from Ptable order by pid desc");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String productname = set.getString("productname");
                String smallcontent = set.getString("smallcontent");
                String pic = set.getString("pic");
                Timestamp pdate = set.getTimestamp("pdate");
                int catid = set.getInt("catid");
                int userId = set.getInt("userId");
                int price = set.getInt("price");
                Post post = new Post(pid, productname, smallcontent,  pic, pdate, catid, userId, price);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostByCatId(int catid) {
        List<Post> list = new ArrayList<>();
        //fetch all post by id
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from Ptable where catid=?");
            p.setInt(1, catid);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String productname = set.getString("productname");
                String smallcontent = set.getString("smallcontent");
                
                String pic = set.getString("pic");
                Timestamp pdate = set.getTimestamp("pdate");

                int userId = set.getInt("userId");
                int price = set.getInt("price");
                Post post = new Post(pid, productname, smallcontent, pic, pdate, catid, userId, price);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Cart> getCartProducts(ArrayList<Cart> cartList){
    	List<Cart> products = new ArrayList<Cart>();
    	try {
    		if(cartList.size()>0) {
    			for(Cart item:cartList) {
    				PreparedStatement p = con.prepareStatement("select * from Ptable where pid=?");
    	            p.setInt(1, item.getPid());
    	            ResultSet set = p.executeQuery();
    	            while(set.next()) {
    	            	Cart row = new Cart();
    	            	row.setPid(set.getInt("pid"));
    	            	row.setProductname(set.getString("productname"));
    	            	row.setPrice(set.getInt("price")*item.getQuantity());
    	            	row.setQuantity(item.getQuantity());
    	            	products.add(row);
    	            }
    	            
    			}
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return products;
    }
    
    public Post getSingleProduct(int pid) {
    	Post row =null;
    	try {
    		String query = "select * from Ptable where pid=?";
    		PreparedStatement p = con.prepareStatement(query);
    		p.setInt(1, pid);
    		ResultSet set = p.executeQuery();
    		while(set.next()) {
    			row = new Post();
    			row.setPid(set.getInt("pid"));
    			row.setProductname(set.getString("productname"));
    			row.setPrice(set.getInt("price"));
    			row.setPic(set.getString("pic"));
    		}
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
		return row;
    }
    
    public double getTotalCartPrice(ArrayList<Cart> cartList) {
    	double sum =0;
    	try {
    		if(cartList.size()>0) {
    			for(Cart item:cartList) {
    				PreparedStatement p = con.prepareStatement("select price from Ptable where pid=?");
    	            p.setInt(1, item.getPid());
    	            ResultSet set = p.executeQuery();
    	            while(set.next()) {
    	            	sum+=set.getDouble("price")*item.getQuantity();
    	            }
    			}
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return sum;
    }
    
    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from Ptable where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String productname = set.getString("productname");
                String smallcontent = set.getString("smallcontent");
               
                String pic = set.getString("pic");
                Timestamp pdate = set.getTimestamp("pdate");
                int cid=set.getInt("catid");
                int userId = set.getInt("userId");
                int price= set.getInt("price");
                post = new Post(pid, productname, smallcontent,  pic, pdate, cid, userId, price);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
}
