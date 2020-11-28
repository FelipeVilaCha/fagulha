package com.uff.fagulha.servlet;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;

import com.uff.fagulha.model.Doacoes;

/**
 *
 * @author felip
 */
public class ConsultaDoacoes extends HttpServlet {

	private static final long serialVersionUID = 1L;
	WebTarget wt;
    Integer status;
    List<Doacoes> doacoes = null;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Client client = ClientBuilder.newClient();
            HttpSession session = request.getSession();
            URI uri;
            
            String base = "https://api-verde-esperanca.herokuapp.com/resources/doacoes";

            uri = new URI(base);
            wt = client.target(uri);
            wt.request().accept("application/xml");

            Invocation call = wt.request().buildGet();
            Response resposta = call.invoke();
            status = resposta.getStatus();
            
            doacoes = resposta.readEntity(new GenericType<List<Doacoes>>(){});
            
            session.setAttribute("doacoes", doacoes);
        } catch (URISyntaxException ex) {
            Logger.getLogger(ConsultaDoacoes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
