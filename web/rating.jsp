<%-- 
    Document   : rating
    Created on : 30 Apr, 2020, 2:52:04 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="connection.jsp" %>

<%
if(session.getAttribute("userid")==null)
        {
            System.out.println("welcome to request"); 
            response.sendRedirect("login.jsp");
            return;
            
        }
    Statement stmnt=null;
    ResultSet rs1=null,rs2=null;
    Connection con=null;
    try{
        con=DriverManager.getConnection(url+dbname,userID,pwd);
        stmnt=con.createStatement();
        if(request.getParameter("bid")!=null)
        {
            Calendar calendar = Calendar.getInstance();
        // 2) get a java.util.Date from the calendar instance.
        //    this date will represent the current instant, or "now".
        java.util.Date now = calendar.getTime();
        // 3) a java current time (now) instance
        java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
        
        String uid=(String)session.getAttribute("userid"),svid=(String)request.getParameter("svid"),review=(String)request.getParameter("rev"),bid=(String)request.getParameter("bid");
        int stars=Integer.parseInt(request.getParameter("rating"));
        out.println(bid+" "+uid+" "+svid+" "+stars+" "+currentTimestamp);
            String sql="INSERT INTO RATING(UID,SVID,STARS,REVIEW,TIMING,BID) VALUES('"+uid+"','"+svid+"',"+stars+",'"+review+"','"+currentTimestamp+"','"+bid+"')";
            stmnt.executeUpdate(sql);
            
            sql="UPDATE BOOKINGS SET REVIEW=TRUE WHERE BID="+bid;
            stmnt.executeUpdate(sql);
            %>
            <script>alert("successful")</script>
            <%
            %>
            <script>
                alert("successful");
            </script>
            
            <%
            response.sendRedirect("rating.jsp");
        }
        String sql1="SELECT * FROM BOOKINGS WHERE uid='"+session.getAttribute("userid")+"'";
        rs1=stmnt.executeQuery(sql1);
        
    }
    catch(Exception e){
        e.printStackTrace();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Services</title>
        <link rel="stylesheet" href="jquery.rating.css">
        <script src="jquery.js"></script>
        <script src="jquery.rating.js"></script>
        <style>
            .checked {
                color: orange;
              }
            .rate1{
                margin: 1% 5% 1% 5%;
                width: 90%;
                height: auto;
                min-height: 50%;
                background: lightgoldenrodyellow;
                border:solid black 2px;
                float: left;
            }
            .rate2{
                margin:1%;
                width: 100%;
                height: 100%;
                float:left;
            }
            .rate3{
                height: auto;
                float:left;
                width: 95%;
                height: auto;
                border:solid black 1px;
            }
            .column{
                width:29%;
                margin: .5%;
                float:left;
                
            }
            .rate4{
                width: 95%;
                float:left;
                height: auto;
            }
            .rev{
                float: left;
                
                font-size: 15px;
            }
            .star{
                float:left;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="rate1">
            <div class="rate2">
                <%
                if(rs1!=null)
                {
                    while(rs1.next())
                    {
                
                %>
                <div class="rate3">
                    <div class="column"><p><b>Booking Id :</b><% out.print(rs1.getString("bid"));%></p></div>
                    <div class="column"><p><b>Service :</b><% out.print(rs1.getString("service"));%></p></div>
                    <div class="column"><p><b>Timings :</b><% out.print(rs1.getString("timing"));%></p></div>
                    <div class="column"><p><b>ServiceMan :</b><% out.print(rs1.getString("svid"));%></p></div>
                    <div class="column"><p><b>City :</b><% out.print(rs1.getString("city"));%></p></div>
                    <div class="column"><p><b>Address :</b><% out.print(rs1.getString("address"));%></p></div>
                    
                   <%if(!rs1.getBoolean("review")){
                       %>
                       
                       <div class="rate4">
                           <hr>
                           <h3 style="margin-left: 1%;"> Review</h3>
                           <form style="margin-left: 1%;" action="rating.jsp?bid=<%out.print(rs1.getString("bid"));%>&svid=<% out.print(rs1.getString("svid"));%>" method="post">
                                <div style="float:left;width: 100%;margin: 2%;">
                                <b style="float: left">Rate</b>
                                <input type="radio" name="rating" value=1 class="star" required="">
                                <input type="radio" name="rating" value=2 class="star" required="">
                                <input type="radio" name="rating" value=3 class="star" required="">
                                <input type="radio" name="rating" value=4 class="star" required="">
                                <input type="radio" name="rating" value=5 class="star" required="">
                                </div>
                                <div style="float:left;width: 100%;margin: 2%;">
                                    <b style="float:left;">Review:</b>
                                    <textarea  name="rev" class="rev" cols="100" rows='10' required></textarea>
                                </div>
                                <input type="submit" value="Submit">
                                
                            </form>
                       </div>
                       <%
                   } %>
                </div>
                <%
                    }
                }
                else{
                    %>
                    <h3>No Bookings Yet? <a href="index.jsp">Click here to book</a></h3>
                    <%
                }
                %>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
