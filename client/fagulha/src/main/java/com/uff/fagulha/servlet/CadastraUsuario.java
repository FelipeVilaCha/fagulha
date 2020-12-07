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
public class CadastraUsuario extends HttpServlet {

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
            
            String base = "https://api-fagulha.herokuapp.com/resources/usuario";

            uri = new URI(base);
            wt = client.target(uri);
            wt.request().accept("application/xml");
            
            Usuario usuario = new Usuario();
            
            Date date = new Conversor().transformTraco(request.getParameter("dataNascimento"));
            usuario.setDataNasc(date);
            usuario.setCidade(request.getParameter("cidade"));
            usuario.setCpf(request.getParameter("cpf"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setEstado(request.getParameter("estado"));
            usuario.setNome(request.getParameter("nome"));
            usuario.setPais(request.getParameter("pais"));
            usuario.setSenha(new Encriptador().encripta(request.getParameter("senha")));
            
            Invocation call = wt.request().buildPost(Entity.xml(usuario));
            call.invoke();
            
            session.setAttribute("mensagemIndex", "sucesso");
            
            response.sendRedirect("https://fagulha-esperanca.herokuapp.com");
        } catch (URISyntaxException ex) {
            Logger.getLogger(CadastraUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}