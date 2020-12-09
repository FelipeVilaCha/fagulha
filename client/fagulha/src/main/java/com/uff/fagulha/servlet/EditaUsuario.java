package com.uff.fagulha.servlet;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Date;
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

import com.uff.fagulha.model.Usuario;
import com.uff.fagulha.util.Conversor;
import com.uff.fagulha.util.Encriptador;

/**
 *
 * @author Felipe Vila Chã
 */
public class EditaUsuario extends HttpServlet {

	private static final long serialVersionUID = 1L;
	WebTarget wt;
    Integer status;
    Usuario usuario;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
        	
        	if(request.getParameter("file") != null) {
        		Client client = ClientBuilder.newClient();
                HttpSession session = request.getSession();
                URI uri;
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                
                String base = "https://api-fagulha.herokuapp.com/resources/usuario/foto/" + usuario.getId();
                
                uri = new URI(base);
                wt = client.target(uri);
                wt.request().accept("application/xml");
                
                usuario.setFoto(request.getParameter("file"));
                
                Invocation call = wt.request().buildPut(Entity.xml(usuario));
                call.invoke();
        	} else {
        	
	            Client client = ClientBuilder.newClient();
	            HttpSession session = request.getSession();
	            URI uri;
	            Usuario usuario = (Usuario) session.getAttribute("usuario");
	            
	            String base = "https://api-fagulha.herokuapp.com/resources/usuario/" + usuario.getId();
	
	            uri = new URI(base);
	            wt = client.target(uri);
	            wt.request().accept("application/xml");
	            
	            Date date = new Conversor().transformBarra(request.getParameter("dataNascimento"));
	            
	            usuario.setCpf(request.getParameter("cpf"));
	            usuario.setDataNasc(date);
	            usuario.setCidade(request.getParameter("cidade"));
	            usuario.setEstado(request.getParameter("estado"));
	            usuario.setNome(request.getParameter("nome"));
	            usuario.setSenha(new Encriptador().encripta(request.getParameter("senha")));
	            usuario.setPais(request.getParameter("pais"));
	            usuario.setEmail(request.getParameter("email"));
	            
	            if(usuario.getFoto() != null) {
	            	usuario.setFoto(usuario.getFoto());
	            }
	            
	            Invocation call = wt.request().buildPut(Entity.xml(usuario));
	            call.invoke();
        	}
        	
        	response.sendRedirect("https://fagulha-esperanca.herokuapp.com/perfil.jsp");
        } catch (URISyntaxException ex) {
            Logger.getLogger(EditaUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}