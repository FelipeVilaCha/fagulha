package com.uff.fagulha.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Felipe Vila Chã
 */
@Entity
@Table(name = "doacoes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Doacoes.findAll", query = "SELECT d FROM Doacoes d")
    , @NamedQuery(name = "Doacoes.findByUsuario", query = "SELECT d FROM Doacoes d WHERE d.usuario = :usuario")})
public class Doacoes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_DOACAO")
    private Integer id;
    @Column(name = "VALOR")
    private double valor;
    @Column(name = "data_realizacao")
    @Temporal(TemporalType.DATE)
    private Date dataRealizacao;
    @Column(name = "estado")
    private String estado;
    @ManyToOne
    @JoinColumn(name="usuario", nullable=false)
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
