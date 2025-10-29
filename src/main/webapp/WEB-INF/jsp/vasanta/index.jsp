<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko"><head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<meta id="mobileMeta" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <title>한전씨에스씨(주)</title>
  <meta name="robots" content="All">
  <meta name="title" content="대표명">
  <meta name="keywords" content="검색 문구">
  <meta name="description" content="페이지에 대한 간략 설명">
  <link rel="stylesheet" href="/publish/ft/css/style.css">
  <link rel="stylesheet" href="/publish/ft/css/swiper.min.css">
  <script type="text/javascript" src="/publish/ft/js/jquery-1.12.2.min.js"></script>
  <script type="text/javascript" src="/publish/ft/js/slick.js"></script>
  <script type="text/javascript" src="/publish/ft/js/swiper.min.js"></script>
  <script type="text/javascript" src="/publish/ft/js/aos.js"></script>
  <script type="text/javascript" src="/publish/ft/js/common.js"></script>
  <script type="text/javascript">

  	$(function(){
  		loading();
  		visualEffect01();
  		floatMenu();
  		mainMap();
  		mainVisual();
  		mainBusiness();
  		mainTab();
  		mainAllCommu();
  		aosJs();
  		boardData('1');
  		fncSelect('');
  		//popup
		getPopup();
  	});

  	function loading(){
		window.onload = function(){
			//$('.tree_img').show("slow");
			$('.visual_text').show("slow");
		}
	}

  	//visual 이미지

  	function visualEffect01() {
  		$('.typebg01').addClass('on');
  	}

  //map

  function mainMap(){
	  //클릭했을때 이미지 호버됨
	  $('.map_click').off('click').on('click', function(e){
		  e.preventDefault();
		  $(this).parents('div').addClass('connect');
		  $(this).closest('li').siblings().find('div').removeClass('connect');
		  var $map_li = $(this).parents('li').attr('class');

		  $('.js-wmap area').each(function(index,element){
			 var $map_area = $(this).attr('title');
			 var $map = $(this).attr('src');

			 if($map_area == $map_li){
				if(typeof $(this).attr('src') == 'undefined') map = '';
		        $('.js-map-over img').attr('src', '' + $map);
			 }
		  });

		  $('.js-map-over span').each(function(index,element){
			 var $map_span = $(this).attr('class');
			var $this =$(this);

			 if($map_li == $map_span){
				 	$(this).addClass('connect');
					$('.js-map-over').find('span').not($this).removeClass('connect');
			 }else if($map_li ==! $map_span){
					$(this).removeClass('connect');
				 //$('.js-map-over').find('span').not($this).removeClass('connect');
			 }
		  });

	  });

	  //맵 클릭 했을때
	  $('.js-wmap area').on('click', function(e) {
		 	 e.preventDefault();
	        var map = $(this).attr('src');
	        var mapTitle = $(this).attr('title');
	        if(typeof $(this).attr('src') == 'undefined') map = '';
	        $('.js-map-over img').attr('src', '' + map);

	        //호버했을때 옆에 li 불켜짐
	        $('.place_map_list li').each(function(index,element){
	        	var $map_li = $(this).attr('class');
	        	if($map_li == mapTitle){
	        		$(this).find('div').addClass('connect');
	        	}else{
	        		$(this).find('div').removeClass('connect');
	        	}
	        });


	    });

  }
  //follow quick menu
	function floatMenu(){
		var currentPosition = parseInt($(".floating_menu").css("top"));
		var currentPositionH = parseInt($(".floating_menu").css("height"));
	    $(window).scroll(function() {
    		// 현재 스크롤바의 위치값을 반환.
            var position = $(window).scrollTop() ;
            //각 영역별 위치값
            //var visualPosition = $('#main_visual').offset();
            var bussinessPosition = $('#main_business').offset();
            var placePosition = $('#main_place').offset();
            var communityPosition = $('#main_community').offset();
            var footerPosition = $('#foot_content').offset();
            var place_comm_bind = $('#main_place_comm_bind').offset();

            $(".floating_menu").stop().animate({"top":position + currentPositionH +"px"},1200);

            if($(document).scrollTop() > place_comm_bind.top - 200){
            	$('.bg_cloud').addClass('on');
            }else{
            	$('.bg_cloud').removeClass('on');
            }
            //각 영역 도달시 플로팅메뉴 이미지 변경
            if($(document).scrollTop() > bussinessPosition.top - 200){
            	//$('.floating_menu li').removeClass('on');
            	$('.float01').addClass('on');
            }else{
            	$('.float01').removeClass('on');
            }

            if($(document).scrollTop() > placePosition.top - 200){
            	$('.floating_menu li').removeClass('on');
            	$('.float02').addClass('on');

            	//$('.main_business .main_tit').addClass('on');
            }else{
            	$('.float02').removeClass('on');

            	//$('.main_business .main_tit').removeClass('on');
            }

            if($(document).scrollTop() > communityPosition.top - 200){
            	$('.floating_menu li').removeClass('on');
            	$('.float03').addClass('on');
            }else{
            	$('.float03').removeClass('on');
            }

            if($(document).scrollTop() > footerPosition.top - 200){
            	//$('.floating_menu').addClass('white');
            	$('.floating_menu li').removeClass('on');
            	$('.float04').addClass('on');
            }else{
            	//$('.floating_menu').removeClass('white');
            	$('.float04').removeClass('on');
            }
	    });

	    $(".floating_menu li a").click(function(e){
			e.preventDefault();
			$("html,body").animate({scrollTop:$(this.hash).offset().top},1200);
	    });
	}


  	function mainVisual(){
  		var time = 3;
  		var isPause,
	    tick,
	    percentTime;
  		var $bar = $('.slider-progress .progress');
  		var $status = $('#main_visual .slide_paging');
  		var $slick_main = $('#main_visual .visual');

  		$slick_main.on('init', function(event, slick) {
			$("#main_visual .visual_item").eq(0).addClass("active");
		});
  		$slick_main.on('afterChange', function(event, slick, currentSlide){
			$("#main_visual .visual_item").removeClass("active");
			$(this).find(".visual_item").eq(currentSlide).addClass("active")
		});
  		$slick_main.on('init reInit afterChange', function (event, slick, currentSlide, nextSlide) {
  			 var i = (currentSlide ? currentSlide : 0) + 1;
  			 $status.html('<span class="count">'+'0'+ i + '</span> / <span class="pagecount">' +'0'+ slick.slideCount + '</span>');
  		});

  		$slick_main.slick({
  			autoplay:false,
			arrows: true,
		    fade: true,
		    dots: true,
		    speed: 1500,
		    autoplaySpeed : 9000,
		    infinite: true,
		    pauseOnHover:false,
		    cssEase: 'ease',
	        slidesToShow: 1,
	        slidesToScroll: 1,
  		});


  		function startProgressbar() {
			resetProgressbar();
			percentTime = 0;
			isPause = false;
			tick = setInterval(interval, 30);
		}

  		function interval() {
			if (isPause === false) {
			  percentTime += 1 / (time + 0.5);
			  $bar.css({
				width: percentTime + "%"
			  });
			  if (percentTime >= 100) {
				$slick_main.slick('slickNext');
			    startProgressbar();
			  }
			}
		}

  		function resetProgressbar() {
			$bar.css({
			  width: 0 + '%'
			});
			clearTimeout(tick);
		}

  		startProgressbar();

  		$('.slick-next, .slick-prev').click(function() {
			startProgressbar();
		});

  		$('.slick-dots li').click(function() {
			startProgressbar();
			//console.log('hi');
		});

  	}

  	function mainBusiness(){

  		var time = 3;
  		var isPause,
	    tick,
	    percentTime;
  		var $bar = $('.busi_slider-progress .busi_progress');
  		var $status = $('#main_visual .slide_paging');
  		var $slick_busi = $("#main_business .busi_visual");

  		$slick_busi.on('init', function(event, slick) {
			$("#main_business .busi_item").eq(0).addClass("active");
		});

  		$slick_busi.on('afterChange', function(event, slick, currentSlide){
			$("#main_business .busi_item").removeClass("active");
			$(this).find(".busi_item").eq(currentSlide).addClass("active")
		});

  		$slick_busi.slick({
  			autoplay:false,
			arrows: true,
		    dots: false,
		    fade: true,
		    speed: 500,
		    infinite: true,
		    pauseOnHover:false,
		    cssEase: 'ease',
	        slidesToShow: 1,
	        slidesToScroll: 1,
  		});

  		function startProgressbar() {
			resetProgressbar();
			percentTime = 0;
			isPause = false;
			tick = setInterval(interval, 30);
		}

  		function interval() {
			if (isPause === false) {
			  percentTime += 1 / (time + 0.5);
			  $bar.css({
				width: percentTime + "%"
			  });
			  if (percentTime >= 100) {
				$slick_busi.slick('slickNext');
			    startProgressbar();
			  }
			}
		}

  		function resetProgressbar() {
			$bar.css({
			  width: 0 + '%'
			});
			clearTimeout(tick);
		}

  		startProgressbar();

  		$('.busi_visual .slick-next, .busi_visual .slick-prev').click(function() {
			startProgressbar();
		});
  	}

  	function mainTab(){
  		    $(".js-tab-content").hide();
  		    $(".js-tab-content:first").show();
  		    $(".js-tab a").click(function(event) {
  		        event.preventDefault(); //주소에 #숨김
  		        $(this).parent().addClass("current");
  		        $(this).parent().siblings().removeClass("current");
  		        var tab = $(this).attr("href");
  		        $(".js-tab-content").not(tab).css("display", "none");
  		        $(tab).fadeIn();
  		    });
  	}

  	//메인 커뮤
  	function mainAllCommu(){

  		var swiperSotre = new Swiper('.all_commu.swiper-container', {
  			slidesPerView: "auto",
  			spaceBetween: 35, // margin-right 로 값이 들어옴.
  			//slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
  			autoHeight : true,
  			scrollbar: {
  		        el: '.swiper-scrollbar',
  		        //hide: true,
  		        dragSize:'auto',
  		      	draggable: true,
  		    },
  		  	navigation : { // 네비게이션 설정
	  			nextEl : '.commu_list_next.swiper-button-next', // 다음 버튼 클래스명
	  			prevEl : '.commu_list_prev.swiper-button-prev', // 이번 버튼 클래스명
	  		},

	  		breakpoints: {
	  	        640: {
	  	          slidesPerView: 2,
	  	          spaceBetween: 20,
	  	        },
	  	        768: {
	  	          slidesPerView: 1,
	  	          spaceBetween: 40,
	  	        },
	  	        1024: {
	  	          slidesPerView: 5,
	  	          spaceBetween: 50,
	  	        }
	  		},
	  		loopFillGroupWithBlank : true,

  		 });
  	}


  	function aosJs(){
  		AOS.init();
  	}

  	/**
  	 *  a: 사업소 코드
  	 *  b: 사업소 갯수
  	 *  c: 지도 번호
  	 */
  	function fncMapSelect(a,b,c) {
  		$("#dept1Cd").val(a);
  		$("#pageIndex").val('1');
  		$.ajax({
  			method: "POST",
  			url: "/ft/mapList.do",
   			data :$("#defaultFrm").serialize(),
  			dataType: "html",
  			success: function(data) {
			$("#placeList").html(data);
  			}
		})

  		$("#clickMenu1").html("서울");
  		$("#clickMenu2").html("인천");
  		$("#clickMenu3").html("경기북부");
  		$("#clickMenu4").html("경기");
  		$("#clickMenu5").html("대전세종충남");
  		$("#clickMenu6").html("전북");
  		$("#clickMenu7").html("광주전남");
  		$("#clickMenu8").html("경남");
  		$("#clickMenu9").html("부산울산");
  		$("#clickMenu10").html("대구");
  		$("#clickMenu11").html("충북");
  		$("#clickMenu12").html("강원");
  		$("#clickMenu13").html("제주");
  		$("#clickMenu14").html("경북");

  		$("#clickMenu"+c).html(b);

  		if(a === null || a === '') {
  			$(".place_map_list li div").removeClass('connect');
  			$(".js-map-over img").attr('src','/publish/ft/images/main/bg_main_map00.png');
  			$('.js-map-over span').removeClass('connect')
  			$("#mapButton").html('전체');
  		} else {
  			$("#mapButton").html($("#code"+a).text());
  			$("#code"+a).trigger('mouseover');
  			$('.js-map-over span').removeClass('connect')
  		 	$('.js-map-over #clickMenu' + c).addClass('connect');
  		}
  	}

  	/**
  	 *  a : 사업소 코드
  	 */
  	function fncSelect(a) {
  		if(a === null || a === '') {
  			fncMapSelect('','','')
  		} else {
  			$("#mapClick"+a).trigger("click");
  		}
  	}

  	/**
  	 *  a : 클릭한 페이지
  	 */
  	function fncPageMap(a) {
  		$("#pageIndex").val(a);
  		$.ajax({
  			method: "POST",
  			url: "/ft/mapList.do",
   			data :$("#defaultFrm").serialize(),
  			dataType: "html",
  			success: function(data) {
			$("#placeList").html(data);
  			}
		})
	}


  	/**
  	*  a : 사업소 코드
  	*/
  	function boardData(a) {
		$.ajax({
	 		method: "POST",
			url: "/ft/board.do",
			data : {para : a},
			dataType: "html",
			success: function(data) {
			$("#boardArea").html(data).fadeIn();
	 		}
		})
	}

  	function getPopup(){
		
	}

	function popUpChk(num){
		 if(!checkPoupCookie('popup'+num)){
			$("#layerbox"+num).css("display","block");
		} else {
			$("#layerbox"+num).css("display","none");
		}
	}

	function checkPoupCookie(cookieName){
		var cookie = document.cookie;
		if(cookie.length > 0){
			startIndex = cookie.indexOf(cookieName);
			if(startIndex != -1){
				return true;
			}else{
				return false;
			};
		}else{
			return false;
		};
	}

	function setCookie(name, value, expiredays){
		var todayDate = new Date();
		 todayDate = new Date(parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);
		 if ( todayDate > new Date() )      {
			 expiredays = expiredays - 1;
		 }
		 todayDate.setDate( todayDate.getDate() + expiredays );
		 document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}

	function closePopup(num){
		setCookie("popup"+num, "popup"+num, 1);
		$("#layerbox"+num).css("display","none");
	}

	function id_view_hide(num){
		$("#layerbox"+num).css("display","none");
	}

