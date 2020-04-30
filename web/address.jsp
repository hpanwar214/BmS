<%-- 
    Document   : address
    Created on : 28 Apr, 2020, 5:42:58 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%
    Connection con=DriverManager.getConnection(url+dbname,userID,pwd);
    Statement stmnt=con.createStatement();
    ResultSet rs=null;
    String add=request.getParameter("address");
    try
    {    
        if(add!=null)
        {
            String uid=(String)session.getAttribute("userid");
            String sql="INSERT INTO ADDRESS(UID,ADDRESS) VALUES('"+uid+"','"+add+"')";
            stmnt.executeUpdate(sql);            
            response.sendRedirect("order.jsp?contact="+request.getParameter("contact")+"&svid="+request.getParameter("svid")+"&add="+add);
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .clsAdd1
        {
            float: left;
            margin:2% 10% 10% 10%;
            width: 80%;
            min-height: 200px;
            border:solid black 2px;
            background: lightgoldenrodyellow;
        }
        form{
            width: 100%;
            height: auto;
        }
        input[type="text"]{
            color:black;
            width: 400px;
            display: block;
            box-sizing: border-box;
            margin-bottom: 20px;
            margin-left:1%;
            padding: 4px;
            border: none;
            border-bottom: 1px solid #AAA;
            font-family: 'Roboto', sans-serif;
            font-weight: 400;
            font-size: 15px;
            transition: 0.2s ease;
        }
        .clsAdd11{
            margin: 1% 1% 1% 1%;
            width: 45%;
            min-height: 90%;
            background: white;
            border: solid black 2px;
            float:left;
        }
        .clsAdd12{
            width: 45%;
            min-height: 90%;
            float: left;
            margin: 1% 1% 1% 1%;
            background: white;
            border: solid black 2px;
        }
    </style>
    <body>
        <%@include file="header.jsp" %>
        <div class='clsAdd1'>
            <div class="clsAdd11">
                <form method="post" action='address.jsp' style="margin-left: 1%;">
                    <h3>Address Specification</h3>
                    
                    New Address: <input type="text" placeholder="New Address" name='address'>
                    <p>* for example: Donear House, Plot No. A-50, Park Road, Andheri(E), Mumbai-400 093, Maharashtra *</p>
                    
                    <center><input type='submit' placeholder="Add Address" style="margin-bottom:1%;"></center>
                </form>
               
                
            </div>
            <div class="clsAdd12">
                <%
            try{
                String uid=(String)session.getAttribute("userid");
                String sql2="SELECT ADDRESS FROM ADDRESS WHERE UID='"+uid+"'";
                ResultSet rs2=stmnt.executeQuery(sql2);
                String url1="order.jsp?contact="+request.getParameter("contact")+"&svid="+request.getParameter("svid");
                if(uid!=null&&rs2!=null)
                {
                    %>
                    <h3>Choose Address</h3>
                    
                    <form action="<%out.print(url1);%>" method="post">
                            <table>
                                <tr>
                                    <th>Select</th>
                                    <th>Address</th>
                                </tr>
                                <%
                                int i=0;
                                while(rs2.next())
                                {
                                    %>
                                    <tr>
                                        <td><input type='radio' id='<%out.print("rd"+i); %>' name="add" value="<% out.println(rs2.getString("ADDRESS"));%>"></td>
                                        <td><input type='text' id='<%out.print("ad"+i);%>' name="radio_add" value='<% out.println(rs2.getString("ADDRESS"));%>' readonly></td>
                                    </tr>
                                    <%
                                     i++;
                                }
                                %>
                                <tr><td><input type='submit' placeholder="Proceed"></td><tr>
                            </table>
                    </form>
                    <%
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        %>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
