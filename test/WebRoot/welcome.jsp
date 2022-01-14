<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Creative - Start Smart Home</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style type="text/css">
        	<style type="text/css">
			/*表格样式*/			
			table {
				width: 90%;
				background: #ccc;
				margin: 10px auto;
				border-collapse: collapse;/*border-collapse:collapse合并内外边距(去除表格单元格默认的2个像素内外边距*/	
			}				
			th,td {
				height: 25px;
				line-height: 25px;
				text-align: center;
				border: 1px solid #ccc;
			}		
			th {
				background: #eee;
				font-weight: normal;
			}		
			tr {
				background: #fff;
			}		
			tr:hover {
				background: #cc0;
			}		
			td a {
				color: #06f;
				text-decoration: none;
			}		
			td a:hover {
				color: #06f;
				text-decoration: underline;
			}
		</style>

    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#page-top">Smart Home</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                        <!--li class="nav-item"><a class="nav-link" href="#portfolio">Portfolio</a></li-->
                        <li class="nav-item"><a class="nav-link" href="#RoomCheck">RoomCheck</a></li>
                        <li class="nav-item"><a class="nav-link" href="#SecurityCheck">HomeSecurity</a></li>
                        <li class="nav-item"><a class="nav-link" href="#FunctionCheck">FunctionCheck</a></li>
                        <li class="nav-item"><a class="nav-link" href="#SmartControl">SmartControl</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <h1 class="text-white font-weight-bold">YOUR HOME.</h1>
                        <h1 class="text-white font-weight-bold">SIMPLIFIED.</h1>
<hr class="divider" />
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                        <p class="text-white-75 mb-5">An intelligent home always keep you in the know. Stay informed and in control of everything happening in and around your home -- whether you are in the kitchen or across the world.</p>
                        <a class="btn btn-primary btn-xl" href="#about">Find Out More</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- About-->
        <section class="page-section bg-primary" id="about">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="text-white mt-0">We've got what you need!</h2>
                        <hr class="divider divider-light" />
                        <p class="text-white-75 mb-4">Life gets busy but when your home technology is connected into one simple-to-use system, it helps take away some of those daily little stresses. A true smart home makes your life more convenient and your home safer, more comfortable, and easy to enjoy.
