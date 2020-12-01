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

import com.uff.fagulha.model.Denuncia;
import com.uff.fagulha.model.Doacoes;
import com.uff.fagulha.model.Usuario;

/**
 *
 * @author Felipe Vila Chã
 */
public class HomeAdmin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        WebTarget wt;
        List<Usuario> usuarios;
        List<Denuncia> denuncias;
        List<Doacoes> doacoes;
        
        try {
            Client client = ClientBuilder.newClient();
            URI uri;
            
            String baseUsuario = "https://api-fagulha.herokuapp.com/resources/usuario";
            String baseDenuncia = "https://api-fagulha.herokuapp.com/resources/denuncia";
            String baseDoacoes = "https://api-fagulha.herokuapp.com/resources/doacoes";
            
            uri = new URI(baseUsuario);
            wt = client.target(uri);
            wt.request().accept("application/xml");

            Invocation callUser = wt.request().buildGet();
            Response respostaUser = callUser.invoke();
            
            usuarios = respostaUser.readEntity(new GenericType<List<Usuario>>(){});
            
            uri = new URI(baseDenuncia);
            wt = client.target(uri);
            wt.request().accept("application/xml");

            Invocation callDenuncia = wt.request().buildGet();
            Response respostaDenuncia = callDenuncia.invoke();
            
            denuncias = respostaDenuncia.readEntity(new GenericType<List<Denuncia>>(){});
            
            uri = new URI(baseDoacoes);
            wt = client.target(uri);
            wt.request().accept("application/xml");

            Invocation callDoacoes = wt.request().buildGet();
            Response respostaDoacoes = callDoacoes.invoke();
            
            doacoes = respostaDoacoes.readEntity(new GenericType<List<Doacoes>>(){});
            
            HttpSession session = request.getSession();
            
            session.setAttribute("usuarios", usuarios);
            session.setAttribute("denuncias", denuncias);
            session.setAttribute("doacoes", doacoes);
                
            response.sendRedirect("/http://localhost:8080/admin.jsp");
        } catch (URISyntaxException ex) {
            Logger.getLogger(HomeAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}