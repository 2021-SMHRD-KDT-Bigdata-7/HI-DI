<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Model.DAO"%>
<%@page import="Model.MemberVO"%>
<%@page import="Model.ChecklistVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Clyde - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
   href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
   rel="stylesheet">

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/style.css">
    <style>
        #div1 {
            width: 900px;
            padding-top: 50px;
            padding-bottom: 50px;
        }
    
        #div2 {
            width: 900px;
            padding-top: 50px;
            padding-bottom: 50px;
        }
        
        /* div���� ul�±׷� ��� */
        #div1> ul {
            list-style: none;
        }
        
        .checktitle {
            color: #81A3AA;
            font-size: 20px;
            margin-left: 30px;
        }

        table {
            margin-left: auto;
            margin-right: auto;
            width: 90%;
            border-top: 2px solid #81A3AA;
            border-bottom: 2px solid #81A3AA;
            border-collapse: collapse;
        }
        .disname, .checklist {
            border-top: 1px solid #81A3AA;
            border-bottom: 1px solid #81A3AA;
            border-left: 1px solid #81A3AA;
            padding: 10px;
        }
        
        .disname:first-child, .checklist:first-child {
            border-left: none;
        }

        
        .sysmtom > li {
            list-style-type: none;
            float: left;
            margin-left: 30px;
            width: 162px;
            list-style-type: disc;
        }
        
        a {
            color: black;
        }
        

    </style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
   data-offset="300">

   <!-- üũ����Ʈ �ҷ����� -->
   <%
   //�޼ҵ� ����ϱ� ���� dao��ü ����
   DAO dao = new DAO();

   //������ �޾ƿ��� ���� ��ü����
   MemberVO vo = (MemberVO) session.getAttribute("vo");

   LocalDate now = LocalDate.now(); // ���� ��¥
   int year = now.getYear(); // ������ ������

   int mb_age = Integer.parseInt(vo.getMb_birthdate().substring(0, 4)); // ������� ����⵵
   String check_age = Integer.toString((year - mb_age) / 10) + "0��"; //���ɴ� ����
   ArrayList<ChecklistVO> mb_checklist = dao.SelectCheckAge(check_age); //���ɴ뿡 �´� üũ����Ʈ ����

   //���ɺ� �������� üũ����Ʈ ����� ���� ���� �� ����
   Random rd = new Random();
   int num = rd.nextInt(mb_checklist.size() + 1);

   int check_seq = mb_checklist.get(num).getCheck_seq(); //���� ������
   String check_name = mb_checklist.get(num).getCheck_name(); //���� ������
   int check_std = mb_checklist.get(num).getCheck_std(); //���� üũ����
   String dis_code = mb_checklist.get(num).getDis_code(); //���� ���� �ڵ�
   String[] mb_arr = mb_checklist.get(num).getCheck_item().split("/"); //���� üũ����Ʈ

   //���� ��ü �����Ϳ��� ������ �ߺ����� ���
   ArrayList<ChecklistVO> checklist = (ArrayList<ChecklistVO>) request.getAttribute("checklist");

   //���� ��, ���� �ڵ� �ߺ����� ���
   ArrayList<String> name = new ArrayList<String>();
   ArrayList<String> disname = new ArrayList<String>();
   if (checklist != null) {
      for (int i = 0; i < checklist.size(); i++) {
         name.add(checklist.get(i).getCheck_name());
      }
   }
   HashSet<String> name2 = new HashSet<String>(name);
   disname = new ArrayList<String>(name2);
   %>


   <!-- �޴�(�ڰ�����, ����, ����������) -->
   <nav
      class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
      id="ftco-navbar">
      <div class="container">
         <!-- �ΰ� hidi�� �ٲٱ� -->
         <a class="navbar-brand" href="main.jsp"><span>HI-DI</span></a>
         <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
            type="button" data-toggle="collapse" data-target="#ftco-nav"
            aria-controls="ftco-nav" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> ȸ������ <span class="oi oi-menu"></span>
            �α���
         </button>
         <!-- ��� �޴� -->
         <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav nav ml-auto">
               <li class="nav-item"><a href="SelectAllService"
                  class="nav-link"><span>�ڰ�����</span></a></li>
               <li class="nav-item"><a href="disease.jsp" class="nav-link"><span>�����˻�</span></a></li>
               <li class="nav-item"><a href="foodall.jsp" class="nav-link"><span>��ǰ�˻�</span></a></li>
               <li class="nav-item"><a href="poll.jsp" class="nav-link"><span>����</span></a></li>
               <li class="nav-item"><a href="statistics.jsp" class="nav-link"><span>�������</span></a></li>
               <li class="nav-item"><a href="mypage.jsp" class="nav-link"><span>����������</span></a></li>
            </ul>
         </div>
      </div>
   </nav>

   <!-- ��� -->
   <section class="hero-wrap hero-wrap-2"
      style="background-image: url('images/bg_4.jpg');"
      data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
         <div
            class="row no-gutters slider-text align-items-end justify-content-center">
            <div class="col-md-9 ftco-animate pb-5 text-center">

               <h1 class="mb-0 bread">
                  HI-DI�� �ڽ��� �ǰ������� <br> üũ�غ���
               </h1>
            </div>
         </div>
      </div>
   </section>

   <div id="checklist_body">
      <div id="checklist1" class="open checklistMain">
         <div class="cl_word">
            <h3>���ϸ�üũ</h3>
         </div>
         <div class="cl_body">
            <div class="cl_b_menu">
               <section>
                  <a href="#" class="cl1_click"><p>���ϸ�üũ</p></a>
               </section>
               <section>
                  <a href="#" class="cl2_click"><p>�ڰ�����</p></a>
               </section>
            </div>
            <div class="cl_b_content">
               <div>

                  <!-- �ڰ����� ����뺴�� -->
                  <!-- div ���̵�, strong ���̵�, ul ���̵� �� �ְ� value�� �ۼ��� -->
                  <hr>
                   <div id="div1">
                       <h2 class="checktitle"> �Ϲ����� ���� </h2> <br> <br>
                       <ul class="sysmtom">
                           <li id="l1">����</li>
                           <li>�� ����</li>
                           <li>������(��������)</li>
                           <li>����</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>�Ƿΰ�</li>
                           <li>��� ���</li>
                           <li>�񽰰� ��Ҹ� �ҽ�</li>
                           <li>����</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>ü�߰��� </a></li>
                           <li>�Ǹ����� ȥ�� </a></li>
                           <li><a
                               href="http://www.snuh.org/health/SelfDgs/chart/Ch47.do"> ��ħ
                           </a></li>
                           <li><a
                               href="http://www.snuh.org/health/SelfDgs/chart/Ch47.do"> ����
                                   �αٰŸ� </a></li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>ü������</li>
                           <li>�����</li>
                           <li>���� ȣ��</li>
                           <li>�财 ���� ���</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>���� ���</li>
                           <li>�ҾȰ�</li>
                           <li>õ����</li>
                           <li>��</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>��</li>
                           <li>��������</li>
                           <li>��Ű�� ���</li>
                           <li>�财��</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>������ �� �긲</li>
                           <li>�������� �Ǻι���</li>
                           <li>����</li>
                           <li>����</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>����</li>
                           <li>���� �ִ� ����</li>
                           <li>��߼� ����</li>
                           <li>���� ���� �Ǵ� ����</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>�ǽŰ��� ����</li>
                           <li>�ι߰� ������ ����</li>
                           <li>����</li>
                           <li>���̳� ���� ����</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>����</li>
                           <li>���� �����̳� �ڱ�</li>
                           <li>��߼� ����</li>
                           <li>�ٸ��� ����</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>��������</li>
                           <li>�÷� ��� �Ǵ� �ҽ�</li>
                           <li>���� �ظ�</li>
                           <li>������</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>������ ���� ���� ����</li>
                           <li>û�� ��� �Ǵ� �ҽ�</li>
                           <li>�׹��� ���� ����</li>
                           <li>�߸� ��â</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>��ð� ����</li>
                           <li>���� ����</li>
                           <li>����</li>
                           <li>����</li>
                       </ul>
                   </div>
                   <hr style="float:left; width: 900px;">
                   <br><br>
                   <!-- üũ����Ʈ -->
                  <div id="div2">
                     <h2 class="checktitle"> üũ����Ʈ </h2>
                     <table>
                        <tr>
                           <th class="disname" align="center" colspan=""><%= check_name %></th>
                        </tr>
                        <tr style="font-size: x-small;">
                           <td class="checklist" align="right">����</td>
                           <td class="checklist" align="center">��</td>
                           <td class="checklist" align="center">�ƴϿ�</td>
                        </tr>
                        <%for(int j=0; j<mb_arr.length; j++){ %>
                        <tr>
                           <td class="checklist"><%= mb_arr[j]%></td>
                           <td class="checklist" align="center"><input type="radio" name="<%= "no"+j %>" value="1">
                           </td>
                           <td class="checklist" align="center"><input type="radio" name="<%= "no"+j %>" value="0">
                           </td>
   
                        </tr>
                        <%} %>
                        <tr>
                           <td colspan="3" align="center">
                                   <button type="button" id="submit">�������</button>
                               </td>
                        </tr>
                     </table>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div id="checklist2" class="checklistMain">
         <div class="cl_word">
            <h3>�ڰ�����</h3>
         </div>
         <div class="cl_body">
            <div class="cl_b_menu">
               <section>
                  <a href="#" class="cl1_click"><p>���ϸ�üũ</p></a>
               </section>
               <section>
                  <a href="#" class="cl2_click"><p>�ڰ�����</p></a>
               </section>
            </div>
            <div class="cl_b_content">
               <%
               for (int i = 0; i < disname.size(); i++) {
               %>
               <a href="checkAll.jsp?name=<%=disname.get(i)%>"><%=disname.get(i)%>
                  �ڰ����� </a> <br> <br>
               <%
               }
               %>
            </div>
         </div>
      </div>
   </div>
   </div>

   <footer class="ftco-footer ftco-section">
      <div class="container">
         <div class="row mb-5">
            <div class="col-md">
               <div class="ftco-footer-widget mb-4">
                  <h2 class="ftco-heading-2">Lets talk about</h2>
                  <p>Far far away, behind the word mountains, far from the
                     countries Vokalia and Consonantia, there live the blind texts.</p>
                  <p>
                     <a href="#" class="btn btn-primary">Learn more</a>
                  </p>
               </div>
            </div>
            <div class="col-md">
               <div class="ftco-footer-widget mb-4 ml-md-4">
                  <h2 class="ftco-heading-2">Links</h2>
                  <ul class="list-unstyled">
                     <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Home</a></li>
                     <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>About</a></li>
                     <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Services</a></li>
                     <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Projects</a></li>
                     <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Contact</a></li>
                  </ul>
               </div>
            </div>
            <div class="col-md">
               <div class="ftco-footer-widget mb-4">
                  <h2 class="ftco-heading-2">Services</h2>
                  <ul class="list-unstyled">
                     <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Web
                           Design</a></li>
                     <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Web
                           Development</a></li>
                     <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Business
                           Strategy</a></li>
                     <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Data
                           Analysis</a></li>
                     <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Graphic
                           Design</a></li>
                  </ul>
               </div>
            </div>
            <div class="col-md">
               <div class="ftco-footer-widget mb-4">
                  <h2 class="ftco-heading-2">Have a Questions?</h2>
                  <div class="block-23 mb-3">
                     <ul>
                        <li><span class="icon fa fa-map marker"></span><span
                           class="text">203 Fake St. Mountain View, San Francisco,
                              California, USA</span></li>
                        <li><a href="#"><span class="icon fa fa-phone"></span><span
                              class="text">+2 392 3929 210</span></a></li>
                        <li><a href="#"><span
                              class="icon fa fa-paper-plane pr-4"></span><span class="text">info@yourdomain.com</span></a></li>
                     </ul>
                  </div>
                  <ul class="ftco-footer-social list-unstyled mt-2">
                     <li class="ftco-animate"><a href="#"><span
                           class="fa fa-twitter"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="fa fa-facebook"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="fa fa-instagram"></span></a></li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12 text-center">

               <p>
                  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                  Copyright &copy;
                  <script>
                     document.write(new Date().getFullYear());
                  </script>
                  All rights reserved | This template is made with <i
                     class="fa fa-heart" aria-hidden="true"></i> by <a
                     href="https://colorlib.com" target="_blank">Colorlib</a>
                  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
               </p>
            </div>
         </div>
      </div>
   </footer>


   <!-- loader -->
   <div id="ftco-loader" class="show fullscreen">
      <svg class="circular" width="48px" height="48px">
         <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
            stroke-width="4" stroke="#eeeeee" />
         <circle class="path" cx="24" cy="24" r="22" fill="none"
            stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
      </svg>
   </div>

   <script src="js/jquery.min.js"></script>
   <script src="js/jquery-migrate-3.0.1.min.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/jquery.easing.1.3.js"></script>
   <script src="js/jquery.waypoints.min.js"></script>
   <script src="js/jquery.stellar.min.js"></script>
   <script src="js/owl.carousel.min.js"></script>
   <script src="js/jquery.magnific-popup.min.js"></script>
   <script src="js/jquery.animateNumber.min.js"></script>
   <script src="js/scrollax.min.js"></script>
   <script src="js/js_main.js"></script>
   <script src="js/script.js"></script>
   <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
   <script type="text/javascript">      
      let radioChecked = function(){
         let cnt = 0;
         
         let radios = $('input[type="radio"]');
         
         for(let i = 0; i < radios.length; i++){
            if($(radios[i]).prop('checked')){
               cnt++;
            }
         }
         console.log('üũ�� ���� ��ư : ' + cnt);
         return cnt;      
      }
   
   
      let num = 0;
      $('#submit').on('click', function(){
         
         // ���� �±� ���� ��������
         let radios = $('input[type="radio"]');
         if(radioChecked() >= <%=mb_arr.length%>){
            
            for(let i = 0; i < radios.length; i++){
               
               if($(radios[i]).prop('checked')){
                  console.log($(radios[i]).val());
                  num += Number($(radios[i]).val());
               }
               
            }
          //üũ����Ʈ ������ �Ѿ� ���� �� �ٸ��������� �̵�
         if(num >= <%=check_std%>){
            // ajax �̿��ؼ� �����ص� num ���� ������� servlet���� ������
            $.ajax({
               type: "post", // get / post 
               url:"checkResult.jsp",
               success : function(res){
                  // res : Servlet���� ������ ��
                  // �� �ȿ� ó���� ����
                  // page�̵��� �Ͼ�� ���
                  // window��ü ��� : window��ü --> ��ä â�� ��������� ����
                  // window.location : ���� ������ �ּ�
                  // window.location = 'test.jsp' �̷������� �̵���ų �� ����
                  window.location = 'checkResult.jsp?name=<%=check_name%>&seq=<%=check_seq%>&result=y';
               },
               error : function() {
                  alert('���� ����');
               }               
            })
         }else{
            // ajax �̿��ؼ� �����ص� num ���� ������� servlet���� ������
            $.ajax({
               type: "post", // get / post 
               url:"checkResult.jsp",
               success : function(res){
                  // res : Servlet���� ������ ��
                  // �� �ȿ� ó���� ����
                  // page�̵��� �Ͼ�� ���
                  // window��ü ��� : window��ü --> ��ä â�� ��������� ����
                  // window.location : ���� ������ �ּ�
                  // window.location = 'test.jsp' �̷������� �̵���ų �� ����
                  window.location = 'checkResult.jsp?name=<%= check_name %>&seq=<%= check_seq %>&result=n';
               },
               error : function() {
                  alert('���� ����');
               }               
            })
         }
      }else{
         alert('��� ������ üũ�ϼ���.');
      }
      console.log(num);
         num = 0;
     });

   </script>


</body>
</html>