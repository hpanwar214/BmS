 <%-- 
    Document   : order
    Created on : 18 Apr, 2020, 7:11:25 PM
    Author     : Harshit
--%>
<%@include file="connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    if(session.getAttribute("userid")==null)
        {
            System.out.println("welcome to request"); 
            response.sendRedirect("login.jsp");
            return;
        }
    
    if(session.getAttribute("order")!=null)
    {
        int check=Integer.parseInt(session.getAttribute("order").toString());
        if(check==1)
        {
            %>
            <script>
                alert("Page Refreshed");
                window.location="rating.jsp";
            </script>
            <%
            
        }
        else
        {
            session.setAttribute("order",1);
        }
    }
   
   Statement stmnt=null;
    ResultSet rs1=null,rs2=null,rs3=null;
    Connection con=null;

    Calendar calendar = Calendar.getInstance();
        java.util.Date now = calendar.getTime();
        java.sql.Timestamp  currentTimestamp = new java.sql.Timestamp(now.getTime());

        String mode="";
    int bid=1001;
    double amount=175.00;
    String uid="",svid="",city="",service="",add="",mobile="";
    System.out.print("er");
    try
    {
        con=DriverManager.getConnection(url+dbname,userID,pwd);
        stmnt=con.createStatement();
        String sql1="SELECT COUNT(*) FROM BOOKINGS";
        rs1=stmnt.executeQuery(sql1);
        rs1.next();
        bid=bid+rs1.getInt(1);
        if(request.getParameter("mode").equals("paytm"))
        {
            mode="PayTM";amount=160.00;   
            svid=(String)session.getAttribute("svid");
            add=(String)session.getAttribute("address");
        }
        else
        {
            mode="Cash On Delievry";
            amount=175.00;
            svid=request.getParameter("SV_ID");
            add=request.getParameter("ADDRESS");
        }

        uid=(String)session.getAttribute("userid");
        
        
        System.out.println(svid+" "+uid+" "+add);
        
        String sql2="SELECT CITY, SERVICE,MOBILE FROM SERVICEMAN WHERE EMAIL='"+svid+"'";
        rs2=stmnt.executeQuery(sql2);
        rs2.next();
        
        city=rs2.getString("CITY");
        service=rs2.getString("SERVICE");
        mobile=rs2.getString("MOBILE");
        // 1) create a java calendar instance
        
        String sql3="INSERT INTO BOOKINGS(BID,TIMING,CITY,SERVICE,UID,ADDRESS,SVID) VALUES("+bid+",'"+currentTimestamp+"','"+city+"','"+service+"','"+uid+"','"+add+"','"+svid+"' )";
        int rowsUpdated=stmnt.executeUpdate(sql3);
        if(rowsUpdated>0)
        {
            %>
            <script>
                alert("Booking Successfully Done");
            </script>
            <%
        }
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Successful</title>
        <script>
        function ready(){
            var flag=confirm("Are you sure you want to cancel booking");
            if(flag==true){
                var url= "cancel.jsp?bid=<%=bid%>"; 
                window.location = url;
                return true;
            }
            return false;
        }
    </script>
    <style>
        .cls01{
            float: left;
            margin: 5%;
            width: 90%;
            max-height:90%;
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
            max-height:25%;
            height: auto;
            background: white;
            border:black solid 2px;
        }
        .cls0121{
            margin: 2%;
            width: 90%;
            max-height: 20%;
            height: auto;
        }
        .cls013{
            float:left;
            width: 90%;
            margin:8%;
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
            height: 20px;;
         
        }
                    

    </style>
    
    </head>
    
    
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
                        <th>Timing</th>
                        <th>Contact ServiceMAn</th>
                        <th>Payment Method</th>
                        <th>Amount</th>
                    </tr>
                    <tr>
                        <td><%out.println(bid);%></td>
                        <td><%out.print(currentTimestamp);%></td>
                        <td><%out.println(mobile);%></td>
                        <td><%out.println(mode);%></td>
                        <td><%out.println(amount+"/-");%></td>
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
                            <button onclick="return ready()" style="width: auto;height: 50px;">Cancel Booking</button>
                            
                            <div style="float:right;margin: 2%;">
                                <a href='index.jsp' style='color: blue'> <h3>>>Continue</h3></a>
                            </div>
                        </div>
        </div>
        <%@include file="footer.jsp" %>                      
        
    </body>
</html>
