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
import javax.ws.rs.core.Response;

import com.uff.fagulha.model.Doacoes;
import com.uff.fagulha.model.Usuario;
import com.uff.fagulha.util.ConversorData;

/**
 *
 * @author Felipe Vila Chã
 */
public class CriaDoacoes extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	WebTarget wt;
    Doacoes doacao;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Client client = ClientBuilder.newClient();
            HttpSession session = request.getSession();
            URI uri;
            
            String base = "https://api-fagulha.herokuapp.com/resources/doacoes";

            uri = new URI(base);
            wt = client.target(uri);
            wt.request().accept("application/xml");
            
            Usuario usuario = ((Usuario) session.getAttribute("usuario"));
            
            Date date = new ConversorData().transformBarra(new Date());

            doacao = new Doacoes(Integer.parseInt(request.getParameter("valor")), date, request.getParameter("estado"), usuario);

            Invocation call = wt.request().buildPost(Entity.xml(doacao));
            Response resposta = call.invoke();
            
            if(resposta.getStatus() == 204 || resposta.getStatus() == 200) {
            	session.removeAttribute("mensagemDenuncia");
            } else {
            	session.setAttribute("mensagemDenuncia", "erro");
            }
            
            request.getRequestDispatcher("/infos.jsp").forward(request, response);
        } catch (URISyntaxException ex) {
            Logger.getLogger(CriaDoacoes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}