</script>
</head>
<body class="main_body" data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">

<form id="defaultFrm" name="defaultFrm" action="/ft/main.do" method="post">
	<input id="pageIndex" name="pageIndex" type="hidden" value="1">
	<input id="dept1Cd" name="dept1Cd" type="hidden" value="">
</form>

  <div id="skipnavi">
		<a href="#container">▶본문 바로가기</a>
		<a href="#gnb_area">▶주메뉴 바로가기</a>
	</div>
  <div id="wrapper">
    <!-- header_area -->
    <div class="header_area">
      <!-- header  -->
  		<header id="header">
  			<div class="gnb_bg js-gnb-bg" style="height: 0px;"></div>
  			<div class="header_box">
  				<h1 class="logo"><a href="/ft/main.do">한전CSC(주)</a></h1>
  				 <div class="util_right clear">
  				   	<!-- <a href="#" class="menuonly"><img src="/publish/ft/images/main/btn_main_login.png" alt="" /><span>직원전용</span></a> -->
  					
  						<a href="/ft/login.do" class="util_login"></a>
  					
  					
  				</div>
  				<!-- GNB -->
  				<div id="gnb_area">
  					<nav class="gnb js-gnb">
  					<ul class="depth2 clear" style="height: 111px;">
  						
			    				<li class="depth1_1 w180">
									<a href="/ft/pr/pr01/list.do">
										
										<span>회사소개</span>
									</a>
									<div class="gnb_txt" style="display: none;">
										<strong>회사소개</strong>
										<span class="eng">ABOUT KEPCO CSC</span>
										<div class="gnb_ect_txt">
											<span class="tit">빛을 이어주는 사람들</span>
											<span class="txt">고객과 함께 새로운 도약을 합니다.</span>
										</div>
									</div>
									
									
										<div class="depthBox">
											<ul>
												
													
												
													
												
													
												
													
												
													
														<li>
															<a href="/ft/pr/pr01/list.do">
																<span>CEO인사말</span>
															</a>
														</li>
													
												
													
												
													
												
													
												
													
												
													
												
													
														<li>
															<a href="/ft/pr/pr02/list.do">
																<span>회사연혁</span>
															</a>
														</li>
													
												
													
												
													
												
													
														<li>
															<a href="/ft/pr/pr05/list.do">
																<span>CI</span>
															</a>
														</li>
													
												
													
												
													
												
													
												
													
														<li>
															<a href="/ft/pr/pr03/list.do">
																<span>조직도</span>
															</a>
														</li>
													
												
													
														<li>
															<a href="/ft/pr/pr06/list.do">
																<span>경영방침</span>
															</a>
														</li>
													
												
													
														<li>
															<a href="/ft/pr/pr04/list.do">
																<span>찾아오시는길</span>
															</a>
														</li>
													
												
											</ul>
										</div>
									
								</li>
							
			    				<li class="depth1_2 w180">
									<a href="/ft/pa/pa01/list.do">
										
										<span>사업분야</span>
									</a>
									<div class="gnb_txt" style="display: none;">
										<strong>사업분야</strong>
										<span class="eng">BUSINESS</span>
										<div class="gnb_ect_txt">
											<span class="tit">빛을 이어주는 사람들</span>
											<span class="txt">고객과 함께 새로운 도약을 합니다.</span>
										</div>
									</div>
									
									
										<div class="depthBox">
											<ul>
												
													
												
													
												
													
												
													
												
													
												
													
														<li>
															<a href="/ft/pa/pa01/list.do">
																<span>한전 123 고객센터</span>
															</a>
														</li>
													
												
													
												
													
														<li>
															<a href="/ft/pa/pa02/list.do">
																<span>고객서비스헌장</span>
															</a>
														</li>
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
											</ul>
										</div>
									
								</li>
							
			    				<li class="depth1_3 w180">
									<a href="/ft/off/ftoff01/list.do">
										
										<span>사업소 현황</span>
									</a>
									<div class="gnb_txt" style="display: none;">
										<strong>사업소 현황</strong>
										<span class="eng">BUSINESS PLACE</span>
										<div class="gnb_ect_txt">
											<span class="tit">빛을 이어주는 사람들</span>
											<span class="txt">고객과 함께 새로운 도약을 합니다.</span>
										</div>
									</div>
									
									
										<div class="depthBox">
											<ul>
												
													
														<li>
															<a href="/ft/off/ftoff01/list.do">
																<span>전국사업소 소개</span>
															</a>
														</li>
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
													
												
											</ul>
										</div>
									
								</li>
							
			    				<li class="depth1_4 w180">
									<a href="/ft/ftbd/ftbd01/list.do">
										
										<span>한전CSC소식</span>
									</a>
									<div class="gnb_txt" style="display: none;">
										<strong>한전CSC소식</strong>
										<span class="eng">COMMUNITY</span>
										<div class="gnb_ect_txt">
											<span class="tit">빛을 이어주는 사람들</span>
											<span class="txt">고객과 함께 새로운 도약을 합니다.</span>
										</div>
									</div>
									
									
										<div class="depthBox">
											<ul>
												
													
												
													
														<li>
															<a href="/ft/ftbd/ftbd01/list.do">
																<span>경영공시</span>
															</a>
														</li>
													
												
													
												
													
												
													
												
													
												
													
														<li>
															<a href="/ft/ftbd/ftbd02/list.do">
																<span>언론보도자료</span>
															</a>
														</li>
													
												
													
												
													
												
													
												
													
												
													
														<li>
															<a href="/ft/ftbd/ftbd03/list.do">
																<span>공지사항</span>
															</a>
														</li>
													
												
													
												
													
												
													
												
													
												
													
														<li>
															<a href="/ft/ftbd/ftbd04/list.do">
																<span>채용정보</span>
															</a>
														</li>
													
												
													
												
													
												
													
												
											</ul>
										</div>
									
								</li>
							
			    				<li class="depth1_5 w180">
									<a href="/ft/mem/not/list.do">
										
