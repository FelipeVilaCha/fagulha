package com.uff.fagulha.filters;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author FelipeVilaChadosSant
 */
public class LoginFilter implements Filter {    
    
    private ServletContext context;
    
    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        this.context = fConfig.getServletContext();
        this.context.log("Log");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        Enumeration<String> params = req.getParameterNames();
        
        while(params.hasMoreElements()){
            String nomeParametro = params.nextElement();
            String valorParametro = request.getParameter(nomeParametro);
            String homePage = "";

            if("email".equals(nomeParametro)) {
                if (!valorParametro.equals("admin@admin.com")) {
                            
                	boolean found = false;
                            
                    if(req.getCookies() != null){
                    	for(Cookie c : req.getCookies()){
                    		if(c.getName().contains(valorParametro)){
                    			found = true;
                            }
                    	}
                    }
                            
                    if(!found){
                    	Cookie c = new Cookie("logado", valorParametro);
                        c.setMaxAge(-1);
                        res.addCookie(c);
                    }
                    
                    chain.doFilter(request, response);
                    
                } else {
                	request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
                }
            }
        }
    }

    @Override
	public void destroy() {}

}