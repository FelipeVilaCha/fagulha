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
</head>

<body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
        <div class="container d-flex align-items-center">
            <h1 class="logo mr-auto">
                <a href="index.html">Fagulha</a>
            </h1>
        
            <nav class="nav-menu d-none d-lg-block">
                <ul>
                    <li><a href="index.jsp#header">Home</a></li>
                    <li><a href="index.jsp#about">Sobre</a></li>
                    <li class="active"><a href="infos.jsp">Informacoes</a></li>
                    <li><a href="denuncia.jsp">Denuncias</a></li>
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
	<!--Modal: Doacoes-->
    <div class="modal fade" id="doeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
        <form action="criaDoacoes" method="post">
          <div class="modal-header">
            <h5 class="modal-title">Doacoes</h5>
          </div>
          <div class="modal-body mx-2">
            <div class="md-form mb-2">
              <i class="icofont-money"></i>
              <label>Valor</label
              >
              <input
                type="number"
                name="valor"
                id="valor"
                placeholder="R$"
                class="form-control validate"
              	required />
            </div>

            <div class="md-form mb-2">
              <i class="icofont-location-pin"></i>
              <label>Estado</label
              >
              <input
                type="text"
                name="estado"
                id="estado"
                class="form-control validate"
              	required minlength="2" maxlength="2"/>
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-outline-success waves-effect ml-auto"
              data-dismiss="modal"
            >
              Fechar
            </button>
            <button type="submit" class="btn btn-success">
              Doar<i class="fas fa-sign-in ml-1"></i>
            </button>
          </div>
          </form>
        </div>
      </div>
    </div>
    <!--End Modal: Doacoes-->
    <main id="main">
        <div style="margin-top: 100px">
            <h1 style="text-align: center; padding: 5rem 0 2rem 0">
                Numero de focos por estado em 24 horas
            </h1>
            <div style="width:800px;margin:auto">
            <canvas width="700" height="700" id="myChart"></canvas>
            </div>
            <div style="text-align: center" id="notFound"></div>
        </div>

        <!-- ======= Info Section ======= -->
        <section id="doacoes" class="about section-bg">
      <div class="container">
        <div class="row no-gutters">
          <div class="content col-xl-5 d-flex align-center">
            <div class="content">
              <h3>Faca a sua doacao</h3>
              <p>
                Nos do time fagulha levamos muito a serio as nossas contribuicoes. Ajudando um estado, voce pode estar ajudando a vida de milhoes nesta e em futuras geracoes. Venha conosco.
              </p>
              <% if((Usuario) session.getAttribute("usuario") == null) {
        		 	out.println("<a href=\"#modalLRForm\" class=\"about-btn\" data-toggle=\"modal\" data-target=\"#modalLRForm\"><span>Doe!</span> <i class=\"bx bx-chevron-left\"></i></a>");
        		 } else {
        		 	out.println("<a data-toggle=\"modal\" data-target=\"#doeModal\" class=\"about-btn\"><span>Doe!</span> <i class=\"bx bx-chevron-left\"></i></a>");
        		 }%>
            </div>
          </div>
        </div>
      </div>
    </section>
        <section id="info" class="tabs">
            <div class="container">
                <ul style="flex-direction:row;flex-wrap: nowrap" class="nav nav-tabs row d-flex">
                    <li class="nav-item col-3">
                        <a class="nav-link active show" data-toggle="tab" href="#tab-1">
                            <i class="ri-gps-line"></i>
                            <h4 class="d-none d-lg-block">Causas</h4>
                        </a>
                    </li>
                    <li class="nav-item col-3">
                        <a class="nav-link" data-toggle="tab" href="#tab-2">
                            <i class="ri-body-scan-line"></i>
                            <h4 class="d-none d-lg-block">
                                Solucoes
                            </h4>
                        </a>
                    </li>
                    <li class="nav-item col-3">
                        <a class="nav-link" data-toggle="tab" href="#tab-3">
                            <i class="ri-sun-line"></i>
                            <h4 class="d-none d-lg-block">Voce</h4>
                        </a>
                    </li>
                    <li class="nav-item col-3">
                        <a class="nav-link" data-toggle="tab" href="#tab-4">
                            <i class="ri-lungs-line"></i>
                            <h4 class="d-none d-lg-block">Impacto</h4>
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active show" id="tab-1">
                        <div class="row">
                            <div class="col-lg-6 order-2 order-lg-1 mt-4 mt-lg-0" data-aos-delay="100">
                                <p>
                                    A Amazonia possui condicoes climaticas que fazem dela uma
                                    floresta umida e de altas temperaturas durante o ano todo,
                                    praticamente. Dessa forma, quando ha focos de queimadas e
                                    incendios florestais, nao ha possibilidade desse fogo ter
                                    sido causado de forma natural, e sim artificial, antropica.
                                    Assim, podemos encontrar tres tipos de queimadas no bioma:
                                </p>
                                <ul>
                                    <li>- Renovar o pasto;</li>
                                    <li>- Desmatar grandes areas;</li>
                                    <li>
                                        - Fogo em areas ja desmatadas, o chamado incendio
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
                            <div class="col-lg-6 order-2 order-lg-1 mt-4 mt-lg-0">
                                <p>
                                    O professor Thiago Izzo, pos-doutor em Biologia,
                                    especialista em Ecologia Evolutiva e professor da
                                    Universidade Federal de Mato Grosso (UFMT) defende que, alem
                                    de remediar, e necessario impedir que o fogo ocorra
                                    novamente. “e importante que no ano que vem, em marco,
                                    abril, no maximo, ja comecem campanhas de prevencao e
                                    fiscalizacao. Desta vez, a atencao esta se dando no final do
                                    processo”, lamenta.
                                </p>
                                <br />
                                <p>
                                    O pesquisador compara os incendios deste ano a pandemia do
                                    novo coronavirus: “Nunca haviamos passado por isso”. Apesar
                                    do historico de fogo que ja existe no bioma em epocas e
                                    extensoes especificas, Izzo afirma que o incendio desta vez
                                    “atingiu proporcoes ineditas”. Uma alternativa para os
                                    proximos anos, acrescenta, e a tecnica de fogo controlado,
                                    ja utilizada antes, para impedir que esses grandes incendios
                                    saiam do controle. As florestas sao enormes campos de
                                    material combustivel, como folhas secas, madeiras e
                                    arbustos. Com as chamas controladas, parte do material ja
                                    vai ser consumido, havendo muito menos materia para ser
                                    queimada quando a seca chegar.
                                    
                                    Ao lado, um mapa que demonstra, no Brasil, as areas em 
                                    protecao ambiental levando em conta os diferentes biomas
                                    brasileiros. A hora de acordar e ajudar a nossa nacao e planeta
                                    e agora. 
                                </p>
                                <p>
                                    <a
                                        href="https://exame.com/esg/o-que-e-preciso-para-acabar-com-as-queimadas-no-pantanal/"></a>
                                </p>
                            </div>
                            <div class="col-lg-6 order-1 order-lg-2 text-center">
                                <img src="assets/img/ed09_p53_info.jpg" alt="" class="img-fluid" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-3">
                        <div class="row">
                            <div class="col-lg-6 order-2 order-lg-1 mt-4 mt-lg-0">
                                <p>
                                    Grandes biomas do Brasil estao em chamas e as imagens que
                                    chegam a todo o momento sao preocupantes. Saiba como agir
                                    pela protecao ambiental
                                </p>
                                <ul>
                                    <li>- Compartilhe informacoes</li>
                                    <li>- Fiscalize</li>
                                    <li>- Cobre das autoridades</li>
                                    <li>- Participe de iniciativas de protecao ambiental</li>
                                </ul>
                                <p>
                                    <a
                                        href="https://www.greenpeace.org/brasil/blog/7-coisas-que-voce-pode-fazer-pelo-pantanal/">De os seus primeiros passos</a>
                                </p>
                            </div>
                            <div class="col-lg-6 order-1 order-lg-2 text-center">
                                <img src="assets/img/tabs3.jpg" alt="" class="img-fluid" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-4">
                        <div class="row">
                            <div class="col-lg-6 order-2 order-lg-1 mt-4 mt-lg-0">
                                <p>
                                    A resposta ao fogo pode ser abrupta. "Em anos de seca, a mortalidade pode chegar a 
                                    90% das arvores, principalmente na borda da floresta amazonica", diz um estudo cientifico 
                                    publicado recentemente, mencionando os impactos das queimadas.
									Com a alta mortalidade, a paisagem muda drasticamente e nessas condiçoes, 
									o fogo pode varrer do mapa a floresta densa que ja ocupou a area atingida.
									As queimadas podem deixar a floresta tao degradada que ela ja nao tem mais cara de floresta. 
									A invasao de gramineas e a perda da diversidade das especies nao permitem que a floresta volte 
									a ser densa – o que sao impactos irreversiveis nesse cenario de temperatura subindo e estacao de seca 
									mais prolongada.
									
									Ao lado o mapa de focos desses incendios no ano de 2020, somente em solo brasileiro. Podemos observar que
									a situacao esta fora de controle. Cabe a nos, ajudarmos e nos colocar na linha de frente,
                                </p>
                                <p>
                                    <a
                                        href="https://www.dw.com/pt-br/queimadas-na-amaz%C3%B4nia-podem-causar-danos-irrevers%C3%ADveis/a-50161460">Fonte da informacao</a>
                                </p>
                            </div>
                            <div class="col-lg-6 order-1 order-lg-2 text-center">
                                <img src="assets/img/focos_2020.png" alt="" class="img-fluid" />
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
                        <h4>Links uteis</h4>
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
    	const BASE_API_URL = 'https://9r7a896r4l.execute-api.sa-east-1.amazonaws.com/default/serverless-dev-hello';
        let labels = [];
        let data = [];
        let colors = [];
        const options = {
        		headers: {
        	          'Origin': "http://127.0.0.1:8080/",
        	          'Access-Control-Allow-Origin': '*',
        	          'method': 'GET',
        	        }
        };

        function handleError() {
            console.log('error when retrieving data from INPE API')

            document.getElementById('myChart').width = 0
            document.getElementById('myChart').height = 0
            document.getElementById('notFound').innerHTML = `<p>We do not found any data</p>`
        }

        window.addEventListener('fetch', () => console.log('fetched'))
        
        try {
            fetch(BASE_API_URL, options)
                .then(function (response) {
                	if (response.status !== 200) {
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