<%-- 
    Document   : address
    Created on : 28 Apr, 2020, 5:42:58 PM
    Author     : Harshit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    if(session.getAttribute("userid")==null)
    {
        System.out.println("welcome to request"); 
        response.sendRedirect("login.jsp");
        return;
    }
    Connection con=DriverManager.getConnection(url+dbname,userID,pwd);
    Statement stmnt=con.createStatement();
    ResultSet rs=null;
    String address=request.getParameter("address");
    String contact=(String)request.getParameter("contact");
    String svid=(String)request.getParameter("svid");
    try
    {    
        if(address!=null)
        {
            String uid=(String)session.getAttribute("userid");
            String sql="INSERT INTO ADDRESS(ADDRESS,UID) VALUES('"+address+"','"+uid+"')";
            stmnt.executeUpdate(sql);  
            String url2="paytm/TxnTest.jsp?svid="+svid;
            response.sendRedirect(url2+"&address="+address);
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
        form
        {
            width: 100%;
            height: auto;
        }
        input[type="text"]
        {
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
        select
        {
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
        .clsAdd11
        {
            margin: 1% 1% 1% 1%;
            width: 45%;
            min-height: 90%;
            background: white;
            border: solid black 2px;
            float:left;
        }
        .clsAdd12
        {
            width: 45%;
            min-height: 90%;
            float: left;
            margin: 1% 1% 1% 1%;
            background: white;
            border: solid black 2px;
        }
    </style>
    <script>
        function show()
        {
            var elem=document.getElementById('elem');
            elem.style.display='block';
            var elem2=document.getElementById('elem2');
            elem2.style='none';
        }
    </script>
        
    </head>
    
    <body>
        <%@include file="header.jsp" %>
        <div class='clsAdd1' id='elem2'>
            <div class="clsAdd11">
                <%
                String url3="address.jsp?contact="+request.getParameter("contact")+"&svid="+request.getParameter("svid");
                %>
                <form method="post" action='<%out.print(url3);%>' style="margin-left: 1%;">
                    <h3>Address Specification</h3>
                    
                    New Address: <input type="text" placeholder="New Address" name='address' required>
                    <p>* for example: Donear House, Plot No. A-50, Park Road, Andheri(E), Mumbai-400 093, Maharashtra *</p>
                    
                    <center><input type='submit' placeholder="Add Address" style="margin-bottom:1%;"></center>
                </form>
               
                
            </div>
                    <h2 style="float:left;">OR</h2>     
            <div class="clsAdd12">
                <%
            try{
                String uid=(String)session.getAttribute("userid");
                String sql2="SELECT ADDRESS FROM ADDRESS WHERE UID='"+uid+"'";
                ResultSet rs2=stmnt.executeQuery(sql2);
                String url1="paytm/TxnTest.jsp?svid="+request.getParameter("svid");
                if(uid!=null&&rs2.getRow()==0)
                {
                    %>
                    <h3>Choose Address</h3>
                    
                    <form action='<%out.print(url1);%>' method="post" >
                        <select id="address" name="address" style="margin:2%;"  required>
                                <%
                                   int i=0;
                                   while(rs2.next())
                                   {
                                %>
                                               
                                    <option name="address" id="<%out.print("rd"+i); %>" value="<% out.println(rs2.getString("ADDRESS"));%>"> <% out.println(rs2.getString("ADDRESS"));%> </option>
                                    <%
                                        i=i+1;
                                        }
                                    %>
                             </select>
                             <input type="submit" value="Proceed" style="margin-bottom:3%;">  
                  
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
