package com.uff.fagulha.service;

import com.uff.fagulha.dao.DoacoesDAO;
import com.uff.fagulha.dao.UsuarioDAO;
import com.uff.fagulha.model.Doacoes;
import com.uff.fagulha.model.Usuario;
import com.uff.fagulha.util.EnviaEmail;

import java.io.IOException;
import java.util.List;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
    

/**
 *
 * @author Felipe Vila Chã
 */

@Path("doacoes")
public class DoacoesService {
    
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public List<Doacoes> get() throws IOException {
        return new DoacoesDAO().getDoacoes();
    }

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_XML)
    public Doacoes getById(@PathParam("id") int id) {
        return new DoacoesDAO().getDoacoesById(id);
    }
    
    @GET
    @Path("usuario/{id}")
    @Produces(MediaType.APPLICATION_XML)
    public List<Doacoes> getDoacoesByUsuario(@PathParam("id") int id) {
        Usuario usuario = new UsuarioDAO().getUsuarioById(id);
        return new DoacoesDAO().getDoacoesByUser(usuario);
    }
    
    @POST
    @Consumes(MediaType.APPLICATION_XML)
    public void cria(Doacoes doacao) {
        try {
            new DoacoesDAO().insereDoacoes(doacao);
            new EnviaEmail().envia(doacao.getUsuario().getEmail(), "criacao", doacao);
        } catch(Exception ex) {
            
        } 
    }
}
