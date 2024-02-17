<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Cart"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.*"%>
<% User user = (User) session.getAttribute("currentUser");
List<Order> orders= null;
    if (user != null) {
        request.setAttribute("user", user);
        orders = new OrderDao(ConnectionProvider.getConnection()).userOrders(user.getId());
    }
    else{
    	response.sendRedirect("login_page.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>

<title>E-Commerce Cart</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&family=IBM+Plex+Serif:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
	<header>
        
        <div class="poster">
            
            <div class="box">
                <div class="sidebar1">
                    <div class="s1"></div>
                </div>
                
                <div class="sidebar2">
                    <div class="s2"></div>
                </div>
                
                <div class="middle_cont"></div>
                
                 <div class="sidebar3">
                    <div class="s3"></div>
                </div>
                <div class="sidebar4">
                    <div class="s4"></div>
                </div> 
            </div>

            <div class="poster_name">
                <span>ELECTROSHARE</span>
            </div>
        </div>
    </header>

           <nav>
        <div class="navigation">
                <div class="menu">
                    <input type="checkbox" name="checkbox" id="Show_sidebar">
               
                    <label id="nav_lable" for="Show_sidebar">
                        <i id="menu_icon" class="fa fa-bars"></i>
                        <span id="menu_icon_lable">All</span>
                    </label>

    
                    <div class="sidebar_section">
                        <div id="Menu_Sidebar">
                            <h1 id="Menu_Sidebar_header">Electroshare</h1>
                           <h2>Connect Locally, Buy Globally</h2>
                           <ul>
                               <a href="index.jsp">
                               <li id="Home_list_item">
                                    <img src="./all web image stock/sidebarhome.png" alt=""> 
                                    <span>Home</span>
                                </li>
                               </a>
                    
                               <a href="profile.jsp">
                               <li id="Profile_list_item">
                                <img src="./all web image stock/sidebarprofile.png" alt="">
                                <span>Profile</span>
                                </li>
                               </a>
                    
                               
                               
                               <a href="cart1.jsp">
                               <li id="Cart_list_item">
                                <img src="./all web image stock/sidebarcart.png" alt="">
                                <span>Cart</span>
                              </li>
                               </a>
                               
                               <a href="orders.jsp">
                               <li id="Orders_list_item">
                                   <img src="./all web image stock/sidebarorder.png" alt=""> 
                                   <span>Orders</span>
                                </li>
                              </a>
                              <a href="LogoutServlet">
                               <li id="Orders_list_item">
                                   <img src="./all web image stock/logout.png" alt=""> 
                                   <span>Logout</span>
                                </li>
                              </a>
                              
                            </ul>
                        </div> 
                        
                        <div class="hide_sidebar">
                            <label for="Show_sidebar"> &times;</label>
                        </div>
                    </div>
                    

                </div>
            
            <a id="hearderform_link" href="livelocation.jsp">
              <div class="userloction">
                <i id="cart_logo" class="fa fa-map-marker"></i>
                <div class="hearderformText">
                      <span id="Text1"> Live Location</span>
                      
                </div>
                
              </div>
            </a>
            <a id="header_cart_link" href="" data-toggle="modal" data-target="#add-post-modal">
                <div class="header_cart">
                    <i class="fa fa-upload" id="cart_logo"></i>
                    <span id="Text1">Upload product</span>
                </div>
            </a>
          
            <div class="SearchBar">
                <input type="text" id="Search" placeholder="Search Your Product....">
                <a href="##" id="summit_text">
                    <i class="fa fa-search" id="search_icon"></i>
                </a>
            </div>
      
            <a id="headProfile_link"  href="profile.jsp" >
                  <div class="Account">
                        <i id="cart_logo"class="fa fa-home" ></i>
                        <span id="Text1" >Home</span>
                  </div>
            </a>
            
            
            <a id="header_cart_link" href="cart1.jsp">
                <div class="header_cart">
                    <i id="cart_logo" class='fa fa-shopping-cart'></i>
                    <span class="badge bg-danger">${cart_list.size()} </span>
                </div>
            </a>
             <a id="header_cart_link" href="LogoutServlet">
                <div class="header_carte">
            <i id="cart_logo"class="fa fa-sign-out" ></i>
                    <span id="Text1">Logout</span>
                </div>
            </a>
          
          </div>    
          
        
    </nav>
	
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			
			if(orders != null){
				 System.out.println(orders);
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<% System.out.println(o.getDate());%>
						<td><%=o.getProductname() %></td>
						<td><%= o.getQuantity() %></td>
						
						<td><%= o.getPrice() %></td>
						<td><a class="btn btn-sm btn-danger" href="CancelorderServlet?pid=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
	<script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
       <script src= https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js></script>
        <script src="js/myjs.js" type="text/javascript"></script>
		<script>
				$(document).ready(function(){
					let editStatus = false;
					$('#edit-profile-button').click(function(){
			//			alert("button clicked")
						if(editStatus == false)
							{
								$("#profile-details").hide()
								
								$("#profile-edit").show();
								editStatus = true;
								$(this).text("Back")
							}else
								{
									$("#profile-details").show()
								
									$("#profile-edit").hide();
									editStatus = false;
									$(this).text("Edit")
								}
						
					})
				});
		</script>
		        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "Upload successfully", "success");
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
        <script >
        function getPosts(catid,temp){
        	$("#loader").show;
        	$("#post-container").hide()
        	$(".c-link").removeClass('active')
        	$.ajax({
    			url : "load_posts.jsp",
    			data :{cid:catid},
    			success: function (data,textStatus,JqXHR){
    				console.log(data);
    				$("#loader").hide();
    				$("#post-container").show();
    				$('#post-container').html(data)
    				$(temp).addClass('active')
    			}
    		})
        }
        	$(document).ready(function (e){
        		let allproductRef=$('.c-link')[0]
        		getPosts(0,allproductRef)
        	})
        </script>
 
</body>
</html>