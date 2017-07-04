
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

    body {   margin : auto;  opacity : 1;
 		   background-image: url("${pageContext.request.contextPath}/resources/img/background3.jpg");
 		   background-repeat: no-repeat;  background-size: 100%; } 
   div {margin : 5px;}
   #box{ width: 1200px;  margin : auto; height: 1000px;text-align : center; padding-top: 350px;} 
   #titleLogo { margin : auto;  opacity:1;}
   .button {
               border: none;
               color: white;
               padding: 15px 32px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 16px;
               margin: auto;
               cursor: pointer;
               background-color: #e7e7e7;   
               border: 2px solid #ffffff;
            }

   .button:hover {
      background-color: white;
      color: black;
      border: 2px solid #e7e7e7;
   }
   img { padding-bottom : 20px;}
   
   .loginForm{margin :auto; width : 200px;}
   .form-control{ margin:10px; }
   
    #backimg{  height: 100%; background-color : black;
		    background-repeat: no-repeat;  background-size: 100%; opacity : 0.5; z-index: 1000;
		   
    } 
    
    #logogo { opacity : 1; z-index: 2000;}
    
    input:focus { background-color: black; color : white;}
    
    @media screen and (max-width: 512px){
       #box{
       width: 256px !important;
       padding-top: 0 !important;
       } 
    }
    
    @media screen and (min-width: 512px) and (max-width: 1024px){
       #box{
       width: 512px !important;
       padding-top: 0 !important;
       } 
    }
    
    @media screen and (min-width: 1024px) and (max-width: 1536px){
       #box{
       width: 1024px !important;
       padding-top: 200px !important;
       } 
    }
    
    @media screen and (min-width: 1536px) and (max-width: 2048px){
       #box{
       width: 1536px !important;
       padding-top: 250px !important;
       } 
    }
    
    @media screen and (min-width: 2048px){
       #box{
       width: 2048px !important;
       padding-top: 350px !important;
       } 
    }
    
   
</style>
</head>
<body>
<div id="backimg">

   <div id="box" class="titleLogo" >
      <div id="titleLogo">
         <img id="logogo" alt="메인로고" src="${pageContext.request.contextPath}/resources/img/titleLogo.png"/><br>
               <div class="loginForm">
               <form method="post">
               <input type="text" name="member_enum" class="form-control" placeholder="id">
               <input type="password" name="member_pass" class="form-control" placeholder="Password">
              <br>
         	<input type="submit" class="btn btn-primary" id="login" value="Log in"/> 
         </form><br><br><br><br>
<!--          <input type="button" class="btn btn-default" id="signup" value="sign up"/>   -->
         </div> 
      </div>
   </div>
   </div>
</body>
</html>