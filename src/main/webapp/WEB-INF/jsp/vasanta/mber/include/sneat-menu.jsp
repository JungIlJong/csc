<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="/resources/js/sh-common.js"></script>
<script async src="https://www.googletagmanager.com/gtag/js?id=G-D8LW20DGXL"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());
    gtag('config', 'G-D8LW20DGXL');
</script>

<!-- header -->
<header class="header">
    <div class="gnb_bg"></div>
    <div class="hd-inner">
        <div class="logo">
            <a href="/"><img src="/resources/landing/images/main/mcs_new_logo_230706.png" alt="한전MCS(주)"></a>
        </div>

        <nav id="gnb">
            <ul class="nav-depth_01">
                <c:forEach var="depth1" items="${menuList}">
                    <c:if test="${depth1.gnbAt eq 'Y'}">
                        <li>
                            <a href="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}">
                                <c:out value="${depth1.menuNm}"/>
                            </a>

                            <div class="depth-wrap">
                                <c:forEach var="depth2" items="${depth1.childList}">
                                    <c:choose>
                                        <c:when test="${not empty depth2.childList}">
                                            <ul class="menu-depth_02">
                                                <li>
                                                    <span class="menu-d3-head"><c:out value="${depth2.menuNm}"/></span>
                                                    <ul class="menu-depth_03">
                                                        <c:forEach var="depth3" items="${depth2.childList}">
                                                            <c:set var="depth3Url"
                                                                   value="${depth3.menuTy eq 'DIR' ? (not empty depth3.childList ? depth3.childList[0].url : '#') : depth3.url}" />
                                                            <li <c:if test="${depth3.menuTy eq 'LINK'}">class="safetyreport"</c:if>>
                                                                <a href="${depth3Url}"
                                                                   <c:if test="${depth3.menuTy eq 'LINK'}">target="_blank"</c:if>>
                                                                    <span><c:out value="${depth3.menuNm}"/></span>
                                                                </a>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </c:when>

                                        <c:otherwise>
                                            <ul class="nav-depth_02">
                                                <c:set var="depth2Url"
                                                       value="${depth2.menuTy eq 'DIR' ? (not empty depth2.childList ? depth2.childList[0].url : '#') : depth2.url}" />
                                                <li>
                                                    <a href="${depth2Url}"
                                                       <c:if test="${depth2.menuTy eq 'LINK'}">target="_blank"</c:if>>
                                                        <span><c:out value="${depth2.menuNm}"/></span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
            <div class="indicator"></div>
        </nav>

        <!-- 검색 -->
        <div class="combine_search_box">
            <label for="combine_search" style="display:none;">사이트 전체 검색</label>
            <input id="combine_search" type="text" class="combine_search" name="combine_search" />
            <button id="combine_search_btn" class="combine_search_btn" type="button">
                <img class="combine_search_img" src="/resources/landing/images/main/ico_search.png" alt="사업소 찾기" style="">
            </button>
        </div>

        <div class="btn-menu">
            <span></span>
            <span></span>
        </div>
    </div>

    <div class="overlay-menu-wrap">
        <div class="overlay-menu" id="overlay-menu_id">
            <ul class="menu-depth_01" id="menu-depth_01_id">
                <c:forEach var="depth1" items="${menuList}" varStatus="st1">
    <c:if test="${depth1.gnbAt eq 'Y'}">
        <li <c:if test="${st1.index == 0}">class="visible"</c:if>>
            <span data-menu="${st1.index}">${depth1.menuNm}</span>

            <c:if test="${not empty depth1.childList}">
                <ul class="menu-depth_02 menu-fixed">
                    <c:forEach var="depth2" items="${depth1.childList}">
                        <c:choose>
                            <c:when test="${not empty depth2.childList}">
                                <li>
                                    <span class="menu-d3-head"><c:out value="${depth2.menuNm}"/></span>
                                    <ul class="menu-depth_03">
                                        <c:forEach var="depth3" items="${depth2.childList}">
                                            <c:set var="depth3Url"
                                                value="${depth3.menuTy eq 'DIR' ? 
                                                  (not empty depth3.childList ? depth3.childList[0].url : '#') : depth3.url}" />
                                            <li <c:if test="${depth3.menuTy eq 'LINK'}">class="safetyreport"</c:if>>
                                                <a href="${depth3Url}" <c:if test="${depth3.menuTy eq 'LINK'}">target="_blank"</c:if>>
                                                    <span><c:out value="${depth3.menuNm}"/></span>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:when>

                            <c:otherwise>
                                <c:set var="depth2Url"
                                    value="${depth2.menuTy eq 'DIR' ? 
                                      (not empty depth2.childList ? depth2.childList[0].url : '#') : depth2.url}" />
                                <li>
                                    <a href="${depth2Url}" <c:if test="${depth2.menuTy eq 'LINK'}">target="_blank"</c:if>>
                                        <span><c:out value="${depth2.menuNm}"/></span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </c:if>
        </li>
    </c:if>
