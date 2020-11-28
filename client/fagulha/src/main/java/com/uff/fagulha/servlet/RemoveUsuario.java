package com.uff.fagulha.servlet;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Response;

import com.uff.fagulha.model.Usuario;

/**
 *
 * @author felip
 */
public class RemoveUsuario extends HttpServlet {

	private static final long serialVersionUID = 1L;
	WebTarget wt;
    Usuario usuario;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Client client = ClientBuilder.newClient();
            HttpSession session = request.getSession();
            URI uri;
            
            String base = "https://api-verde-esperanca.herokuapp.com/resources/usuario/" + Integer.parseInt(request.getParameter("id")) ;

            uri = new URI(base);
            wt = client.target(uri);
            wt.request().accept("application/xml");

            Invocation call = wt.request().buildDelete();
            Response resposta = call.invoke();
            
            Cookie userCookie = new Cookie("logout", "logout");
            for  (Cookie c : request.getCookies()) {
            	System.out.println(c.getName());
            	session.setAttribute("usuario", new Usuario("felipe"));
            	if(c.getName() == ((Usuario) session.getAttribute("usuario")).getEmail()) {
            		userCookie = c;
            	}
            }
            
            userCookie.setMaxAge(0);
            response.addCookie(userCookie);
            request.removeAttribute("usuario");
            response.sendRedirect("https://verde-esperanca.herokuapp.com");
        } catch (URISyntaxException ex) {
            Logger.getLogger(RemoveUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
