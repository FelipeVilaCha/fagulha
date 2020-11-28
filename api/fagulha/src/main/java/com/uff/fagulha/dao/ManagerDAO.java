package com.uff.fagulha.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ManagerDAO {
    public EntityManagerFactory fac = Persistence.createEntityManagerFactory("FagulhaPU");
    
    public EntityManager criaManager() {
        return fac.createEntityManager();
    }
    
    public void fechaConexao (EntityManager em) {
        em.close();
        this.fac.close();
    }
}
