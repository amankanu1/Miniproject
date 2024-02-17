<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page  errorPage="error_page.jsp" %>
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

<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());

    Post p = d.getPostByPostId(postId);
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getProductname()%> || Electroshare by Aman and members </title>

        <div id="fb-root"></div>
		<div id="fb-root"></div>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v19.0" nonce="uV6gmhai"></script>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&family=IBM+Plex+Serif:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
        <style>



            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;

            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .categoryinfo{
                font-size: 20px;

            }


            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }

          
        </style>
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
                    <span id="Text1">${cart_list.size()} </span>
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

      
    
<!--main content-->
		<div class="container">
			<div class="row my-4">
			<div class="col-md-8 offset-md-2">
			<div class="card">
			<div class="card-header text-center">
				<h4><%=p.getProductname() %></h4>
			</div>
				<div class="card-body">
				 <img class="card-img-top my-2" src="img/<%= p.getPic()%>" alt="sorry something wen worng while uploading.." width="200" height="200"onerror="this.src='img/defalulpost.png'">
				<div class="row my-3 row-user">
					<div class="col-md-8">
					<% UserDao ud=new UserDao(ConnectionProvider.getConnection()); %>
						<p class="categoryinfo">Uploaded By : <a href="#"  data-toggle="modal" data-target="#profilemodal1"><%= ud.getUserByUserId(p.getUserId()).getName() %></a></p>
						<p class="categoryinfo"><%= p.getSmallcontent() %></p>
						<p class="post-date">Price :<%= p.getPrice() %> Rs</p>
				
						</div>
							<div class="col-md-4">
								<p class="post-date"><%= p.getPdate().toLocaleString() %></p>
								
						</div>
					</div>
				</div>
				
				
				</div>
				<div class="card-footer text-center">
				<% 
					LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
				%>
					<a href="#!" onclick="doLike(<%=p.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-primary btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span>  </a>
                <div class="fb-comments" data-href="http://localhost:8087/dutry2/show_blog_page.jsp?post_id=<%= p.getPid() %>" data-width="" data-numposts="5"></div>
                <a href="#!"  class="btn btn-outline-primary btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
                <a href="AddToCartServlet?pid=<%= p.getPid() %>"  class="btn btn-outline-dark btn-sm"> <span>Add To Cart</span>  </a>
                <a href="#"  class="btn btn-outline-primary btn-sm"> <span>Buy Now</span>  </a>
                <a href="profile.jsp">
		<button type="button" class="btn btn-secondary text-center">Back</button>
		</a>
				</div>	
				
						
				</div>
			</div>
		</div>
<!-- sellers modal -->


		











<!-- end of main content -->
<div class="modal fade" id="profilemodal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
      <img  src="img/default.png"class="img-fluid" style="border-radius:50%;max-width: 200px;">
      
         <h5 class="modal-title mt-3" id="exampleModalLabel">Sellers Info :</h5>
         <!-- details -->
  <div id="profile-details">    
 <table class="table">
  <tbody>
  	 <tr>
      <th scope="row">Sellers Profile Name :</th>
      <td><%= ud.getUserByUserId(p.getUserId()).getName()%></td>
    
    </tr>
    <tr>
      <th scope="row">Registration ID :</th>
      <td><%= ud.getUserByUserId(p.getUserId()).getId()%></td>
    
    </tr>
    <tr>
      <th scope="row">Email :</th>
      <td><%=ud.getUserByUserId(p.getUserId()).getEmail() %></td>
     
    </tr>
    <tr>
      <th scope="row">Phone Number :</th>
      <td><%= ud.getUserByUserId(p.getUserId()).getMobilrNumber() %></td>
      
    </tr>
    <tr>
      <th scope="row">Registration Date :</th>
      <td><%= ud.getUserByUserId(p.getUserId()).getRdate()%></td>
      
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
        
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Seller Info :</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <div class="modal-body">
      <div class="container text-center">
      <img  src="img/default.png"class="img-fluid" style="border-radius:50%;max-width: 200px;">
      
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
 
</html>

