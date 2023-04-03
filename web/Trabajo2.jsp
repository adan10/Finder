
<html>
    <head>
        <title>Pagina de Empleo</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="assets/css/main_2.css" />
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <script>
       function cierra() {
                document.getElementById('myModal').style.display = "none";
            }



            function lol() {
                document.getElementById('myModal').style.display = "block";
            }
            
            function mostrarModal(titulo) {
  $("#modalTitle").html(titulo);
  $("#myModal").modal("show");
}
            </script>
            <style>
            #header {
		background: #1c1c1c;
		color: #d5d5d5;
		cursor: default;
		height: 5em;
		left: 0;
		line-height: 5em;
		position: fixed;
		text-align: right;
		top: 0;
		width: 100%;
		z-index: 10001;
	}

		#header .inner {
			max-width: 65em;
			width: calc(100% - 6em);
			margin: 0 auto;
			position: relative;
		}

			@media screen and (max-width: 480px) {

				#header .inner {
					max-width: 90%;
					width: 90%;
				}

			}

		#header .logo {
			font-family: 'Pacifico', cursive;
			display: inline-block;
			height: inherit;
			left: 0;
			line-height: inherit;
			margin: 0;
			padding: 0;
			position: absolute;
			top: 0;
			color: #e5474b;
			font-size: 1.75em;
			text-transform: none;
			font-weight: normal;
			padding: 0;
		}

			#header .logo:hover {
				color: rgba(229, 71, 75, 0.75);
			}

		#header a {
			-moz-transition: color 0.2s ease-in-out;
			-webkit-transition: color 0.2s ease-in-out;
			-ms-transition: color 0.2s ease-in-out;
			transition: color 0.2s ease-in-out;
			display: inline-block;
			padding: 0 2em;
			color: #ffffff;
			text-decoration: none;
			text-transform: uppercase;
			font-weight: 700;
			font-size: .85em;
		}

			#header a:hover {
				color: rgba(255, 255, 255, 0.75);
			}

			#header a:last-child {
				padding-right: 0em;
			}

			@media screen and (max-width: 736px) {

				#header a {
					padding: 0 0.5em;
				}

			}

	@media screen and (max-width: 480px) {

		#header {
			min-width: 320px;
		}

	}


            .buton{
                outline: 0;
                padding: 15px 16px;
                margin: 0px;
                border: 0px;
                color: white;
                background-color: transparent;
                font-size: 14px;
                font-family:Arial;



            }
            .buton:hover{
                background-color: #111;
                color: white;
            } .buton:active,.buton:focus {
                background-color: #3B0B0B;
                color:#FFF;
            }
            .active {
                background-color: #3B0B0B;
                color:#FFF;
            }
            .leftli {
                float: left;
            }

</style>
    <body>
<header id="header">
            <div class="inner">
                <a href="index.html" class="logo">FinderBliss</a>
                <nav id="nav">
                    <div class="message"> 
                        <button onclick="inicioSesion();" id="home"  class="buton active">Inicio</button>
                        <button onclick="regEmpleador();"  class="buton">Registro Empleador</button>
                        <button onclick="regSolicitante();" class="buton">Registro Solicitante</button>
                        <button onclick="contacto();" class="buton">Strom Industries</button>

                    </div>
                </nav>
                
            </div>


        </header>
        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Main -->
            <div id="main">
                <div class="inner">

                    <!-- Banner -->
                    <section id="banner">
                        <div class="content">
                            <header>
                                <h1>Esta es la pagina de empleo<br />
                                    </h1>
                                <p>Aqui puedes poner tu empleo</p>
                            </header>
                            <p>Ingresa aqui todas tus ofertas de empleo. Encuentra a tu empleado ideal!</p>
                            <ul class="actions">
                                <li><a href="#abc" class="button big">Trabajos ingresados</a></li><br/>
                                <li><a href="#123" class="button big">Ingresar un Trabajo</a></li>
                            </ul>
                        </div>
                        <span class="image object">
                            <img src="assets/images/fondotr.jpg" alt=""/>
                        </span>
                    </section>

                    
                    <!-- Section -->
                    <section id="abc">
                        <header class="major">
                            <h2>Publica los trabajos</h2>
                        </header>
                        <div class="posts">
                            <article>
                                <a href="#" class="image">
                                <img src="assets/images/google.jpg" alt=""/></a>
                                <h3>Trabaja en Google </h3>
                                <p>En este trabajo te ofrecemos facilidad en horario, necesitamos ingenieros en sistemas 
                                    <strong>Publicado 31/10/2017</strong> 
                               </p>
                                
                                <ul class="actions">
                                    <li><a href="#" class="button">Mas Infromacion</a></li>
                                     <div class="ec-stars-wrapper">
    <link href="assets/css/segunda_1.css" rel="stylesheet" type="text/css"/>
	
	</div>
                                </ul>
                            </article>
                            <article>
                                <a href="#" class="image">
                                    <img src="assets/images/uber.jpg" alt=""/>
                               </a>
                                <h3>Chofer en Uber</h3>
                                <p>En esta empresa te ofrecemos la oportunidad de crecer profecionalmente como chofer de alguno de nuests autos
                                    <strong>Publicada el 30/10/2017</strong>
                                </p>
                                <ul class="actions">
                                    <li><a href="#" class="button">Mas Informacion</a></li>
                                </ul>
                                   <div class="ec-stars-wrapper">
    <link href="assets/css/segunda_1.css" rel="stylesheet" type="text/css"/>
	
	</div>
                            </article>
                            <article>
                                <a href="#" class="image"> <img src="assets/images/imagenes.jpg" alt=""/></a>
                                <h3>Trabaja en un hotel</h3>
                                <p>Te ofrecemos la oportunidad de tener un trabajo en un hotel como recepcionista, maletero con opotunidad de crecer</p>
                                <ul class="actions">
                                    <li><a href="#" class="button">Mas informacion</a></li>
                                </ul>
                            </article>
                            <article>
                                <a href="#" class="image">
                                    <img src="assets/images/fondocool.jpg" alt=""/></a>
                                <h3>Trabajo de Contador</h3>
                                <p>Necesitamos contadores con experiencia de 3 años con un sueldo base de ....
                                    <strong>Publicado 31/10/2017</strong>
                                </p>
                                <ul class="actions">
                                    <li><a href="#" class="button">Más informacion</a></li>
                                </ul>
                                   <div class="ec-stars-wrapper">
    <link href="assets/css/segunda_1.css" rel="stylesheet" type="text/css"/>
	
	</div>
                            </article>
                            <article>
                                <a href="#" class="image"><img src="images/pic05.jpg" alt="" /></a>
                                <h3>Publica Aqui un Nuevo Trabajo</h3>
                                <p></p><ul class="actions">
                                    <li><a href="#" class="button">Publica</a></li>
                                </ul>
                            </article>
                            <article>
                                <a href="#" class="image"><img src="images/pic06.jpg" alt="" /></a>
                                <h3>Publica Un Nuevo Trabajo</h3>
                                <p></p>
                                <ul class="actions">
                                    <li><a href="#" class="button">Publica</a></li>
                                </ul>
                            </article>
                        </div>
                    </section>

                </div>
            </div>

      </body>
</html>