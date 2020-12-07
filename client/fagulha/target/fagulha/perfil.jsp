<%@page import="java.io.PrintWriter"%>
<%@page import="com.uff.fagulha.model.Usuario"%>
<%@page import="com.uff.fagulha.model.Doacoes"%>
<%@page import="com.uff.fagulha.model.Denuncia"%>
<%@page import="com.uff.fagulha.util.Conversor"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-br">
    
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    
        <title>Fagulha</title>
        <meta content="" name="description" />
        <meta content="" name="keywords" />
    
        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon" />
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />
    
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet" />
    
        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet" />
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet" />
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
        <link href="assets/vendor/venobox/venobox.css" rel="stylesheet" />
        <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet" />
    
        <!-- =======================================================
      * Template Name: Presento - v2.0.1
      * Template URL: https://bootstrapmade.com/presento-bootstrap-corporate-template/
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->
    </head> 
    <jsp:include page="/getUsuario"/>
    <jsp:include page="/getDoacoes"/> 
    <jsp:include page="/getDenuncia"/>
    <body>
        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top">
            <div class="container d-flex align-items-center">
                <h1 class="logo mr-auto">
                    <a href="index.jsp">Fagulha</a>
                </h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt=""></a>-->
    
                <nav class="nav-menu d-none d-lg-block">
                    <ul>
                        <li><a href="index.jsp#header">Home</a></li>
                        <li><a href="index.jsp#about">Sobre</a></li>
                        <li><a href="infos.jsp">Informações</a></li>
                        <li><a href="denuncia.jsp">Denúncias</a></li>
                    </ul>
                </nav>
                <!-- .nav-menu -->
            <div class="dropdown">
                    <a
                    href="#"
                    class="get-started-btn scrollto"
                    id="dropdownMenuButton" 
                    data-toggle="dropdown"
                    style="border-radius: 50%; padding: 8px 12px;"
                    ><i class="icofont-ui-user"></i></a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="perfil.jsp">Perfil</a>
                  <a class="dropdown-item" href="/logout">Sair</a>
                </div>
              </div>
          </div>
            </div>
        </header>
        <!-- End Header -->
    
        <!--Modal: Login / Register Form-->
        <div class="modal fade" id="modalLRForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog cascading-modal modal-dialog-centered" role="document">
    <!--Content-->
    <div class="modal-content">

      <!--Modal cascading tabs-->
      <div class="modal-c-tabs">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs md-tabs tabs-2 light-blue darken-3" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#panel7" role="tab"><i class="fas fa-user mr-1"></i>
              Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#panel8" role="tab"><i class="fas fa-user-plus mr-1"></i>
              Registrar-se</a>
          </li>
        </ul>

        <!-- Tab panels -->
        <div class="tab-content">
          <!--Panel 7-->
          <div class="tab-pane fade in show active" id="panel7" role="tabpanel">

            <!--Body-->
            <form action="login" method="post">
	            <div class="modal-body mx-2">
	              <div class="md-form mb-2">
	                <i class="icofont-ui-email"></i>
	                <label data-error="wrong" data-success="right" for="defaultForm-email">Email</label>
	                <input type="email" name="email" id="defaultForm-email" class="form-control validate">
	              </div>
	    
	              <div class="md-form mb-2">
	                <i class="icofont-ui-password"></i>
	                <label data-error="wrong" data-success="right" for="defaultForm-pass">Senha</label>
	                <input type="password" name="senha" id="defaultForm-pass" class="form-control validate">
	              </div>
	
	              <div class="options mt-1">
	                <p class="mb-0">Não é um membro? <a href="#" class="blue-text">Registrar-se</a></p>
	              </div>
	            </div>
	            <!--Footer-->
	            <div class="modal-footer">
	              <button type="button" class="btn btn-outline-success waves-effect ml-auto" data-dismiss="modal">Fechar</button>
	              <button type="submit" class="btn btn-success">Entrar<i class="fas fa-sign-in ml-1"></i></button>
	            </div>
			</form>
          </div>
          <!--/.Panel 7-->

          <!--Panel 8-->
          <div class="tab-pane fade" id="panel8" role="tabpanel">

            <!--Body-->
            <form action="cadastraUsuario" method="post">
            <div class="modal-body mx-2">
              
              <div class="md-form mb-2">
                <i class="icofont-ui-person"></i>
                <label data-error="wrong" data-success="right" for="defaultForm-text">Nome</label>
                <input type="text" id="defaultForm-text" name="nome" class="form-control validate">
              </div>
              
              <div class="md-form mb-2">
                <i class="icofont-ui-number"></i>
                <label data-error="wrong" data-success="right" for="defaultForm-text">Data de Nascimento</label>
                <input type="date" id="defaultForm-text" name="dataNascimento" class="form-control validate">
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
                <input type="password" id="defaultForm-pass" name="senha" class="form-control validate" data-rule="len:8">
              </div>

              <div class="options mt-1">
                <p class="mb-0">Já tem uma conta? <a href="#panel7" class="blue-text">Clique aqui</a></p>
              </div>
    
            </div>
            <!--Footer-->
            <div class="modal-footer">
              <button type="button" class="btn btn-outline-success waves-effect ml-auto" data-dismiss="modal">Fechar</button>
                <button type="submit" class="btn btn-success">Finalizar<i class="fas fa-sign-in ml-1"></i></button>
            </div>
          </form>
          </div>
          
          <!--/.Panel 8-->
        </div>

      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
        <!--Modal: Login / Register Form-->
    
        <!-- Modal Upload de imagem -->
        <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Upload</h5>
                        <button type="button" class="btn btn-outline-success waves-effect ml-auto"
                            data-dismiss="modal"><i class="icofont-close"></i></button>
                    </div>
                    <div class="modal-body">
                        <img class="img-fluid" src="https://globoesporte.globo.com/platb/files/985/2013/02/kombi_vasco.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
        <!-- End Modal Upload de imagem -->
    
        <main id="main">
            <section id="denuncia" class="denuncia mt-5">
                <div class="container aos-init aos-animate" data-aos="fade-up">
    
                    <div class="section-title">
                        <h2>Perfil</h2>
                    </div>
    
                    <div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
    
                        <div class="col-lg-4">
                            <div class="section-title">
                                <h4>Editar perfil</h4>
                            </div>
                            <form action="editaUsuario" method="post" role="form" class="php-email-form">
                                    <div class="row">
                                        <div class="d-flex justify-content-center mb-3">
                                            <div class="image-upload">
                                                <label for="file-input">
                                                <img class="img-fluid" src="data:image/png;base64,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"/>
                                                </label>
                                                <input id="img-profile-input" type="file" />
                                            </div>
                                        </div>
                                      <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                        <div class="text-center text-sm-left mb-2 mb-sm-0">
                                          <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap font-weight-bold"><%=((Usuario) session.getAttribute("usuario")).getNome()%></h4>
                                          <p class="mb-0"><%=new Conversor().getIdade(((Usuario) session.getAttribute("usuario")).getDataNasc())%> anos</p>
                                          <p class="mb-0"><%=((Usuario) session.getAttribute("usuario")).getEmail()%></p>
                                        </div>
                                      </div>
                                    </div>
                                <div class="d-flex">
                                <div class="form-group pr-1">
                                    <label>Nome Completo</label>
                                    <input type="text" class="form-control" name="nome" id="nome"
                                        placeholder="<%=((Usuario) session.getAttribute("usuario")).getNome()%>" data-rule="minlen:4">
                                    <div class="validate"></div>
                                </div>
                                <div class="form-group pl-1">
                                    <label>E-mail</label>
                                    <input type="email" class="form-control" name="email" id="email"
                                        placeholder="<%=((Usuario) session.getAttribute("usuario")).getEmail()%>" data-rule="minlen:4">
                                    <div class="validate"></div>
                                </div>
                            </div>
                                <div class="d-flex">
                                <div class="form-group pr-1">
                                    <label>Data de Nascimento</label>
                                    <input type="text" class="form-control" name="dataNascimento" id="datanascimento"
                                        placeholder="<%=new Conversor().getDate(((Usuario) session.getAttribute("usuario")).getDataNasc())%>" data-rule="len:8">
                                    <div class="validate"></div>
                                </div>
                                <div class="form-group pl-1">
                                    <label>CPF</label>
                                    <input type="text" class="form-control" name="cpf" id="cpf"
                                        placeholder="<%=((Usuario) session.getAttribute("usuario")).getCpf()%>" data-rule="len:11">
                                    <div class="validate"></div>
                                </div>
                            </div>
                                
                                <div class="d-flex">
                                    <div class="form-group">
                                        <label>Cidade</label>
                                        <input type="text" class="form-control" name="cidade" id="cidade"
                                            placeholder="<%=((Usuario) session.getAttribute("usuario")).getCidade()%>" data-rule="minlen:4">
                                        <div class="validate"></div>
                                    </div>
                                    <div class="form-group px-2">
                                        <label>Estado</label>
                                        <input type="text" class="form-control" name="estado" id="estado"
                                            placeholder="<%=((Usuario) session.getAttribute("usuario")).getEstado()%>" data-rule="minlen:2">
                                        <div class="validate"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>País</label>
                                        <input type="text" class="form-control" name="pais" id="pais"
                                            placeholder="<%=((Usuario) session.getAttribute("usuario")).getPais()%>" data-rule="minlen:2">
                                        <div class="validate"></div>
                                    </div>
                                </div>
    
                                <div class="form-group">
                                    <label>Senha</label>
                                    <input type="password" class="form-control" name="senha" id="password"
                                        placeholder="<%=((Usuario) session.getAttribute("usuario")).getSenha()%>" data-rule="maxlen:8"
                                        data-msg="Entre com a sua senha de oito digitos">
                                    <div class="validate"></div>
                                </div>
                                
                                <div class="mb-3">
                                    <div class="loading">Carregando</div>
                                </div>
                                <div class="text-center"><button type="submit">Salvar</button></div>
                            </form>
                        </div>
    
                        <div class="col-lg-8">
                            <div class="section-title">
                                <h4>Histórico de denúncias</h4>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="info-box p-3">
                                        <table class="table denuncia-table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Cidade</th>
                                                    <th scope="col">Estado</th>
                                                    <th scope="col">Descrição</th>
                                                    <th scope="col">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<% if((List<Denuncia>) session.getAttribute("denuncias") != null) {
                                            	     	int index = 0;
														for(Denuncia d : (List<Denuncia>) session.getAttribute("denuncias")) {
                                            	        	index += 1;
                                            	            out.println("<tr>");
                                            	            out.println("<th scope=\"row\">" + index + "</th>");
															out.println("<td>" + d.getCidade() + "</td>");
															out.println("<td>" + d.getEstado() + "</td>");
															out.println("<td><p>" + d.getDescricao() + "</p></td>");
															out.println("<td class=\"font-weight-bold\">" + new Conversor().getStatus(d.getStatus()) + "</td>");
															out.println("</tr>");
														}
                                            	}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
    						<div class="section-title">
                                <h4>Histórico de doações</h4>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="info-box">
                                        <table class="table denuncia-table p-2">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Valor</th>
                                                    <th scope="col">Registrado</th>
                                                    <th scope="col">Destino</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<% if((List<Doacoes>) session.getAttribute("doacoes") != null) {
                                            	    	int index = 0;
                                            	        for(Doacoes d : (List<Doacoes>) session.getAttribute("doacoes")) {
                                            	        	index += 1;
                                            	            out.println("<tr>");
                                            	            out.println("<th scope=\"row\">" + index + "</th>");
                                            	            out.println("<td> R$" + d.getValor() + "</td>");
                                            	            out.println("<td>" + new Conversor().getDate(d.getDataRealizacao()) + "</td>");
                                            	            out.println("<td>" + d.getEstado() + "</td>");
                                            	            out.println("</tr>");
                                            	        }
                                            	    }%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                  </div>
                </div>
            </section>
        </main>
        <!-- End #main -->
    
        <!-- Footer -->
        <footer id="footer">
    
            <div class="footer-top">
                <div class="container">
                    <div class="row">
    
                        <div class="col-lg-4 col-md-4 footer-contact">
                            <h3>Fagulha<span>.</span></h3>
                            <p>
                                Av. Gal. Milton Tavares de Souza <br>
                                Niteroi, RJ 24210-310<br>
                                Brasil <br><br>
                                <strong>Telefone:</strong> +55 21 3396-6873<br>
                                <strong>Email:</strong> fagulha.esperanca@gmail.com<br>
                            </p>
                        </div>
    
                        <div class="col-lg-4 col-md-4 footer-links">
                            <h4>Links Úteis</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="www.ibama.gov.br">Ibama</a></li>
               					<li><i class="bx bx-chevron-right"></i> <a href="https://www.embrapa.br/territorial/">Embrapa</a></li>
                				<li><i class="bx bx-chevron-right"></i> <a href="https://www.sosma.org.br/">SOS Mata Atlântica</a></li>
                				<li><i class="bx bx-chevron-right"></i> <a href="https://www.greenpeace.org/brasil/">Greenpeace</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
    
            <div class="container d-md-flex py-4">
    
                <div class="mr-md-auto text-center text-md-left">
                    <div class="copyright">
                        © <strong><span>Fagulha</span></strong>. Todos os direitos reservados
                    </div>
                </div>
                <div class="social-links text-center text-md-right pt-3 pt-md-0">
                    <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                    <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                    <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                    <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                    <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                </div>
            </div>
        </footer>
        <!-- End Footer -->
    
        <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
    
        <!-- Vendor JS Files -->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
        <script src="assets/vendor/counterup/counterup.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/venobox/venobox.min.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
    
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
    
    </html>