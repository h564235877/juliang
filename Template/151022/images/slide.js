$(document).ready(function () {
	$(function () {
		var len = 3;
		var index = 0;
		var adTimer;
		$('#banner-focus .list').hover(function () {
			clearInterval(adTimer);
		}, function () {
			adTimer = setInterval(function () {
					index++;
					if (index == len) {
						index = 0;
					}
					showImg(index);
				}, 4000);
		}).trigger("mouseleave");
	});
	function showImg(index) {
		var s_li_height = 360;
		$("#banner-focus .list").stop(true, false).animate({
			top : -s_li_height * index + 'px'
		}, 400);
	};
});
