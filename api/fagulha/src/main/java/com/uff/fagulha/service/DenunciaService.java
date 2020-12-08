package com.uff.fagulha.service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.uff.fagulha.dao.DenunciaDAO;
import com.uff.fagulha.dao.UsuarioDAO;
import com.uff.fagulha.model.Denuncia;
import com.uff.fagulha.model.Usuario;
import com.uff.fagulha.util.EnviaEmail;
    

/**
 *
 * @author Felipe Vila Chã
 */

@Path("denuncia")
public class DenunciaService {
    
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public List<Denuncia> get() {
        return new DenunciaDAO().getDenuncias();
    }

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_XML)
    public Denuncia getById(@PathParam("id") int id) {
        return new DenunciaDAO().getDenunciaById(id);
    }
    
    @GET
    @Path("usuario/{id}")
    @Produces(MediaType.APPLICATION_XML)
    public List<Denuncia> getDenunciaByUser(@PathParam("id") int id) {
        Usuario usuario = new UsuarioDAO().getUsuarioById(id);
        return new DenunciaDAO().getDenunciaByUser(usuario);
    }
    
    @POST
    @Consumes(MediaType.APPLICATION_XML)
    public void cria(Denuncia denuncia) {
        try {
            new DenunciaDAO().insereDenuncia(denuncia);
            new EnviaEmail().envia(denuncia.getUsuario().getEmail(), "criacao", denuncia);
        } catch(Exception ex) {
            
        } 
    }
    
    @PUT
    @Path("{id}")
    @Consumes(MediaType.APPLICATION_XML)
    public void put(@PathParam("id") int id, Denuncia d) {
        try {
        	Denuncia denuncia = new DenunciaDAO().getDenunciaById(id);
        	denuncia.setStatus(d.getStatus());
        	
        	new DenunciaDAO().updateDenuncia(denuncia);
            new EnviaEmail().envia(denuncia.getUsuario().getEmail(), "atualizacao", denuncia);
        } catch(Exception ex) {
            
        } 
    }
    
    @DELETE
    @Path("{id}")
    @Consumes(MediaType.APPLICATION_XML)
    public void delete(@PathParam("id") int id) {
        try {
            new DenunciaDAO().removeDenuncia(id);
        } catch(Exception ex) {
        
        }
    }
}
