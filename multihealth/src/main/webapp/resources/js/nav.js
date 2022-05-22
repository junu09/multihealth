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

function modalOpen() {
    document.querySelector('.modal_wrap').style.display = 'block';
}

// 모달 끄기
function modalClose() {
    document.querySelector('.modal_wrap').style.display = 'none';
}


//버튼 클릭리스너 달기
document.querySelector('#modal_btn').addEventListener('click', modalOpen);
document.querySelector('.modal_close').addEventListener('click', modalClose);