package com.hb.model;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.sun.net.ssl.HttpsURLConnection;

import sun.net.www.protocol.http.HttpURLConnection;



public class Ajax_WeatherXMLCommand implements Command {
	StringBuffer sb = new StringBuffer();
	String msg = "";
	InputStream is = null;
	URL url = null;
	HttpURLConnection conn = null;
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		try {
			url = new URL("http://www.kma.go.kr/XML/weather/sfc_web_map.xml");
			conn = (HttpURLConnection)url.openConnection();
			is = conn.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			while((msg = br.readLine()) !=null){
				sb.append(msg);
			}
		
		} catch (Exception e) {
		} finally {
			try {
				is.close();
			} catch (Exception e2) {
			}
		}
		return sb.toString();
	}

}
