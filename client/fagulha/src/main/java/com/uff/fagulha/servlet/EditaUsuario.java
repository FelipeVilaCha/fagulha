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
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Response;

import com.uff.fagulha.model.Usuario;
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
            Client client = ClientBuilder.newClient();
            URI uri;
            
            String base = "https://api-fagulha.herokuapp.com/resources/usuario/" + + Integer.parseInt(request.getParameter("id_usuario"));;

            uri = new URI(base);
            wt = client.target(uri);
            wt.request().accept("application/xml");
            
            Usuario usuario = new Usuario(Integer.parseInt(request.getParameter("id_usuario")));
            
            usuario.setCpf(request.getParameter("cpf"));
            usuario.setDataNasc(new Date(new Long(request.getParameter("dataNascimento"))));
            usuario.setCidade(request.getParameter("cidade"));
            usuario.setEstado(request.getParameter("estado"));
            usuario.setNome(request.getParameter("nome"));
            usuario.setSenha(new Encriptador().encripta(request.getParameter("senha")));
            usuario.setPais(request.getParameter("pais"));
            usuario.setEmail(request.getParameter("senha"));
           
            Invocation call = wt.request().buildPut(Entity.xml(usuario));
            Response resposta = call.invoke();
            status = resposta.getStatus();
            
            request.getRequestDispatcher("/perfil.jsp").forward(request, response);    
        } catch (URISyntaxException ex) {
            Logger.getLogger(EditaUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}