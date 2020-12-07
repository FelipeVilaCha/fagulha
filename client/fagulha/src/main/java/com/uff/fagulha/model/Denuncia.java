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
public class Denuncia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "id_denuncia")
    private Integer id;
    @Column(name = "descricao")
    private String descricao;
    @Column(name = "cd_status")
    private Integer status;
    @Column(name="usuario")
    private Usuario usuario;
    @Column(name="estado")
    private String estado;
    @Column(name="cidade")
    private String cidade;

    public Denuncia() {
    }

    public Denuncia(Integer idDenuncia) {
        this.id = idDenuncia;
    }

    public Denuncia(int id, int status) {
        this.id = id;
        this.status = status;
    }
    
    public Denuncia(String descricao, Usuario usuario, int status, String estado, String cidade) {
        this.descricao = descricao;
        this.usuario = usuario;
        this.status = status;
        this.estado = estado;
        this.cidade = cidade;
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