<!--					    					<img src="/publish/ft/images/main/btn_main_login.png"> -->
					    				
										<span>직원전용</span>
									</a>
									<div class="gnb_txt" style="display: block;">
										<strong>직원전용</strong>
										<span class="eng">CSC family</span>
										<div class="gnb_ect_txt">
											<span class="tit">빛을 이어주는 사람들</span>
											<span class="txt">고객과 함께 새로운 도약을 합니다.</span>
										</div>
									</div>
									
									
								</li>
							
  						</ul>
  					</nav>
  				</div>
  				<!-- //GNB -->
  				<a href="#" class="btn_all_menu" onclick="return false;"><span><img src="/publish/ft/images/main/btn_main_allmenu.png" alt="전체메뉴"></span></a>
  			</div>
  		</header>
    </div>

    <!--// header_area -->
    <div class="allmenu_area">
			<div class="allmenu_box">
				<div class="allmenu_logo_box">
					<div class="allmenu_logo_area">
						<span class="menu_logo"></span>
						<div class="logo_title">SITEMAP</div>
					</div>
				</div>
				<nav id="menu">
				
		    		
		    			<ul class="depth1 clear type05">
		    				
		    					
			    					<li>
										<a href="#" class="depth1_link">
											<span class="depth1_sup">ABOUT KEPCO CSC</span>
											<span>회사소개</span>
										</a>
										<ul class="depth2" style="display: block;">
											
												
											
												
											
												
											
												
											
												
													<li>
														
															
															
																<a href="/ft/pr/pr01/list.do">
																	<span>CEO인사말</span>
																</a>
															
														
													</li>
												
											
												
											
												
											
												
											
												
											
												
											
												
													<li>
														
															
															
																<a href="/ft/pr/pr02/list.do">
																	<span>회사연혁</span>
																</a>
															
														
													</li>
												
											
												
											
												
											
												
													<li>
														
															
															
																<a href="/ft/pr/pr05/list.do">
																	<span>CI</span>
																</a>
															
														
													</li>
												
											
												
											
												
											
												
											
												
													<li>
														
															
															
																<a href="/ft/pr/pr03/list.do">
																	<span>조직도</span>
																</a>
															
														
													</li>
												
											
												
													<li>
														
															
															
																<a href="/ft/pr/pr06/list.do">
																	<span>경영방침</span>
																</a>
															
														
													</li>
												
											
												
													<li>
														
															
															
																<a href="/ft/pr/pr04/list.do">
																	<span>찾아오시는길</span>
																</a>
															
														
													</li>
												
											
										</ul>
									</li>
								
							
		    					
			    					<li>
										<a href="#" class="depth1_link">
											<span class="depth1_sup">BUSINESS</span>
											<span>사업분야</span>
										</a>
										<ul class="depth2" style="display: block;">
											
												
											
												
											
												
											
												
											
												
											
												
													<li>
														
															
															
																<a href="/ft/pa/pa01/list.do">
																	<span>한전 123 고객센터</span>
																</a>
															
														
													</li>
												
											
												
											
												
													<li>
														
															
															
																<a href="/ft/pa/pa02/list.do">
																	<span>고객서비스헌장</span>
																</a>
															
														
													</li>
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
										</ul>
									</li>
								
							
		    					
			    					<li>
										<a href="#" class="depth1_link">
											<span class="depth1_sup">BUSINESS PLACE</span>
											<span>사업소 현황</span>
										</a>
										<ul class="depth2" style="display: block;">
											
												
													<li>
														
															
															
																<a href="/ft/off/ftoff01/list.do">
																	<span>전국사업소 소개</span>
																</a>
															
														
													</li>
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
												
											
										</ul>
									</li>
								
							
		    					
			    					<li>
										<a href="#" class="depth1_link">
											<span class="depth1_sup">COMMUNITY</span>
											<span>한전CSC소식</span>
										</a>
										<ul class="depth2" style="display: block;">
											
												
											
												
													<li>
														
															
															
																<a href="/ft/ftbd/ftbd01/list.do">
																	<span>경영공시</span>
																</a>
															
														
													</li>
												
											
												
											
												
											
												
											
												
											
												
													<li>
														
															
															
																<a href="/ft/ftbd/ftbd02/list.do">
																	<span>언론보도자료</span>
																</a>
															
														
													</li>
												
											
												
											
												
											
												
											
												
											
												
													<li>
														
															
															
																<a href="/ft/ftbd/ftbd03/list.do">
																	<span>공지사항</span>
																</a>
															
														
													</li>
												
											
												
											
												
											
												
											
												
											
												
													<li>
														
															
															
																<a href="/ft/ftbd/ftbd04/list.do">
																	<span>채용정보</span>
																</a>
															
														
													</li>
												
											
												
											
												
											
												
											
										</ul>
									</li>
								
							
		    					
							
			    		</ul>
		    		
		    	</nav>
		    	<a href="#" class="btn btn_close"></a>
		    	<div class="m_util_box">
					<span class="btn_logout"><a href="/ft/login.do">Login</a></span>
			    </div>
			</div>
		</div>
		<!-- //allMenu -->
    <!--  container -->
    <div id="container">
    	<div class="floating_menu" style="top: 300px;">
			<ul>
				<li class="float01"><a href="#main_business">비지니스</a></li>
				<li class="float02"><a href="#main_place">비지니스플레이스</a></li>
				<li class="float03"><a href="#main_community">커뮤니티</a></li>
				<li class="float04"><a href="#main_footer">풋</a></li>
				<li class="float05">
					<a href="#main_visual">
						<span>TOP</span>
					</a>
				</li>
			</ul>
		</div>
    	<div id="main_visual">
    		<div class="main_visual_box">
	    		<span class="slide_paging"><span class="count">02</span> / <span class="pagecount">04</span></span>
	    		<div class="visual slick-initialized slick-slider slick-dotted"><button class="slick-prev slick-arrow" aria-label="Previous" type="button" style="display: block;">Previous</button><div class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 7620px;"><div class="slick-slide" data-slick-index="0" aria-hidden="true" role="tabpanel" id="slick-slide00" style="width: 1905px; position: relative; left: 0px; top: 0px; z-index: 8; opacity: 0; transition: opacity 1500ms;" aria-describedby="slick-slide-control00" tabindex="-1"><div><div class="visual_item" style="width: 100%; display: inline-block;">
	    					<div class="visu_img typebg01 pc_version on">
	    						<div class="ex01"><img src="/publish/ft/images/main/bg_main_visual_01_float.png"></div>
								<div class="ex02"><img src="/publish/ft/images/main/bg_main_visual_01.jpg"></div>
	    					</div>
		    				<span class="visu_img m_version">
		    					<img src="/publish/ft/images/main/bg_main_visual_01_m.jpg" alt="">
		    				</span>
	    				<div class="visual_text_area">
	    					<div class="visual_text" style="">
		    					<div class="text_gradi">KEPCOCSC</div>
		    					<div>
			    					<h2 class="text_main pc_version">고객과&nbsp;함께&nbsp;<strong>새로운&nbsp;도약</strong>을 합니다!</h2>
			    					<h2 class="text_main m_version"><span class="block">고객과함께</span><strong>새로운도약</strong>을 합니다!</h2>
			    					<div class="text_sub">고객만족 100%,<strong>123</strong>고객상담전문 한전씨에스씨(KEPCOCSC)</div>
		    					</div>
	    					</div>
	    				</div>
	    			</div></div></div><div class="slick-slide slick-current slick-active" data-slick-index="1" aria-hidden="false" role="tabpanel" id="slick-slide01" style="width: 1905px; position: relative; left: -1905px; top: 0px; z-index: 9; opacity: 1;" aria-describedby="slick-slide-control01"><div><div class="visual_item active" style="width: 100%; display: inline-block;">
	    				<div class="pc_video video02 pc_version">
	    					<video src="/publish/ft/images/main/bg_video02.mp4" autoplay="autoplay" loop=" loop" muted="muted"></video>
	    				</div>
	    				<span class="visu_img m_version">
	    					<img src="/publish/ft/images/main/bg_main_visual_02_m.jpg" alt="">
	    				</span>
	    				<div class="visual_text_area type02">
	    					<div class="visual_text" style="">
		    					<div class="text_gradi">KEPCOCSC</div>
		    					<div>
			    					<h2 class="text_main pc_version"><strong class="char_spacing">마음으로</strong>다가가는 서비스</h2>
			    					<h2 class="text_main m_version"><strong>마음으로</strong><span class="block">다가가는 서비스</span></h2>
			    					<div class="text_sub pc_version">따뜻한 마음가짐으로 고객과 소통하고 귀를 기울여 전기사용 불편을 최소화하겠습니다.</div>
			    					<div class="text_sub m_version"><span class="block">따뜻한 마음가짐으로 고객과 소통하고</span> 귀를 기울여 전기사용 불편을 최소화하겠습니다.</div>
		    					</div>
	    					</div>
	    				</div>
	    			</div></div></div><div class="slick-slide" data-slick-index="2" aria-hidden="true" role="tabpanel" id="slick-slide02" style="width: 1905px; position: relative; left: -3810px; top: 0px; z-index: 8; opacity: 0; transition: opacity 1500ms;" aria-describedby="slick-slide-control02" tabindex="-1"><div><div class="visual_item" style="width: 100%; display: inline-block;">
	    				<div class="pc_video video02 pc_version">
	    					<video src="/publish/ft/images/main/bg_video03.mp4" autoplay="autoplay" loop=" loop" muted="muted"></video>
	    				</div>
	    				<span class="visu_img m_version">
	    					<img src="/publish/ft/images/main/bg_main_visual_03_m.jpg" alt="">
	    				</span>
	    				<div class="visual_text_area type02">
	    					<div class="visual_text" style="">
		    					<div class="text_gradi">KEPCOCSC</div>
		    					<div>
			    					<h2 class="text_main pc_version"><strong class="char_spacing">전문성, 24시간 </strong>전기상담 고객센터</h2>
			    					<h2 class="text_main m_version"><strong>전문성, 24시간</strong><span class="block">전기상담 고객센터</span></h2>
			    					<div class="text_sub pc_version">디지털 세상에 최적화된 고객서비스! 전기관련 모든 궁금증을 신속하고 정확하게 해결합니다.</div>
			    					<div class="text_sub m_version"><span class="block">디지털 세상에 최적화된 고객서비스! </span><span class="block">전기관련 모든 궁금증을 신속하고 </span>정확하게 해결합니다.</div>
		    					</div>
	    					</div>
	    				</div>
	    			</div></div></div><div class="slick-slide" data-slick-index="3" aria-hidden="true" role="tabpanel" id="slick-slide03" style="width: 1905px; position: relative; left: -5715px; top: 0px; z-index: 8; opacity: 0; transition: opacity 1500ms;" aria-describedby="slick-slide-control03" tabindex="-1"><div><div class="visual_item" style="width: 100%; display: inline-block;">
	    				<span class="visu_img type05 pc_version">
	    					<img src="/publish/ft/images/main/bg_main_visual_05.jpg" alt="">
	    				</span>
	    				<span class="visu_img m_version">
	    					<img src="/publish/ft/images/main/bg_main_visual_04_m.jpg" alt="">
	    				</span>
	    				<div class="visual_text_area">
	    					<div class="visual_text" style="">
		    					<div class="text_gradi">KEPCOCSC</div>
		    					<div>
			    					<h2 class="text_main pc_version"><strong class="char_spacing">고객과 상담사가</strong> 행복한 한전 씨에스씨</h2>
			    					<h2 class="text_main m_version"><strong>고객과 상담사가</strong><span class="block">행복한 한전씨에스씨</span></h2>
			    					<div class="text_sub  pc_version">
			    						<span class="block">상호 존중과 배려를 통한 커뮤니케이션, 정체되지않은 미래지향적 사고로</span>
			    						<span class="block">고객에게 더 큰 혜택으로 더 가까이 다가가겠습니다.</span>
			    					</div>
			    					<div class="text_sub m_version">
			    						<span class="block">상호 존중과 배려를 통한 커뮤니케이션, 정체되지않은</span>
			    						<span class="block">미래지향적 사고로 고객에게 더 큰 혜택으로</span>
			    						<span class="block">더 가까이 다가가겠습니다.</span>
			    					</div>
		    					</div>
	    					</div>
	    				</div>
	    			</div></div></div></div></div><button class="slick-next slick-arrow" aria-label="Next" type="button" style="display: block;">Next</button><ul class="slick-dots" style="display: block;" role="tablist"><li class="" role="presentation"><button type="button" role="tab" id="slick-slide-control00" aria-controls="slick-slide00" aria-label="1 of 4" tabindex="-1">1</button></li><li role="presentation" class="slick-active"><button type="button" role="tab" id="slick-slide-control01" aria-controls="slick-slide01" aria-label="2 of 4" tabindex="0" aria-selected="true">2</button></li><li role="presentation" class=""><button type="button" role="tab" id="slick-slide-control02" aria-controls="slick-slide02" aria-label="3 of 4" tabindex="-1">3</button></li><li role="presentation" class=""><button type="button" role="tab" id="slick-slide-control03" aria-controls="slick-slide03" aria-label="4 of 4" tabindex="-1">4</button></li></ul></div>
	    		<section class="scroll_progress_area">
		    		<div class="scroll_area scroll_guide">
		    			<a href="#main_business" class="clear">
			    			<span class="tit">SCROLL DOWN</span>
			    			<i class="i_scroll"><span class="scroll_img"><img src="/publish/ft/images/main/img_scroll.png" alt=""></span></i>
		    			</a>
		    		</div>
		    		<div class="slider-progress">
		    			<div class="progress" style="width: 59.7143%;"></div>
		    		</div>
	    		</section>
    		</div>
    	</div>
    	<!-- #main_content -->
    	<section id="main_content">

    		<section id="main_business">
    			<div class="line_area_position">
		    		<div class="line_area">
			    		<span class="line01"></span>
			    		<span class="line02"></span>
			    		<span class="line03"></span>
			    		<span class="line04"></span>
			    		<span class="line05"></span>
		    		</div>
		    	</div>
    			<div class="busi_bg">
    				<div class="busi_chapter">
    				<div class="main_title busi_tit aos-init" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="400">
    					<h2 class="title">
    						<span class="title_sup">
	    						<span class="txt_box">A</span>
    							<span class="txt_box">b</span>
    							<span class="txt_box">o</span>
    							<span class="txt_box">u</span>
    							<span class="txt_box">t</span>
    						</span>
    						<span class="title_bot">
    							<span class="txt_box">B</span>
    							<span class="txt_box">u</span>
    							<span class="txt_box">s</span>
    							<span class="txt_box">i</span>
    							<span class="txt_box">n</span>
    							<span class="txt_box">e</span>
    							<span class="txt_box">s</span>
    							<span class="txt_box">s</span>
   							</span>
    					</h2>
	    			</div>

	    			<div class="busi_visual slick-initialized slick-slider aos-init" data-aos="fade-up" data-aos-easing="linear" data-aos-duration="1300"><button class="slick-prev slick-arrow" aria-label="Previous" type="button" style="display: block;">Previous</button><div class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 4200px;"><div class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 1400px; position: relative; left: 0px; top: 0px; z-index: 9; opacity: 1;"><div><div class="busi_item active" style="width: 100%; display: inline-block;">
    						<div class="visual_text_area clear">
		    					<div class="visual_text" style="">
			    					<h2 class="text_main"><strong>신기술</strong>상담채널개발</h2>
			    					<div class="text_sub pc_version">챗봇,상담어드바이저등 신기술 기반 상담솔루션 관리</div>
			    					<div class="text_sub m_version"><span class="block">챗봇,상담 어드바이저등</span>신기술 기반 상담솔루션 관리</div>
			    					<div class="text_sub02">
			    						<span class="top"><i class="apostrophe">"</i> 영상, 채팅, 음성등 신규상담채널 개발</span>
			    						<span class="bot">잘못된 서비스는 즉시 시정하고 서비스 품질을 향상하겠습니다.<i class="apostrophe">"</i></span>
			    					</div>
			    					<div class="btn btn_area">
			    						<a href="/ft/pa/pa01/list.do" class="btn btn_more clear" tabindex="0">
				    						<span class="btn_text">VIEW MORE</span>
				    						<i class="long_w_arrow"></i>
			    						</a>
			    					</div>
		    					</div>
		    					<div class="visual_pic">
		    						<span class="bg_visu_pic">
		    							<img src="/publish/ft/images/main/img_busi_slide_pic01.png" alt="" class="pc_version">
		    							<img src="/publish/ft/images/main/img_busi_slide_pic01_m.jpg" alt="" class="m_version">
		    						</span>
		    					</div>
	    					</div>
	    				</div></div></div><div class="slick-slide" data-slick-index="1" aria-hidden="true" style="width: 1400px; position: relative; left: -1400px; top: 0px; z-index: 8; opacity: 0; transition: opacity 500ms;" tabindex="-1"><div><div class="busi_item" style="width: 100%; display: inline-block;">
    						<div class="visual_text_area clear">
		    					<div class="visual_text" style="">
			    					<h2 class="text_main"><strong>24시간</strong>고객응대</h2>
			    					<div class="text_sub pc_version">전화,온라인 등 상담시스템을 통한 24시간 고객응대</div>
			    					<div class="text_sub m_version"><span class="block">전화,온라인 등 상담시스템을 통한</span>24시간 고객응대</div>
			    					<div class="text_sub02">
			    						<span class="top"><i class="apostrophe">"</i> 전기사용 및 관련업무를 친절, 신속, 정확한</span>
			    						<span class="bot">In-Out Bound상담수행으로 고객감동을 실현하겠습니다.<i class="apostrophe">"</i></span>
			    					</div>
			    					<div class="btn btn_area">
			    						<a href="/ft/pa/pa01/list.do" class="btn btn_more clear" tabindex="-1">
				    						<span class="btn_text">VIEW MORE</span>
				    						<i class="long_w_arrow"></i>
			    						</a>
			    					</div>
		    					</div>
		    					<div class="visual_pic">
		    						<span class="bg_visu_pic">
		    							<img src="/publish/ft/images/main/img_busi_slide_pic02.png" alt="" class="pc_version">
		    							<img src="/publish/ft/images/main/img_busi_slide_pic02_m.jpg" alt="" class="m_version">
		    						</span>
		    					</div>
	    					</div>
    					</div></div></div><div class="slick-slide" data-slick-index="2" aria-hidden="true" style="width: 1400px; position: relative; left: -2800px; top: 0px; z-index: 8; opacity: 0; transition: opacity 500ms;" tabindex="-1"><div><div class="busi_item" style="width: 100%; display: inline-block;">
    						<div class="visual_text_area clear">
		    					<div class="visual_text" style="">
			    					<h2 class="text_main"><strong>비상상황</strong>고객응대 지원</h2>
			    					<div class="text_sub pc_version">자연재해 등으로 인한 비상상황 발생시 고객 응대 지원</div>
			    					<div class="text_sub m_version">자연재해 등으로 인한 비상상황 발생시 고객 응대 지원</div>
			    					<div class="text_sub02">
			    						<span class="top"><i class="apostrophe">"</i> 전력 서비스 이용고객에 대한 만족도 모니터링을 포함하여</span>
			    						<span class="bot">고객을 위한 최고의 서비스를 제공하겠습니다. <i class="apostrophe">"</i></span>
			    					</div>
			    					<div class="btn btn_area">
			    						<a href="/ft/pa/pa01/list.do" class="btn btn_more clear" tabindex="-1">
				    						<span class="btn_text">VIEW MORE</span>
				    						<i class="long_w_arrow"></i>
			    						</a>
			    					</div>
		    					</div>
		    					<div class="visual_pic">
		    						<span class="bg_visu_pic">
		    							<img src="/publish/ft/images/main/img_busi_slide_pic03.png" alt="" class="pc_version">
		    							<img src="/publish/ft/images/main/img_busi_slide_pic03_m.jpg" alt="" class="m_version">
		    						</span>
		    					</div>
	    					</div>
    					</div></div></div></div></div><button class="slick-next slick-arrow" aria-label="Next" type="button" style="display: block;">Next</button></div> <!-- busi_visual -->

	    			<!-- progress bar -->
	    			<div class="busi_slider-progress">
		    			<div class="busi_progress" style="width: 63.4286%;"></div>
		    		</div>

				</div><!--// busi_chapter -->

    		</div><!-- //busi_bg -->

    		</section>
    		<!-- // main_business -->
    		<div id="main_place_comm_bind">
    		<section id="main_place">
    			<div>
	    			<article class="place_section clear">
	    				<div class="place_info">
	    					<div class="main_title place_tit aos-init" data-aos="fade-left" data-aos-easing="linear" data-aos-duration="400">
		    					<h2 class="title">
		    						<span class="title_sup">
			    						<span class="txt_box">N</span>
		    							<span class="txt_box">e</span>
		    							<span class="txt_box">t</span>
		    							<span class="txt_box">w</span>
		    							<span class="txt_box">o</span>
		    							<span class="txt_box">r</span>
		    							<span class="txt_box">k</span>
		    						</span>
		    						<span class="title_bot">
		    							<span class="txt_box">B</span>
		    							<span class="txt_box">u</span>
		    							<span class="txt_box">s</span>
		    							<span class="txt_box">i</span>
		    							<span class="txt_box">n</span>
		    							<span class="txt_box">e</span>
		    							<span class="txt_box">s</span>
		    							<span class="txt_box">s</span>
		    							<span class="txt_box ml10">P</span>
		    							<span class="txt_box">l</span>
		    							<span class="txt_box">a</span>
		    							<span class="txt_box">c</span>
		    							<span class="txt_box">e</span>
		   							</span>
		    					</h2>
			    			</div>
			    			<div data-aos="fade-left" data-aos-easing="linear" data-aos-duration="1000" class="aos-init">
				    			<div class="place_subj">
				    				<h3 class="pc_version">고객과 상담사가 모두 행복한 한전 씨에스씨</h3>
				    				<h3 class="m_version">
				    					<span class="block">고객과 상담사가 모두 행복한</span> 한전 씨에스씨
				    				</h3>
				    				<span class="m_span">신뢰와 바탕으로 서로 협력하며</span>
				    				<span class="m_span">친절하고 신속한 업무처리로 감동을 실현하겠습니다.</span>
				    			</div>
		    					<div class="place_location">
			    					<div class="fake_select js-fake-select">
									    <span class="ctrl"><span class="arrow"></span></span>
									    <button type="button" class="my_value js-my-value" id="mapButton">전체</button>
									    <ul class="a_list">
									    	<li><a href="javascript:void(0)" id="code" onclick="fncSelect('')">전체</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code2000" onclick="fncSelect('2000')">서울</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code2200" onclick="fncSelect('2200')">인천</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code2300" onclick="fncSelect('2300')">경기북부</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code2400" onclick="fncSelect('2400')">경기</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code2500" onclick="fncSelect('2500')">강원</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code2600" onclick="fncSelect('2600')">충북</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code2700" onclick="fncSelect('2700')">대전세종충남</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code2800" onclick="fncSelect('2800')">전북</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code2900" onclick="fncSelect('2900')">광주전남</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code3000" onclick="fncSelect('3000')">대구</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code2100" onclick="fncSelect('2100')">경북</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code3200" onclick="fncSelect('3200')">부산울산</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code3300" onclick="fncSelect('3300')">경남</a></li>
									    	
									    		<li><a href="javascript:void(0)" id="code3400" onclick="fncSelect('3400')">제주</a></li>
									    	
									    </ul>
									</div>
								</div>
								<div id="placeList">















