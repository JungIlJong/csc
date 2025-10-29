<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/jsp/vasanta/include/head.jsp"/>
</head>

<body class="sub_body" data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
	<div id="wrapper">
		<div id="skipnavi">
			<a href="#container">▶본문 바로가기</a>
			<a href="#gnb_area">▶주메뉴 바로가기</a>
		</div>
		<div class="header_area">
	    	<!-- header  -->
	      	<div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/include/sneat-menu.jsp"/></div>
	    </div>
		<!-- //header -->
		<!-- allMenu -->
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
        <!--// header -->     
        
        <!-- container -->
        <div id="container">
	        <!-- sub_visual and location --> 
 <!-- sub_visual and location --> 
<div class="sub_visual">
		<div class="v_zoom bg01 on"></div>
	<div class="sub_visual_box">
		<div>
				<strong>ABOUT CSC</strong>
				KEPCO Contact service &amp; Communication Co., Ltd.
		</div>
	</div>
</div>
<div class="top_area">
	<div class="location_area">
		<!-- loaction -->
		<div class="clear">
			<a href="/ft/main.do" class="i_home"></a>
			<div class="fake_select">
				<button type="button" class="my_value">회사소개</button>
				<ul class="a_list">
					
						<li><a href="/ft/pr/pr01/list.do">회사소개</a></li>
					
						<li><a href="/ft/pa/pa01/list.do">사업분야</a></li>
					
						<li><a href="/ft/off/ftoff01/list.do">사업소 현황</a></li>
					
						<li><a href="/ft/ftbd/ftbd01/list.do">한전CSC소식</a></li>
					
						<li><a href="/ft/mem/not/list.do">직원전용</a></li>
							
				</ul>
			</div>
			<div class="fake_select">
				<button type="button" class="my_value">CEO인사말</button>
				<ul class="a_list">
					
							<li><a href="/ft/pr/pr01/list.do">CEO인사말</a></li>
							<li><a href="/ft/pr/pr02/list.do">회사연혁</a></li>
							<li><a href="/ft/pr/pr05/list.do">CI</a></li>
						
							<li><a href="/ft/pr/pr03/list.do">조직도</a></li>
							<li><a href="/ft/pr/pr06/list.do">경영방침</a></li>
							<li><a href="/ft/pr/pr04/list.do">찾아오시는길</a></li>
			</div>
		</div>
	</div>
</div>
			<div id="content">

<script type="text/javascript">
$(document).ready(function(){
	
	if("pr01" != "cs01"){
		var menuUrl = new Array();
		var menuName = new Array();

		var menuIdx = 0;
		var nowIdx = 0;
				menuUrl[menuIdx] = "/ft/pr/pr01/list.do";
				menuName[menuIdx] = "CEO인사말";
				
				nowIdx = menuIdx; 
				
				menuIdx = menuIdx + 1;
			
				menuUrl[menuIdx] = "/ft/pr/pr02/list.do";
				menuName[menuIdx] = "회사연혁";
				
				menuIdx = menuIdx + 1;
				menuUrl[menuIdx] = "/ft/pr/pr05/list.do";
				menuName[menuIdx] = "CI";
				
				menuIdx = menuIdx + 1;
				menuUrl[menuIdx] = "/ft/pr/pr03/list.do";
				menuName[menuIdx] = "조직도";
				
				menuIdx = menuIdx + 1;
				menuUrl[menuIdx] = "/ft/pr/pr06/list.do";
				menuName[menuIdx] = "경영방침";
				
				menuIdx = menuIdx + 1;
				menuUrl[menuIdx] = "/ft/pr/pr04/list.do";
				menuName[menuIdx] = "찾아오시는길";
				menuIdx = menuIdx + 1;
		
		menuIdx = menuIdx - 1;
		
		if(nowIdx != 0){
			var pUrl = menuUrl[nowIdx - 1];
	    	var pText = menuName[nowIdx - 1];
	    	$("#prevMn").attr('href', pUrl);
	    	$("#prevMn").html(pText);
		} else {
			$("#prevMn").attr('href', 'javascript:void(0)');
	    	$("#prevMn").hide();
		}
		
		if(nowIdx != menuIdx){
			var nUrl = menuUrl[nowIdx + 1];
	    	var nText = menuName[nowIdx + 1];
	    	$("#nextMn").attr('href', nUrl);
	    	$("#nextMn").html(nText);
		} else {
			$("#nextMn").attr('href', 'javascript:void(0)');
	    	$("#nextMn").hide();
		}
	} else {
		$("#prevMn").attr('href', 'javascript:void(0)');
    	$("#prevMn").hide();
    	$("#nextMn").attr('href', 'javascript:void(0)');
    	$("#nextMn").hide();
	}
	
});
</script>

