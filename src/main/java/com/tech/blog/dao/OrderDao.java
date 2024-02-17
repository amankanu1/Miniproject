package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.User;
import com.tech.blog.entities.Order;
import com.tech.blog.entities.Post;

public class OrderDao {
	 private Connection con;

	    public OrderDao(Connection con) {
	        this.con = con;
}
	    public boolean insertOrder(Order model) {
	        boolean result = false;
	        try {
	            String query = "insert into orders(p_id, u_id, o_quantity, o_date) values (?, ?, ?, ?)";
	            PreparedStatement p = con.prepareStatement(query);
	            p.setInt(1, model.getPid());
	            p.setInt(2, model.getUid());
	            p.setInt(3, model.getQuantity());
	            p.setString(4, model.getDate());
	            
	            // Execute the prepared statement
	            int rowsAffected = p.executeUpdate();
	            
	            // If rowsAffected is greater than 0, insertion was successful
	            if (rowsAffected > 0) {
	                result = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return result;
	    }
	    public List<Order> userOrders(int id){
			List<Order>list = new ArrayList<>();
			try {
				String query ="select*from orders where u_id=? order by orders.o_id desc";
				PreparedStatement p = con.prepareStatement(query);
				p.setInt(1, id);
				ResultSet set = p.executeQuery();
				while(set.next()) {
					Order order = new Order();
					PostDao postDao =new PostDao(this.con);
					int pid = set.getInt("p_id");
					Post product = postDao.getSingleProduct(pid);
					order.setOrderId(set.getInt("o_id"));
					order.setPid(pid);
					order.setProductname(product.getProductname());
					order.setPrice(product.getPrice()*set.getInt("o_quantity"));
					order.setQuantity(set.getInt("o_quantity"));
					order.setDate(set.getString("o_date"));
					list.add(order);
					
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
	    	return list;
	    	
	    }
	    public void cancelOrder(int pid) {
	    	try {
	    		String query= "delete from orders where o_id=?";
	    		PreparedStatement p = con.prepareStatement(query);
	    		p.setInt(1, pid);
	    		p.execute();
	    		}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    }
	    }