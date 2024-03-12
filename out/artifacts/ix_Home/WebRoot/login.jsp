<%@ page language="java" pageEncoding="GB18030"%>
 
 
<html>
<html lang="en">
	<head>
		<title>JSP for UserForm form</title>
	</head>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="css/login.css"/>
</head>
<body>
<div class="container right-panel-active">
    <!-- ×¢²á -->
    <div class="container_form container--signup">
        <form action="./register" method="get" class="form" id="form1">
            <h2 class="form_title">Sign Up</h2>
            <input type="text" placeholder="User" class="input" name="username"/>
            <input type="text" placeholder="password" class="input" name="password"/>
            <input type="text" placeholder="FamilyID" class="input" name="fid"/>
            <button class="btn">Sign Up</button>
        </form>
    </div>

    <!-- µÇÂ¼ -->
    <div class="container_form container--signin">
    	<form method="post" action="./login" class="form" id="form2">
            <h2 class="form_title">Sign In</h2>           
            <input type="text" placeholder="User" class="input" name="username"/><br/>
			<input type="password" placeholder="Password" class="input" name="password"/><br/>
			<a href="#" class="link" >Forget your password?</a>
			<!--input type="SUBMIT" name="submit" value="Submit"--> 
            <button class="btn">Sign In</button>
        </form>
    </div>

    <!--¸¡²ã  -->
    <div class="container_overlay">
        <div class="overlay">
            <div class="overlay_panel overlay--left">
                <button class="btn" id="signIn">Sign In</button>
            </div>
            <div class="overlay_panel overlay--right">
                <button class="btn" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
</div>

<!-- ±³¾° -->
<div class="slidershow">
    <div class="slidershow--image" style="background-image: url('images/login1.jpg')"></div>
    <div class="slidershow--image" style="background-image: url('images/login1.jpg')"></div>
    <div class="slidershow--image" style="background-image: url('images/login1.jpg')"></div>
    <div class="slidershow--image" style="background-image: url('images/login1.jpg')"></div>
</div>

<!-- partial -->
  <script src="js/login.js"></script>
</body>
</html>
