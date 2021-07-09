
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@ include file="connection.jsp" %>
<%
    String city=request.getParameter("city");
    String service=request.getParameter("service");
    Connection con=null;
    Statement stmnt=null;
    ResultSet rs=null;
    try{    if(!city.equals(""))
        {
            con=DriverManager.getConnection(url);
            stmnt=con.createStatement();
            String sql="SELECT  * FROM SERVICEMAN WHERE CITY='"+city+"' or SERVICE='"+service+"'";     
            rs=stmnt.executeQuery(sql);
        }        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>

<html>
    <head>
        <title>Services</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                    <form method="GET" action="service.jsp">
                        <input name="city" type="text" placeholder="City" class="search-bar-city" required>
                        <input name="service" type="text" placeholder="Type of Service" class="search-bar-service" required>
                        <input type="submit" value="Go" class="search-bar-go btn-success" required>
                    </form>
                </center>
            </div>
          
        </div>
         
        
        
        <div class="content">
            <% if(rs!=null){ 
            while(rs.next())
            {%>
                <div class="box" >
                    
                    <div class="col-md-3 col-sm-2" style="float: left;">
                        <img src="<%out.print(rs.getString("image"));%>" class="img-responsive img-circle photo">
                    </div>
                    <div class="col-md-4  col-sm-3">
                        <div class="info">
                            <p><span class="glyphicon glyphicon-user"></span><%out.print(rs.getString("name"));%></p>
                            <p><span class="glyphicon glyphicon-map-marker"></span><%out.print(rs.getString("city"));%></p>
                            <p><span class="glyphicon glyphicon-wrench"></span><%out.print(rs.getString("service"));%></p>
                            <p><span class="glyphicon glyphicon-education"></span>Engine specilaist</p>
                            <p><span class="glyphicon glyphicon-time"></span>4 years of experience</p>
                        </div>
                    </div>
                                 
                    <div class="col-md-5  col-sm-4">
                        <div class="moreinfo">
                            <p><span class="glyphicon glyphicon-envelope"></span><%out.print(rs.getString("email"));%></p>
                            <p><span class="glyphicon glyphicon-phone"></span><%out.print(rs.getString("mobile"));%></p>
                            <p><span class="glyphicon glyphicon-star"></span>4.3</p>
                            <p><span class="glyphicon glyphicon-thumbs-up"></span>Prime service expert</p>
                            <p style="color: green"><span class="glyphicon glyphicon-stats"></span><%out.print(rs.getString("status"));%></p>                  
                        </div>
                    </div>
                        
                    <div class="infbtn">
                        <button class="btn-primary" style="margin-top: 4px;"><span class="glyphicon glyphicon-saved"></span>Book Now</button>&nbsp;&nbsp;
                        <button class="btn-success" style="margin-top: 4px;" ><span class="glyphicon glyphicon-transfer"></span>Request</button>
                    </div>    
                </div>
               <%          
              }
            }%>
            
            
        </div>
        <%@ include file = "footer.jsp" %>
    </body>
</html>
