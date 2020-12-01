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

import org.json.simple.JSONObject;

import com.uff.fagulha.model.FocusAPI;

public class GetInfos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	WebTarget wt;
    Integer status;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Client client = ClientBuilder.newClient();
            HttpSession session = request.getSession();
            URI uri;
            
            String base = "http://queimadas.dgi.inpe.br//queimadas/dados-abertos/api/focos/";

            uri = new URI(base);
            wt = client.target(uri);
            wt.request().accept("application/json");

            Invocation call = wt.request().buildGet();
            Response resposta = call.invoke();
            status = resposta.getStatus();
            
            String api = resposta.readEntity(new GenericType<String>(){});
            session.setAttribute("api", api);
        } catch (URISyntaxException ex) {
            Logger.getLogger(ConsultaDoacoes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
