<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.uff.fagulha.model.FocusAPI"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<% if((String) session.getAttribute("api") != null) {
			out.println(((String) session.getAttribute("api")));
	}%>
	<jsp:include page="/homeAdmin"/>
	
	<form action="cadastraUsuario" method="post">
	            <div class="body mx-2">
	              
	              <div class="md-form mb-2">
	                <i class="icofont-ui-person"></i>
	                <label data-error="wrong" data-success="right" for="defaultForm-text">Nome</label>
	                <input type="text" id="defaultForm-text" name="nome" class="form-control validate">
	              </div>
	              
	              <div class="md-form mb-2">
	                <i class="icofont-ui-number"></i>
	                <label data-error="wrong" data-success="right" for="defaultForm-text">Data de Nascimento</label>
	                <input type="date" id="defaultForm-text" name="dataNasc" class="form-control validate">
	              </div>
	              
	              <div class="md-form mb-2">
	                <i class="icofont-ui-location"></i>
	                <label data-error="wrong" data-success="right" for="defaultForm-text">Cidade</label>
	                <input type="text" id="defaultForm-text" name="cidade" class="form-control validate">
	              </div>
	              
	              <div class="md-form mb-2">
	                <i class="icofont-ui-location"></i>
	                <label data-error="wrong" data-success="right" for="defaultForm-text">Estado</label>
	                <input type="text" id="defaultForm-text" name="estado" class="form-control validate">
	              </div>
	              
	              <div class="md-form mb-2">
	                <i class="icofont-ui-location"></i>
	                <label data-error="wrong" data-success="right" for="defaultForm-text">País</label>
	                <input type="text" id="defaultForm-text" name="pais" class="form-control validate">
	              </div>
	              
	              <div class="md-form mb-2">
	                <i class="icofont-ui-location"></i>
	                <label data-error="wrong" data-success="right" for="defaultForm-text">CPF</label>
	                <input type="text" id="defaultForm-text" name="cpf" class="form-control validate">
	              </div>
	              
	              <div class="md-form mb-2">
	                <i class="icofont-ui-email"></i>
	                <label data-error="wrong" data-success="right" for="defaultForm-email">Email</label>
	                <input type="email" id="defaultForm-email" name="email" class="form-control validate">
	              </div>
	    			
	              <div class="md-form mb-2">
	                <i class="icofont-ui-password"></i>
	                <label data-error="wrong" data-success="right" for="defaultForm-pass">Senha</label>
	                <input type="password" id="defaultForm-pass" name="senha" class="form-control validate">
	              </div>
	
	              <div class="options mt-1">
	                <p class="mb-0">Já tem uma conta? <a href="#panel7" class="blue-text">Clique aqui</a></p>
	              </div>
	            </div>
              <button type="submit" class="btn btn-success">Entrar<i class="fas fa-sign-in ml-1"></i></button>
            </div>
          </form>
</body>
</html>