<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<header id="header">
    <div class="gnb_bg js-gnb-bg"></div>
    <div class="header_box">
        <h1 class="logo"><a href="/">한전CSC(주)</a></h1>

        <div class="util_right clear">
            <a href="/ft/login.do" class="util_login"></a>
        </div>

        <div id="gnb_area">
            <nav class="gnb js-gnb">
                <ul class="depth2 clear">
                    <c:forEach var="depth1" items="${menuList}">
                        <c:if test="${depth1.gnbAt eq 'Y'}">
                            <li class="depth1_${depth1.menuId} w180">
                                <a href="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}">
                                    <span><c:out value="${depth1.menuNm}"/></span>
                                </a>

                                <div class="gnb_txt">
                                    <strong><c:out value="${depth1.menuNm}"/></strong>
                                    <span class="eng"><c:out value="${depth1.menuSj}"/></span>
                                    <div class="gnb_ect_txt">
                                        <span class="tit">빛을 이어주는 사람들</span>
                                        <span class="txt">고객과 함께 새로운 도약을 합니다.</span>
                                    </div>
                                </div>
                                <c:if test="${not empty depth1.childList}">
                                    <div class="depthBox">
                                        <ul>
                                            <c:forEach var="depth2" items="${depth1.childList}">
                                                <li>
                                                    <a href="${depth2.menuTy eq 'DIR' 
                                                        ? (not empty depth2.childList ? depth2.childList[0].url : '#') 
                                                        : depth2.url}">
                                                        <span><c:out value="${depth2.menuNm}"/></span>
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </c:if>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </nav>
        </div>

        <a href="#" class="btn_all_menu" onclick="return false;">
            <span><img src="/publish/ft/images/main/btn_main_allmenu.png" alt="전체메뉴"></span>
        </a>
    </div>
</header>

<script>
$(document).ready(function() {
    var $header = $('#header');
    var hHeader = $header.innerHeight();
    var hGnb = 600;

    $('.gnb_bg').css({'top': hHeader, 'height': hGnb});

    // GNB hover
    $('.gnb .depth1_1, .gnb_bg').on({
        'mouseenter focusin': function() {
            $(this).addClass('on');
            $header.addClass('open');
            $('.gnb_bg').stop().slideDown(350);
        },
        'mouseleave focusout': function() {
            $(this).removeClass('on');
            $header.removeClass('open');
            $('.gnb_bg').stop().slideUp(350);
        }
    });

    // 스크롤 이벤트
    $(window).scroll(function(){
        var wintop = $(window).scrollTop();
        if(wintop > 30){
            $header.addClass("scroll");
        } else {
            $header.removeClass("scroll");
        }
    });
});
</script>
