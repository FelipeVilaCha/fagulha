package com.uff.fagulha.service;

import java.util.Set;
import javax.ws.rs.core.Application;

/**
 *
 * @author Felipe Vila Chã
 */
@javax.ws.rs.ApplicationPath("resources")
public class ApplicationConfig extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<>();
        addRestResourceClasses(resources);
        return resources;
    }

    private void addRestResourceClasses(Set<Class<?>> resources) {
        resources.add(com.uff.fagulha.service.DenunciaService.class);
        resources.add(com.uff.fagulha.service.DoacoesService.class);
        resources.add(com.uff.fagulha.service.UsuarioService.class);
    }
    
}
