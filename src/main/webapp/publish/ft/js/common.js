$(function(){
	response();
	
	$.get("/resources/landing/include/footer.html", function(data) {
	    $("#content").after(data);
	});
});

window.onresize = function() {  
    response();
};


function response(){
    //pc만
     if ($(window).width() > 1199) {
    	 pcMenu();
        pc_gnb();
        familySite();
        //setTimeout('canvasDots()', 2000 );
        scrollGuide();
        bgFix();
        PClocaWidth();
        canvasDots();
        
        if($("#container > div").is(".top_area")){
            subScroll();
        }
        if($("#container div").hasClass("location_area") ){
            subPageAni();
        }
        

    }else{
    //mobile만
        mMenu(); 
        scrollGuide();
        MlocaWidth();
    }    
     
}

//loginbtn
function pcMenu(){
	$('.allmenu_box .depth1 > li').removeClass('open');
	$('.btn_all_menu').click(function(){ 
        $('.allmenu_area').css({'left':'0'});
    }); 
    $('.allmenu_area .btn_close').click(function(){
        $('.allmenu_area').css({'left':'-100%'});
    });
    
    $('.allmenu_box .depth2').css('display','block');
}

//mMenu
function mMenu(){ 
	$('.allmenu_box .depth2').css('display','none');
    $('.allmenu_box .depth1 > li').click(function(){
        $(this).removeClass('open');
        if($(this).hasClass('open')){
        	$(this).removeClass('open'); 
        	$(this).children('.depth2').slideUp();
        }else{
        	$(this).siblings('li').removeClass('open');
        	$(this).siblings('li').children('.depth2').slideUp();
        	$(this).addClass('open');
        	$(this).children('.depth2').slideDown();
        }
    });
    $('.btn_all_menu').click(function(){ 
        $('.allmenu_area').css({'left':'0'});
    }); 
    $('.allmenu_area .btn_close').click(function(){
        $('.allmenu_area').css({'left':'-100%'});
    });
}


// gnb
function pc_gnb(){
  $('.js-gnb .depth2 > li').on({
    'mouseenter focusin':function() {
      $(".js-gnb-bg").stop().animate({"height":"360px"},500);
      $(".js-gnb .depth2").stop().animate({"height":"380px"},500);
      $(".js-gnb .depth2 li").not(this).removeClass("on");
      $(".js-gnb .depth2 li").not(this).children(".gnb_txt").hide();
      $(this).addClass("on");
      $(this).children(".gnb_txt").show();
      //직원전용에 이미지 호버될때 바꾸는것.
      //$(this).find("img").attr('src',$(this).find("img").attr('src').replace('.png','_over.png'));
      //$(".js-gnb .depth2 li").find("depth1_6").css("border","1px solid #000");
      
    },'mouseleave focusout click':function(){
      $(".js-gnb .depth2").stop().animate({"height":"111px"},500);
      $(".js-gnb-bg").stop().animate({"height":"0"},500);
      $(".js-gnb .depth2 li").removeClass("on");
      //$(this).find("img").attr('src',$(this).find("img").attr('src').replace('_over.png','.png'));
    }
  });
  
  //gnb메뉴 고객센터 없을때 크기 조정 li 갯수5개 일때 width 180px로 잡힘.
  var js_length = $('.js-gnb .depth2 > li').length
  	
  	if(js_length <= 5){
  		 $(".js-gnb .depth2 > li").addClass('w180');
  	}else{
  		 $(".js-gnb .depth2 > li").removeClass('w180');
  	}


}


function subPageAni(){
    $(window).on('load',function(){
		setTimeout(function(){
			if($(window).scrollTop() == 0){
				$('html,body').animate({scrollTop:500},400);
			}
		},350);
	});
}

/*subScroll*/

function subScroll(){
	$(window).scroll(function() {
		var $pagenav = $('.top_area'),
			topH = $('#header').height() + $('.sub_visual').height();

		if ($(this).scrollTop() >= topH) {
			$pagenav.addClass('top_fixed');
			$('#content').addClass('top_fixed');
		} else {
			$pagenav.removeClass('top_fixed');
			$('#content').removeClass('top_fixed');
		}
	});
}



