package com.uff.fagulha.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.WebTarget;

import com.uff.fagulha.model.Usuario;

/**
 *
 * @author Felipe Vila Chã
 */
public class RealizaLogout extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	WebTarget wt;
    Usuario usuario;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
    	Usuario usuario = (Usuario) session.getAttribute("usuario");
    	   	
    	for(Cookie c : request.getCookies()) {
    		if (c.getValue() == usuario.getEmail()) {
    	   		c.setMaxAge(0);
    	   	}
    	}
    	   	
    	session.invalidate();
    	response.sendRedirect("/index.jsp");
    }
}