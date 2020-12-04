package com.uff.fagulha.servlet;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Response;

import com.uff.fagulha.model.Denuncia;
import com.uff.fagulha.model.Usuario;


/**
 *
 * @author Felipe Vila Chã
 */
public class CriaDenuncia extends HttpServlet {
   
	private static final long serialVersionUID = 1L;
	WebTarget wt;
    Integer status;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Client client = ClientBuilder.newClient();
            HttpSession session = request.getSession();
            URI uri;
            
            String base = "https://api-fagulha.herokuapp.com/resources/denuncia";

            uri = new URI(base);
            wt = client.target(uri);
            wt.request().accept("application/xml");
            
            Usuario usuario = ((Usuario) session.getAttribute("usuario"));
            Integer status = 0;
            
            Denuncia denuncia = new Denuncia(request.getParameter("descricao"), usuario, status, request.getParameter("estado"), request.getParameter("cidade"));
            
            Invocation call = wt.request().buildPost(Entity.xml(denuncia));
            Response res = call.invoke();
            
            if(res.getStatus() == 200 || res.getStatus() == 204) {
            	session.removeAttribute("mensagemDenuncia");
            } else {
            	session.setAttribute("mensagemDenuncia", "erro");
            }
            
            request.getRequestDispatcher("/denuncia.jsp").forward(request, response);
        } catch (URISyntaxException ex) {
            Logger.getLogger(CriaDenuncia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}