function familySite(){
    $(".footBtn button").click(function(){
        $(".family_list").slideToggle("fast", function(){
            $('.footBtn').toggleClass('open');
        });
    });
    $(".family_list a").click(function(){
        if($('.footBtn').hasClass('open')){
            $(".family_list").slideUp("4000");
            $('.footBtn').removeClass('open');
        }
    });
    $('html').click(function(e) {
        if(!$(e.target).parents().hasClass("footBtn")) {
            $(".family_list").slideUp();
            $('.footBtn').removeClass("open");
        }
    });

}

//ie background-attached
function bgFix(){
	if(navigator.userAgent.match(/Trident\/7\./)) {
        $('body').on("mousewheel", function () {
            event.preventDefault();

            var wheelDelta = event.wheelDelta;

            var currentScrollPosition = window.pageYOffset;
            window.scrollTo(0, currentScrollPosition - wheelDelta);
        });

        $('body').keydown(function (e) {

            var currentScrollPosition = window.pageYOffset;

            switch (e.which) {

                case 38: // up
                    e.preventDefault(); // prevent the default action (scroll / move caret)
                    window.scrollTo(0, currentScrollPosition - 10);
                    break;

                case 40: // down
                    e.preventDefault(); // prevent the default action (scroll / move caret)
                    window.scrollTo(0, currentScrollPosition + 10);
                    break;

                default: return; // exit this handler for other keys
            } 
        });
    }
}


/*location width*/
function PClocaWidth(){
	$('.location_2').css('width','calc(100% - 34rem)');
	$('.location_2 .a_list').css('width','');
}

function MlocaWidth(){ 
	$('.location_2 .a_list').each(function(){
		var $this = $(this), 
			sum = 0;
		$('li',$this).each(function(){
			sum += $(this).outerWidth(true); 
		}); 
		$this.css('width',sum + 10);
		var totalWidth = $('.top_area').outerWidth(true);
		var h = $('.i_home').outerWidth(true);
		var f = $('.fake_select').outerWidth(true);
		var l = $('.loca_arrow').outerWidth(true);
		$('.location_2').css('width', totalWidth - h - f - l);
	});
}



/*location position*/ 
function locaPosition(){
	var widthAdd = 0;
	var lengthPreDiv = $('.location_2 .a_list li.on').prevAll().length;
	for(i=0; i < lengthPreDiv; i++){
		widthAdd = widthAdd + parseInt($('.on').siblings().eq(i).width());
	}
	$('.location_2').scrollLeft(widthAdd);
}

jQuery(function($){
    // Common
    var select_root = $('div.fake_select');
    var select_value = $('.my_value');
    var select_a = $('div.fake_select>ul>li>a');
    var select_input = $('div.fake_select>ul>li>input[type=radio]');
    var select_label = $('div.fake_select>ul>li>label');
    // Radio Default Value
    $('div.my_value').each(function(){
        var default_value = $(this).next('.i_list').find('input[checked]').next('label').text();
        $(this).append(default_value);
    });
    // Line
    select_value.bind('focusin',function(){$(this).addClass('outLine');});
    select_value.bind('focusout',function(){$(this).removeClass('outLine');});
    select_input.bind('focusin',function(){$(this).parents('div.fake_select').children('div.my_value').addClass('outLine');});
    select_input.bind('focusout',function(){$(this).parents('div.fake_select').children('div.my_value').removeClass('outLine');});
    // Show
    function show_option(){
        $(this).parents('div.fake_select:first').toggleClass('open');
    }
    // Hover
    function i_hover(){
        $(this).parents('ul:first').children('li').removeClass('hover');
        $(this).parents('li:first').toggleClass('hover');
    }
    // Hide
    function hide_option(){
        var t = $(this);
        setTimeout(function(){
            t.parents('div.fake_select:first').removeClass('open');
        }, 1);
    }
    // Set Input
    function set_label(){
        var v = $(this).next('label').text();
        $(this).parents('ul:first').prev('.my_value').text('').append(v);
        $(this).parents('ul:first').prev('.my_value').addClass('selected');
    }
    // Set Anchor
    function set_anchor(){
        var v = $(this).text();
        $(this).parents('ul:first').prev('.my_value').text('').append(v);
        $(this).parents('ul:first').prev('.my_value').addClass('selected');
    }
    // Anchor Focus Out
    $('*:not("div.fake_select a")').focus(function(){
        $('.a_list').parent('.fake_select').removeClass('open');
    });
    select_value.click(show_option);
    select_root.removeClass('open');
    select_root.mouseleave(function(){$(this).removeClass('open');});
    select_a.click(set_anchor).click(hide_option).focus(i_hover).hover(i_hover);
    select_input.change(set_label).focus(set_label);
    select_label.hover(i_hover).click(hide_option);
});

