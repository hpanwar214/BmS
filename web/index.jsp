<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>BookMyService Home</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
       
    </head>
    <body>
        <%@include file="header.jsp" %>      
         <div class="middle">
            <div class="col-md-3"></div>
            <div class="col-md-6 col-sm-4">
                <center>
                    <h2><b>Your Service Expert in your City</b></h2>
                    <h3><b>Get Instant Access to reliable and affordable services</b></h3>
                    <form method="GET" action="sales.jsp">
                        <input name="city" type="text" placeholder="City" class="search-bar-city" required>
                        <input name="service" type="text" placeholder="Type of Service" class="search-bar-service" required>
                        <input type="submit" value="Go" class="search-bar-go btn-success" required>
                    </form>
                </center>
            </div>
          
        </div>
        
        
        
        <div class="serviceDisplay">
            <div class="displayer1">
                <h2 style="margin-bottom: 10x;">Technical Services</h2>
                <div class="imgDisplay">
                    <div class="imgTitle">
                       <img src="myimages\electrician.jpg" class="img-rounded img-responsive imgSize" title="Electrician"> 
                       <center><h4>Electrician</h4></center>
                    </div>
                    <div class="imgTitle">
                       <img src="myimages\technician.jpg" class="img-rounded img-responsive imgSize" title="Technician">
                       <center><h4>Technician</h4></center>
                    </div>
                    <div class="imgTitle">
                         <img src="myimages\mechanic.jpg" class="img-rounded img-responsive imgSize" title="Mechanic">
                       <center><h4>Mechanic</h4></center>
                    </div>                                  
                </div>
                
            </div>
            <div class="displayer1">
                <h2>General Services</h2>
                <div class="imgDisplay">
                    <div class="imgTitle">
                       <img src="myimages\barber.jpg" class="img-rounded img-responsive imgSize" title="Barber"> 
                       <center><h4>Barber</h4></center>
                    </div>
                    <div class="imgTitle">
                       <img src="myimages\carpenter.jpg" class="img-rounded img-responsive imgSize" title="carpenter">
                       <center><h4>Carpenter</h4></center>
                    </div>
                    <div class="imgTitle">
                         <img src="myimages\plumber.jpg" class="img-rounded img-responsive imgSize" title="plumber">
                       <center><h4>Plumber</h4></center>
                    </div>                                    
                </div>
                
            </div>
            <div class="displayer1">
                <h2>Miscellaneous Services</h2>
                <div class="imgDisplay">
                    <div class="imgTitle">
                       <img src="myimages\maid.jpg" class="img-rounded img-responsive imgSize" title="Maids"> 
                       <center><h4>Maids</h4></center>
                    </div>
                    <div class="imgTitle">
                       <img src="myimages\painter.jpg" class="img-rounded img-responsive imgSize" title="Painters">
                       <center><h4>Painters</h4></center>
                    </div>
                    <div class="imgTitle">
                         <img src="myimages\broker.jpg" class="img-rounded img-responsive imgSize" title="Broker">
                       <center><h4>Broker</h4></center>
                    </div>  
                     <div class="imgTitle">
                         <img src="myimages\gardener.jpg" class="img-rounded img-responsive imgSize" title="Gardener">
                       <center><h4>Gardener</h4></center>
                    </div>  
                     <div class="imgTitle">
                         <img src="myimages\spa.jpg" class="img-rounded img-responsive imgSize" title="SPA">
                       <center><h4>SPA</h4></center>
                    </div>
                    
                </div>
            </div>
            
        </div>
        
        
       
        <%@ include file = "footer.jsp" %>
    </body>
</html>