<script>
$(document).ready(function(){
});
</script>

<ul class="place_location_list clear">
	
	<li>
		<dl>
			<dt class="place_loca_tit">
			서울지사
			
			</dt>
			<dd class="place_loca_call">02-123</dd>
		</dl>
	</li>
	
	<li>
		<dl>
			<dt class="place_loca_tit">
			인천지사
			
			</dt>
			<dd class="place_loca_call">032-123</dd>
		</dl>
	</li>
	
	<li>
		<dl>
			<dt class="place_loca_tit">
			경기북부지사
			
			</dt>
			<dd class="place_loca_call">031-123</dd>
		</dl>
	</li>
	
	<li>
		<dl>
			<dt class="place_loca_tit">
			경기지사
			
			</dt>
			<dd class="place_loca_call">031-123</dd>
		</dl>
	</li>
	
	<li>
		<dl>
			<dt class="place_loca_tit">
			강원지사
			
			</dt>
			<dd class="place_loca_call">033-123</dd>
		</dl>
	</li>
	
	<li>
		<dl>
			<dt class="place_loca_tit">
			충북지사
			
			</dt>
			<dd class="place_loca_call">043-123</dd>
		</dl>
	</li>
	
	<li>
		<dl>
			<dt class="place_loca_tit">
			대전세종충남지사
			
			</dt>
			<dd class="place_loca_call">042-123</dd>
		</dl>
	</li>
	
	<li>
		<dl>
			<dt class="place_loca_tit">
			전북지사
			
			</dt>
			<dd class="place_loca_call">063-123</dd>
		</dl>
	</li>
	
	<li>
		<dl>
			<dt class="place_loca_tit">
			광주전남지사
			
			</dt>
			<dd class="place_loca_call">062-123</dd>
		</dl>
	</li>
	
