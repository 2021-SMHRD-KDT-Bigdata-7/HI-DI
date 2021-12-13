<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
    
<style>

        
    body{
     background: black;
         
         
            } 
            
    #root button{position: absolute; top:50%; left:50%; transform: translate(-50%, -50%);
        background: #bf18b2;
        font-weight: bold;
        display:inline-block;
        font-weight: 100%;
        
            }        
            
    #modal {
      display: none;    
      position:relative;
      width:100%;
      height:100%;
      z-index:1;
    }
    
    #modal h2 {
      margin:0;
        
    }
    
    #modal button {
      display:inline-block;
      width:100px;
        background: #bf18b2;
        font-weight: bold;
      margin-left:calc(100% - 100px - 10px);
    }
    
    #modal .modal_content {
      width:300px;
      margin:100px auto;
      padding:20px 10px;
      background: whitesmoke;
      border:2px solid #666;
    }
    
    #modal .modal_layer {
      position:fixed;
      top:0;
      left:0;
      width:100%;
      height:100%;
      background:rgba(0, 0, 0, 0.5);
      z-index:-1;
    }   
    </style>



<body>
<%
	String[][] check_list = {{"Q.기침을 한지 얼마나 되었나요?", "24시간 미만", "48시간 미만"},{"Q.기침을 한지 얼마나 되었나요?2", "24시간 미만2", "48시간 미만2"}};
	

%>
    <div id="root">


        <button type="button" id="modal_opne_btn">열기</button>

    </div>
    
    <div id="modal">
       <script></script>
        <div class="modal_content">
            <h2>기침 자가진단</h2>
            
            <!-- action 태그 달아주기 -->
            <form method="get" action="#"> 
                <p>Q.기침을 한지 얼마나 되었나요?</p>
                <label><input type="radio" name="fruit" value="24시간미만"> 24시간 미만</label>
                <br>
                <label><input type="radio" name="fruit" value="48시간미만"> 48시간 미만 </label>
                <p><input type="reset" value="초기화"><input type="button" value="다음"> </p>
              </form>
              
              <a href="#"><button type="button" id="modal_close_btn">닫기</button></a> 
    
            
        </div>
       
        <div class="modal_layer"></div>
    </div>
    <script language ="javascript">
        document.getElementById("modal_opne_btn").onclick = function() {
            document.getElementById("modal").style.display="block";
        }
       
        document.getElementById("modal_close_btn").onclick = function() {
            document.getElementById("modal").style.display="none";
        }   
    </script>    
	
	<script type="text/javascript" src="jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	
	
	</script>
    
</body>
</html>