//스크롤가이드
function scrollGuide(){
		$(".scroll_guide a").click(function(e){
		e.preventDefault();
		$("html,body").animate({scrollTop:$(this.hash).offset().top},1000);
	});
}

const canvasDots = function() {
	  if(!($('canvas').length > 0) || $("canvas").is(":hidden")) return;
	  if(is_mob()) return;
	  const canvas = document.querySelector("canvas"),
	  ctx = canvas.getContext("2d");

	  canvas.width = $(window).width();
	  canvas.height = $(window).height();
	  canvas.style.display = "block";

	  colorDot = "#ffffff",
	  color = "#ffffff";
	  ctx.fillStyle = colorDot;
	  ctx.lineWidth = 0.1;
	  ctx.strokeStyle = color;

	  var mousePosition = {
	      x: 50 * canvas.width / 100,
	      y: 50 * canvas.height / 100
	  };

	  let dots = {
	      nb: 900,
	      distance: 60,
	      d_radius: 100,
	      array: []
	  };
	   setInterval(function(){
	    dots.array = new Array();
	   },30000)

	  function Dot() {
	    this.x = Math.random() * canvas.width;
	    this.y = Math.random() * canvas.height;

	    this.vx = -0.5 + Math.random();
	    this.vy = -0.5 + Math.random();

	    this.radius = Math.random();
	  }

	  Dot.prototype = {
	      create: function() {
	        ctx.beginPath();
	        ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
	        ctx.fill();
	      },

	      animate: function() {
	        for (i = 0; i < dots.nb; i++) {
	          let dot = dots.array[i];

	          if (dot.y < 0 || dot.y > canvas.height) {
	            dot.vx = dot.vx;
	            dot.vy = -dot.vy;
	          } else if (dot.x < 0 || dot.x > canvas.width) {
	            dot.vx = -dot.vx;
	            dot.vy = dot.vy;
	          }
	          dot.x += dot.vx;
	          dot.y += dot.vy;
	        }
	      },

	      line: function() {
	        for (i = 0; i < dots.nb; i++) {
	          for (j = 0; j < dots.nb; j++) {
	            i_dot = dots.array[i];
	            j_dot = dots.array[j];

	            if (
	                i_dot.x - j_dot.x < dots.distance &&
	                i_dot.y - j_dot.y < dots.distance &&
	                i_dot.x - j_dot.x > -dots.distance &&
	                i_dot.y - j_dot.y > -dots.distance
	            ) {
	              if (
	                  i_dot.x - mousePosition.x < dots.d_radius &&
	                  i_dot.y - mousePosition.y < dots.d_radius &&
	                  i_dot.x - mousePosition.x > -dots.d_radius &&
	                  i_dot.y - mousePosition.y > -dots.d_radius
	              ) {
	                ctx.beginPath();
	                ctx.moveTo(i_dot.x, i_dot.y);
	                ctx.lineTo(j_dot.x, j_dot.y);
	                ctx.stroke();
	                ctx.closePath();
	              }
	            }
	          }
	        }
	      }
	  };

	  function createDots() {
	    ctx.clearRect(0, 0, canvas.width, canvas.height);

	    for (i = 0; i < dots.nb; i++) {
	      dots.array.push(new Dot());
	      dot = dots.array[i];

	      dot.create();
	    }

	    dot.line();
	    dot.animate();
	  }


	  window.onmousemove = function(parameter) {
	    mousePosition.x = parameter.pageX;
	    mousePosition.y = parameter.pageY;
	  };
	  mousePosition.x = window.innerWidth / 2;
	  mousePosition.y = window.innerHeight / 2;

	  setInterval(createDots, 1000 / 30);

	};



	//scroll
	function is_mob(){
		return (/Android|iPhone|iPad|iPod|BlackBerry|Windows Phone/i).test(navigator.userAgent || navigator.vendor || window.opera);
	}

	function is_mac(){
		return navigator.platform.indexOf('Mac') > -1;
	}

	function is_chrome(){
		return /Chrome/.test(navigator.userAgent);
	}

	function is_firefox(){
		return /Firefox/.test(navigator.userAgent);
	}

	function smoothScroll(){
		if(is_mob() || is_mac() || is_firefox()) return;
		var $window = $(window);
		if(smoothScroll_passive()){
			window.addEventListener("wheel",smoothScroll_scrolling,{passive: false});
		}else{
			$window.on("mousewheel DOMMouseScroll", smoothScroll_scrolling);
		}
	}

