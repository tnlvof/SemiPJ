package com.kh.pj.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import wrapper.LoginWrapper;

/**
 * Servlet Filter implementation class IncryptFilter
 */
@WebFilter(filterName="incrypt", urlPatterns="*.me")
public class IncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public IncryptFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		System.out.println("암호화 필터");
		request.setAttribute("checkPwd", request.getParameter("memberPwd"));
		HttpServletRequest h_request = (HttpServletRequest)request;
		LoginWrapper lw = new LoginWrapper(h_request);
		// pass the request along the filter chain
		chain.doFilter(lw, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
