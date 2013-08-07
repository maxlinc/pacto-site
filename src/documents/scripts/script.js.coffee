$ -> 
	# together with minimal css this ensures no css transitions fire on pageload.
	# from: http://css-tricks.com/transitions-only-after-page-load/
	$("body").removeClass("preload")
