
<%@ include file="connection.jsp" %>
<%
    String city=request.getParameter("city");
    String service=request.getParameter("service");
    Connection con=null;
    Statement stmnt=null;
    ResultSet rs=null;
    try
    {    
        if(!city.equals(""))
        {
            con=DriverManager.getConnection(url);
            stmnt=con.createStatement();
            System.out.println("here 1");
            city=city.trim();
            service=service.trim();
            String sql="select  * from serviceman where city='"+city+"' or service='"+service+"'";    
            rs=stmnt.executeQuery(sql);
            System.out.println("here 2");
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
        <link rel="stylesheet" href="sales.css">
        <link rel="stylesheet" href="style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
    </head>
    <body >

       <%@include file="header.jsp" %> 
        <div class="middle" >
            <div class="col-md-3"></div>
            <div class="col-md-6 col-sm-4">
                <center>
                    <h2><b>Your Service Expert in your City</b></h2>
                    <h3><b>Get Instant Access to reliable and affordable services</b></h3>
                    <form method="GET" action="sales.jsp">
                        <!--<input name="city" type="text" placeholder="City" class="search-bar-city" required>
                        <input name="service" type="text" placeholder="Type of Service" class="search-bar-service" required>-->
                        <select id="city" name="city" class="search-bar-city" style="background: rgb(0,0,0,0.4);" required >
                                <option value="Bhopal">Bhopal</option>
                                <option value="Indore">Indore</option>
                                <option value="Ujjain">Ujjain</option>
                                <option value="Gwalior">Gwalior</option>
                                <option value="Jabalpur">Jabalpur</option>
                                <option value="Ratlam">Ratlam</option>
                                <option value="Mandsaur">Mandsaur</option>
                                <option value="Dewas">Dewas</option>
                                <option value="Khandwa">Khandwa</option>
                                <option value="Khargone">Khargone</option>                                       
                        </select>
                        <select id="servcie" name="service" class="search-bar-service"  style="background: rgb(0,0,0,0.4);" required >
                                <option value="Plumber">Plumber</option>
                                <option value="Electrician">Electrician</option>
                                <option value="Mechanic">Mechanic</option>
                                <option value="Gardener">Gardener</option>
                                <option value="Technician">Technician</option>
                                <option value="Barber">Barber</option>
                                <option value="Carpenter">Carpenter</option>
                                <option value="Painter">Painter</option>
                                <option value="SPA">SPA</option>
                                <option value="Maids">Maids</option>                                       
                                <option value="Broker">Broker</option>                                       
                            </select>
                        <input type="submit" value="Go" class="search-bar-go btn-success" required>
                    </form>
                </center>
            </div>          
        </div>
        <%-- seacrhed content --%>
        <%
        if(!rs.next())
        {
            %>
            <div class="merchant">
                <h2 style="float:left">Sorry! This service is not available in this city</h2>
            </div>
            
            <%
        }
        else
        {
            do
            {
                System.out.println("jrt1");            

        %>
        
        <div class="merchant ">               
            <div class="col-md-3" style="float: left;width:24%;height: 100% ">
                    <img src="<%out.print(rs.getString("image"));%>" class="img-responsive img-circle photo">
                </div>            
                <div class="col-md-4" style="float: left;width:32%;height: 100%">
                    <p><span class="glyphicon glyphicon-user"></span><%out.print(rs.getString("name"));%></p>
                    <p><span class="glyphicon glyphicon-map-marker"></span><%out.print(rs.getString("city"));%></p>
                    <p><span class="glyphicon glyphicon-wrench"></span><%out.print(rs.getString("service"));%></p>
                    <p><span class="glyphicon glyphicon-education"></span>Engine specialist</p>
                    <p><span class="glyphicon glyphicon-time"></span>4 years of experience</p>                    
                </div>
                <div class="col-md-4" style="float: left;width:32%;height: 100%">
                   <p><span class="glyphicon glyphicon-envelope"></span><%out.print(rs.getString("email"));%></p>
                    <p><span class="glyphicon glyphicon-phone"></span><%out.print(rs.getString("mobile"));%></p>
                    <p><span class="glyphicon glyphicon-star"></span>4.3</p>
                    <p><span class="glyphicon glyphicon-thumbs-up"></span>Prime service expert</p>
                    <p style="color: green"><span class="glyphicon glyphicon-stats"></span><%out.print(rs.getString("status"));%></p>                   
                </div>
                <div class="col-md-1" style="float: left;width:10%;height: 100%">
                    <a href="detail.jsp?sellerid=<%=rs.getString("email")%>"><button class="btn-success" style="margin-top: 4px;" ><span class="glyphicon glyphicon-transfer"></span>Request</button></a> 
                </div>
        </div>
        <%
            }while(rs.next());
        }
        
        
    %>
    <% con.close();%>
        
        <%@ include file = "footer.jsp" %>
    </body>
</html>
  
        