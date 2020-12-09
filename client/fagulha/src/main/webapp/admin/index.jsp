<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<%@page import="java.io.PrintWriter"%>
<%@page import="com.uff.fagulha.model.Usuario"%>
<%@page import="java.util.List"%>
<head>
  <meta charset="UTF-8" />
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />

  <title>Fagulha</title>
  <meta content="" name="description" />
  <meta content="" name="keywords" />

   <!-- Favicons -->
    <link href="../assets/img/favicon.png" rel="icon" />
    <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />

  <!-- Vendor CSS Files -->
  <link
      href="../assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link href="../assets/vendor/icofont/icofont.min.css" rel="stylesheet" />
    <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link
      href="../assets/vendor/owl.carousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />
    <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="../assets/vendor/venobox/venobox.css" rel="stylesheet" />
    <link href="../assets/vendor/aos/aos.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="../assets/css/style.css" rel="stylesheet" />
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
        <a href="/admin/index.jsp">Fagulha</a>
      </h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt=""></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
            <li><a href="/admin/usuario.jsp">Usuários</a></li>
            <li class="active"><a href="/admin/doacoes.jsp">Doações</a></li>
            <li><a href="/admin/denuncia.jsp">Denúncias</a></li>
        </ul>
      </nav>
      <!-- .nav-menu -->
      <a
          href="https://fagulha-esperanca.herokuapp.com/index.jsp"
          class="get-started-btn scrollto"
          >Logout</a
        >
    </div>
  </header>
  <!-- End Header -->
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container" data-aos="zoom-out" data-aos-delay="100">
      <div class="row">
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
  <script src="../assets/vendor/jquery/jquery.min.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>
  <script src="../assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="../assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="../assets/vendor/counterup/counterup.min.js"></script>
  <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../assets/vendor/venobox/venobox.min.js"></script>
  <script src="../assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
</body>

</html>