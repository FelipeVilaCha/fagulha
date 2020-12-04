package com.uff.fagulha.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.uff.fagulha.servlet.CadastraUsuario;

public class ConversorData {
	
	public Date transformBarra(String date) {
		SimpleDateFormat ini = new SimpleDateFormat("dd/MM/yyyy");
		Date dataFmt = new Date();
	    
	    try {
	    	dataFmt = ini.parse(date);
	    } catch (ParseException e) {
	    	Logger.getLogger(CadastraUsuario.class.getName()).log(Level.SEVERE, null, e);
	    }
	    
	    return dataFmt;
	}
	
	public Date transformBarra(Date date) {
		SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
	    Date dataFmt = new Date();
	    String dataStr = "";
	    
	    try {
	    	dataStr = f.format(date);
	    	dataFmt = f.parse(dataStr);
	    } catch (ParseException e) {
	    	Logger.getLogger(CadastraUsuario.class.getName()).log(Level.SEVERE, null, e);
	    }
	    
	    return dataFmt;
	}
	
	public Date transformTraco(String date) {
		SimpleDateFormat ini = new SimpleDateFormat("yyyy-MM-dd");
		Date dataFmt = new Date();
	    
	    try {
	    	dataFmt = ini.parse(date);
	    } catch (ParseException e) {
	    	Logger.getLogger(CadastraUsuario.class.getName()).log(Level.SEVERE, null, e);
	    }
	    
	    return dataFmt;
	}
	
	public Date transformTraco(Date date) {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
	    Date dataFmt = new Date();
	    String dataStr = "";
	    
	    try {
	    	dataStr = f.format(date);
	    	dataFmt = f.parse(dataStr);
	    } catch (ParseException e) {
	    	Logger.getLogger(CadastraUsuario.class.getName()).log(Level.SEVERE, null, e);
	    }
	    
	    return dataFmt;
	}
}
