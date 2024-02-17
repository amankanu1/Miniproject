<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&family=IBM+Plex+Serif:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">

<div class="row">

    <%
    	User uuu=(User)session.getAttribute("currentUser");
        Thread.sleep(500);
        
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cid=Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if(cid==0){
       
        	posts = d.getAllPosts();
      
        }else{
        	posts=d.getPostByCatId(cid);
        }
        if(posts.size()==0)
        {
        	out.println("<h2 class='display-3 text-center'>No Product Avilable...</h2>");
        	return;
        }
        for (Post p : posts) {
    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="img/<%= p.getPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%= p.getProductname()%></b>
                <p><%= p.getSmallcontent()%></p>
                <p>Price :<%= p.getPrice() %> Rs</p>
                

            </div>
           <div class="card-footer primary-background text-center">
                <% 
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>

                
				<a href="#!" onclick="doLike(<%=p.getPid() %>,<%= uuu.getId() %>)" class="btn btn-outline-primary btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span>  </a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-primary btn-sm">Read More...</a>
                <a href="#!" class="btn btn-outline-primary btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
                
            </div>
           
        </div>


    </div>


    <%
        }
        

    %>

</div>