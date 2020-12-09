<%@page import="com.uff.fagulha.model.Doacoes"%>
<%@page import="com.uff.fagulha.util.Conversor"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
  	<jsp:include page="/consultaDoacoes"/>
    <meta charset="utf-8" />
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
    <link
      href="../assets/vendor/boxicons/css/boxicons.min.css"
      rel="stylesheet"
    />
    <link
      href="../assets/vendor/owl.carousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />
    <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="../assets/vendor/venobox/venobox.css" rel="stylesheet" />
    <link href="../assets/vendor/aos/aos.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="../assets/css/style.css" rel="stylesheet" />

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
          <a href="/admin/index.jsp">Fagulha</a>
        </h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo mr-auto"><img src="../assets/img/logo.png" alt=""></a>-->

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

    <!-- ======= Main =======  -->
    <main id="main">
      <section id="faq" class="faq mt-5">
        <div class="container aos-init aos-animate" data-aos="fade-up">
          <div class="section-title">
            <h2>Doações</h2>
          </div>

          <table class="table Doacoes-table pb-3">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Email</th>
                <th scope="col">Data</th>
                <th scope="col">Valor</th>
                <th scope="col">Destino</th>
              </tr>
            </thead>
            <tbody>
            <%
            	if((List<Doacoes>) session.getAttribute("doacoes") != null) {
            				int index = 0;
                                	for(Doacoes d : (List<Doacoes>) session.getAttribute("doacoes")) {
                                		index += 1;
                                		out.println("<tr>");
                                		out.println("<th scope=\"row\">" + index + "</th>");
                                    	out.println("<td>" + d.getUsuario().getEmail() + "</td>");
                                    	out.println("<td>" + new Conversor().getDate(d.getDataRealizacao()) + "</td>");
                                    	out.println("<td><p>" + d.getValor() + "</p></td>");
                                    	out.println("<td class=\"font-weight-bold\">" + d.getEstado() + "</td>");
                                    	out.println("</tr>");
                            	}
                            }
            %>
            </tbody>
          </table>
        </div>
      </section>
    </main>
    <!-- End #main -->

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
    <script src="../assets/js/main.js"></script>
  </body>
</html>
