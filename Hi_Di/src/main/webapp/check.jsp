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
	String[][] check_list = {{"Q.��ħ�� ���� �󸶳� �Ǿ�����?", "24�ð� �̸�", "48�ð� �̸�"},{"Q.��ħ�� ���� �󸶳� �Ǿ�����?2", "24�ð� �̸�2", "48�ð� �̸�2"}};
	

%>
    <div id="root">


        <button type="button" id="modal_opne_btn">����</button>

    </div>
    
    <div id="modal">
       <script></script>
        <div class="modal_content">
            <h2>��ħ �ڰ�����</h2>
            
            <!-- action �±� �޾��ֱ� -->
            <form method="get" action="#"> 
                <p>Q.��ħ�� ���� �󸶳� �Ǿ�����?</p>
                <label><input type="radio" name="fruit" value="24�ð��̸�"> 24�ð� �̸�</label>
                <br>
                <label><input type="radio" name="fruit" value="48�ð��̸�"> 48�ð� �̸� </label>
                <p><input type="reset" value="�ʱ�ȭ"><input type="button" value="����"> </p>
              </form>
              
              <a href="#"><button type="button" id="modal_close_btn">�ݱ�</button></a> 
    
            
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