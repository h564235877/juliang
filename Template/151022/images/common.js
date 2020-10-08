$(document).ready(function(){ 
	var _gotop = $("#gotop");
	$(window).scroll(function(){
		if($(document).scrollTop()>200){
			_gotop.show();
		}else{
			_gotop.hide();
		}
	}).scroll();
});