<header class="sub_tit_area">
	<div class="sub_tit_box">
		<a href="javascript:void(0)" class="sub_prev" id="prevMn" style="display: none;"></a>
		<h2 class="sub_tit on">CEO인사말</h2>
		<a href="/ft/pr/pr02/list.do" class="sub_next" id="nextMn">회사연혁</a>
	</div>
</header>
<script type="text/javascript">
$(document).ready(function(){
	AOS.init({
		 once: false
	});
});
</script>

<!-- content --> 
<div id="content" class="hello_cont">
	<div class="sub_content_box">
		<div class="bg_hello clear">
			<div class="hello aos-init aos-animate" data-aos="fade-left" data-aos-offset="300" data-aos-easing="ease-in-sine" data-aos-duration="1000">
				<h2 class="sub_con_tit hello_tit">
					<span class="meseage_tit">CEO MESSAGE</span>
					<span class="sub_txt pc_version" style="line-height: 1.4;">한전CSC(주)는 한국전력공사의 자회사이며<br>전기사용 고객의 편의 제고를 위해 <b>365</b>일 <b>24</b>시간 전기상담을 지원하는<br>전기상담 종합 솔루션 제공 기업입니다. </span>
					<span class="sub_txt m_version">
						<span class="block">한전CSC(주)는 한국전력공사의 자회사이며</span>
						<span class="block">전기사용 고객의 편의 제고를 위해</span>
						<span class="block"><b>365</b>일 <b>24</b>시간 전기상담을 지원하는 전기상담 종합 솔루션 제공 기업입니다.</span>
					</span>
				</h2>
				<div class="hello_txt">
					<div class="m_hello_txt"> 
						<h3 class="tit pc_version">
							<span>안녕하십니까?</span>
							<span>한전CSC(주) 대표이사 박상서입니다.</span>
						</h3>
						
						<h3 class="tit m_version">
							<span class="block">안녕하십니까?</span>
							<span class="block">한전CSC(주) 대표이사 박상서입니다.</span>
						</h3>
						
						<div class="hello_char_box">
						<div class="hello_char">
							<p>한전CSC(주)는 한전이 보유한 고객 정보를 기반으로 고객께 신속한 전기상담 서비스를 지원하고 있으며, 4차 산업혁명 등 변화하는 시대 흐름 속에서 디지털 기반 상담 인프라 고도화를 통해 고객께 더 가까이 다가설 수 있도록 노력하고 있습니다.</p>
							<p>또한, <strong>고객의 접근성 향상</strong>을 추구하고 <strong>서비스 혁신</strong>을 통해 <strong>국민의 전기 사용 편익 제공</strong>을 위해 힘쓰고 있습니다.</p>
							<p>한전CSC(주)는 한국전력의 고객서비스 창구로써, 모회사 한전과 지속적인 협업을 통해 <strong>고객 한분 한분의 목소리를 경청</strong>하여 <strong>전기사용 환경 개선에 이바지</strong>하고 있습니다. </p>
							<p>한전CSC(주) 임직원은 공공성 · 청렴윤리를 내재화하여 <strong>고객이 믿고 신뢰할 수 있는 기업, 고객에게 서비스 만족과 감동을 제공하는 기업</strong>이 될 수 있도록 최선을 다할 것을 약속드립니다. 감사합니다. </p>
							<span class="ceo">한전CSC(주) 대표이사<span class="sign"></span></span> 
						</div>
					</div>
					</div>
			</div>
			</div>
			<div class="hello_img aos-init aos-animate" data-aos="fade-right" data-aos-easing="ease-in-sine" data-aos-delay="300" data-aos-duration="1000">
				<img src="/publish/ft/images/sub/img_hello_ceo_03.png" alt="" class="pc_version">  
			</div>
			<div class="m_hello_img">
				<div class="hello_img aos-init aos-animate" data-aos="fade-right" data-aos-easing="ease-in-sine" data-aos-delay="300" data-aos-duration="1000">
					<img src="/publish/ft/images/sub/img_hello_ceo_03.png" alt="">  
				</div>
			</div>
		</div>
	</div> <!--  //sub_content_box  -->
</div>
<!--// content -->
			</div>
			
			<!--// contents e -->      
			
<!-- 페이지 스크롤시 페이드인 효과 하위 위치 필수  -->
<link rel="stylesheet" href="/publish/ft/css/aos.css">
<script type="text/javascript" src="/publish/ft/js/aos.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		$(".v_zoom").addClass('on');
		$(".sub_tit").addClass('on');
		AOS.init({
			 once: false
		});		
	});
</script> 
</body>
</html>
