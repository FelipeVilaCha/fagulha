package com.uff.fagulha.service;

import com.uff.fagulha.dao.UsuarioDAO;
import com.uff.fagulha.model.Usuario;
import com.uff.fagulha.util.EnviaEmail;

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
    

/**
 *
 * @author Felipe Vila Chã
 */

@Path("usuario")
public class UsuarioService {
    
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public List<Usuario> get() {
        return new UsuarioDAO().getUsuarios();
    }

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_XML)
    public Usuario getById(@PathParam("id") int id) {
        return new UsuarioDAO().getUsuarioById(id);
    }

    @POST
    @Consumes(MediaType.APPLICATION_XML)
    @Produces(MediaType.APPLICATION_XML)
    public void cria(Usuario usuario) {
        try {  
        	new UsuarioDAO().insereUsuario(usuario);
        	new EnviaEmail().envia(usuario.getEmail(), "criacao", usuario);
        } catch (Exception ex) {
            
        }
    }

    @PUT
    @Path("{id}")
    @Consumes(MediaType.APPLICATION_XML)
    public void put(@PathParam("id") int id, Usuario usuario) {
    	try {
            new UsuarioDAO().updateUsuario(usuario);
        
        } catch(Exception ex) {
          
        }
    }
    
    @PUT
    @Path("foto/{id}")
    @Consumes(MediaType.APPLICATION_XML)
    public void putFoto(@PathParam("id") int id, Usuario usuario) {
        try {
        	Usuario old_usuario = new UsuarioDAO().getUsuarioById(id);
        	old_usuario.setFoto(usuario.getFoto());
        	
            new UsuarioDAO().updateUsuario(usuario);
        } catch(Exception ex) {
          
        } 
    }
    
    @DELETE
    @Path("{id}")
    @Consumes(MediaType.APPLICATION_XML)
    public void delete(@PathParam("id") int id) {
        try {
            new UsuarioDAO().removeUsuario(id);
        } catch(Exception ex) {
        
        }
    }
    
    @POST
    @Path("login")
    @Consumes(MediaType.APPLICATION_XML)
    @Produces(MediaType.APPLICATION_XML)
    public Usuario getLogin(Usuario usuario) {
        return new UsuarioDAO().getUsuarioByEmail(usuario.getEmail());
    }
}
