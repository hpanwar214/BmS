
<%@ include file="connection.jsp" %>
<%!
    public float rate(String email){
        String sql1="SELECT AVG(RATING) FROM RATING WHERE SVID='"+email+"'";
        
    }
%>
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
            con=DriverManager.getConnection(url+dbname,userID,pwd);
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
        <link rel="stylesheet" href="sales.css">
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
        <%-- seacrhed content --%>
        <%if(rs!=null){
            while(rs.next()){
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
                <div class="col-md-1"style="float: left;width:10%;height: 100%">
                    <a href="detail.jsp?sellerid=<%=rs.getString("email")%>"><button class="btn-success" style="margin-top: 4px;" ><span class="glyphicon glyphicon-transfer"></span>Request</button></a> 
                </div>
        </div>
        <%}}%>
        
        <%@ include file = "footer.jsp" %>
    </body>
</html>
  
        