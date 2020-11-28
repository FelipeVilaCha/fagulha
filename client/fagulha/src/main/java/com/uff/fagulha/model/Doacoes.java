package com.uff.fagulha.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Felipe Vila Chã
 */

@XmlRootElement
public class Doacoes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "ID_DOACAO")
    private Integer id;
    @Column(name = "VALOR")
    private double valor;
    @Column(name = "DATA_REALIZACAO")
    private Date dataRealizacao;
    @Column(name = "ESTADO")
    private String estado;
    @Column(name="USUARIO")
    private Usuario usuario;
    

    public Doacoes() {
    }

    public Doacoes(Integer id) {
        this.id = id;
    }

    public Doacoes(double valor, Date dataRealizacao, String estado, Usuario usuario) {
        this.valor = valor;
        this.dataRealizacao = dataRealizacao;
        this.estado = estado;
        this.usuario = usuario;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public Date getDataRealizacao() {
        return dataRealizacao;
    }

    public void setDataRealizacao(Date dataRealizacao) {
        this.dataRealizacao = dataRealizacao;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
