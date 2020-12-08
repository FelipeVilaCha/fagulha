package com.uff.fagulha.util;

import java.io.IOException;

import com.sendgrid.Content;
import com.sendgrid.Email;
import com.sendgrid.Mail;
import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;
import com.uff.fagulha.model.Denuncia;
import com.uff.fagulha.model.Doacoes;
import com.uff.fagulha.model.Usuario;

public class EnviaEmail {
    
    public String getTitulo (String tipo, Object objeto) {
    	String titulo = "";
    			
    	if(objeto instanceof Usuario && tipo.equals("criacao")) {
    		titulo = "Fagulha - Bem vindo!";
    	} else if (objeto instanceof Denuncia && tipo.equals("criacao")) {
    		titulo = "Fagulha - Denúncia Recebida!";
    	} else if (objeto instanceof Doacoes && tipo.equals("criacao")) {
    		titulo = "Fagulha - Doação Recebida!";
    	} else if (objeto instanceof Denuncia && tipo.equals("atualizacao")) {
    		titulo = "Fagulha - Denúncia Atualizada!";
    	}
    	
    	return titulo;
    }
    
    public String getCorpo (String tipo, Object objeto) {
    	String corpo = "";
    	
    	if (tipo.equals("criacao") && objeto instanceof Usuario) {
    		corpo = "Olá " + ((Usuario) objeto).getNome() + " ! Estamos muito felizes com o seu cadastro. Vamos salvar a nossa natureza!";
    	} else if (tipo.equals("criacao") && objeto instanceof Denuncia) {
    		corpo = "Olá " + ((Denuncia) objeto).getUsuario().getNome() + " ! Recebemos a sua denúncia #" + String.valueOf(((Denuncia) objeto).getId()) + " e analisaremos com cuidado!";
    	} else if (tipo.equals("criacao") && objeto instanceof Doacoes){
    		corpo = "Olá " + ((Doacoes) objeto).getUsuario().getNome() + " ! Obrigado pela sua doação! O estado do " + ((Doacoes) objeto).getEstado() + " é muito grato pela sua ajuda! Vamos em frente!";
    	} else if (tipo.equals("atualizacao") && objeto instanceof Denuncia) {
    		corpo = "Olá " + ((Denuncia) objeto).getUsuario().getNome() + " ! A sua denúncia #" + String.valueOf(((Denuncia) objeto).getId()) + " foi atualizada e agora se encontra " + new Conversor().getStatus(((Denuncia) objeto).getStatus()) + "!";
    	}
    	
    	return corpo;
    }

    public void envia(String email, String tipo, Object objeto) {
    	String titulo = getTitulo(tipo, objeto); 
    	String corpo = getCorpo(tipo, objeto);
	  
    	Email from = new Email("fagulha.esperanca@gmail.com");
    	Email to = new Email(email);
    	Content content = new Content("text/plain", corpo);
    	Mail mail = new Mail(from, titulo, to, content);

	    SendGrid sg = new SendGrid("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");
	    Request request = new Request();
	    
	    try {
	    	request.setMethod(Method.POST);
	    	request.setEndpoint("mail/send");
	    	request.setBody(mail.build());
	    	Response response = sg.api(request);
	    } catch (IOException ex) {
	      ex.getMessage().toString();
	    }
	  }
}