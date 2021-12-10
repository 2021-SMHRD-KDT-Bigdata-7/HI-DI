<%@page import="Model.DAO"%>
<%@page import="Model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hi-Di</title>
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
<link rel="stylesheet" href="css/slide.css">
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
   data-offset="300">

   <!-- MemberVO, DAO 객체생성(진기현) -->
   <%
   //mebervo객체 생성
   MemberVO vo = (MemberVO) session.getAttribute("vo");

   //DAO객체 생성
   DAO dao = new DAO();
   %>


   <ul id="login">
      <%
      if (vo == null) {
      %>
      <li><a href="join.jsp">회원가입</a></li>
      <li><a href="login.jsp">로그인</a></li>
      <%
      } else {
      %>
      <li><a href="LogoutService">로그아웃</a></li>
      <li><a href="mypage.jsp">마이페이지</a></li>
      <%
      }
      %>
   </ul>

   <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
      id="ftco-navbar">
      <div class="container">
         <a class="navbar-brand" href="index.html"><span>HI-DI</span></a>
         <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
            type="button" data-toggle="collapse" data-target="#ftco-nav"
            aria-controls="ftco-nav" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
         </button>

         <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav nav ml-auto">
               <li class="nav-item"><a href="test.jsp" class="nav-link"><span>자가진단</span></a></li>
               <li class="nav-item"><a href="#" class="nav-link"><span>질병검색</span></a></li>
               <li class="nav-item"><a href="#" class="nav-link"><span>식품검색</span></a></li>
               <li class="nav-item"><a href="#" class="nav-link"><span>설문</span></a></li>
               <li class="nav-item"><a href="#" class="nav-link"><span>질병통계</span></a></li>
               <li class="nav-item"><a href="#" class="nav-link"><span>마이
                        페이지</span></a></li>
            </ul>
         </div>
      </div>
   </nav>
   <div id="home-section">
      <div class="gallery">
         <div class="gallery-container">
            <a href="#"><img class="gallery-item gallery-item-1"
               src="http://fakeimg.pl/300/?text=1" data-index="1"></a> <a
               href="#"><img class="gallery-item gallery-item-2"
               src="http://fakeimg.pl/300/?text=2" data-index="2"></a> <a
               href="checklist.jsp"><img class="gallery-item gallery-item-3"
               src="images/bg_1.jpg" data-index="3"></a> <a href="#"><img
               class="gallery-item gallery-item-4"
               src="http://fakeimg.pl/300/?text=4" data-index="4"></a> <a
               href="#"><img class="gallery-item gallery-item-5"
               src="http://fakeimg.pl/300/?text=5" data-index="5"></a>
         </div>
         <div class="gallery-controls"></div>
      </div>
   </div>

   <section class="ftco-counter img bg-light" id="section-counter">
      <div class="container">
         <div class="row">
            <div
               class="col-md-3 justify-content-center counter-wrap ftco-animate">
               <div class="block-18 d-flex">
                  <div class="icon d-flex justify-content-center align-items-center">
                     <span class="flaticon-suitcase"></span>
                  </div>
                  <div class="text">
                     <strong class="number" data-number="750">0</strong> <span>Covid
                        19</span>
                  </div>
               </div>
            </div>
            <div
               class="col-md-3 justify-content-center counter-wrap ftco-animate">
               <div class="block-18 d-flex">
                  <div class="icon d-flex justify-content-center align-items-center">
                     <span class="flaticon-loyalty"></span>
                  </div>
                  <div class="text">
                     <strong class="number" data-number="568">0</strong> <span>확진자
                        수</span>
                  </div>
               </div>
            </div>
            <div
               class="col-md-3 justify-content-center counter-wrap ftco-animate">
               <div class="block-18 d-flex">
                  <div class="icon d-flex justify-content-center align-items-center">
                     <span class="flaticon-coffee"></span>
                  </div>
                  <div class="text">
                     <strong class="number" data-number="478">0</strong> <span>사망자
                        수</span>
                  </div>
               </div>
            </div>
            <div
               class="col-md-3 justify-content-center counter-wrap ftco-animate">
               <div class="block-18 d-flex">
                  <div class="icon d-flex justify-content-center align-items-center">
                     <span class="flaticon-calendar"></span>
                  </div>
                  <div class="text">
                     <strong class="number" data-number="780">0</strong> <span>고혈압</span>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>

   <section class="ftco-about ftco-section ftco-no-pt ftco-no-pb"
      id="about-section">
      <div class="container">
         <div class="row d-flex no-gutters">
            <div class="col-md-6 col-lg-5 d-flex">
               <div class="img-about img d-flex align-items-stretch">
                  <div class="overlay"></div>
                  <div class="img d-flex align-self-stretch align-items-center"
                     style="background-image: url(images/about-1.jpg);"></div>
               </div>
            </div>

         </div>
      </div>
   </section>

   <section class="ftco-section" id="services-section">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-12 heading-section text-center ftco-animate mb-5">
               <span class="subheading"></span>
               <h2 class="mb-4">건강 & 식품</h2>
               <a href = "#"><p>건강 기능 식품</p></a><a href = "#"><p> 식품 </p></a>
            </div>
         </div>
         <!-- a태그, 이미지 달아줌 성수 -->
         <div class="row">
            <div class="col-md-6 col-lg-3">
               <div
                  class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate">
                  <div class="icon d-flex align-items-center justify-content-center">
                     <span class="flaticon-3d-design"></span>
                  </div>
                  <a href="#">
                     <div class="media-body">
                       <img src ="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDAyMjhfMTA2%2FMDAxNTgyODIxODE0NjA2.8yPG1OZW2nyPeaEkebVbUfuSF1SGdhxc-MafoB1jGUcg.UxR9uVmPHAnJ0fZDQSB6RKylGuXXJDVMIX5LhYqDO_kg.JPEG.htyj%2FSAM_9465.JPG&type=a340">
                     </div>
                  </a>
               </div>
            </div>
            <div class="col-md-6 col-lg-3">
               <div
                  class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate">
                  <div
                     class="icon shadow d-flex align-items-center justify-content-center">
                     <span class="flaticon-app-development"></span>
                  </div>
                  <a href="#">
                     <div class="media-body">
                        <img src = "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAxMjdfMjE3%2FMDAxNjExNzEyNDY0MDIx.qBokE2Xg_yLLyZgaufFy54sXPyipuqVyU9-Sytnp0gog.Tem8vNv1OLv_dBfWsJhhKx_rYJyeVbP3cQl9fi_48ZQg.JPEG.yooree890%2FIMG_0243.jpg&type=a340">
                     </div>
                  </a>
               </div>
            </div>
            <div class="col-md-6 col-lg-3">
               <div
                  class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate">
                  <div
                     class="icon shadow d-flex align-items-center justify-content-center">
                     <span class="flaticon-web-programming"></span>
                  </div>
                  <a href="#">
                     <div class="media-body">
                        <img src = "#">
                     </div>
                  </a>
               </div>
            </div>
            <div class="col-md-6 col-lg-3">
               <div
                  class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate">
                  <div
                     class="icon shadow d-flex align-items-center justify-content-center">
                     <span class="flaticon-branding"></span>
                  </div>
                  <a href="#">
                     <div class="media-body">
                        <img src = "#">
                     </div>
                  </a>
               </div>
            </div>
         </div>

         <div class="row">
            <div class="col-md-6 col-lg-3">
               <div
                  class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate">
                  <div
                     class="icon shadow d-flex align-items-center justify-content-center">
                     <span class="flaticon-computer"></span>
                  </div>
                  <a href="#">
                     <div class="media-body">
                        <img src = "#">
                     </div>
                  </a>
               </div>
            </div>
            <div class="col-md-6 col-lg-3">
               <div
                  class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate">
                  <div
                     class="icon shadow d-flex align-items-center justify-content-center">
                     <span class="flaticon-vector"></span>
                  </div>
                  <a href="#">
                     <div class="media-body">
                        <img src = "#">
                     </div>
                  </a>
               </div>
            </div>
            <div class="col-md-6 col-lg-3">
               <div
                  class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate">
                  <div
                     class="icon shadow d-flex align-items-center justify-content-center">
                     <span class="flaticon-vector"></span>
                  </div>
                  <a href="#">
                     <div class="media-body">
                        <img src = "#">
                     </div>
                  </a>
               </div>
            </div>
            <div class="col-md-6 col-lg-3">
               <div
                  class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate">
                  <div
                     class="icon shadow d-flex align-items-center justify-content-center">
                     <span class="flaticon-zoom"></span>
                  </div>
                  <a href="#">
                     <div class="media-body">
                        <img src = "#">
                     </div>
                  </a>
               </div>
            </div>
         </div>
      </div>
   </section>

   <section class="ftco-hireme">
      <div class="container">
         <div class="row justify-content-between">
            <div class="col-md-8 col-lg-8 d-flex align-items-center">
               <div class="w-100 py-4">
                  <h2>Have a project on your mind.</h2>
                  <p>A small river named Duden flows by their place and supplies
                     it with the necessary regelialia. It is a paradisematic country,
                     in which roasted parts of sentences fly.</p>
                  <p class="mb-0">
                     <a href="#" class="btn btn-white py-3 px-4">Contact me</a>
                  </p>
               </div>
            </div>
            <div class="col-md-4 col-lg-4 d-flex align-items-end">
               <img src="images/author.png" class="img-fluid" alt="">
            </div>
         </div>
      </div>
   </section>

   <section class="ftco-section ftco-project" id="projects-section">
      <div class="container-fluid px-md-4">
         <div class="row justify-content-center pb-5">
            <div class="col-md-12 heading-section text-center ftco-animate">
               <span class="subheading">Accomplishments</span>
               <h2 class="mb-4">Our Projects</h2>
               <p>Far far away, behind the word mountains, far from the
                  countries Vokalia and Consonantia</p>
            </div>
         </div>
         <div class="row">
            <div class="col-md-3">
               <div
                  class="project img shadow ftco-animate d-flex justify-content-center align-items-center"
                  style="background-image: url(images/work-1.jpg);">
                  <div class="overlay"></div>
                  <div class="text text-center p-4">
                     <h3>
                        <a href="#">Branding &amp; Illustration Design</a>
                     </h3>
                     <span>Web Design</span>
                  </div>
               </div>
            </div>
            <div class="col-md-3">
               <div
                  class="project img shadow ftco-animate d-flex justify-content-center align-items-center"
                  style="background-image: url(images/work-2.jpg);">
                  <div class="overlay"></div>
                  <div class="text text-center p-4">
                     <h3>
                        <a href="#">Branding &amp; Illustration Design</a>
                     </h3>
                     <span>Web Design</span>
                  </div>
               </div>
            </div>
            <div class="col-md-3">
               <div
                  class="project img shadow ftco-animate d-flex justify-content-center align-items-center"
                  style="background-image: url(images/work-3.jpg);">
                  <div class="overlay"></div>
                  <div class="text text-center p-4">
                     <h3>
                        <a href="#">Branding &amp; Illustration Design</a>
                     </h3>
                     <span>Web Design</span>
                  </div>
               </div>
            </div>
            <div class="col-md-3">
               <div
                  class="project img shadow ftco-animate d-flex justify-content-center align-items-center"
                  style="background-image: url(images/work-4.jpg);">
                  <div class="overlay"></div>
                  <div class="text text-center p-4">
                     <h3>
                        <a href="#">Branding &amp; Illustration Design</a>
                     </h3>
                     <span>Web Design</span>
                  </div>
               </div>
            </div>
            <div class="col-md-3">
               <div
                  class="project img shadow ftco-animate d-flex justify-content-center align-items-center"
                  style="background-image: url(images/work-5.jpg);">
                  <div class="overlay"></div>
                  <div class="text text-center p-4">
                     <h3>
                        <a href="#">Branding &amp; Illustration Design</a>
                     </h3>
                     <span>Web Design</span>
                  </div>
               </div>
            </div>
            <div class="col-md-3">
               <div
                  class="project img shadow ftco-animate d-flex justify-content-center align-items-center"
                  style="background-image: url(images/work-6.jpg);">
                  <div class="overlay"></div>
                  <div class="text text-center p-4">
                     <h3>
                        <a href="#">Branding &amp; Illustration Design</a>
                     </h3>
                     <span>Web Design</span>
                  </div>
               </div>
            </div>
            <div class="col-md-3">
               <div
                  class="project img shadow ftco-animate d-flex justify-content-center align-items-center"
                  style="background-image: url(images/work-7.jpg);">
                  <div class="overlay"></div>
                  <div class="text text-center p-4">
                     <h3>
                        <a href="#">Branding &amp; Illustration Design</a>
                     </h3>
                     <span>Web Design</span>
                  </div>
               </div>
            </div>
            <div class="col-md-3">
               <div
                  class="project img shadow ftco-animate d-flex justify-content-center align-items-center"
                  style="background-image: url(images/work-8.jpg);">
                  <div class="overlay"></div>
                  <div class="text text-center p-4">
                     <h3>
                        <a href="#">Branding &amp; Illustration Design</a>
                     </h3>
                     <span>Web Design</span>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>

   <!-- <section class="ftco-section testimony-section bg-primary">
      <div class="container">
         <div class="row justify-content-center pb-5">
            <div class="col-md-12 heading-section heading-section-white text-center ftco-animate">
               <span class="subheading">Testimonies</span>
               <h2 class="mb-4">What client says about?</h2>
               <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
            </div>
         </div>
         <div class="row ftco-animate">
            <div class="col-md-12">
               <div class="carousel-testimony owl-carousel">
                  <div class="item">
                     <div class="testimony-wrap py-4">
                        <div class="text">
                           <span class="fa fa-quote-left"></span>
                           <p class="mb-4 pl-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                           <div class="d-flex align-items-center">
                              <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                              <div class="pl-3">
                                 <p class="name">Roger Scott</p>
                                 <span class="position">Marketing Manager</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="item">
                     <div class="testimony-wrap py-4">
                        <div class="text">
                           <span class="fa fa-quote-left"></span>
                           <p class="mb-4 pl-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                           <div class="d-flex align-items-center">
                              <div class="user-img" style="background-image: url(images/person_2.jpg)"></div>
                              <div class="pl-3">
                                 <p class="name">Roger Scott</p>
                                 <span class="position">Marketing Manager</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="item">
                     <div class="testimony-wrap py-4">
                        <div class="text">
                           <span class="fa fa-quote-left"></span>
                           <p class="mb-4 pl-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                           <div class="d-flex align-items-center">
                              <div class="user-img" style="background-image: url(images/person_3.jpg)"></div>
                              <div class="pl-3">
                                 <p class="name">Roger Scott</p>
                                 <span class="position">Marketing Manager</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="item">
                     <div class="testimony-wrap py-4">
                        <div class="text">
                           <span class="fa fa-quote-left"></span>
                           <p class="mb-4 pl-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                           <div class="d-flex align-items-center">
                              <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                              <div class="pl-3">
                                 <p class="name">Roger Scott</p>
                                 <span class="position">Marketing Manager</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="item">
                     <div class="testimony-wrap py-4">
                        <div class="text">
                           <span class="fa fa-quote-left"></span>
                           <p class="mb-4 pl-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                           <div class="d-flex align-items-center">
                              <div class="user-img" style="background-image: url(images/person_2.jpg)"></div>
                              <div class="pl-3">
                                 <p class="name">Roger Scott</p>
                                 <span class="position">Marketing Manager</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section> -->


   <section class="ftco-section bg-light" id="blog-section">
      <div class="container">
         <div class="row justify-content-center mb-5 pb-5">
            <div class="col-md-7 heading-section text-center ftco-animate">
               <span class="subheading">Blog</span>
               <h2 class="mb-4">Our Blog</h2>
               <p>Far far away, behind the word mountains, far from the
                  countries Vokalia and Consonantia</p>
            </div>
         </div>
         <div class="row d-flex">
            <div class="col-md-4 d-flex ftco-animate">
               <div class="blog-entry justify-content-end">
                  <a href="single.html" class="block-20"
                     style="background-image: url('images/image_1.jpg');"> </a>
                  <div class="text mt-3 float-right d-block">
                     <div class="d-flex align-items-center mb-3 meta">
                        <p class="mb-0">
                           <span class="mr-2">July 03, 2020</span> <a href="#"
                              class="mr-2">Admin</a> <a href="#" class="meta-chat"><span
                              class="icon-chat"></span> 3</a>
                        </p>
                     </div>
                     <h3 class="heading">
                        <a href="single.html">Why Lead Generation is Key for
                           Business Growth</a>
                     </h3>
                     <p>A small river named Duden flows by their place and
                        supplies it with the necessary regelialia.</p>
                  </div>
               </div>
            </div>
            <div class="col-md-4 d-flex ftco-animate">
               <div class="blog-entry justify-content-end">
                  <a href="single.html" class="block-20"
                     style="background-image: url('images/image_2.jpg');"> </a>
                  <div class="text mt-3 float-right d-block">
                     <div class="d-flex align-items-center mb-3 meta">
                        <p class="mb-0">
                           <span class="mr-2">July 03, 2020</span> <a href="#"
                              class="mr-2">Admin</a> <a href="#" class="meta-chat"><span
                              class="icon-chat"></span> 3</a>
                        </p>
                     </div>
                     <h3 class="heading">
                        <a href="single.html">Why Lead Generation is Key for
                           Business Growth</a>
                     </h3>
                     <p>A small river named Duden flows by their place and
                        supplies it with the necessary regelialia.</p>
                  </div>
               </div>
            </div>
            <div class="col-md-4 d-flex ftco-animate">
               <div class="blog-entry">
                  <a href="single.html" class="block-20"
                     style="background-image: url('images/image_3.jpg');"> </a>
                  <div class="text mt-3 float-right d-block">
                     <div class="d-flex align-items-center mb-3 meta">
                        <p class="mb-0">
                           <span class="mr-2">July 03, 2020</span> <a href="#"
                              class="mr-2">Admin</a> <a href="#" class="meta-chat"><span
                              class="icon-chat"></span> 3</a>
                        </p>
                     </div>
                     <h3 class="heading">
                        <a href="single.html">Why Lead Generation is Key for
                           Business Growth</a>
                     </h3>
                     <p>A small river named Duden flows by their place and
                        supplies it with the necessary regelialia.</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>




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
            stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
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
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
   <script src="js/google-map.js"></script>
   <script src="js/script.js"></script>

   <script src="js/main.js"></script>
   <script src="js/slide.js"></script>
</body>
</html>