</ul>

<div class="paging_wrap">
	<div class="paging">
		<strong>1</strong>
<a href="#" onclick="fncPageMap(2); return false;">2</a>


	</div>
</div>


	
</div>
							</div>
	    				</div>
	    				<div class="place_map aos-init" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="1000">
	    					<div class="place_map_area clear">
	    						<ul class="place_map_list">
	    							
		    							<li class="map_menu1">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('2000','1','1')" id="mapClick2000">
				    								<strong class="tit">서울</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu2">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('2200','1','2')" id="mapClick2200">
				    								<strong class="tit">인천</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu3">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('2300','1','3')" id="mapClick2300">
				    								<strong class="tit">경기북부</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu4">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('2400','1','4')" id="mapClick2400">
				    								<strong class="tit">경기</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu12">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('2500','1','12')" id="mapClick2500">
				    								<strong class="tit">강원</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu11">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('2600','1','11')" id="mapClick2600">
				    								<strong class="tit">충북</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu5">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('2700','1','5')" id="mapClick2700">
				    								<strong class="tit">대전세종충남</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu6">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('2800','1','6')" id="mapClick2800">
				    								<strong class="tit">전북</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu7">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('2900','1','7')" id="mapClick2900">
				    								<strong class="tit">광주전남</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu10">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('3000','1','10')" id="mapClick3000">
				    								<strong class="tit">대구</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu14">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('2100','1','14')" id="mapClick2100">
				    								<strong class="tit">경북</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu9">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('3200','1','9')" id="mapClick3200">
				    								<strong class="tit">부산울산</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu8">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('3300','1','8')" id="mapClick3300">
				    								<strong class="tit">경남</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
		    							<li class="map_menu13">
		    								<div>
			    								<a href="#" class="map_click clear" onclick="fncMapSelect('3400','1','13')" id="mapClick3400">
				    								<strong class="tit">제주</strong>
				    								<span class="num">1</span>
				    								<i class="arrow"><img src="/publish/ft/images/main/i_place_white_arrow.png" alt=""></i>
			    								</a>
		    								</div>
		    							</li>
	    							
	    						</ul>
	    						<!-- //place_map_list -->

	    						<div class="place_map_chapter">
	    							<!-- Image Map Generated by http://www.image-map.net/ -->
									<div class="map_over js-map-over over">
										<img src="/publish/ft/images/main/bg_main_map00.png" usemap="#image-map">
										<span class="map_menu1" id="clickMenu1">서울</span>
										<span class="map_menu2" id="clickMenu2">인천</span>
										<span class="map_menu3" id="clickMenu3">경기북부</span>
										<span class="map_menu4" id="clickMenu4">경기</span>
										<span class="map_menu5" id="clickMenu5">대전세종충남</span>
										<span class="map_menu6" id="clickMenu6">전북</span>
										<span class="map_menu7" id="clickMenu7">광주전남</span>
										<span class="map_menu8" id="clickMenu8">경남</span>
										<span class="map_menu9" id="clickMenu9">부산울산</span>
										<span class="map_menu10" id="clickMenu10">대구</span>
										<span class="map_menu11" id="clickMenu11">충북</span>
										<span class="map_menu12" id="clickMenu12">강원</span>
										<span class="map_menu13" id="clickMenu13">제주</span>
										<span class="map_menu14" id="clickMenu14">경북</span>
									</div>
									<map name="image-map" class="js-wmap">
									    <area target="" alt="서울" title="map_menu1" onclick="fncSelect('2000')" src="/publish/ft/images/main/bg_main_map01.png" href="#" coords="154,143,141,148,131,152,130,160,120,159,120,165,127,176,135,182,148,177,160,179,163,167,160,155" shape="poly">
									    <area target="" alt="인천" title="map_menu2" onclick="fncSelect('2200')" src="/publish/ft/images/main/bg_main_map02.png" href="#" coords="107,149,119,159,115,175,118,184,111,194,105,186,100,175,96,168,94,159" shape="poly">
									    <area target="" alt="경기북부" title="map_menu3" onclick="fncSelect('2300')" src="/publish/ft/images/main/bg_main_map03.png" href="#" coords="96,155,93,139,103,133,118,106,161,69,167,83,177,79,182,89,196,87,200,102,210,104,216,116,211,127,208,136,210,148,209,155,162,167,153,143,132,152,131,158,119,159,107,148" shape="poly">
									    <area target="" alt="경기" title="map_menu4" onclick="fncSelect('2400')" src="/publish/ft/images/main/bg_main_map04.png" href="#" coords="118,183,108,197,120,207,115,217,100,219,98,229,105,231,125,223,108,239,134,239,116,246,129,256,138,249,145,257,163,252,179,258,204,239,224,228,233,219,239,186,239,170,245,167,218,150,209,156,168,168,162,182,134,185,119,169" shape="poly">
									    <area target="" alt="대전세종충남" title="map_menu5" onclick="fncSelect('2700')" src="/publish/ft/images/main/bg_main_map05.png" href="#" coords="108,252,120,259,133,262,164,251,186,262,195,277,179,300,197,305,193,317,204,317,211,326,204,348,216,353,224,377,212,381,194,382,185,366,164,378,153,369,135,365,130,381,113,392,93,386,84,371,97,356,84,343,88,329,79,321,80,306,77,295,68,278,85,252" shape="poly">
									    <area target="" alt="전북" title="map_menu6" onclick="fncSelect('2800')" src="/publish/ft/images/main/bg_main_map06.png" href="#" coords="115,391,133,380,137,365,165,372,187,367,191,380,209,383,224,377,249,376,252,393,224,412,215,443,226,460,218,477,195,474,173,474,152,481,147,460,136,469,124,452,116,459,110,474,89,480,81,453,103,439,79,434,116,415,107,415,121,403,94,403,100,390" shape="poly">
									    <area target="" alt="광주전남" title="map_menu7" onclick="fncSelect('2900')" src="/publish/ft/images/main/bg_main_map07.png" href="#" coords="83,463,66,479,66,500,76,518,72,552,87,553,68,559,75,571,88,585,82,598,86,615,100,630,113,626,131,605,155,601,181,570,223,549,242,534,242,514,223,501,212,483,205,474,179,473,153,479,147,462,134,469,122,454,109,474,87,481" shape="poly">
									    <area target="" alt="경남" title="map_menu8" onclick="fncSelect('3300')" src="/publish/ft/images/main/bg_main_map08.png" href="#" coords="251,401,265,409,279,418,275,436,293,430,305,438,318,432,332,446,338,439,345,446,365,435,374,436,382,448,408,470,375,494,359,508,365,519,344,519,313,549,294,553,271,532,260,546,246,543,244,513,226,498,217,486,229,461,217,446,227,412" shape="poly">
									    <area target="" alt="부산울산" title="map_menu9" onclick="fncSelect('3200')" src="/publish/ft/images/main/bg_main_map09.png" href="#" coords="381,443,382,434,388,423,407,417,415,434,424,427,445,436,443,468,424,499,411,509,402,525,387,528,371,519,363,504,407,469" shape="poly">
									    <area target="" alt="대구" title="map_menu10" onclick="fncSelect('3000')" src="/publish/ft/images/main/bg_main_map14.png" href="#" coords="342,385,327,393,321,401,311,400,320,409,311,416,316,421,307,428,312,432,317,429,323,419,335,417,343,406,349,399" shape="poly">
									    <area target="" alt="충북" title="map_menu11" onclick="fncSelect('2600')" src="/publish/ft/images/main/bg_main_map11.png" href="#" coords="232,225,254,220,256,208,268,205,273,215,290,208,308,212,298,227,309,223,314,229,331,231,338,231,313,250,312,269,304,269,289,261,280,268,270,268,265,278,252,282,248,295,238,298,248,312,243,344,262,351,260,360,251,372,224,372,219,350,208,343,213,327,205,311,197,311,197,303,187,296,197,280,183,259,209,238" shape="poly">
									    <area target="" alt="강원" title="map_menu12" onclick="fncSelect('2500')" src="/publish/ft/images/main/bg_main_map12.png" href="#" coords="166,80,166,71,206,69,233,58,249,72,282,59,302,23,310,37,326,55,327,75,359,115,361,133,392,158,423,204,421,224,405,230,401,235,389,230,363,228,348,233,340,233,320,226,303,222,314,209,291,206,273,212,268,203,252,208,249,219,234,222,242,186,243,173,237,158,224,149,212,151,212,134,221,117,213,102,202,100,199,84,183,84,177,75" shape="poly">
									    <area target="" alt="제주" title="map_menu13" onclick="fncSelect('3400')" src="/publish/ft/images/main/bg_main_map13.png" href="#" coords="193,622,150,635,132,650,121,662,132,673,151,690,163,684,200,682,220,667,229,648,212,624" shape="poly">
									    <area target="" alt="경북" title="map_menu14" onclick="fncSelect('2100')" src="/publish/ft/images/main/bg_main_map10.png" href="#" coords="336,431,328,428,333,439,344,444,366,434,379,437,388,428,406,418,412,425,414,433,422,429,447,441,457,397,456,376,444,367,438,322,436,293,438,252,422,231,412,231,405,245,388,237,370,240,360,247,356,237,348,246,337,242,315,259,319,269,307,280,292,273,276,277,272,282,259,293,254,303,247,303,253,319,248,342,257,343,269,342,269,350,263,361,251,387,259,398,276,408,285,419,286,431,300,425,304,410,309,391,329,380,347,378,356,390,356,403,348,425" shape="poly">
									</map>
								</div>
	    					</div>
	    				</div>
	    			</article>
	    			<span class="moving_txt pc_version aos-init" data-aos="fade-left" data-aos-offset="300" data-aos-easing="linear" data-aos-duration="400">KEPCOCSC</span>
    			</div>
    		</section>

    		<!-- main_community -->
    		<section id="main_community">
    			<div class="bg_cloud"><img src="/publish/ft/images/main/bg_main_cloud.png" alt=""></div>
    			<div class="comm_bg clear">
    				<section class="comm_content clear">
	    				<div class="main_title comm_tit aos-init" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="1000">
	    					<h2 class="title">
	    						<span class="title_sup">
		    						<span class="txt_box">N</span>
	    							<span class="txt_box">e</span>
	    							<span class="txt_box">w</span>
	    							<span class="txt_box">s</span>
	    							<span class="txt_box">&amp;</span>
	    							<span class="txt_box">N</span>
	    							<span class="txt_box">o</span>
	    							<span class="txt_box">t</span>
	    							<span class="txt_box">i</span>
	    							<span class="txt_box">c</span>
	    							<span class="txt_box">e</span>
	    						</span>
	    						<span class="title_bot">
	    							<span class="txt_box">C</span>
	    							<span class="txt_box">o</span>
	    							<span class="txt_box">m</span>
	    							<span class="txt_box">m</span>
	    							<span class="txt_box">u</span>
	    							<span class="txt_box">n</span>
	    							<span class="txt_box">i</span>
	    							<span class="txt_box">t</span>
	    							<span class="txt_box">y</span>
	   							</span>
	    					</h2>
		    			</div>
    				<!-- 탭메뉴 -->
						<section class="main_tabposition aos-init" data-aos="fade-left" data-aos-easing="linear" data-aos-duration="1000">
							<div class="tab_box">
								<ul class="tab js-tab tab_menu">
								    <li class="current"><a href="#tab01" onclick="boardData('1')">전체</a></li>
								    <li><a href="#tab02" onclick="boardData('2')">공지사항</a></li>
								    <li><a href="#tab03" onclick="boardData('3')">언론보도</a></li>
								    <li><a href="#tab04" onclick="boardData('4')">채용정보</a></li>
								</ul>
							</div>
							<div class="main_tab_area">
								<!-- 탭 1 -->
								<div id="boardArea">
								</div>
							</div>
						</section>
					<!--// 탭메뉴 -->
					</section>
    			</div>
    		</section>
    		</div>
    		<!-- //main_community -->

    	</section>
    	<!-- #main_content -->


    </div>
    <!--//  container -->

    <!-- main_footer -->
   		<section id="main_footer">
   			<div class="foot_bg_area">
				<div class="foot_content_div aos-init" data-aos="fade-up" data-aos-easing="linear" data-aos-duration="2000">
					<span class="moving_txt"><img src="/publish/ft/images/main/bg_foot_kepco.png" alt=""></span>
		   			<article id="foot_content">

		   				<div class="copy_sentence">
			   				<div class="copy_title clear">
			   					<span class="light"><img src="/publish/ft/images/main/img_caliy.png" alt="빛"></span>
			   					<div class="copy_text_box">
			   						<div class="mod_text pc_version">을 이어주는 사람들 !</div>
			   						<div class="sub_number pc_version">국번없이 <strong class="call_num">123</strong> / 연중무휴 하루 <strong class="call_num">24</strong> 시간</div>
			   						<div class="copy_text_m">
			   							<div class="mod_text">을 이어주는 사람들 !</div>
			   							<div class="sub_number">
				   							<span class="block">국번없이 <strong class="call_num">123</strong></span>
				   							<span class="block">연중무휴 하루 <strong class="call_num">24</strong> 시간</span>
				   						</div>
			   						</div>
			   						<div class="sub_text">
					   					<span>한전 CSC 고객센터는 고객님의 편리한 전기상담을위해 "365일 24시간" 운영하고있습니다.</span>
					   					<span>서비스 개선에 도움이 될 수 있는 의견을 주시면 업무에 적극 반영하도록 노력하겠습니다.</span>
					   				</div>
					   				<div class="foot_link_box clear ">
					   					<div class="foot_link_btn">
						   					<a href="/ft/pa/pa02/list.do" class="clear">
						   						<span>고객서비스헌장 확인하기</span>
						   						<i><img src="/publish/ft/images/main/i_foot_white_arrow.png" alt=""></i>
						   					</a>
					   					</div>
