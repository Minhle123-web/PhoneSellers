<%-- 
    Document   : index
    Created on : Jul 18, 2021, 12:13:59 PM
    Author     : ad
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link href="../css/indexcss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
     <div class="background">
 <div class="container">
  <div class="row flex-column justify-content-center align-items-center text-center">
   <div class="col-sm-12 col-md-10 col-lg-8">
    <h1 id="time">12:00 AM</h1>
    <h3 id="day" class="display-5">Monday, January 01</h3>
    <h2 id="greeting">Good Morning</h2>
    <h3>What would you like to inquire about today?</h3>
   </div>
   
  </div><!-- /.row -->
 <br/>
<a href="../login.jsp" class="btn btn-secondary btn-lg"><span class="glyphicon glyphicon-log-out"></span>Log out</a>


<script type="text/javascript">
//Document ready function
$(function() {
  
  // Time function to get the date/time
  function time() {
    
    // Create new date var and init other vars
    var date = new Date(),
      hours = date.getHours(), // Get the hours
      minutes = date.getMinutes().toString(), // Get minutes, convert to string
      ante, // Will be used for AM and PM later
      greeting, // Set the appropriate greeting for the time of day
      dd = date.getDate().toString(), // Get the current day
      userName = "User"; // Can be used to insert a unique name
    /* Set the AM or PM according to the time, it is important to note that up
      to this point in the code this is a 24 clock */
    if (hours < 12) {
      ante = "AM";
      greeting = "Morning";
    } else if (hours === 12 && hours >= 3) {
      ante = "PM";
      greeting = "Afternoon"
    } else {
      ante = "PM";
      greeting = "Evening";
    }
    /* Since it is a 24 hour clock, 0 represents 12am, if that is the case
    then convert that to 12 */
    if (hours === 0) {
      hours = 12;
      
      /* For any other case where hours is not equal to twelve, let's use modulus
      to get the corresponding time equivilant */
    } else if (hours !== 12) {
      hours = hours % 12;
    }
    // Minutes can be in single digits, hence let's add a 0 when the length is less than two
    if (minutes.length < 2) {
      minutes = "0" + minutes;
    }
    // Let's do the same thing above here for the day
    if (dd.length < 2) {
      dd = "0" + dd;
    }
    // Months
    Date.prototype.monthNames = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    // Days
    Date.prototype.weekNames = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];
    
    // Return the month name according to its number value
    Date.prototype.getMonthName = function() {
      return this.monthNames[this.getMonth()];
    };
    
    // Return the day's name according to its number value
    Date.prototype.getWeekName = function() {
      return this.weekNames[this.getDay()];
    };
    // Display the following in html
    $("#time").html(hours + ":" + minutes + " " + ante);
    $("#day").html(date.getWeekName() + ", " + date.getMonthName() + " " + dd);
    $("#greeting").html("Good " + greeting + "!");
    
    // The interval is necessary for proper time syncing
    setInterval(time, 1000);
  }
  time();
});

</script>
 </body>
</html>