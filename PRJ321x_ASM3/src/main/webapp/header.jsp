<%-- 
    Document   : header
    Created on : Jul 18, 2021, 12:05:01 PM
    Author     : ad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">       
        <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
        </script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

        <title>JSP Page</title>
    </head>
    <body>
        <form action="SearchController2" methos="get"> 
           
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-2">
                                    <h2>PRJ321x</h2>
                                    <h6>Welcome to my Website</h6>
                                </div>
                                <div class="col-md-10">
                                    
                                        <div class="w-auto">
                                            <select name="type" class="custom-select">
                                                <option selected>Categories</option>
                                                <option value="Smart phone">Iphone</option>
                                                <option value="Laptop">Samsung</option>
                                                <option value="Accessories">LG</option>
                                            </select>
                                        </div>
                                        <input type="text" name="s" placeholder="What are you looking for?"
                                               class="form-control" aria-label="Text input with dropdown button">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-link text-warning">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    
                                </div>
                            </div>
                        </div>
        </form>
                        <div class="col-md-12 mt-2">
                            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                                <!--left menu-->
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item"><a class="nav-link" href="http://localhost:8082/PRJ321x_ASM3/ListController">Home</a></li>

                                    <li class="nav-item"><a class="nav-link" href="http://localhost:8082/PRJ321x_ASM3/ListController">Product</a></li>

                                    <li class="nav-item"><a class="nav-link" href="#">About us</a></li>
                                </ul>
                                <!--right menu-->
                                <ul class="navbar-nav ml-auto">
                                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#">Register</a></li>
                                </ul>
                            </nav>
                        </div>

                    </div>
                    </body>
                    </html>
