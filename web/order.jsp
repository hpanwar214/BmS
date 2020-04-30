 <%-- 
    Document   : order
    Created on : 18 Apr, 2020, 7:11:25 PM
    Author     : Harshit
--%>
<%@include file="connection.jsp" %>
<%
    Statement stmnt=null;
    ResultSet rs1=null,rs2=null,rs3=null;
    Connection con=null;
    int bid=1001;
    String uid="",svid="",city="",service="",add="";
    System.out.print("er");
    try
    {
        con=DriverManager.getConnection(url+dbname,userID,pwd);
        stmnt=con.createStatement();
        String sql1="SELECT COUNT(*) FROM BOOKINGS";
        rs1=stmnt.executeQuery(sql1);
        rs1.next();
        
        bid=bid+rs1.getInt(1);
        svid=request.getParameter("svid");
        uid=(String)session.getAttribute("userid");
        add=(String)request.getParameter("add");
        
        String sql2="SELECT CITY, SERVICE FROM SERVICEMAN WHERE EMAIL='"+svid+"'";
        rs2=stmnt.executeQuery(sql2);
        rs2.next();
        city=rs2.getString("CITY");
        service=rs2.getString("SERVICE");
        
        // 1) create a java calendar instance
        Calendar calendar = Calendar.getInstance();
        // 2) get a java.util.Date from the calendar instance.
        //    this date will represent the current instant, or "now".
        java.util.Date now = calendar.getTime();
        // 3) a java current time (now) instance
        java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
        String sql3="INSERT INTO BOOKINGS(BID,TIMING,CITY,SERVICE,UID,SVID,ADDRESS) VALUES("+bid+",'"+currentTimestamp+"','"+city+"','"+service+"','"+uid+"','"+svid+"','"+add+"')";
        stmnt.executeUpdate(sql3);
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        function ready(){
            var flag=confirm("Are you sure you want to cancel booking");
            if(flag==true){
                var url= "cancel.jsp?bid=<%=bid%>"; 
                window.location = url;
                return true;
            }
            
        }
    </script>
    <style>
        .cls01{
            float: left;
            margin: 5%;
            width: 90%;
            min-height: 20%;
            height: auto;
            background: lightgoldenrodyellow;;
            border:black solid 4px;
        }
        .cls011{
            float:left;
            width: 100%;
            height: 10%;
            color:black;
            margin:5px;
        }
        .cls012{
            float:left;
            margin: 2%;
            width: 90%;
            min-height:50%;
            height: auto;
            background: white;
            border:black solid 2px;
        }
        .cls0121{
            margin: 2%;
            width: 90%;
            min-height: 50%;
            height: auto;
        }
        .cls013{
            float:left;
            width: 90%;
            margin:1%;
        }
        table {
            border-spacing: 0.5rem;
             border-collapse: collapse;
        }
        th {
          border: solid black;
        }
        td{
            border: solid black;
            height:50px;
        }
        button{
            background: red;
            width:auto;
            height: 1%;
         
        }
                    

    </style>
    <body>
        <%@include file="header.jsp" %>
        <div class="cls01">
            <div class="cls011">
                <center><h2>Order Successful</h2></center>
            </div>
            <hr>
            <div class="cls012">
                <table class="cls0121">
                    <tr>
                        <th>Booking Id</th>
                        <th>OTP</th>
                        <th>Contact</th>
                        <th>Payment Method</th>
                        <th>Amount</th>
                    </tr>
                    <tr>
                        <td><%out.println(bid);%></td>
                        <td>5465</td>
                        <td><%out.println(request.getParameter("contact"));%></td>
                        <td>COD</td>
                        <td>175.00/-</td>
                    </tr>
                </table>
            </div>
            <div class="cls011">
                 <h3>Note</h3>
                 <p>--> Please call the Service Man for timings.</p>
                 <p>--> Provide OTP to ServiceMan so that both sides can verified.</p>
                 <p>--> Pay in Cash. No bargaining. Fixed Service.</p>
                 <p>--> After service please take some time to rate the quality of service and seviceman. It will indeed help you to get best service from us </p>
                 <p>--> If you have any complaints or queries regarding service, write to us at bookmyservice@info.com . </p> 
            </div>
                        <div class='cls013'>
                            <h3>Thank You for booking your service with us</h3> 
                            <button onclick="return ready()">Cancel Booking</button>
                            
                            <div style="float:right;margin: .5%;">
                                <a href='index.jsp' style='color: blue'> <h3>>>Continue</h3></a>
                            </div>
                        </div>
        </div>
        <%@include file="footer.jsp" %>                      
        
    </body>
</html>
