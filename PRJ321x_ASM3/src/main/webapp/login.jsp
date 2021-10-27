<%-- 
    Document   : login
    Created on : Jul 18, 2021, 12:10:07 PM
    Author     : ad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Import Boostrap css, js, font awesome here -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">       
        <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="css/logincss.css" rel="stylesheet"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h2> My Website: PRJ321x_A3</h2>
        <div class="container" id="container">
            <div class="form-container sign-in-container">
                <form action="LoginController" method="post">
                    <h1>Sign in</h1>
                    <input type="text" placeholder="Name" name="username"/>
                    <input type="password" placeholder="Password" name="password" />
                    <a href="#">Forgot your password?</a>
                    <input class="button" type="submit" value="Sign In"></input>
                    <%
                        if (session.getAttribute("error") != null) {%>
                    <h3 style='margin: 10px;color: red'><%=session.getAttribute("error")%> </h3>
                    <%}%>
                    
                  


                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
