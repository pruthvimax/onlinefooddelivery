`<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dataBase.DBConfig"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%
    String phno=null;
    try{
        HttpSession hs=request.getSession();
        phno=hs.getAttribute("username").toString();
        String password=hs.getAttribute("password").toString();
        
        if(phno.equals("")|| password.equals("")||phno.equals("null")|| password.equals("null"))
        {
            response.sendRedirect("user.html");
            
        }
        
    }
    catch (Exception e){
        out.println(e);
        response.sendRedirect("user.html");
    }
    %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Restoran - Bootstrap Restaurant Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>fodee</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                               <a href="category.jsp" class="nav-item nav-link ">category</a>
                      <a href="menu.jsp" class="nav-item nav-link">Menu</a>
                 
                  
                        
                      


                       <a href="order.jsp" class="nav-item nav-link active">order</a>
                           <a href="index.html" class="nav-item nav-link">logout</a>
                        
                    </div>
                    
                </div>
            </nav>

            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown"></h1>
                    <nav aria-label="breadcrumb">
                       
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Menu Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal"></h5>
                    <h1 class="mb-5">Order Detail's</h1>
                </div>
             </div>
        </div>
    <div class="container">
        <h1 class="mb-5">Pending Order's</h1>
             <table id="customers">
                  <thead>                 
                  <tr>
                      <th scope="col">SLNO</th>
                      <th scope="col">ID</th>
                      <th scope="col">FoodId</th>
                        <th scope="col">FoodName</th>
                      <th scope="col">Price</th>
                      <th scope="col">Time</th> 
                     <th scope="col">Status</th> 
                      <th scope="col">Uid</th> 
                      <th></th>
                  </tr>
                  </thead>
                                   
                   <form action="userorder" method="POST" class="form-inline">   
                          
                   <input type="hidden" name="id" value="1" class="form-input">
                  
                   
               
                    </td>                      
                      <%
                        try{
                  
                  Class.forName("com.mysql.jdbc.Driver");
                   Connection con=new DBConfig().getConnection();
                  Statement stat=con.createStatement();
                  ResultSet res=stat.executeQuery("SELECT * FROM `order` where status='ordered'");
                  int slno=0;               
                  while(res.next())
                  {
                      slno++;
                    
                     String id=res.getString("id");
                     String foodid=res.getString("foodid");
                     String foodname=res.getString("foodname");
                      String price=res.getString("price");
                     String time=res.getString("time");
                     String status=res.getString("status");
                    String uid=res.getString("uid");
                   out.println("<tr><td>"+slno+"</td><td>"+id+"</td><td>"+foodid+"</td><td>"+foodname+"</td><td>"+price+"</td><td>"+time+"</td><td>"+status+"</td><td>"+uid+"</td><td><button><a href='update?id="+id+"'>SUPPLY</button></a></td></tr>");
                  }
                   %>
             
                       <%
                        
                        } 
                        catch(Exception e)
                       
                        {
                            out.println(e);
                        }
                        
                        %>  
                       
                </table></div>
       <div class="container">
        <h1 class="mb-5">Supplied Order's</h1>
             <table id="customers">
                  <thead>                 
                  <tr>
                      <th scope="col">SLNO</th>
                      <th scope="col">ID</th>
                      <th scope="col">FoodId</th>
                        <th scope="col">FoodName</th>
                      <th scope="col">Price</th>
                      <th scope="col">Time</th> 
                     <th scope="col">Status</th> 
                      <th scope="col">Uid</th> 
                      <th></th>
                  </tr>
                  </thead>
                                   
                   <form action="userorder" method="POST" class="form-inline">   
                          
                   <input type="hidden" name="id" value="1" class="form-input">
                  
                   
               
                    </td>                      
                      <%
                        try{
                  
                  Class.forName("com.mysql.jdbc.Driver");
                   Connection con=new DBConfig().getConnection();
                  Statement stat=con.createStatement();
                  ResultSet res=stat.executeQuery("SELECT * FROM `order` where status='supllied'");
                  int slno=0;               
                  while(res.next())
                  {
                      slno++;
                    
                     String id=res.getString("id");
                     String foodid=res.getString("foodid");
                     String foodname=res.getString("foodname");
                      String price=res.getString("price");
                     String time=res.getString("time");
                     String status=res.getString("status");
                    String uid=res.getString("uid");
                   out.println("<tr><td>"+slno+"</td><td>"+id+"</td><td>"+foodid+"</td><td>"+foodname+"</td><td>"+price+"</td><td>"+time+"</td><td>"+status+"</td><td>"+uid+"</td></tr>");
                  }
                   %>
             
                       <%
                        
                        } 
                        catch(Exception e)
                       
                        {
                            out.println(e);
                        }
                        
                        %>  
                       
                </table></div>
        <!-- Footer Start -->
         <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>

           