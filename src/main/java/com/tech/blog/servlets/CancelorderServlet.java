package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.OrderDao;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class CancelorderServlet
 */
@WebServlet("/CancelorderServlet")
public class CancelorderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			String pid= request.getParameter("pid");
			if(pid!=null) {
				OrderDao orderDao = new OrderDao(ConnectionProvider.getConnection());
				orderDao.cancelOrder(Integer.parseInt(pid));
			}
			response.sendRedirect("orders.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
