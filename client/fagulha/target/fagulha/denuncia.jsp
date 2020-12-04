<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.uff.fagulha.model.Denuncia"%>
<%@page import="com.uff.fagulha.model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.concurrent.TimeUnit"%>
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
                    <li class="active"><a href="denuncia.jsp">Denúncias</a></li>
                </ul>
            </nav>
            <!-- .nav-menu -->
            <% if((Usuario) session.getAttribute("usuario") == null) {
                out.println("<a href=\"#\" class=\"get-started-btn scrollto\" data-toggle=\"modal\" data-target=\"#modalLRForm\">Login</a>");
            } else { 
            	out.println("<div class=\"dropdown\">");
                out.println("<a href=\"#\" class=\"get-started-btn scrollto\" id=\"dropdownMenuButton\" data-toggle=\"dropdown\" style=\"border-radius: 50%; padding: 8px 12px;\"><i class=\"icofont-ui-user\"></i></a>");
               	out.println("<div class=\"dropdown-menu\" aria-labelledby=\"dropdownMenuButton\">");
              	out.println("<a class=\"dropdown-item\" href=\"perfil.jsp\">Perfil</a>");
              	out.println("<a class=\"dropdown-item\" href=\"/logout\">Sair</a>");
            	out.println("</div></div>");
           	}%>
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
	                <input type="password" id="defaultForm-pass" name="senha" class="form-control validate">
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

    <main id="main">
        <section id="faq" class="faq mt-5">
        	<%  if ((String) session.getAttribute("mensagemDenuncia") == "erro") {
        			out.println("<div class=\"alert alert-danger\" role=\"alert\">");
        			out.println("Não foi possível completar sua denúncia, tente novamente!");
        			out.println("</div>");
        		} else if ((String) session.getAttribute("mensagemDenuncia") == "sucesso") {
        			out.println("<div class=\"alert alert-success\" role=\"alert\">");
        			out.println("Denúncia registrada com sucesso. Entraremos em contato!");
        			out.println("</div>");
        		}
        	%>
        	
            <div class="container aos-init aos-animate" data-aos="fade-up">

                <div class="section-title">
                    <h2>Últimas Denúncias</h2>
                </div>
                
                <jsp:include page="/consultaDenuncias"/>                
                
                <% if((List<Denuncia>) session.getAttribute("denuncias") != null) {
                    	for(Denuncia d : (List<Denuncia>) session.getAttribute("denuncias")) {
                    		int index = 0;
                    		if(d.getStatus() == 2){
                    			out.println("<ul class=\"faq-list aos-init aos-animate\" data-aos=\"fade-up\"></ul>");
                        		out.println("<li>");
                        		out.println("<a data-toggle=\"collapse\" class=\"collapsed\" href=\"#faq" + index + "\" aria-expanded=\"false\">" + "Incêndio em " + d.getCidade() + ", " + d.getEstado() + "<i class=\"bx bx-chevron-down icon-show\"></i>");
                        		out.println("<div id=\"faq" + index + "\" class=\"collapse\" data-parent=\".faq-list\">");
                        		out.println("<p>" + d.getDescricao() + "</p>");
                        		out.println("</div>");
                        		out.println("</li>");
                        		out.println("</ul>");
                        		index ++;
                        	}
                    	}
                }%>
            </div>
        </section>
        <section id="denuncia" class="denuncia">
            <div class="container aos-init aos-animate" data-aos="fade-up">

                <div class="section-title">
                    <h2>Denuncie já</h2>
                </div>

                <div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">

                    <div class="col-lg-6">

                        <div class="row">
                            <div class="col-md-6">
                                <div class="info-box">
                                    <i class="bx bx-envelope"></i>
                                    <h3>Mande um e-mail</h3>
                                    <p>fagulha.esperanca@gmail.com.br</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="info-box">
                                    <i class="bx bx-phone-call"></i>
                                    <h3>Ligue já</h3>
                                    <p>0800 2544 341</p>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-lg-6">
                        <form action="criaDenuncia" method="post" role="form" class="php-email-form">
                            <div class="form-group d-flex align-items-center">
                                <i class="icofont-location-pin"></i>
                                <input type="text" class="form-control" name="estado" id="estado"
                                    placeholder="Estado" data-rule="required"
                                    data-msg="Informe um estado">
                                <div class="validate"></div>
                            </div>
                            <div class="form-group d-flex align-items-center">
                                <i class="icofont-location-pin"></i>
                                <input type="text" class="form-control" name="cidade" id="cidade"
                                    placeholder="Cidade" data-rule="required"
                                    data-msg="Informe uma cidade">
                                <div class="validate"></div>
                            </div>
                            <div class="form-group d-flex align-items-start">
                                <i class="icofont-file-document"></i>
                                <textarea class="form-control" name="descricao" rows="5" data-rule="minlen:20"
                                    data-msg="Please write something for us" placeholder="Descrição"></textarea>
                                <div class="validate"></div>
                            </div>
                            <div class="mb-3">
                                <div class="loading">Carregando</div>
                            </div>
                            <div class="text-center">
                            	<% if((Usuario) session.getAttribute("usuario") != null) { 
                            			out.println("<button class=\"btn btn-success\" type=\"submit\">Denunciar</button>");
                            	} else {
                            			out.println("<button class=\"btn btn-success\" data-toggle=\"modal\" data-target=\"#modalLRForm\">Denunciar</button>");
                            	}
                            	%>
                            </div>
                        </form>
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
                <strong>Email:</strong>fagulha.esperanca@gmail.com<br>
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