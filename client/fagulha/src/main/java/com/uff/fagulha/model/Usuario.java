package com.uff.fagulha.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Felipe Vila Chã
 */
@XmlRootElement
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "ID_USER")
    private Integer id;
    @Column(name = "EMAIL")
    private String email;
    @Column(name = "SENHA")
    private String senha;
    @Column(name = "NOME")
    private String nome;
    @Column(name = "DATA_NASC")
    @Temporal(TemporalType.DATE)
    private Date dataNasc;
    @Column(name = "CIDADE")
    private String cidade;
    @Column(name = "ESTADO")
    private String estado;
    @Column(name = "PAIS")
    private String pais;
    @Column(name = "CPF")
    private String cpf;
    @Column(name="DENUNCIAS")
    private List<Denuncia> denuncias;
    @Column(name="DOACOES")
    private List<Doacoes> doacoes;

    public Usuario() {
    }

    public Usuario(Integer idUser) {
        this.id = idUser;
    }
    
    public Usuario(String email) {
        this.email = email;
    }

    public Usuario(Integer idUser, String email, String senha, String nome, Date dataNasc, String cidade, String estado, String pais, String cpf) {
        this.id = idUser;
        this.email = email;
        this.senha = senha;
        this.nome = nome;
        this.dataNasc = dataNasc;
        this.cidade = cidade;
        this.estado = estado;
        this.pais = pais;
        this.cpf = cpf;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(Date dataNasc) {
        this.dataNasc = dataNasc;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public List<Denuncia> getDenuncias() {
        return denuncias;
    }

    public void setDenuncias(List<Denuncia> denuncias) {
        this.denuncias = denuncias;
    }

    public List<Doacoes> getDoacoes() {
        return doacoes;
    }

    public void setDoacoes(List<Doacoes> doacoes) {
        this.doacoes = doacoes;
    }
}
