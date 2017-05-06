package com.br.pb.barros.avaliabus.conf;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class AvaliaBusFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)  throws IOException, ServletException {
		
		HttpServletResponse servResponse = (HttpServletResponse) response;

		servResponse.setHeader("Access-Control-Allow-Origin", "*");
		servResponse.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, OPTIONS, DELETE");
		servResponse.setHeader("Access-Control-Max-Age", "3600");
		servResponse.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		servResponse.setHeader("Content-Security-Policy", "script-src ");
		servResponse.setHeader("Content-Security-Policy", "script-src https://localhost:8443/avaliabus/");
		servResponse.setHeader("Content-Security-Policy", "script-src http://localhost:8080/avaliabus/");
		servResponse.setHeader("Content-Security-Policy", "script-src https://facebook.com/");
		servResponse.setHeader("Content-Security-Policy", "script-src https://code.getmdl.io/1.2.1/material.min.js");
		servResponse.setHeader("Content-Security-Policy", "script-src self");
		servResponse.setHeader("Content-Security-Policy", "script-src unsafe-eval");
		servResponse.setHeader("Content-Security-Policy", "object-src self");

		chain.doFilter(request, response);
		
	}
	
	public void init(FilterConfig filterConfig) {}
	 
    public void destroy() {}
		
}
