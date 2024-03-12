<%@ page language="java" pageEncoding="GB18030"%>
 
<html>
<html lang="en">
	<head>
		<title>JSP for UserForm form</title>
	</head>


<head>
    <meta charset="UTF-8">
    <title>◊¢≤·µ«¬ºΩÁ√Ê¢Ò</title>
    <link rel="stylesheet" href="css/login.css"/>
</head>
<body>
	<script>
		$(function(){
    $("#login").click(function(){
        if($("#user").val()==""){
            $("#msg").text("«Î ‰»Î”√ªß√˚!");
            return false;
        }
        if($("#pass").val()==""){
            $("#msg").text("«Î ‰»Î√‹¬Î!");
            return false;
        }
        alert("µ«¬Ω≥…π¶!");
    })
})
	</script>
<div class="container right-panel-active">
    <!-- ◊¢≤· -->
    <div class="container_form container--signup">
        <form method="post" action="./register" class="form" id="form1" >
            <h2 class="form_title">Sign Up</h2>
            <p><span style="color:red;">Please enter something correct </span></p>
            <input type="text" placeholder="User" class="input" />
             <input type="text" placeholder="Password" class="input" />
            <input type="text" placeholder="FamilyID" class="input" />
           
            <button class="btn">Sign Up</button>
        </form>
        
    </div>

    <!-- µ«¬º -->
    <div class="container_form container--signin"id="msg" style="color:red;">&nbsp;
    	<form method="post" action="./login" class="form" id="form2">
            <h2 class="form_title">Sign In</h2>           
            <input type="text" placeholder="User" class="input" name="username"/><br/>
			<input type="text" placeholder="Password" class="input" name="password"/><br/>
			<!--input type="SUBMIT" name="submit" value="Submit"--> 
            <a href="#" class="link">Forgot your password?</a>
            <button class="btn">Sign In</button>
        </form>
    </div>

    <!-- ∏°≤„ -->
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

<!-- ±≥æ∞ -->
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
