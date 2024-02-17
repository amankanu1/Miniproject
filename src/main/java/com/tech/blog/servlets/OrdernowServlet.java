package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.OrderDao;
import com.tech.blog.entities.Cart;
import com.tech.blog.entities.Order;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class OrdernowServlet
 */
@WebServlet("/OrdernowServlet")
public class OrdernowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			User auth = (User) request.getSession().getAttribute("currentUser");
			if(auth != null) {
				String productId = request.getParameter("id");
				System.out.println(productId);
				int productQuantity = Integer.parseInt(request.getParameter("quantity"));
				System.out.println(productQuantity);
				if(productQuantity <0) {
					productQuantity =1;
				}
				
				Order orderModal = new Order();
				orderModal.setPid(Integer.parseInt(productId));
				
				orderModal.setUid(auth.getId());
				orderModal.setQuantity(productQuantity);
				orderModal.setDate(formatter.format(date));
				
				OrderDao orderdao = new OrderDao(ConnectionProvider.getConnection());
				boolean result = orderdao.insertOrder(orderModal);
				if(result) {
					ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
					if(cart_list != null)
					{
						for(Cart c: cart_list) {
							if(c.getPid()== Integer.parseInt(productId)) {
								cart_list.remove(cart_list.indexOf(c));
								break;
							}
						}
						
					}
					response.sendRedirect("orders.jsp");
				}
				else {
					out.print("order failed");
				}
				
			}else {
				response.sendRedirect("login_page.jsp");
			}
		}
			catch(Exception e) {
				e.printStackTrace();
			}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
