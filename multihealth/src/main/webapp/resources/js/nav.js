const menutitles=document.querySelectorAll('.menutitle');
const admin=document.querySelector('#admin');
const header=document.querySelector('header');
const nav = document.querySelector('nav');
const mobilebtn = document.querySelector('#mobilebtn');
const check = document.getElementsByName("menuBtn");



//웹상 메뉴 
for(let i = 0; i < menutitles.length; i++)  {
	let windowWidth = window.outerWidth;
    if (windowWidth >720){
		if(menutitles.length==3){
			menutitles[i].style.width = 15+ '%';
		}else{
			menutitles[i].style.width = 12 + '%';
		}
    }
  }
  
nav.addEventListener('mouseover', function(){
	let windowWidth = window.outerWidth;
    if (windowWidth >720) {
		header.style.height='250px';
    }
});
nav.addEventListener('mouseout', function(){
	let windowWidth = window.outerWidth;
    if (windowWidth >720) {
		header.style.height='100px';
    }
});

//모바일 메뉴 
mobilebtn.addEventListener('click', () => {
    let windowWidth = window.outerWidth;
    if (windowWidth <720) {
    	if(header.style.overflow=='hidden'){
    		header.style.overflow='visible';
    	}else{
    		header.style.overflow='hidden'
    		for(let i=0;check.length;i++){
    			if(check[i].checked){
    				check[i].checked = false;
                }
    		}
    		
    	}
    	
    }
});

// modal
var $button         = $('.button'),
    $modalContainer = $('#modal-container'),
    $modal_close    = $('.modal_close'),
    $body           = $('body'),
    $content        = $('.content'),
    btnId;

$button.on('click', function () {
  btnId = $(this).attr('id');
  
  $modalContainer
      .removeAttr('class')
      .addClass(btnId);
  $content
      .removeAttr('class')
      .addClass('content');
  
  $body.addClass('modal-active');
  
  if (btnId == 'two' || btnId == 'three'|| btnId == 'four') {
    $content.addClass(btnId);
  }
  
});

$modal_close.on('click', function () {
	
  $modalContainer.addClass('out');
  $body.removeClass('modal-active');
  if ($(this).hasClass(btnId)) {
    
    $content.addClass('out');
    
  }
});

// 자동 완성
 $("#testText").autocomplete({
 source : function(request, response) {
 
 $.ajax({
 
 url : "/autocomplete",
 type : "post",
 dataType : "json",
 data: request,
 
 success : function(data) {
 
 var result = data;
 response(result);
 },
 
 error : function(data) {
 alert("에러가 발생하였습니다.")
 }
 });
 }
 });
 
 var $btnsubmit      = $('#btnsubmit');
 var $text = $('#testText').val();
$btnsubmit.on('click', function(){
	location.href="http://localhost:8081/productsearch?search="+$('#testText').val();
})