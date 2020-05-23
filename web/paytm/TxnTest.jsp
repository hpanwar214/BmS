<%@include file="../connection.jsp" %>
 <%@page import="java.util.*" %>  
 <%
        Connection con=DriverManager.getConnection(url+dbname,userID,pwd);
        Statement stmnt=con.createStatement();
        ResultSet rs1=null;
        String address=request.getParameter("address");
        System.out.println(address);
        session.setAttribute("address",address);
        session.setAttribute("svid",request.getParameter("svid"));
        con=DriverManager.getConnection(url+dbname,userID,pwd);
        stmnt=con.createStatement();
        String sql1="SELECT COUNT(*) FROM BOOKINGS";
        rs1=stmnt.executeQuery(sql1);
        rs1.next();
        int bid=1001+rs1.getInt(1);
        
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
        
        
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Merchant Check Out Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Evrsoft First Page">
<link rel="stylesheet" href="../style.css">
<style>
    .bill{
        float: left;
        width: 45%;
        height: auto; 
        margin: 5% 15% 2% 25%;
        background: lavenderblush;
        border: solid black 2px;
    }
</style>
</head>
<body>
    <%@include file="../header.jsp" %>
    <!--<div class="bill">-->
    <center><h1> Merchant Check Out</h1></center>
	<pre>
	</pre>
        
    <table border="10" style="background-color:lightgoldenrodyellow" align="center">
        
            <tbody>
                <tr>
                    <th><h1><b>Payment Through PayTm</b></h1></th>
                    <th> </th>
                    <th><h1><b>Cash on delivery</b></h1></th>
		</tr>
            
                <tr>
                    <td>
                       
	<form method="post" action="pgRedirect.jsp" style="background:lightblue">
		<table border="5">
			<tbody>
				<tr>
					<th>S.No</th>
					<th>Label</th>
					<th>Value</th>
				</tr>
				<tr>
					<td>1</td>
					<td><label>ORDER_ID::*</label></td>
                                        <td><input id="ORDER_ID" tabindex="1" maxlength="20" size="20" name="ORDER_ID" autocomplete="off" value="ORDS_<%= randomInt %>" readonly>
					</td>
				</tr>
				
                                <tr>
					<td>2</td>
					<td><label>CUSTID ::*</label></td>
					<td><input id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST_ID" readonly></td>
				</tr>
				<tr>
					<td>3</td>
					<td><label>INDUSTRY_TYPE_ID ::*</label></td>
					<td><input id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off"  value="Retail" readonly></td>
				</tr>
				<tr>
					<td>4</td>
					<td><label>Channel ::*</label></td>
					<td><input id="CHANNEL_ID" tabindex="4" maxlength="12"	size="12" name="CHANNEL_ID"  value="WEB" readonly>
					</td>
				</tr>
				<tr>
					<td>5</td>
					<td><label>txnAmount*</label></td>
					<td><input title="TXN_AMOUNT" tabindex="10" type="text" name="TXN_AMOUNT" value="160.00" readonly>
					</td>
				</tr>
				<tr>
					<td>6</td>
					<td>paytm</td>
					<td><input value="CheckOut" type="submit" onclick=""></td>
                                </tr>
                                
                                
                               
			</tbody>
		</table>
                                        <p>* - Mandatory Fields</p>
	</form>
                                        
                    </td>
                    <td>   </td>
                                        
             <td>                           
                 <form method="post" action="../order.jsp?mode=cod" style="background: lightgreen;">
		<table border="5">
			<tbody>
				<tr>
					<th>S.Nos</th>
					<th>Label</th>
					<th>Value</th>
				</tr>
				<tr>
					<td>1</td>
					<td><label>ORDER_ID::*</label></td>
                                        <td><input id="ORDER_ID" tabindex="1" maxlength="20" size="20"	name="ORDER_ID" value="ORDS_<%= bid %>" readonly>
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td><label>CUSTID ::*</label></td>
                                        <td><input id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID"  value="<%= session.getAttribute("userid")%>" readonly></td>
				</tr>
                                <tr>
					<td>3</td>
					<td><label>SVID ::*</label></td>
					<td><input id="SV_ID" tabindex="2" maxlength="30" size="12" name="SV_ID" value="<%= request.getParameter("svid")%>" readonly></td>
				</tr>
				<tr>
					<td>4</td>
					<td><label>INDUSTRY_TYPE_ID ::*</label></td>
					<td><input id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID"  value="Retail" readonly></td>
				</tr>
				<tr>
					<td>5</td>
					<td><label>Channel ::*</label></td>
					<td><input id="CHANNEL_ID" tabindex="4" maxlength="12"	size="12" name="CHANNEL_ID"  value="WEB" readonly>
					</td>
				</tr>
				<tr>
					<td>6</td>
					<td><label>txnAmount*</label></td>
					<td><input title="TXN_AMOUNT" tabindex="10" type="text" name="TXN_AMOUNT" value="175.00" readonly>
					</td>
				</tr>
                                <tr>
					<td>7</td>
					<td><label>Address*</label></td>
					<td><input title="ADDRESS" tabindex="10" name='ADDRESS' type="text" name="TXN_AMOUNT" value="<%=address %>" readonly>
					</td>
				</tr>
				<tr>
					<td>8</td>
					<td>COD</td>
					<td><input value="CheckOut" type="submit" onclick=""></td>
                                </tr>
                                
                                
                                <tr>
                                
                                </tr>    
			</tbody>
		</table>
                                        <p>* - Mandatory Fields</p>
	</form>
             </td>
                </tr>
                                        
        </table> 
    <!--</div>-->
        <%@include file="../footer.jsp" %>
</body>

</html>