<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.uff.fagulha.model.Usuario"%>
<%@page import="java.util.List"%>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"
        integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw=="
        crossorigin="anonymous"></script>

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
                <a href="index.html">Fagulha</a>
            </h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt=""></a>-->

            <nav class="nav-menu d-none d-lg-block">
                <ul>
                    <li><a href="index.jsp#header">Home</a></li>
                    <li><a href="index.jsp#about">Sobre</a></li>
                    <li class="active"><a href="info.jsp">Informações</a></li>
                    <li><a href="denuncia.jsp">Denúncias</a></li>
                </ul>
            </nav>
            <!-- .nav-menu -->

            <% if((Usuario) session.getAttribute("usuario") == null) {
      		 out.println("<a href=\"#modalLRForm\" class=\"get-started-btn scrollto\" data-toggle=\"modal\" data-target=\"#modalLRForm\">Login</a>"); 
      	 } else {
        	 out.println("<a href=\"perfil.jsp\" class=\"get-started-btn scrollto\">" + ((Usuario) session.getAttribute("usuario")).getNome() + " </a>");
        	 out.println("<a href=\"/logout\">  (sair) </a>");
      	} %>
        </div>
    </header>
    <!-- End Header -->

    <!--Modal: Login / Register Form-->
    <div class="modal fade" id="modalLRForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog cascading-modal modal-dialog-centered" role="document">
            <!--Content-->
            <div class="modal-content">

                <!--Modal cascading tabs-->
                <div class="modal-c-tabs">

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs md-tabs tabs-2 light-blue darken-3" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#panel7" role="tab"><i
                                    class="fas fa-user mr-1"></i>
                                Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#panel8" role="tab"><i
                                    class="fas fa-user-plus mr-1"></i>
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
                                        <label data-error="wrong" data-success="right"
                                            for="defaultForm-email">Email</label>
                                        <input type="email" name="email" id="defaultForm-email"
                                            class="form-control validate">
                                    </div>

                                    <div class="md-form mb-2">
                                        <i class="icofont-ui-password"></i>
                                        <label data-error="wrong" data-success="right"
                                            for="defaultForm-pass">Senha</label>
                                        <input type="password" name="senha" id="defaultForm-pass"
                                            class="form-control validate">
                                    </div>

                                    <div class="options mt-1">
                                        <p class="mb-0">Não é um membro? <a href="#" class="blue-text">Registrar-se</a>
                                        </p>
                                        <p class="mb-0">Esqueceu <a href="#" class="blue-text">a senha?</a></p>
                                    </div>
                                </div>
                                <!--Footer-->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-success waves-effect ml-auto"
                                        data-dismiss="modal">Fechar</button>
                                    <button type="submit" class="btn btn-success">Entrar<i
                                            class="fas fa-sign-in ml-1"></i></button>
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
                                        <label data-error="wrong" data-success="right"
                                            for="defaultForm-text">Nome</label>
                                        <input type="text" id="defaultForm-text" name="nome"
                                            class="form-control validate">
                                    </div>

                                    <div class="md-form mb-2">
                                        <i class="icofont-ui-number"></i>
                                        <label data-error="wrong" data-success="right" for="defaultForm-text">Data de
                                            Nascimento</label>
                                        <input type="date" id="defaultForm-text" name="dataNasc"
                                            class="form-control validate">
                                    </div>

                                    <div class="md-form mb-2">
                                        <i class="icofont-ui-location"></i>
                                        <label data-error="wrong" data-success="right"
                                            for="defaultForm-text">Cidade</label>
                                        <input type="text" id="defaultForm-text" name="cidade"
                                            class="form-control validate">
                                    </div>

                                    <div class="md-form mb-2">
                                        <i class="icofont-ui-location"></i>
                                        <label data-error="wrong" data-success="right"
                                            for="defaultForm-text">Estado</label>
                                        <input type="text" id="defaultForm-text" name="estado"
                                            class="form-control validate">
                                    </div>

                                    <div class="md-form mb-2">
                                        <i class="icofont-ui-location"></i>
                                        <label data-error="wrong" data-success="right"
                                            for="defaultForm-text">País</label>
                                        <input type="text" id="defaultForm-text" name="pais"
                                            class="form-control validate">
                                    </div>

                                    <div class="md-form mb-2">
                                        <i class="icofont-ui-location"></i>
                                        <label data-error="wrong" data-success="right"
                                            for="defaultForm-text">CPF</label>
                                        <input type="text" id="defaultForm-text" name="cpf"
                                            class="form-control validate">
                                    </div>

                                    <div class="md-form mb-2">
                                        <i class="icofont-ui-email"></i>
                                        <label data-error="wrong" data-success="right"
                                            for="defaultForm-email">Email</label>
                                        <input type="email" id="defaultForm-email" name="email"
                                            class="form-control validate">
                                    </div>

                                    <div class="md-form mb-2">
                                        <i class="icofont-ui-password"></i>
                                        <label data-error="wrong" data-success="right"
                                            for="defaultForm-pass">Senha</label>
                                        <input type="password" id="defaultForm-pass" name="senha"
                                            class="form-control validate">
                                    </div>

                                    <div class="options mt-1">
                                        <p class="mb-0">Já tem uma conta? <a href="#panel7" class="blue-text">Clique
                                                aqui</a></p>
                                    </div>

                                </div>
                                <!--Footer-->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-success waves-effect ml-auto"
                                        data-dismiss="modal">Fechar</button>
                                    <button type="submit" class="btn btn-success">Entrar<i
                                            class="fas fa-sign-in ml-1"></i></button>
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
        <div style="margin-top: 100px">
            <h1 style="text-align: center; padding: 4rem 0">
                Número de focos por estado em 24 horas
            </h1>
            <canvas width="700" height="700" id="myChart"></canvas>
            <div style="text-align: center" id="notFound"></div>
        </div>
        <!-- ======= Count Section ======= -->
        <section id="count-info" class="counts">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-12">
                        <div class="count-box">
                            <i class="icofont-forest-fire"></i>
                            <span data-toggle="counter-up">21.772</span>
                            <p>Focos de incêndio registrados no Pantanal em 2020</p>
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
                            <p>do Pantanal já foi queimado!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ======= End Count Section ======= -->

        <!-- ======= Info Section ======= -->
        <section id="info" class="tabs">
            <div class="container">
                <ul class="nav nav-tabs row d-flex">
                    <li class="nav-item col-3">
                        <a class="nav-link active show" data-toggle="tab" href="#tab-1">
                            <i class="ri-gps-line"></i>
                            <h4 class="d-none d-lg-block">As causas das queimadas</h4>
                        </a>
                    </li>
                    <li class="nav-item col-3">
                        <a class="nav-link" data-toggle="tab" href="#tab-2">
                            <i class="ri-body-scan-line"></i>
                            <h4 class="d-none d-lg-block">
                                O que fazer para evitar o problema?
                            </h4>
                        </a>
                    </li>
                    <li class="nav-item col-3">
                        <a class="nav-link" data-toggle="tab" href="#tab-3">
                            <i class="ri-sun-line"></i>
                            <h4 class="d-none d-lg-block">Como você pode agir</h4>
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active show" id="tab-1">
                        <div class="row">
                            <div class="col-lg-6 order-2 order-lg-1 mt-3 mt-lg-0" data-aos-delay="100">
                                <p>
                                    A Amazônia possui condições climáticas que fazem dela uma
                                    floresta úmida e de altas temperaturas durante o ano todo,
                                    praticamente. Dessa forma, quando há focos de queimadas e
                                    incêndios florestais, não há possibilidade desse fogo ter
                                    sido causado de forma natural, e sim artificial, antrópica.
                                    Assim, podemos encontrar três tipos de queimadas no bioma:
                                </p>
                                <ul>
                                    <li>- Renovar o pasto;</li>
                                    <li>- Desmatar grandes áreas;</li>
                                    <li>
                                        - Fogo em áreas já desmatadas, o chamado incêndio
                                        florestal.
                                    </li>
                                </ul>
                                <p>
                                    <a href="https://mundoeducacao.uol.com.br/geografia/queimadas-na-amazonia.htm"></a>
                                </p>
                            </div>
                            <div class="col-lg-6 order-1 order-lg-2 text-center" data-aos-delay="200">
                                <img src="assets/img/tabs1.jpg" alt="" class="img-fluid" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-2">
                        <div class="row">
                            <div class="col-lg-6 order-2 order-lg-1 mt-3 mt-lg-0">
                                <p>
                                    O professor Thiago Izzo, pós-doutor em Biologia,
                                    especialista em Ecologia Evolutiva e professor da
                                    Universidade Federal de Mato Grosso (UFMT) defende que, além
                                    de remediar, é necessário impedir que o fogo ocorra
                                    novamente. “É importante que no ano que vem, em março,
                                    abril, no máximo, já comecem campanhas de prevenção e
                                    fiscalização. Desta vez, a atenção está se dando no final do
                                    processo”, lamenta.
                                </p>
                                <br />
                                <p>
                                    O pesquisador compara os incêndios deste ano à pandemia do
                                    novo coronavírus: “Nunca havíamos passado por isso”. Apesar
                                    do histórico de fogo que já existe no bioma em épocas e
                                    extensões específicas, Izzo afirma que o incêndio desta vez
                                    “atingiu proporções inéditas”. Uma alternativa para os
                                    próximos anos, acrescenta, é a técnica de fogo controlado,
                                    já utilizada antes, para impedir que esses grandes incêndios
                                    saiam do controle. As florestas são enormes campos de
                                    material combustível, como folhas secas, madeiras e
                                    arbustos. Com as chamas controladas, parte do material já
                                    vai ser consumido, havendo muito menos matéria para ser
                                    queimada quando a seca chegar.
                                </p>
                                <p>
                                    <a
                                        href="https://exame.com/esg/o-que-e-preciso-para-acabar-com-as-queimadas-no-pantanal/"></a>
                                </p>
                            </div>
                            <div class="col-lg-6 order-1 order-lg-2 text-center">
                                <img src="assets/img/tabs2.jpg" alt="" class="img-fluid" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-3">
                        <div class="row">
                            <div class="col-lg-6 order-2 order-lg-1 mt-3 mt-lg-0">
                                <p>
                                    Grandes biomas do Brasil estão em chamas e as imagens que
                                    chegam a todo o momento são preocupantes. Saiba como agir
                                    pela proteção ambiental
                                </p>
                                <ul>
                                    <li>- Compartilhe informações</li>
                                    <li>- Fiscalize</li>
                                    <li>- Cobre das autoridades</li>
                                    <li>- Participe de iniciativas de proteção ambiental</li>
                                </ul>
                                <p>
                                    <a
                                        href="https://www.greenpeace.org/brasil/blog/7-coisas-que-voce-pode-fazer-pelo-pantanal/">Fonte</a>
                                </p>
                            </div>
                            <div class="col-lg-6 order-1 order-lg-2 text-center">
                                <img src="assets/img/tabs3.jpg" alt="" class="img-fluid" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Info Section -->
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
                            <li><i class="bx bx-chevron-right"></i> <a
                                    href="https://www.embrapa.br/territorial/">Embrapa</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="https://www.sosma.org.br/">SOS Mata
                                    Atlântica</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a
                                    href="https://www.greenpeace.org/brasil/">Greenpeace</a></li>
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
    <script async>
        const BASE_API_URL = 'http://localhost:7777';
        let labels = [];
        let data = [];
        let colors = [];
        const options = {
            method: 'GET',
        };

        function handleError() {
            console.log('error when retrieving data from INPE API')

            document.getElementById('myChart').width = 0
            document.getElementById('myChart').height = 0
            document.getElementById('notFound').innerHTML = `<p>We do not found any data</p>`
        }

        try {
            fetch(BASE_API_URL, options)
                .fail(() => {
                    handleError()
                })
                .then(function (response) {
                    if (!response.ok) {
                        handleError()

                        throw Error(response);
                    }
                    return response.json();
                })
                .then((responseBody) => {
                    labels = Object.keys(responseBody?.statesMap);
                    data = Object.values(responseBody?.statesMap);
                    colors = Object.values(responseBody?.statesColorMap);

                    var ctx = document.getElementById('myChart').getContext('2d');

                    var myChart = new Chart(ctx, {
                        type: 'doughnut',
                        data: {
                            labels,
                            datasets: [
                                {
                                    label: '# of Votes',
                                    data,
                                    backgroundColor: colors,
                                    hoverBackgroundColor: '#000',
                                    borderColor: colors,
                                    borderWidth: 1,
                                },
                            ],
                        },
                        options: {
                            legend: {
                                display: false,
                            },
                            layout: {
                                padding: {
                                    left: 50,
                                    right: 50,
                                    bottom: 50,
                                },
                            },
                        },
                    });
                });
        } catch {
            handleError()
        }

    </script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
</body>

</html>