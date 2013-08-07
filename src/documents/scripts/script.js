$(function(){
	//together with minimal css this ensures no css transitions fire on pageload.
	//from: http://css-tricks.com/transitions-only-after-page-load/
	//timeout exists since javascript might run earlier before first transition would be done
	setTimeout(function(){
		$("body").removeClass("preload");
	}, 200);
})