</c:forEach>

            </ul>
        </div>

        <div class="overlay-menu-ft">
            <div class="phone-info">
                <p>대표전화</p>
                <p>061·345·9991</p>
            </div>
            <p class="menu-copy">Copyright © 한전MCS. All Rights Reserved.</p>
        </div>
    </div>
</header>

<script>
    $(document).ready(function () {
        var hHeader = $('.header').innerHeight();
        var hGnb = 600;
        $('.gnb_bg').css({'top': $('.header').innerHeight(), 'height': hGnb});
        $('.depth-wrap').css('height', hGnb);

        // 스크롤 이벤트
        $(window).scroll(function(){
            var wintop = $(window).scrollTop();
            if(wintop > 30){
                $(".header").addClass("scroll")
            }else{
                $(".header").removeClass("scroll")
            }
        });

        // gnb hover
        $('.nav-depth_01 > li, .gnb_bg').on({
            'mouseenter focusin': function () {
                if(!$("header").hasClass("overlay")){
                    $(this).addClass('on');
                    $('.header').addClass('open');
                    $("header").addClass("on");
                    $('.gnb_bg').stop().slideDown(350);
                    $('#gnb').stop().animate({height: hHeader + hGnb}, 350);
                }
            },
            'mouseleave focusout': function () {
                if(!$("header").hasClass("overlay")){
                    $(this).removeClass('on');
                    $('.header').removeClass('open');
                    $("header").removeClass("on");
                    $('.gnb_bg').stop().slideUp(350);
                    $('#gnb').stop().animate({height: hHeader}, 350);
                }
            }
        });

        $('.nav-depth_01 > li').on('mouseenter focusin', function () {
            $('.indicator').stop().animate({left: $(this).position().left + 'px'}, 10);
        });

        // 모바일 버튼
        $('.btn-menu').click(function () {
            $('header').toggleClass('overlay');
        });

        // 모바일 depth1 클릭
        $('.menu-depth_01>li>span').click(function () {
            let menuNumber = $(this).attr('data-menu');
            if ($(window).width() <= 960) {
                $('.menu-depth_01 li').removeClass('visible');
                $('.menu-depth_01 li:nth-child(' + menuNumber + ')').addClass('visible')
            }
        });

        $('.menu-d3-head').on('click', function(e) {
            // 클릭 기본 동작 막음 (페이지 튀는거 방지)
            e.preventDefault();

            let $li = $(this).closest('li');

            if ($li.hasClass('open')) {
                $li.removeClass('open');
            } else {
                // 같은 레벨 다른 메뉴는 닫기
                $li.siblings().removeClass('open');
                $li.addClass('open');
            }
        });
        
        // 검색 이벤트
        $('#combine_search_btn').click(function () { combind_search(); });
        $('#combine_search').on("keyup", function (e) { if (e.keyCode == 13) { combind_search(); } });

        function combind_search() {
            var text = $('#combine_search').val().trim().replace(/#/gi, "");
            if (text == "") { alert("검색어를 입력해주세요."); return false; }
            if (text.length < 2) { alert("두글자이상 입력해주세요."); return false; }
            window.open("/pop/search/all/list/" + text, "_blank")
        }
    });
</script>
