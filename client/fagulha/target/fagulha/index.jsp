<!DOCTYPE html>
<html lang="pt-br">
<%@page import="java.io.PrintWriter"%>
<%@page import="com.uff.fagulha.model.Usuario"%>
<%@page import="java.util.List"%>
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
      rel="stylesheet"
    />

  <!-- Vendor CSS Files -->
  <link
      href="assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet" />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link
      href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="assets/vendor/venobox/venobox.css" rel="stylesheet" />
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <script
      async
      src="https://platform.twitter.com/widgets.js"
      charset="utf-8"
    ></script>
    
   
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
          <li class="active"><a href="#header">Home</a></li>
          <li><a href="#about">Sobre</a></li>
          <li><a href="infos.jsp">Informações</a></li>
          <li><a href="denuncia.jsp">Denúncias</a></li>
        </ul>
      </nav>
      <!-- .nav-menu -->
      <% if((Usuario) session.getAttribute("usuario") == null) { 
      	 	out.println("<a href=\"#modalLRForm\" class=\"get-started-btn scrollto\" data-toggle=\"modal\" data-target=\"#modalLRForm\">Login</a>"); 
      	} else {
      		out.println("<div class=\"dropdown\">");
            out.println("<a href=\"#\" class=\"get-started-btn scrollto\" id=\"dropdownMenuButton\" data-toggle=\"dropdown\" style=\"border-radius: 50%; padding: 8px 12px;\"><i class=\"icofont-ui-user\"></i></a>");
           	out.println("<div class=\"dropdown-menu\" aria-labelledby=\"dropdownMenuButton\">");
          	out.println("<a class=\"dropdown-item\" href=\"perfil.jsp\">Perfil</a>");
          	out.println("<a class=\"dropdown-item\" href=\"/logout\">Sair</a>");
        	out.println("</div></div>");
       } %>
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
	                <label for="defaultForm-email">Email</label>
	                <input type="email" name="email" id="defaultForm-email" class="form-control validate" required>
	              </div>
	    
	              <div class="md-form mb-2">
	                <i class="icofont-ui-password"></i>
	                <label for="defaultForm-pass">Senha</label>
	                <input type="password" name="senha" id="defaultForm-pass" class="form-control validate" required>
	              </div>
	
	              <div class="options mt-1">
	                <p class="mb-0">Não é um membro? <a href="#panel8" class="blue-text">Registrar-se</a></p>
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
                <label for="nome">Nome</label>
                <input type="text" id="nome" name="nome" class="form-control validate" required>
              </div>
              
              <div class="md-form mb-2">
                <i class="icofont-ui-number"></i>
                <label for="dataNascimento">Data de Nascimento</label>
                <input type="date" id="dataNascimento" name="dataNascimento" class="form-control validate" required>
              </div>
              
              <div class="md-form mb-2">
                <i class="icofont-ui-location"></i>
                <label for="cidade">Cidade</label>
                <input type="text" id="cidade" name="cidade" class="form-control validate" required>
              </div>
              
              <div class="md-form mb-2">
                <i class="icofont-ui-location"></i>
                <label for="estado">Estado</label>
                <input type="text" id="estado" name="estado" class="form-control validate" required minlength="2" maxlength="2">
              </div>
              
              <div class="md-form mb-2">
                <i class="icofont-ui-location"></i>
                <label for="pais">País</label>
                <input type="text" id="pais" name="pais" class="form-control validate" required>
              </div>
              
              <div class="md-form mb-2">
                <i class="icofont-ui-location"></i>
                <label for="cpf">CPF</label>
                <input type="text" id="cpf" name="cpf" class="form-control validate" required minlength="11" maxlength="11">
              </div>
              
              <div class="md-form mb-2">
                <i class="icofont-ui-email"></i>
                <label for="email">Email</label>
                <input type="email" id="email" name="email" class="form-control validate" required>
              </div>
    			
              <div class="md-form mb-2">
                <i class="icofont-ui-password"></i>
                <label for="senha">Senha</label>
                <input type="password" id="senha" name="senha" class="form-control validate" required>
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

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container" data-aos="zoom-out" data-aos-delay="100">
      <div class="row">
      <% if((String) session.getAttribute("mensagemIndex") != null && (String) session.getAttribute("mensagemIndex") == "erro") { 
    	  	out.println("<div class=\"alert alert-danger\" role=\"alert\">");
			out.println("Usuário ou senha incorretos, tente novamente!");
			out.println("</div>");
      	} else if((String) session.getAttribute("mensagemIndex") != null && (String) session.getAttribute("mensagemIndex") == "sucesso") { 
    	  	out.println("<div class=\"alert alert-success\" role=\"alert\">");
			out.println("Cadastro realizado com sucesso! Bem-vindo!");
			out.println("</div>");
      	} else if((String) session.getAttribute("mensagemCadastro") != null) { 
    	  	out.println("<div class=\"alert alert-danger\" role=\"alert\">");
			out.println("Cadastro não realizado. Usuário já existente!");
			out.println("</div>");
      	}%>
        <div class="col-xl-6">
          <h1>Fagulha</h1>
          <h2>
            Somos um projeto de prevenção e combate às queimadas do Brasil
          </h2>
          <a href="#about" class="btn-get-started scrollto">Sobre nós</a>
        </div>
      </div>
    </div>
  </section>
  <!-- End Hero -->

  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about section-bg">
      <div class="container">
        <div class="row no-gutters">
          <div class="content col-xl-5 d-flex align-items-stretch">
            <div class="content">
              <h3>O Projeto Fagulha</h3>
              <p>
                Nós somos um projeto criado para acompanhar todas as notícias sobre queimadas no Brasil. Além disso,
                somos um canal de denúncia contra crimes ambientais com um serviço de registros de ocorrências on-line. Venha fazer parte do time!
              </p>
              <a href="denuncia.jsp" class="about-btn"><span>Denuncie já!</span> <i class="bx bx-chevron-right"></i></a>
            </div>
          </div>
          <div class="col-xl-7 d-flex align-items-stretch">
            <div class="icon-boxes d-flex justify-content-center">
              <div class="row">
                <div class="col-md-4 icon-box" data-aos-delay="100">
                  <i class="icofont-tree"></i>
                  <h4>Conscientize-se</h4>
                  <p>
                    As queimadas não podem ter vez
                  </p>
                </div>
                <div class="col-md-4 icon-box" data-aos-delay="200">
                  <i class="icofont-ui-call"></i>
                  <h4>Denuncie</h4>
                  <p>
                    Todas as denúncias são anônimas
                  </p>
                </div>
                <div class="col-md-4 icon-box" data-aos-delay="300">
                  <i class="icofont-handshake-deal"></i>
                  <h4>Colabore</h4>
                  <p>
                    Vamos construir um futuro melhor
                  </p>
                </div>
              </div>
            </div>
            <!-- End .content-->
          </div>
        </div>
      </div>
    </section>
    <!-- End About Section -->
    <section id="count-info" class="counts">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-12">
                        <div class="count-box">
                            <i class="icofont-forest-fire"></i>
                            <span data-toggle="counter-up">21.772</span>
                            <p>Focos de incendio registrados no Pantanal em 2020</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-12 mt-4 mt-md-0">
                        <div class="count-box">
                            <i class="icofont-fire-burn"></i>
                            <div class="d-flex justify-content-center align-items-center">
                                <span data-toggle="counter-up">200</span>
                                <span>%</span>
                            </div>
                            <p>De aumento de queimadas no pantanal em 2020</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-12 mt-4 mt-lg-0">
                        <div class="count-box">
                            <i class="icofont-tree-alt"></i>
                            <div class="d-flex justify-content-center align-items-center">
                                <span data-toggle="counter-up">23</span>
                                <span>%</span>
                            </div>
                            <p>do Pantanal ja foi queimado!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <!-- Twitter integration Section -->
    <div class="section-title pt-5">
        <h2>Últimas Notícias</h2>
      </div>
      <div>
        <article style="margin: auto; max-width: 960px; margin-top: 50px">
          <a
            data-height="700"
            class="twitter-timeline"
            href="https://twitter.com/botqueimadas?ref_src=twsrc%5Etfw"
          >
          </a>
        </article>
      </div>
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