<!--
										<div class="foot_link_btn">
						   					<a href="/ft/cs/cs01/list.do" class="clear">
						   						<span>고객문의 바로가기</span>
						   						<i><img src="/publish/ft/images/main/i_foot_white_arrow.png" alt="" /></i>
						   					</a>
					   					</div>
-->
					   				</div>
			   					</div>
			   				</div>
		   				</div>

		   			</article>
	   			</div>

	   			<section class="footer_info">
					<div class="footer_text_area">
		   				<div class="footer_text clear">
		   					<div class="foot_left">
		    					<ul class="foot_util_link clear">
		    						<li><a href="#dispay_view5" title="팝업창 호출" onclick="view_show(5)">개인정보처리방침</a></li>
		    						<li><a href="/ft/off/ftoff01/list.do">사업소안내</a></li>
		    						<li><a href="/ft/ftbd/ftbd04/list.do">채용정보</a></li>
		    						<li><a href="/ft/cs/cs01/list.do">고객문의</a></li>
		    					</ul>
		   					</div>
		   					<div class="foot_right">
			                    <div class="familysite">
			    					 <div class="footBtn">
			    						<button type="button">계열사 바로가기<span class="arrow"></span></button>
			    						<ul class="family_list" style="">
			    							<li><a href="http://www.kepco.co.kr" target="_blank">한국전력공사(주)</a></li>
												<li><a href="http://www.khnp.co.kr" target="_blank">한국수력원자력(주)</a></li>
		                            			<li><a href="https://www.koenergy.kr" target="_blank">한국남동발전(주)</a></li>
		                            			<li><a href="https://www.komipo.co.kr" target="_blank">한국중부발전(주)</a></li>
		                            			<li><a href="https://www.iwest.co.kr" target="_blank">한국서부발전(주)</a></li>
		                            			<li><a href="http://www.kospo.co.kr/" target="_blank">한국남부발전(주)</a></li>
		                            			<li><a href="http://www.ewp.co.kr" target="_blank">한국동서발전(주)</a></li>
		                            			<li><a href="https://www.kdn.com/" target="_blank">한전KDN(주)</a></li>
		                            			<li><a href="http://www.kopec.co.kr" target="_blank">한국전력기술(주)</a></li>
		                            			<li><a href="http://www.kps.co.kr" target="_blank">한전KPS(주)</a></li>
		                            			<li><a href="http://www.knfc.co.kr/" target="_blank">한전원자력연료(주)</a></li>
		                            			<li><a href="http://www.kepid.co.kr" target="_blank">한전산업개발(주)</a></li>
		                            			<li><a href="http://www.kepcomedi.co.kr" target="_blank">한전병원(주)</a></li>
		                            			<li><a href="http://www.kepcomcs.co.kr" target="_blank">한전MCS(주)</a></li>
		                            			<li><a href="http://www.kepcofms.co.kr" target="_blank">한전FMS(주)</a></li>
			    						</ul>
			    					</div>
			    				</div>
			                </div>

		   				</div>
	   				</div>
	   				<div class="foot_company_area">
		   				<div class="foot_company clear">
		   					<div class="footer_logo">
		   						<img class="pc_version" src="/publish/ft/images/common/img_footer_logo.png" alt="KEPCO Contact Servise &amp; Communication Co..Ltd.">
		   						<img class="m_version" src="/publish/ft/images/common/img_footer_logo_m.png" alt="KEPCO Contact Servise &amp; Communication Co..Ltd.">
		   					</div>
		   					<div class="footer_addr_area">
		    					<address class="footer_addr">
		    						<span class="block">(58217) 전남 나주시 빛가람로 727, <span class="m_block"> &nbsp;&nbsp;7층</span></span>
		    						<span class="block"><span class="m_block">대표전화 : <a href="tel:061-820-8114">061-820-8114</a></span><span class="m_block">팩스 : 061-820-8319</span></span>
		    					</address>
		    					<div class="foot_copy pc_version">COPYRIGHT © 한전CSC. ALL RIGHTS RESERVED.</div>
		   					</div>

		   					<div class="foot_to_top scroll_guide">
		   						<a href="#container">위로</a>
		   					</div>
		   				</div>
		   			</div>
	   			</section>
	   			<div class="foot_copy m_version">COPYRIGHT © 한전CSC. ALL RIGHTS RESERVED.</div>
   				<!--  //footer_info -->

   			</div>
   		</section>
   		<!-- //main_footer -->
    	<canvas id="draw" class="canvas_dots" width="1905" height="911" style="display: block;"></canvas>
  </div>
    <!--// wrapper -->

    <!-- 개인정보처리방침 약관 popup -->
	<div id="dispay_view5" class="popup main_popup js-popup">
	    <div class="pop_header">
	        <h1 class="pop_tit">개인정보처리방침</h1>
	        <a href="javascript:void(0)" onclick="view_hide(5);" class="pop_close"></a>
	    </div>
	    <div class="pop_content">
	        <div class="txt_box">
	        	<p>한전씨에스씨 공개채용 홈페이지는 개인정보 보호법 제 30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원할하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립·공개합니다.</p>
	        </div>
	        <ul class="Policy_list">
	        	<li>제1조 (개인정보 처리목적)
	        		<ul class="Policy_inner_list">
	        			<li class="list">① ‘한전씨에스씨 인사팀’은 「한전에프엠에스 채용 홈페이지」(이하 ‘채용 홈페이지’)회원가입 또는 채용공고에 따른 입사지원의 경우 등에 한해 최소한으로 개인정보를 수집하고 있습니다.</li>
	        			<li class="list">② ‘한전씨에스씨 인사팀’은 개인정보 보호법 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 아래와 같이 개인정보 처리방침을 수립·공개합니다.</li>
	        			<li class="list">③ ‘한전씨에스씨 인사팀’은 정보주체가 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다</li>
	        			<li class="list">④ ‘한전씨에스씨 인사팀’은 개인정보 처리방침을 「한전씨에스씨 채용 홈페이지」 첫 화면에 게재함으로써 정보주체가 용이하게 확인할 수 있도록 조치하고 있습니다. 또한 개인정보 처리방침을 개정하는 경우 버전번호 등을 부여하여 개정된 사항을 정보주체가 쉽게 확인할 수 있도록 하고 있습니다.</li>
	        		</ul>
	        	</li>
	        	<li>제2조 (개인정보의 처리 및 보유기간)
	        		<ul class="Policy_inner_list">
	        			<li class="txt">‘한전씨에스씨 인사팀’은 정보주체로부터 개인정보를 수집시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다. 각각의 개인정보 처리·보유기간은 다음과 같습니다.</li>
	        			<li class="list">1. 채용 홈페이지 회원 가입 및 관리시 : 회원 탈퇴 또는 회원자격 상실시까지</li>
	        			<li class="list">2. 채용공고에 따른 입사지원시 : 전형단계별 합격자 결정시까지</li>
	        		</ul>
	        	</li>
	        	<li>제3조 (처리하는 개인정보 항목)
	        		<ul class="Policy_inner_list">
	        			<li class="txt">‘한전씨에스씨 인사팀’은 다음의 개인정보 항목을 처리하고 있습니다.</li>
	        			<li class="tit">[지원자 등록 시] 필수항목 </li>
	        			<li class="txt">아이디(이메일주소), 비밀번호, 이름, 생년월일, 휴대폰번호</li>
	        			<li class="tit">[지원서 작성 및 공고지원/인재풀 등록 시] 필수항목</li>
	        			<li class="txt">경력사항(입사일, 퇴사일, 회사명, 직급, 담당업무, 직원유형), 자기소개</li>
	        			<li class="tit">선택사항</li>
	        			<li class="list">1) 학력사항(입학일, 졸업일, 졸업유무, 교육기관 이름, 전공, 학점)</li>
	        			<li class="list">2) 자격증정보(발급일, 자격증명칭, 발급기관, 급수)</li>
	        			<li class="list">3) 어학사항(언어, 시험명, 점수/급, 주관, 취득일)</li>
	        			<li class="list">4) 수상경력(수상일, 수상명, 발급기관, 급수)</li>
	        			<li class="list">5) 병역사항(병역구분)</li>
	        			<li class="list">7) 장애사항(장애유형, 장애급수)<br>※ 서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성·수집될 수 있습니다.</li>
	        			<li class="list">○ 방문일시, 서비스 이용기록</li>
	        		</ul>
	        	</li>
	        	<li>제4조 (정보주체의 권리·의무 및 행사방법)
	        		<ul class="Policy_inner_list">
	        			<li class="list">① 정보주체는 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.<br>1. 개인정보 열람요구<br>2. 오류 등이 있을 경우 정정 요구<br>3. 삭제요구<br>4. 처리정지 요구<br></li>
	        			<li class="list">② 제1항에 따른 권리 행사는 ‘한전씨에스씨 인사팀’에 대해 서면, 전화, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 ‘한전씨에스씨 인사팀’은 이에 대해 지체없이 조치하겠습니다.</li>
	        			<li class="list">③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 ‘한전씨에스씨 인사팀’은 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하지 않습니다.</li>
	        			<li class="list">④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</li>
	        			<li class="list">⑤ 정보주체는 개인정보 보호법 등 관계법령을 위반하여 ‘한전씨에스씨 인사팀’이 처리하고 있는 정보주체 본인이나 타인의 개인정보 및 사생활을 침해하여서는 안됩니다.</li>
	        		</ul>
	        	</li>
	        	<li>제5조 (개인정보의 파기절차 및 방법)
	        		<ul class="Policy_inner_list">
	        			<li class="list">① ‘한전씨에스씨 인사팀’은 채용 홈페이지 회원 탈퇴시 또는 채용 전형단계별 합격자 결정시 지체없이 불필요하게 된 개인정보를 복구 또는 재생되지 아니하도록 파기합니다.</li>
	        			<li class="list">② 개인정보의 파기절차 및 방법은 다음과 같습니다.<br>1. 파기절차 : 파기하여야 하는 개인정보에 대해 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br>2. 파기방법 : 전자적 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용하며 종이에 출력된 개인정보는 분쇄기로 분쇄하여 파기합니다.</li>
	        			<li class="list"></li>
	        			<li class="list"></li>
	        		</ul>
	        	</li>
	        	<li>제6조 (개인정보 열람청구)
	        		<ul class="Policy_inner_list">
	        			<li class="list">① 정보주체는 개인정보 보호법 제3조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. ‘한전씨에스씨 인사팀’은 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.</li>
	        			<li class="tit">1. 개인정보 열람청구 접수·처리 부서</li>
	        			<li>
							<div class="tbl_wrap">
								<table class="tbl_Policy">
									<caption>개인정보처리방침 약관 정보</caption>
									<colgroup>
										<col style="width:20%">
										<col style="width:40%">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">한전씨에스씨 <span class="m_block">채용 담당</span></th>
											<th scope="col">한전씨에스씨 <span class="m_block">개인정보보호 담당</span></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">담당부서</th>
											<td>인사팀</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row">이메일</th>
											<td>-</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row">전화</th>
											<td>-</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row">팩스</th>
											<td>-</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row">주소</th>
											<td>-</td>
											<td>-</td>
										</tr>
									</tbody>
								</table>
							</div>
	        			</li>
	        			<li class="list">② 정보주체가 직접 개인정보 열람 및 정정을 하고자 할 경우 채용 홈페이지의 ‘회원정보관리’ 또는 ‘지원서 수정’을 통해 처리하실 수 있습니다. </li>
	        		</ul>
	        	</li>
	        	<li>제7조 (개인정보 위탁처리)
	        		<ul class="Policy_inner_list">
	        			<li class="list">① ‘한전씨에스씨 인사팀’은 서비스 향상을 위해서 정보주체의 개인정보를 외부에 수집, 취급, 관리 등을 위탁하여 처리할 수 있습니다. 1. 개인정보 처리를 위탁하는 경우에는 위탁기관 및 그 사실을 채용 홈페이지를 통해 미리 정보주체에게 고지하겠습니다.</li>
	        			<li class="list">2. 개인정보의 처리를 위탁하는 경우에는 위탁계약 등을 통하여 위탁서비스를 수행하는 자로서의 개인정보보호 관련규정 및 지시사항 엄수, 개인정보에 관한 비밀유지, 제3자 제공의 금지 및 사고시의 책임부담, 위탁기간, 처리 종료 후의 개인정보의 반환 또는 파기 등을 명확히 규정하고 당해 계약내용을 서면 또는 전자적으로 보관하겠습니다.</li>
        			</ul>
	        	</li>
	        	<li>제8조 (개인정보 제공)
	        		<ul class="Policy_inner_list">
	        			<li class="list">① ‘한전씨에스씨 인사팀’은 채용 전형시 필요한 경우 정보주체의 개인정보를 제3자에게 제공할 수 있습니다. 1. 정보주체의 개인정보를 제3자에게 제공하는 경우 사전에 정보주체의 동의를 받으며 제공받는 자 및 제공의 목적, 제공되는 항목, 제공받는 자의 개인정보 보유 및 이용기간, 개인정보 제공을 거부할 권리가 있다는 사실 및 동의 거부에 따른 불이익이 있는 경우 그 불이익의 내용을 정보주체에게 고지하도록 하겠습니다.</li>
	        			<li class="list">② 현재 ‘한전씨에스씨 인사팀’이 채용 과정에서 정보주체의 개인정보를 제3자에게 제공하는 경우는 아래와 같습니다. <br>1. 신원조회 (경찰서)<br>2 신체검사 (외부 전문병원)</li>
        			</ul>
	        	</li>
	        	<li>제9조 (개인정보 안전성 확보조치)
	        		<ul class="Policy_inner_list">
	        			<li class="list">① ‘한전씨에스씨 인사팀’은 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.</li>
	        			<li class="list">1. 개인정보 취급직원의 최소화 및 교육 개인정보를 취급하는 직원은 반드시 필요한 인원에 한하여 지정·관리하고 있으며 취급직원을 대상으로 안전한 관리를 위한 교육을 실시하고 있습니다.</li>
	        			<li class="list">2. 개인정보에 대한 접근 제한 개인정보를 처리하는 채용 홈페이지 시스템에 대한 접근권한의 부여·변경·말소를 통하여 개인정보에 대한 접근통제를 위한 필요한 조치를 하고 있습니다.</li>
	        			<li class="list">3. 접속기록의 보관 채용 홈페이지 시스템에 접속한 기록을 최소 6개월 이상 보관·관리하고 있습니다.</li>
	        			<li class="list">4. 개인정보의 암호화 개인정보는 암호화 등을 통해 안전하게 저장 및 관리되고 있습니다. 또한 중요한 데이터는 저장 및 전송시 암호화하여 사용하는 등의 별도 보안기능을 사용하고 있습니다.</li>
	        			<li class="list">5. 보안프로그램 설치 및 주기적 점검·갱신 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안 프로그램을 설치하고 주기적으로 갱신·점검하고 있습니다.</li>
        			</ul>
	        	</li>
	        	<li>제10조 (개인정보 보호책임자)
	        		<ul class="Policy_inner_list">
	        			<li class="list">① ‘한전씨에스씨 인사팀’은 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 채용관련 개인정보 보호책임자 및 담당자를 지정하고 있습니다.<br>1. 공개채용 개인정보보호 책임자 및 담당자</li>
	        			<li class="list">
	        				<div class="tbl_wrap">
								<table class="tbl_Policy">
									<caption>개인정보처리방침 약관 정보</caption>
									<colgroup>
										<col style="width:20%">
										<col style="width:30%">
										<col style="width:20%">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col" colspan="2">개인정보보호책임자</th>
											<th scope="col" colspan="2">개인정보보호담당자</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">담당부서</th>
											<td>-</td>
											<th scope="row">담당부서</th>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row">성명</th>
											<td>-</td>
											<th scope="row">성명</th>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row">직책</th>
											<td>-</td>
											<th scope="row">직책</th>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row">전화</th>
											<td colspan="3">-</td>
										</tr>
										<tr>
											<th scope="row">팩스</th>
											<td colspan="3">-</td>
										</tr>
										<tr>
											<th scope="row">이메일</th>
											<td colspan="3">-</td>
										</tr>
										<tr>
											<th scope="row">주소</th>
											<td colspan="3">-</td>
										</tr>
									</tbody>
								</table>
							</div>
	        			</li>
	        			<li class="list">② 정보주체께서 ‘한전씨에스씨 인사팀’의 서비스를 이용하시면서 발생한 모든 개인정보 보호관련 문의, 불만처리. 피해구제 등에 관한 사항을 문의하실수 있으며 ‘한전씨에스씨 인사팀’은 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다</li>
        			</ul>
	        	</li>
	        	<li>제11조 (권익침해 구제방법)
	        		<ul class="Policy_inner_list">
	        			<li class="txt">정보주체는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다.아래의 기관은 한전에프엠에스와 별개의 기관으로서, 공개채용 홈페이지의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다.</li>
	        			<li class="list">① 개인정보 침해신고센터(한국인터넷흥원 운영) - 소관업무 : 개인정보 침해사실 신고, 상담 신청 <br>- 홈페이지 : <a href="privacy.kisa.or.kr">privacy.kisa.or.kr</a> <br>- 전화 : (국번없이) 118 <br>- 주소 : (58324) 전남 나주시 진흥길 9(빛가람동 301-2) 3층 개인정보침해신고센터</li>
	        			<li class="list">② 개인정보 분쟁조정위원회 - 소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)<br>- 홈페이지 : <a href="www.kopico.go.kr">www.kopico.go.kr</a><br>- 전화 : (국번없이) 1833-6972<br>- 주소 : (03171)서울특별시 종로구 세종대로 209 정부서울청사 4층</li>
	        			<li class="list">③ 대검찰청 사이버범죄수사단 : (국번없이) 1301 (<a href="www.spo.go.kr">www.spo.go.kr</a>)</li>
	        			<li class="list">④ 경찰청 사이버안전국 : 182 (<a href="http://cyberbureau.police.go.kr">http://cyberbureau.police.go.kr</a>)</li>
        			</ul>
	        	</li>
	        	<li>제12조 (개인정보 처리방침 변경)
	        		<ul class="Policy_inner_list">
	        			<li class="list">① 이 개인정보 처리방침은 2019년 9월 1일에 제정되었으며 정부의 정책 등에 따라 내용의 추가·삭제 및 수정이 있을 시에는 채용 홈페이지를 통해 고지하겠습니다. 개인정보처리방침 버전번호 : v1.0</li>
        			</ul>
	        	</li>
	        </ul>
	    </div>
	</div>
	<div class="popup_bg" id="js-popup-bg"></div>

	
		
	


</body></html>