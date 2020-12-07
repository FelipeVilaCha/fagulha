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

/**
 *
 * @author Felipe Vila Chã
 */
public class AtualizaDenuncia extends HttpServlet {

	private static final long serialVersionUID = 1L;
	WebTarget wt;
    Integer status;
    Denuncia denuncia;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Client client = ClientBuilder.newClient();
            URI uri;
            HttpSession session = request.getSession();
            
            String base = "https://api-fagulha.herokuapp.com/resources/denuncia/" + Integer.parseInt(request.getParameter("id_denuncia"));

            uri = new URI(base);
            wt = client.target(uri);
            wt.request().accept("application/xml");
            
            denuncia = new Denuncia(Integer.parseInt(request.getParameter("id_denuncia")), Integer.parseInt(request.getParameter("status")));
            
            Invocation call = wt.request().buildPut(Entity.xml(denuncia));
            Response resposta = call.invoke();
            status = resposta.getStatus();
            
            if (status != 200 || status != 204) {
            	session.setAttribute("mensagem", "erro");
            } else {
            	session.setAttribute("mensagem", "sucesso");
            }
            
            request.getRequestDispatcher("/admin/denuncia.jsp").forward(request, response);
        } catch (URISyntaxException ex) {
            Logger.getLogger(AtualizaDenuncia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}