</p>
                        <a class="btn btn-light btn-xl" href="#services">Get Started!</a>
                    </div>
                </div>
            </div>
        </section>
         <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="assets/img/portfolio/thumbnails/1.jpg"alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Control</div>
                                <div class="project-name">Enjoy control like you have never experienced before.</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="assets/img/portfolio/fullsize/2.jpg" title="Project Name">
                            <img class="img-fluid" src="assets/img/portfolio/thumbnails/2.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Control</div>
                                <div class="project-name">It is modern, intuitive, and fun to use!</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="assets/img/portfolio/fullsize/3.jpg" title="Project Name">
                            <img class="img-fluid" src="assets/img/portfolio/thumbnails/3.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Control</div>
                                <div class="project-name">Smart Lighting from bright to brilliant.</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="assets/img/portfolio/fullsize/4.jpg" title="Project Name">
                            <img class="img-fluid" src="assets/img/portfolio/thumbnails/4.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Check</div>
                                <div class="project-name">Connect, Communicate, and Control like never before.</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="assets/img/portfolio/fullsize/5.jpg" title="Project Name">
                            <img class="img-fluid" src="assets/img/portfolio/thumbnails/5.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Check</div>
                                <div class="project-name">A push notification from your house just told you the kids are home safely.</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="assets/img/portfolio/fullsize/6.jpg" title="Project Name">
                            <img class="img-fluid" src="assets/img/portfolio/thumbnails/6.jpg" alt="..." />
                            <div class="portfolio-box-caption p-3">
                                <div class="project-category text-white-50">Check</div>
                                <div class="project-name">Keep your home, and the important things in it, safe and secure at all times. </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center mt-0">At Your Service</h2>
                <hr class="divider" />
                <div class="row gx-4 gx-lg-5">
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2">
                                <a href="#RoomCheck"><i class="bi-house fs-1 text-primary"></i></a>
                             </div>
                            <h3 class="h4 mb-2">Room Check&nbsp;</h3>
                            <p class="text-muted mb-0">A smart home operating system  connects virtually all of the technology in your home.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2">
                                <a href="#SecurityCheck"><i class="bi-exclamation-diamond fs-1 text-primary"></i></a>
                            </div>
                            <h3 class="h4 mb-2">&nbsp;Home Security</h3>
                            <p class="text-muted mb-0">Intelligent security solutions put peace of mind at your fingertips so you can trust that all is safe and sound.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2">
                                <a href="#FunctionCheck"><i class="bi-broadcast-pin fs-1 text-primary"></i></a>
                            </div>
                            <h3 class="h4 mb-2">Function Check</h3>
                            <p class="text-muted mb-0">Check the functional switching status of part of the device.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2">
                                <a href="#SmartControl"><i class="bi-lightbulb fs-1 text-primary"></i></a>
                            </div>
                            <h3 class="h4 mb-2">Smart&nbsp; Control</h3>
                            <p class="text-muted mb-0">Do not worry about leaving the lights on when you leave. You have a button that turns every one of them off, simultaneously.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
       
        
        <!-- Room Check-->
        <section class="page-section bg-dark" id="RoomCheck">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center text-light mt-0">Room Check</h2>
                 <hr class="divider divider-light" />
                <div class="row gx-4 gx-lg-5 justify-content-center">                     
                    <div class="col-lg-4 text-center">
                        <h2 class="text-white h4 mb-2">Doors&Windows</h2>
                        <hr class="divider divider-light" />
                       <p><img src="assets/img/img1.png"  width="100%"></p>
                         <p class="text-white-75 mb-4">Doors: <c:choose><c:when test="${requestScope.measureList[0].door}">open</c:when><c:otherwise>close</c:otherwise></c:choose> </p>
                       

                         <p class="text-white-75 mb-4">Windows:  <c:choose><c:when test="${requestScope.measureList[0].windows}">open</c:when><c:otherwise>close</c:otherwise></c:choose> </p>
                          <%System.out.println("close");%>
                    </div>
                    <div class="col-lg-4 text-center">
                         <h2 class="text-white h4 mb-2">Temperature&Humidity</h2>
                        
				
			
                        <hr class="divider divider-light" />
                       <p><img src="assets/img/img2.png"  width="100%"></p>
                         <p class="text-white-75 mb-4">Temperature:${requestScope.measureList[0].temperature}°C</p>
                          
                  
                         <p class="text-white-75 mb-4">Humidity:${requestScope.measureList[0].humidity}%</p>
                          
                    </div>
                    <div class="col-lg-4 text-center">
                        <h2 class="text-white h4 mb-2">Brightness of the room</h2>
                        <hr class="divider divider-light" />
                       <p><img src="assets/img/img3.png"  width="100%"></p>
                         <p class="text-white-75 mb-4">Brightness: ${requestScope.measureList[0].brightness}</p>
                         
                    </div>
                </div>
            </div>
        </section>

         <!-- SecurityCheck-->
        <section class="page-section bg-light" id="SecurityCheck">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center mt-0">Home Security</h2>
                <hr class="divider divider-primary" />
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-6 text-center">
                        <h2 class="text-dark h4 mb-2">Buzzer Alarm</h2>
                        <hr class="divider divider-light" />
                       <p><img src="assets/img/img4.png"  width="100%"></p>
                         <p class="text-dark-75 mb-4">Status:<c:choose><c:when test="${requestScope.measureList[0].buzzer}">open</c:when><c:otherwise>close</c:otherwise></c:choose> </p>
                    </div>
                    <div class="col-lg-6 text-center">
                         <h2 class="text-dark h4 mb-2">Theft Detection</h2>
                        <hr class="divider divider-light" />
                       <p><img src="assets/img/img5.png"  width="100%"></p>
                         <p class="text-dark-75 mb-3">Status:<c:choose><c:when test="${requestScope.measureList[0].theft}">open</c:when><c:otherwise>close</c:otherwise></c:choose> </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Function Check-->
        <section class="page-section bg-dark" id="FunctionCheck">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center text-light mt-0">Function Check</h2>
                <hr class="divider divider-light" />
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-6 text-center">
                        <h2 class="text-white h4 mb-2">Vibration Sensor</h2>
                        <hr class="divider divider-light" />
                       <p><img src="assets/img/img6.png"  width="100%"></p>
                         <p class="text-white-75 mb-4">Status: <c:choose><c:when test="${requestScope.measureList[0].vibration_sensor}">open</c:when><c:otherwise>close</c:otherwise></c:choose></p>
                    </div>
                    <div class="col-lg-6 text-center">
                         <h2 class="text-white h4 mb-2">Human Infrared</h2>
                        <hr class="divider divider-light" />
                       <p><img src="assets/img/img7.png"  width="100%"></p>
                         <p class="text-white-75 mb-4">Status: <c:choose><c:when test="${requestScope.measureList[0].human_infrared}">open</c:when><c:otherwise>close</c:otherwise></c:choose> </p>
                         
                    </div>
                </div>
            </div>
        </section>

         <!-- Smart Control-->
        <section class="page-section bg-light" id="SmartControl">
            <div class="container px-4 px-lg-5">                    
                <h2 class="text-center mt-0">Smart Control</h2>
                <hr class="divider divider-primary" />
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-6 text-center">
                        <h2 class="text-dark h4 mb-2">LED</h2>
                        <hr class="divider divider-primary" />
                       <p><img src="assets/img/img8.png"  width="100%"></p>
                       <a class="btn btn-primary btn-xl" href="#">Turn On</a>
                       <a class="btn btn-primary btn-xl" href="#">Turn Off</a>
                    </div>
                    <div class="col-lg-6 text-center">
                         <h2 class="text-dark h4 mb-2">SunShade Angle</h2>
                        <hr class="divider divider-primary" />
                       <p><img src="assets/img/img9.png"  width="100%"></p>
                         <a class="btn btn-primary btn-xl" href="#">Turn On</a>
                       <a class="btn btn-primary btn-xl" href="#">Turn Off</a>
         </section>
                  <section class="page-section bg-light">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-6 text-center">
                        <h2 class="text-dark h4 mb-2">Door</h2>
                        <hr class="divider divider-primary" />
                       <p><img src="assets/img/img11.png"  width="100%"></p>
                          <a class="btn btn-primary btn-xl" href="#">Open</a>
                       <a class="btn btn-primary btn-xl" href="#">Close</a>
                    </div>
                    <div class="col-lg-6 text-center">
                         <h2 class="text-dark h4 mb-2">Window</h2>
                        <hr class="divider divider-primary" />
                       <p><img src="assets/img/img10.png"  width="100%"></p>
                         <a class="btn btn-primary btn-xl" href="#">Open</a>
                       <a class="btn btn-primary btn-xl" href="#">Close</a>                         
                    </div>
                </div>
            </div>
        </section>





        
        <!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <h2 class="mt-0">Let's Get In Touch!</h2>
                        <hr class="divider" />
                        <p class="text-muted mb-5">Ready to start your next project with us? Send us a messages and we will get back to you as soon as possible!</p>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                    <div class="col-lg-6">
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- * * SB Forms Contact Form * *-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- This form is pre-integrated with SB Forms.-->
                        <!-- To make this form functional, sign up at-->
                        <!-- https://startbootstrap.com/solution/contact-forms-->
                        <!-- to get an API token!-->
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name">Full name</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                <label for="email">Email address</label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                            </div>
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                                <label for="phone">Phone number</label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                            </div>
                            <!-- Message input-->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                                <label for="message">Message</label>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div>
                            <!-- Submit success message-->
                            <!---->
                            <!-- This is what your users will see when the form-->
                            <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Form submission successful!</div>
                                    To activate this form, sign up at
                                    <br />
                                    <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                </div>
                            </div>
                            <!-- Submit error message-->
                            <!---->
                            <!-- This is what your users will see when there is-->
                            <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                            <!-- Submit Button-->
                            <div class="d-grid"><button class="btn btn-primary btn-xl disabled" id="submitButton" type="submit">Submit</button></div>
                        </form>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-4 text-center mb-5 mb-lg-0">
                        <i class="bi-phone fs-2 mb-3 text-muted"></i>
                        <div>+1 (555) 123-4567</div>
                    </div>
                </div>
            </div>
        </section>
      
        <div style="color:#FF1493;margin: 0 auto; width: 790px;">
        <h2>Historical state of smart home</h2>
        </div>
         <div style="color:#4B0091;margin: 0 auto; width: 790px;">
        <p>
        <p>
		<table border="1" >
		<thead>
			<tr>
				<th>temperature</th>
				<th>humidity</th>
				<th>brightness</th>
				<th>door</th>
				<th>windows</th>
				<th>buzzer</th>
				<th>theft</th>
				<th>vibration_sensor</th>
				<th>human_infrared</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${measureList }" var="measure">
				<tr>
					<td>${measure.temperature }°C</td>
					<td>${measure.humidity }%</td>
					<td>${measure.brightness }</td>
					<td><c:choose><c:when test="${measure.door}">open</c:when><c:otherwise>close</c:otherwise></c:choose></td>
					<td><c:choose><c:when test="${measure.windows}">open</c:when><c:otherwise>close</c:otherwise></c:choose></td>
					<td><c:choose><c:when test="${measure.buzzer}">open</c:when><c:otherwise>close</c:otherwise></c:choose></td>
					<td><c:choose><c:when test="${measure.theft}">open</c:when><c:otherwise>close</c:otherwise></c:choose></td>
					<td><c:choose><c:when test="${measure.vibration_sensor}">open</c:when><c:otherwise>close</c:otherwise></c:choose></td>
					<td><c:choose><c:when test="${measure.human_infrared}">open</c:when><c:otherwise>close</c:otherwise></c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		</div>
        <!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2021 - Group9</div></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- SimpleLightbox plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>