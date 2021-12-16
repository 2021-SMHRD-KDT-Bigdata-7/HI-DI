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
        
        /* div에서 ul태그로 상속 */
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

   <!-- 체크리스트 불러오기 -->
   <%
   //메소드 사용하기 위해 dao객체 생성
   DAO dao = new DAO();

   //연령을 받아오기 위한 객체생성
   MemberVO vo = (MemberVO) session.getAttribute("vo");

   LocalDate now = LocalDate.now(); // 현재 날짜
   int year = now.getYear(); // 연도만 가져옴

   int mb_age = Integer.parseInt(vo.getMb_birthdate().substring(0, 4)); // 사용자의 출생년도
   String check_age = Integer.toString((year - mb_age) / 10) + "0대"; //연령대 생성
   ArrayList<ChecklistVO> mb_checklist = dao.SelectCheckAge(check_age); //연령대에 맞는 체크리스트 생성

   //연령별 랜덤으로 체크리스트 출력을 위해 랜덤 수 생성
   Random rd = new Random();
   int num = rd.nextInt(mb_checklist.size() + 1);

   int check_seq = mb_checklist.get(num).getCheck_seq(); //랜덤 시퀀스
   String check_name = mb_checklist.get(num).getCheck_name(); //랜덤 질병명
   int check_std = mb_checklist.get(num).getCheck_std(); //랜덤 체크기준
   String dis_code = mb_checklist.get(num).getDis_code(); //랜덤 질병 코드
   String[] mb_arr = mb_checklist.get(num).getCheck_item().split("/"); //랜덤 체크리스트

   //질병 전체 데이터에서 질병명 중복없이 출력
   ArrayList<ChecklistVO> checklist = (ArrayList<ChecklistVO>) request.getAttribute("checklist");

   //질병 명, 질병 코드 중복없이 출력
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


   <!-- 메뉴(자가진단, 설문, 마이페이지) -->
   <nav
      class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
      id="ftco-navbar">
      <div class="container">
         <!-- 로고 hidi로 바꾸기 -->
         <a class="navbar-brand" href="main.jsp"><span>HI-DI</span></a>
         <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
            type="button" data-toggle="collapse" data-target="#ftco-nav"
            aria-controls="ftco-nav" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> 회원가입 <span class="oi oi-menu"></span>
            로그인
         </button>
         <!-- 상단 메뉴 -->
         <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav nav ml-auto">
               <li class="nav-item"><a href="SelectAllService"
                  class="nav-link"><span>자가진단</span></a></li>
               <li class="nav-item"><a href="disease.jsp" class="nav-link"><span>질병검색</span></a></li>
               <li class="nav-item"><a href="foodall.jsp" class="nav-link"><span>식품검색</span></a></li>
               <li class="nav-item"><a href="poll.jsp" class="nav-link"><span>설문</span></a></li>
               <li class="nav-item"><a href="statistics.jsp" class="nav-link"><span>질병통계</span></a></li>
               <li class="nav-item"><a href="mypage.jsp" class="nav-link"><span>마이페이지</span></a></li>
            </ul>
         </div>
      </div>
   </nav>

   <!-- 배너 -->
   <section class="hero-wrap hero-wrap-2"
      style="background-image: url('images/bg_4.jpg');"
      data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
         <div
            class="row no-gutters slider-text align-items-end justify-content-center">
            <div class="col-md-9 ftco-animate pb-5 text-center">

               <h1 class="mb-0 bread">
                  HI-DI로 자신의 건강정보를 <br> 체크해보자
               </h1>
            </div>
         </div>
      </div>
   </section>

   <div id="checklist_body">
      <div id="checklist1" class="open checklistMain">
         <div class="cl_word">
            <h3>데일리체크</h3>
         </div>
         <div class="cl_body">
            <div class="cl_b_menu">
               <section>
                  <a href="#" class="cl1_click"><p>데일리체크</p></a>
               </section>
               <section>
                  <a href="#" class="cl2_click"><p>자가진단</p></a>
               </section>
            </div>
            <div class="cl_b_content">
               <div>

                  <!-- 자가진단 서울대병원 -->
                  <!-- div 아이디, strong 아이디, ul 아이디 값 주고 value값 작성함 -->
                  <hr>
                   <div id="div1">
                       <h2 class="checktitle"> 일반적인 증상 </h2> <br> <br>
                       <ul class="sysmtom">
                           <li id="l1">불편감</li>
                           <li>얼굴 통증</li>
                           <li>인후통(목의통증)</li>
                           <li>변비</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>피로감</li>
                           <li>언어 장애</li>
                           <li>목쉼과 목소리 소실</li>
                           <li>흉통</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>체중감소 </a></li>
                           <li>건망증과 혼돈 </a></li>
                           <li><a
                               href="http://www.snuh.org/health/SelfDgs/chart/Ch47.do"> 기침
                           </a></li>
                           <li><a
                               href="http://www.snuh.org/health/SelfDgs/chart/Ch47.do"> 가슴
                                   두근거림 </a></li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>체중증가</li>
                           <li>우울증</li>
                           <li>가쁜 호흡</li>
                           <li>배뇨 조절 곤란</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>수면 장애</li>
                           <li>불안감</li>
                           <li>천명음</li>
                           <li>빈뇨</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>열</li>
                           <li>가려움증</li>
                           <li>삼키기 장애</li>
                           <li>배뇨통</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>과도한 땀 흘림</li>
                           <li>전반적인 피부문제</li>
                           <li>구토</li>
                           <li>요통</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>종괴</li>
                           <li>열이 있는 발진</li>
                           <li>재발성 구토</li>
                           <li>목의 통증 또는 경직</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>실신감과 기절</li>
                           <li>두발과 두피의 문제</li>
                           <li>복통</li>
                           <li>팔이나 손의 통증</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>두통</li>
                           <li>눈의 통증이나 자극</li>
                           <li>재발성 복통</li>
                           <li>다리의 통증</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>어지럼증</li>
                           <li>시력 장애 또는 소실</li>
                           <li>복부 팽만</li>
                           <li>관절통</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>감각이 없고 저린 증상</li>
                           <li>청력 장애 또는 소실</li>
                           <li>항문과 직장 문제</li>
                           <li>발목 종창</li>
                       </ul>
                       <br>
                       <ul class="sysmtom">
                           <li>경련과 떨림</li>
                           <li>귀의 통증</li>
                           <li>설사</li>
                           <li>없음</li>
                       </ul>
                   </div>
                   <hr style="float:left; width: 900px;">
                   <br><br>
                   <!-- 체크리스트 -->
                  <div id="div2">
                     <h2 class="checktitle"> 체크리스트 </h2>
                     <table>
                        <tr>
                           <th class="disname" align="center" colspan=""><%= check_name %></th>
                        </tr>
                        <tr style="font-size: x-small;">
                           <td class="checklist" align="right">질문</td>
                           <td class="checklist" align="center">예</td>
                           <td class="checklist" align="center">아니오</td>
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
                                   <button type="button" id="submit">결과보기</button>
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
            <h3>자가진단</h3>
         </div>
         <div class="cl_body">
            <div class="cl_b_menu">
               <section>
                  <a href="#" class="cl1_click"><p>데일리체크</p></a>
               </section>
               <section>
                  <a href="#" class="cl2_click"><p>자가진단</p></a>
               </section>
            </div>
            <div class="cl_b_content">
               <%
               for (int i = 0; i < disname.size(); i++) {
               %>
               <a href="checkAll.jsp?name=<%=disname.get(i)%>"><%=disname.get(i)%>
                  자가진단 </a> <br> <br>
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
         console.log('체크된 라디오 버튼 : ' + cnt);
         return cnt;      
      }
   
   
      let num = 0;
      $('#submit').on('click', function(){
         
         // 라디오 태그 전부 가져오기
         let radios = $('input[type="radio"]');
         if(radioChecked() >= <%=mb_arr.length%>){
            
            for(let i = 0; i < radios.length; i++){
               
               if($(radios[i]).prop('checked')){
                  console.log($(radios[i]).val());
                  num += Number($(radios[i]).val());
               }
               
            }
          //체크리스트 기준을 넘어 섰을 때 다른페이지로 이동
         if(num >= <%=check_std%>){
            // ajax 이용해서 저장해둔 num 값을 사용해줄 servlet으로 보내줌
            $.ajax({
               type: "post", // get / post 
               url:"checkResult.jsp",
               success : function(res){
                  // res : Servlet에서 돌려준 값
                  // 이 안에 처리할 로직
                  // page이동이 일어나는 경우
                  // window객체 사용 : window객체 --> 현채 창의 모든정보를 가짐
                  // window.location : 현재 페이지 주소
                  // window.location = 'test.jsp' 이런식으로 이동시킬 수 있음
                  window.location = 'checkResult.jsp?name=<%=check_name%>&seq=<%=check_seq%>&result=y';
               },
               error : function() {
                  alert('전송 실패');
               }               
            })
         }else{
            // ajax 이용해서 저장해둔 num 값을 사용해줄 servlet으로 보내줌
            $.ajax({
               type: "post", // get / post 
               url:"checkResult.jsp",
               success : function(res){
                  // res : Servlet에서 돌려준 값
                  // 이 안에 처리할 로직
                  // page이동이 일어나는 경우
                  // window객체 사용 : window객체 --> 현채 창의 모든정보를 가짐
                  // window.location : 현재 페이지 주소
                  // window.location = 'test.jsp' 이런식으로 이동시킬 수 있음
                  window.location = 'checkResult.jsp?name=<%= check_name %>&seq=<%= check_seq %>&result=n';
               },
               error : function() {
                  alert('전송 실패');
               }               
            })
         }
      }else{
         alert('모든 문항을 체크하세요.');
      }
      console.log(num);
         num = 0;
     });

   </script>


</body>
</html>