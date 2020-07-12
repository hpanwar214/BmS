/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Harshit
 */
package generateOtp;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.*;
 
public class SmsOtp {
	public int sendSms(String mobile) {
		try {
			// Construct data

                        Random randomGenerator = new Random();
                        int otp = randomGenerator.nextInt(9999);
                        
                        //String apiKey = "apikey=" + "SKo6xkwk49Y-ZIJpwuvQqXJ1vf6yo1zrWYiNUIdWzL";
                        String apiKey = "apikey=" + "/04srJIx7bw-GDYR7KPFDsvlMxctRrxuFawO6uBtZ6";
                        
                        
			String message = "&message=" + "Hey!"
                                + " One Time Password (OTP) is "+otp;
			String sender = "&sender=" + "TXTLCL";
			String numbers = "&numbers=" + "91"+mobile;
			
			// Send data
                        
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
                        System.out.println(stringBuffer.toString());
			rd.close();
			
			return otp;
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
                        return -1;
		}
	}
}