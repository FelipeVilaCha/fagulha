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
@Table(name = "denuncia")
@NamedQueries({
    @NamedQuery(name = "Denuncia.findAll", query = "SELECT d FROM Denuncia d")
    , @NamedQuery(name = "Denuncia.findByIdDenuncia", query = "SELECT d FROM Denuncia d WHERE d.id = :id")
    , @NamedQuery(name = "Denuncia.findByDescricao", query = "SELECT d FROM Denuncia d WHERE d.descricao = :descricao")
    , @NamedQuery(name = "Denuncia.findByCdStatus", query = "SELECT d FROM Denuncia d WHERE d.status = :status")
    , @NamedQuery(name = "Denuncia.findByUsuario", query = "SELECT d FROM Denuncia d WHERE d.usuario = :usuario")})
@XmlRootElement
public class Denuncia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_denuncia")
    private Integer id;
    @Column(name = "descricao")
    private String descricao;
    @Column(name = "cd_status")
    private Integer status;
    @Column(name = "estado")
    private String estado;
    @Column(name = "cidade")
    private String cidade;
    @ManyToOne
    @JoinColumn(name="usuario")
    private Usuario usuario;

    public Denuncia() {
    }

    public Denuncia(Integer idDenuncia) {
        this.id = idDenuncia;
    }
    
    public Denuncia(String descricao, Usuario usuario, int status, String estado, String cidade) {
        this.descricao = descricao;
        this.usuario = usuario;
        this.status = status;
        this.estado = estado;
        this.cidade = cidade;
    }
    
    public Denuncia(String descricao, int status, Usuario usuario) {
        this.descricao = descricao;
        this.status = status;
        this.usuario = usuario;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
}