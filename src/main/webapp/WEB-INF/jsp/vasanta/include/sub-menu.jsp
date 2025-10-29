<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="clear subnav">
    <a href="/" class="i_home"></a>

	<c:set var="depth1Name" value="" />
	<c:set var="depth2Name" value="" />
	
	<c:forEach var="depth1" items="${menuList}">
		<c:if test="${upperMenuId eq depth1.menuId}">
	     <c:set var="depth1Name" value="${depth1.menuNm}" />
		</c:if>
		
	    <c:forEach var="depth2" items="${depth1.childList}">
	        <c:if test="${fn:contains(requestUri, depth2.url)}">
	            <c:set var="depth2Name" value="${depth2.menuNm}" />
	        </c:if>
	    </c:forEach>
	</c:forEach>
	
    <!-- 1단계 메뉴 -->
    <div class="fake_select js-fake-select">
        <button type="button" class="my_value">
            <c:out value="${depth1Name}" />
        </button>
        <ul class="a_list">
            <c:forEach var="depth1" items="${menuList}">
                <c:if test="${depth1.gnbAt eq 'Y'}">
                    <li>
                        <a href="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}">
                            <c:out value="${depth1.menuNm}" />
                        </a>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>

    <!-- 2단계 메뉴 -->
    <div class="fake_select js-fake-select">
        <button type="button" class="my_value">
            <c:out value="${depth2Name}" />
        </button>
        <ul class="a_list">
            <c:forEach var="depth1" items="${menuList}">
                <c:if test="${depth1.menuNm eq depth1Name}">
                    <c:forEach var="depth2" items="${depth1.childList}">
                        <li>
                            <a href="${depth2.menuTy eq 'DIR' ? depth2.firstMatchUrl : depth2.url}">
                                <c:out value="${depth2.menuNm}" />
                            </a>
                        </li>
                    </c:forEach>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>

<script>
$(function($){
  $(window).on('load', function(){
    var currentUrl = '${requestUri}';
    var $depth2 = $('.fake_select').eq(1).find('ul.a_list li a');
    var prevUrl = '', prevName = '';
    var nextUrl = '', nextName = '';

    $depth2.each(function(i){
        var href = $(this).attr('href');
        if (currentUrl.indexOf(href) !== -1) {
            if (i > 0) {
                prevUrl = $depth2.eq(i-1).attr('href');
                prevName = $depth2.eq(i-1).text();
            }
            if (i < $depth2.length - 1) {
                nextUrl = $depth2.eq(i+1).attr('href');
                nextName = $depth2.eq(i+1).text();
            }
        }
    });

    if (prevUrl) {
        $('#prevMn').attr('href', prevUrl).text(prevName).show();
    } else {
        $('#prevMn').hide();
    }

    if (nextUrl) {
        $('#nextMn').attr('href', nextUrl).text(nextName).show();
    } else {
        $('#nextMn').hide();
    }
  });
});
</script>
