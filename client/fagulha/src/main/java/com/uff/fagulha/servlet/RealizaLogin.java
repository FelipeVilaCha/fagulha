package com.uff.fagulha.servlet;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

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

import com.uff.fagulha.model.Usuario;
import com.uff.fagulha.util.Encriptador;

/**
 *
 * @author Felipe Vila Chã
 */
public class RealizaLogin extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	WebTarget wt;
    Usuario usuario;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        String senhaEncriptada = new Encriptador().encripta(senha);
        
        try {
            Client client = ClientBuilder.newClient();
            URI uri;
            
            String base = "https://api-verde-esperanca.herokuapp.com/resources/usuario/login/" + email ;

            uri = new URI(base);
            wt = client.target(uri);
            wt.request().accept("application/xml");

            Invocation call = wt.request().buildGet();
            Response resposta = call.invoke();
            
            usuario = resposta.readEntity(new GenericType<Usuario>(){});
            
            if(usuario.getId().equals(0) || !usuario.getSenha().equals(senhaEncriptada)){
            	session.setAttribute("usuario", usuario);
            } else {
            	session.setAttribute("erro", "Login");
            }
        } catch (URISyntaxException ex) {
            
        }
    }
}