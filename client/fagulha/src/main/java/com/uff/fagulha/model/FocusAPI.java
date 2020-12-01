package com.uff.fagulha.model;


import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

	/**
	 *
	 * @author Felipe Vila Chã
	 */
@XmlRootElement
public class FocusAPI implements Serializable {

	private static final long serialVersionUID = 1L;
	private String estado;
	private int focus;
	
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public int getFocus() {
		return focus;
	}
	public void setFocus(int focus) {
		this.focus = focus;
	}
	
	public FocusAPI(String estado, int focus) {
		this.estado = estado;
		this.focus = focus;
	}
}
