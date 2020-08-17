<%@ page import="java.util.*,com.paytm.merchant.CheckSumServiceHelper,javax.servlet.*;"%>
<%@include file="../connection.jsp" %>
<%
    String MID="your merchant id";
    String MERCHANT_KEY="your merchant key";
    String INDUSTRY_TYPE_ID="Retail";
    String CHANNEL_ID="WEB";
    String WEBSITE="WEBSTAGING";
    String PAYTM_URL="https://securegw-stage.paytm.in/theia/processTransaction"; 
    String mobile="";
    
Enumeration<String> paramNames = request.getParameterNames();

Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	if(paramName.equals("CHECKSUMHASH")){
		paytmChecksum = mapData.get(paramName)[0];
	}else{
		parameters.put(paramName,mapData.get(paramName)[0]);
	}
        out.println(paramName+ " "+mapData.get(paramName)[0] );
}
boolean isValideChecksum = false;
String outputHTML="";
int check=-2;
try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(MERCHANT_KEY,parameters,paytmChecksum);
	if(isValideChecksum && parameters.containsKey("RESPCODE")){
		if(parameters.get("RESPCODE").equals("01"))
                {
			outputHTML = parameters.toString();
                        check=1;
                        
		}else
                {
			outputHTML="<b>Payment Failed.</b>";
                        check=-1;
		}
	}
        else
        {
		outputHTML="<b>Checksum mismatched.</b>";
                check=0;
	} 

}catch(Exception e){
	outputHTML=e.toString();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment check out</title>
<link rel="stylesheet" href="../style.css">
</head>
<body>
    
    <%
        if(check==1)//payment succesful
        {
           out.print(outputHTML);
           %>
           <script>
               alert("Your Payment is successful");
               window.location='../order.jsp?mode=paytm';
           </script>
           <%
        }
        else if(check==0)//checksum mismatched
        {
            %>
            <div style="margin:5% 25% 5% 25%;color: yellow;background: lightyellow;float:left;width: 50%;height: 50%"> 
                <div style="margin:25%;float:left">
                     <img src='../myimages/checksum.jpg' style="width:50%;height: 50%;">
                    <h3>PAYMENT FAILED</h3>
                    <p><a href="../detail.jsp?sellerid=<%=session.getAttribute("svid") %>">Click here to re-Book</a></p>
                </div>
            </div>
            <%
        }
        else if(check==-1)
        {
            %>
            <div style="margin:5% 25% 5% 25%;color: red;background: lightyellow;float:left;width: 50%;height: 50%"> 
                <div style="margin:25%;float:left">
                     <img src='../myimages/checksum.jpg' style="width:50%;height: 50%;">
                     <h3>CHECKSUM MISMATCHED</h3>
                    <p><a href="../detail.jsp?sellerid=<%=session.getAttribute("svid") %>">Click here to re-Book</a></p>
                </div>
            </div>
            <%
        }
    %>

<%@include file="../footer.jsp" %>
</body>
</html>
