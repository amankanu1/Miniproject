package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Cart;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");

            if (cartList == null) {
                cartList = new ArrayList<>();
                session.setAttribute("cart-list", cartList);
            }

            String pidParam = request.getParameter("pid");
            if (pidParam == null || pidParam.isEmpty()) {
                out.println("Product ID is missing or empty");
                return; // Exit the method
            }

            int pid;
            try {
                pid = Integer.parseInt(pidParam);
            } catch (NumberFormatException e) {
                out.println("Invalid Product ID format");
                return; // Exit the method
            }

            boolean exist = false;

            for (Cart c : cartList) {
                if (c.getPid() == pid) {
                    exist = true;
                    break;
                }
            }

            if (!exist) {
                Cart cn = new Cart();
                cn.setPid(pid);
                cn.setQuantity(1);
                cartList.add(cn);
                response.sendRedirect("profile.jsp");
            } else {
                out.println("<h3 style='color:crimson; text-align:center'>Product already exists in the cart<a href='cart1.jsp'>Go to Cart Page</a></h3>");
            }

            for (Cart c : cartList) {
                out.println(c.getPid());
            }
        }
    }
}

