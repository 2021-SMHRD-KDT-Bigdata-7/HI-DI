function img(){
    // 클릭했을때 img태그의 src값을 수정하는 부분
    document.getElementsByClassName("slider-homez").src = "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDEyMTJfMjQy%2FMDAxNjA3NzU4MzM2MTA2.ojXKk6VOfMDnw-soMbPmyRXeVoeZPDeiEqGYtVi39AIg.kOx3iHeN-uf4hRmzHKzhAzDAXRq4w89h_mKEfHulR4Qg.JPEG.smotherguy%2FPartyU_mobile_3.jpg&type=ofullfill340_600";
}

// 자가진단 js

$(".cl1_click").click(
	function(){
		$("#checklist1").addClass("open");
		$("#checklist2").removeClass("open");
	}
);
$(".cl2_click").click(
	function(){
		$("#checklist2").addClass("open");
		$("#checklist1").removeClass("open");
	}
);