var fncDate = function(){
	var setDate = arguments;
	var getId;
	var fmt = "yy.mm.dd";
	switch (setDate.length) {
		case 1: getId ="#"+setDate[0];break;
		case 2: if(setDate[1] != ''){getId ="#"+setDate[0]+", #"+setDate[1];break;}else{getId ="#"+setDate[0];break;}
		case 3: if(setDate[1] != ''){getId ="#"+setDate[0]+", #"+setDate[1];fmt=setDate[2];break;}else{getId ="#"+setDate[0];fmt=setDate[2];break;}
	}
	
	 var dates = $( getId ).datepicker({
      changeMonth: true,
      changeYear: true,
      showOn: "button",
      buttonImage: "/publish/ft/images/icon_calendar.png",
      buttonImageOnly: true,
      dateFormat : fmt,
      onSelect: function( selectedDate ) {
          var option = this.id == setDate[0] ? "minDate" : "maxDate",
          instance = $( this ).data( "datepicker" ),
          date = (fmt == 'yy.mm' ? new Date(instance.selectedYear, instance.selectedMonth, 1) : $.datepicker.parseDate( $.datepicker._defaults.dateFormat, selectedDate, instance.settings ))
    	  dates.not( this ).datepicker( "option", option, date );
      }
  });
}
	
function isValidEmail(value) {
	var pattern = /^[_a-zA-Z0-9-\.]+@[\.a-zA-Z0-9-]+\.[a-zA-Z]+$/;
	return (pattern.test(value));
}	

function isValidpass(value) {
	var pattern = /^[a-zA-Z0-9_]{8,16}$/;
	return pattern.test(value);
}

//popup
function view_show(num) {
    $("body").addClass("ofHidden"); // css로 body 스크롤 없애기
    var left = (( $(window).width() - $("#dispay_view"+num).width()) / 2 );
    var top = (( $(window).height() - $("#dispay_view"+num).height()) / 2 );
    $("#dispay_view"+num).css({'left':left,'top':top, 'position':'fixed'});
    document.getElementById("dispay_view"+num).style.display = "block";
    document.getElementById("js-popup-bg").style.display = "block";
    return false;
 }
function view_hide(num) {
  $("body").removeClass("ofHidden");
  document.getElementById("dispay_view"+num).style.display = "none";
  document.getElementById("js-popup-bg").style.display = "none";
  return false;
}
 
$(function(){
    $('#js-popup-bg').click(function(){
        $("body").removeClass("ofHidden");
        $('.js-popup').css("display","none");
        $(this).css("display","none");
      });
});		
 
$(function(){
    $('.window_close').click(function(){
        window.open('about:blank', '_self').close();
    })
});
