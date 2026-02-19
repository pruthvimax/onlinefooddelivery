<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dataBase.DBConfig"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<% 
    try{
        HttpSession hs=request.getSession();
        String username=hs.getAttribute("username").toString();
        String password=hs.getAttribute("password").toString();
        if(username.equals("")|| password.equals("")||username.equals("null")|| password.equals("null"))
        {
            response.sendRedirect("admin1.jsp");
            
        }
        
    }
    catch (Exception e){
        out.println(e);
        response.sendRedirect("admin1.jsp");
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
                      <a href="menu.jsp" class="nav-item nav-link active">Menu</a>
                 
                  
                        
                      


                       <a href="order.jsp" class="nav-item nav-link ">order</a>
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
  <form action="menu1" method="POST">
           <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                           
                                            <input type="text" class="form-control" name="name" placeholder="Name">
                                            <label for="name">FoodName</label>
                                        </div>
                                    </div>
               <div class="col-md-4">
                                        <div class="form-floating">
                                            <select  class="form-control"  name="cid">
                                                 <%
                        try{
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con =new DBConfig().getConnection();
                  Statement stat=con.createStatement();
                  ResultSet res=stat.executeQuery("SELECT * FROM categories");
                  while(res.next())
                  {
                      String id=res.getString("id");
                      String name=res.getString("name");
                    
              
                          out.println("<option value="+id+">"+name+"</option>");
                  }
                        }
                        catch(Exception e)
                        {
                            out.println(e);
                        }
                        %>
                                            </select>
                                       
                                          
                                            <label for="cid" >category </label>
                                        </div>
                                    </div>
                                  
                                    <div class="col-2">
                                        <div class="form-floating">
                                           
                                        </div>
                                    </div>
                 <div class="col-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" name="price" placeholder="Enter price">
                                            <label for="price">price</label>
                                        </div>
                                    </div>
                 <div class="col-2">
                                        <button class="btn btn-primary w-100 py-6" type="submit">ADD</button>
                                    </div>
                                   
                             
                </div>
  </form>
                                                <center>
              <h2>
           Menu
        </h2>
                   
      
              <table border="5" width="80%" align="center">
                  <tr> <th>Slno</th><th>Name</th><th>Price</th><tr>
                  
                    <%
                        try{
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con =new DBConfig().getConnection();
                  Statement stat=con.createStatement();
                  ResultSet res=stat.executeQuery("SELECT * FROM categories");
                  while(res.next())
                  {
                   String cid=res.getString("id");
                  String cname=res.getString("name");
                     out.println("<tr><th>"+cname+"</th><td></td><td></td></tr>");
                     int slno=0;
                      Connection con1 =new DBConfig().getConnection();
                      Statement stat1=con1.createStatement();
                  ResultSet res1=stat1.executeQuery("SELECT * FROM menu WHERE cid='"+cid+"';");
               // out.println("SELECT * FROM menu WHERE cid='"+cid+"';");
                  while(res1.next())
                  {
                     String name=res1.getString("name");
                        String price=res1.getString("price");
            slno++;
                          out.println("<tr><td>"+slno+"</td><td>"+name+"</td><td>"+price+"</td><tr>");
                  }
                  }
                        }
                        catch(Exception e)
                        {
                            out.println(e);
                        }
                        %>
                  
                         
                    
         
                </table>  
         
                 </center>
            


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