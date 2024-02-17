
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
<%@page import="com.tech.blog.entities.User"%>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if(cart_list != null){
    	PostDao pDao = new PostDao(ConnectionProvider.getConnection());
    	cartProduct = pDao.getCartProducts(cart_list);
    	request.setAttribute("cart_list", cart_list);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>




       
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&family=IBM+Plex+Serif:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
       
    </head>
    <body>
        <!--navbar--> 
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
      
            <a id="headProfile_link"  href="#!"  data-toggle="modal" data-target="#profile-modal">
                  <div class="Account">
                        
                        <span id="Text1" ><%= user.getName() %></span>
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



        <!--end of navbar-->
        
          <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%= m.getCssClass() %>" role="alert">
                                <%= m.getContent() %>
                            </div> 


                            <%        
                                    session.removeAttribute("msg");
                                }

                            %>
     <!--prem's body -->
<main>
	<div class="container">
	<div class="row mt-4">
		<div class="col-md-4">
			<div class="list-group">
			  <a href="#" onclick="getPosts(0,this)"class=" c-link list-group-item list-group-item-action active">
			    All Products
			  </a>
			  <%
			  	PostDao d=new PostDao(ConnectionProvider.getConnection());
			  ArrayList<Category>list1 =d.getAllCategories();
			  for(Category ak : list1){
				  
				  %>
				  		<a href="#" onclick="getPosts(<%= ak.getCid() %>,this)"  class=" c-link list-group-item list-group-item-action"><%= ak.getCname() %></a>
				  <%
				  
			  }
			  
			  %>
			  
			 
			</div>
		</div>
		<div class="col-md-8" >
		
		<div class="container text-center" id="loader">
		<i class="fa fa-refresh fa-3x fa-spin"></i>
		<h3>Please wait...</h3>
		</div>
			<div class="container-fluid" id="post-container"></div>
		</div>
		</div>
	</div>
</main>








<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Upload product:</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="add-post-form" action="AddPostServlet" method="post">
        <div class="form-group">
        	<select class="form-control" name="cid">
        		<option selected disabled ="">---Select Category---</option>
        		<%
        			PostDao postd = new PostDao(ConnectionProvider.getConnection());
        			ArrayList<Category> list =postd.getAllCategories();
        			for(Category c:list)
        			{
        				%>
        				<option value="<%= c.getCid() %>">
        				<%= c.getCname() %>
        				
        				</option>
        				
        			<% 	
        			}
        		%>
        	</select>
        </div>
        	<div class="form-group">
        		<input name="productname" type="text" placeholder="Enter Product Title" class="form-control" >
        		
        	</div>
        	<div class="form-group">
        		<textarea name="smallcontent" placeholder="Enter Product content" class="form-control" style="height: 100px;" ></textarea>
        		
        	</div>
        	<div class="form-group">
        		<input name="price" type="text" placeholder="Enter Price" class="form-control" >
        		
        	</div>
        	
        	<div class="form-group">
        	<label>Upload Product Picture"</label>
        	<br>
        		<input type="file" name="pic" >
        		
        	</div>
        			<div class="container text-center">
        				<button type="submit" class="btn btn-outline-primary">Post</button>
        			</div>
        	</form>
  			</div>
     
      
    </div>
    
  </div>
  
</div>


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="container text-center">
      <img  src="img/<%= user.getProfileinfo() %>"class="img-fluid" style="border-radius:50%;max-width: 200px;">
      
         <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
         <!-- details -->
  <div id="profile-details">    
 <table class="table">
  <tbody>
    <tr>
      <th scope="row">Registration ID :</th>
      <td><%= user.getId() %></td>
    
    </tr>
    <tr>
      <th scope="row">Email :</th>
      <td><%= user.getEmail() %></td>
     
    </tr>
    <tr>
      <th scope="row">Phone Number :</th>
      <td><%= user.getMobilrNumber() %></td>
      
    </tr>
    <tr>
      <th scope="row">Registration Date :</th>
      <td><%= user.getRdate() %></td>
      
    </tr>
  </tbody>
</table>
</div>
<div id="profile-edit" style="display: none;">
<h3 class="mt-2">Please Edit Carefully</h3>
<form action="EditServlet" method="post" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<td> Registration ID :</td>
			<td><%= user.getId() %></td>
		</tr>
		<tr>
			<td> Email :</td>
			<td><input type="email" class="form-control" name="email" value="<%= user.getEmail() %>"></td>
		</tr>
		<tr>
			<td> Phone Number :</td>
			<td><input type="number" class="form-control" name="MobilrNumber" value="<%= user.getMobilrNumber() %>"></td>
		</tr>
		<tr>
			<td> Name :</td>
			<td><input type="text" class="form-control" name="name" value="<%= user.getName() %>"></td>
		</tr>
		<tr>
			<td> Password :</td>
			<td><input type="password" class="form-control" name="password" value="<%= user.getPassword() %>"></td>
		</tr>
		<tr>
			<td>Update Profile :</td>
			<td><input type="file" class="form-control" name="image" ></td>
		</tr>
	</table>
	<div class="container">
		<button type="submit" class="btn btn-outline-primary">save</button>
	</div>
</form>

      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
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
