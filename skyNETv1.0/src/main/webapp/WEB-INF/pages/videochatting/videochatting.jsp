<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <script> 
    $(function(){
    	$( "#result" ).load( "https://apprtc.appspot.com" );
      $("#includedContent").load("https://apprtc.appspot.com"); 
    });
    </script>
  <style>
      
      body {
         background-color : black;
      }
      
      .well {
          background-color : black;
          
          
      }
      
      .container {
         padding : 3px;
         border : black;
         color : white;
      }

      .chat_log{ width: 95%; height: 200px; }
      .name{ width: 14%; }
      .message{ width: 70%; }
      .chat{ width: 10%; }
      .chating{width:100%;}

  </style>
</head>
<body>
  <br>
  
<div class="content-wrapper">
	<section class="content-header">
		<h1>&nbsp;</h1>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title"><b>비디오 채팅</b></h3>
					</div>
   
    <div class="col-sm-8">
    <!-- <div class="well" id="paintCanvas" style="height:630px; width:1160px;">
		<iframe style="height:100%; width:100%;" src="https://apprtc.appspot.com"></iframe>
      	<canvas id="canvas" width="730" height="445" ></canvas>
   </div> -->
     </div>
     </div>
         <div class="col-sm-12 well text-left">
             <!-- <textarea id="chatLog" style="color:#000000; width:100%;" class="chat_log" style="resize: none;" readonly></textarea>
             <form id="chat" class="chating">
              <input id="name" style="color:#000000;" class="name" type="text" readonly>
              <input id="message" style="color:#000000; " class="message" type="text">
              <input type="submit"  style="color:#000000; "class="chat" value="chat"/>
            </form>
          <div id="box" class="box"></div> -->
   		</div>
   </div>
   </div>
   </section>
    <!-- 소켓 사용해서 채팅하기 위한 스크립트 -->
    <script src="/socket.io/socket.io.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.1.js"></script>
    <script>
      var socket = io();
      $('#chat').on('submit', function(e){
        socket.emit('send message', $('#name').val(), $('#message').val());
        $('#message').val("");
        e.preventDefault();
      });
      socket.on('receive message', function(msg){
        $('#chatLog').append(msg+"\n");
        $('#chatLog').scrollTop($('#chatLog')[0].scrollHeight)
      });
      socket.on('change name', function(name){
        $('#name').val(name);
      });
    </script>


      </div>






</body>
</html>
