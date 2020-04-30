 <%-- 
    Document   : detail
    Created on : 14 Apr, 2020, 9:44:01 PM
    Author     : Harshit
--%>
<%@page import="java.io.Reader"%>
<%@page import="java.sql.Clob"%>
<%@include file="connection.jsp" %>
<%
    Statement stmnt=null;
    ResultSet rs=null,rs2=null;
    Connection con=null;
    String userid="";
    String sellid="";
    
            String mobile="";
            String em="";
    try{
        System.out.println("welcome to request"); 
        session=request.getSession();
        if(session.getAttribute("userid")==null)
        {
            System.out.println("welcome to request"); 
            %>
            <script> window.alert("Please login to make request")</script>
            <%
            response.sendRedirect("login.jsp");
        }
        else
            
        {   
            con=DriverManager.getConnection(url+dbname,userID,pwd);
            stmnt=con.createStatement();
            userid=(String)session.getAttribute("userid");
            sellid=request.getParameter("sellerid");
            String sql="SELECT  * FROM SERVICEMAN WHERE EMAIL='"+sellid+"'";
            rs=stmnt.executeQuery(sql);
            
        }
    
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
%>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script>
            function ready()
            {
                window.alert("Do you want to order");
            }
        </script>
        <style>
            .request
            {
                float:left;
                margin: 2%;
                width: 98%;
                min-height:30%;
                height: auto;
                background: lightgoldenrodyellow;
                border:gray solid 2px;
            }
            .imgDis{
                margin: 3%;
                border: black 1px;
                box-shadow: 5px 10px;
                float:left;
                width:20%;
                height:20%
            }
            .infoDis
            {
               float:left;
               width: auto;
               min-width:15%;
               height: 20%;
               margin: 2%;
               color:black;
            }
            .comment
            {
                margin:3%;
                float:left;
                width:60%;
                min-height: 10%;
                height: auto;
                background: linen;              
            }
            .rat{
                width: 90%;
                margin: 0.5%;
                border: solid black 2px;
                float: left;
            }
            .order
            {
                margin:5px;
                float:left;
                min-width: 30%;
                width: auto;
                min-height:10%;
                height: auto;
                background: white;
                border: black solid;              
                
            }
        </style>

        <title>Booking</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="request">
            <% if(rs!=null)
            {
                while(rs.next())
                {
                    em=rs.getString("email");
                    mobile=rs.getString("mobile");
                    System.out.println(em+" "+mobile);
            %>
                <div style="width:100%;float:left;">
                    <div class="imgDis">
                        <img class="img-responsive" src='<%out.println(rs.getString("image"));%>' style="width: 100%;height: 100%">
                    </div>
                    <div class="infoDis">
                        <p><span class="glyphicon glyphicon-user"></span></p><h2><%out.println(rs.getString("name"));%></h2>
                        <p><span class="glyphicon glyphicon-map-marker"></span><h2><%out.println(rs.getString("city"));%></h2></p>
                    </div>
                    <div class="infoDis">
                        <p><span class="glyphicon glyphicon-phone"></span><h3><%out.println(rs.getString("mobile"));%></h3></p>
                        <p><span class="glyphicon glyphicon-envelope"></span><h3><%out.println(rs.getString("email"));%></h3></p>
                    </div>
                     <div class="infoDis">
                         <p><span class="glyphicon glyphicon-wrench"></span> <h3><%out.println(rs.getString("service"));%></h3></p>
                        <p><span class="glyphicon glyphicon-stats"></span><h3 style='color: green'><%out.println(rs.getString("status"));%></h3></p>
                    </div>
                </div>
            <%} }%>
                
                    <div class="comment">
                        <h2>Reviews</h2>
                        <p>_________________________________________</p>
                        <div class='rat1'>
                            <%
                                
                                String sql2="SELECT * FROM RATING WHERE SVID='"+sellid+"'";
                                rs2=stmnt.executeQuery(sql2);
                                if(rs2!=null){
                                while(rs2.next())
                                {%>
                                <div style='width: 90%;height: auto;margin: 1%;background: white;'>
                                <p><b><%out.println(rs2.getString("uid")+"      ");%>
                                <%out.println(rs2.getString("timing"));%></b></p>
                                 <div style='width: 100%;height: auto;float: left;margin: .5%'>
                                <%
                                int st=rs2.getInt("stars");
                                while(st>0)
                                {
                                    %>
                               
                                    <img src='myimages/star.png' style='float: left;width:20px;height: 20px;'>
                                
                                    <%
                                    st--;
                                    
                                }%></div><%
                                Clob clob = rs2.getClob("review");
                                Reader r = clob.getCharacterStream();
                                StringBuffer buffer = new StringBuffer();
                                int ch;                                
                                while ((ch = r.read())!=-1) {
                                   buffer.append(""+(char)ch);
                                }
                                System.out.println("Contents: "+buffer.toString());
                                %>
                                <p><b><% out.println(buffer.toString());%></b></p>
                                <hr style="magin:1%;">
                                
                                </div>
                            <%  } }
                             %>
                            
                        </div>
                        
                    </div>
                    <div class="order">
                        <center>
                        <h2>Order</h2>
                        <p>Service charge(in Rs):<b>150.00</b></p>
                        <p>CGST @7.5%          :<b>12.50</b></p>
                        <p>SGST @7.5%          :<b>12.50</b></p>
                        <p>_______________________________</p>
                        <p>Total Amount        :<b>175</b></p>
                        </center>
                        <center><a href="address.jsp?contact=<%=mobile%>&svid=<%=em%>"><button value="Order" class="btn-info" onclick="return ready()" style="margin: 10px;">Order</button></a></center>
                        
                    </div>
               
        </div>
        
        

        
        <%@include file="footer.jsp" %>  
    </body>
</html>
