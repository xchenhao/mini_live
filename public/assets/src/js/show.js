$("#play").click(function() {
	try {
		video.play();
	} catch (e) {
		//TODO handle the exception
		alert('播放失败,请刷新重试');
	}
});

function video_position() {
	console.log('video_position')
	setTimeout(function() {
		var lheight = $("#video").parent().height();
		var lwidth = $("#video").parent().width();
		$("#video").css("width", lwidth);
		var _height_ = 0;
		try {
			_height_ = (lheight - $("#video").height()) / 2;
		} catch (e) {
			console.log(e)
		}

		if (_height_ > 0) {
			$("#video").css("margin-top", _height_);
		}
		$("#video").css("max-width", lwidth);
		$("#video").css("max-height", lheight - 34);
		//播放按钮位置
		var _left_ = (lwidth - 81) / 2;
		var _top_ = (lheight - 81) / 2;
		$("#play").css("left", _left_);
		$("#play").css("top", _top_);
	}, 0.1 * 1000);
}

function video_play() {
	setTimeout(function() {
		video.play();
	}, 3 * 1000);
}
var video = document.getElementById('video');
// video.oncontextmenu = function() {
// 	return false;
// }
if (Hls.isSupported()) {
	var video = document.getElementById('video');

	video.addEventListener("playing", function() {
		console.log('video is playing');
		$("#play").addClass("playing");
		$("#play").removeClass("seeking");
		$("#play").removeClass("pausing");
		$("#play").hide();
		$("#loading-box").hide();
		video_position();
	});
	video.addEventListener("seeking", function() {
		console.log('video is seeking');
		$("#play").addClass("seeking");
		$("#play").removeClass("playing");
		$("#play").removeClass("pausing");
		$("#play").show();
		$("#loading-box").text('拼命缓冲中...');
		$("#loading-box").show();
	});
	video.addEventListener("pause", function() {
		console.log('video is pause');
		$("#play").addClass("pausing");
		$("#play").removeClass("playing");
		$("#play").removeClass("seeking");
		$("#loading-box").text('');
		$("#loading-box").show();
		$("#play").show();
	});

	//实例化Hls
	var config = {
		debug: false
	}
	console.log('hls:', 'supported');
	var hls = new Hls(config);
	//bind
	hls.attachMedia(video);
	hls.on(Hls.Events.MEDIA_ATTACHED, function() {
		console.log('hls events:', 'MEDIA_ATTACHED, ');
		//加载资源
		hls.loadSource(pull);
		
		console.log('url:', hls.url);
		hls.on(Hls.Events.MANIFEST_PARSED, function() {
			//加载资源完毕
			console.log('hls events:', 'MANIFEST_PARSED, ');
			//开始播放
			console.log('hls events:', 'start play...');
			video.play();
			video_play();
		});
	});

	//error
	hls.on(Hls.Events.ERROR, function(event, data) {
		var errorType = data.type;
		var errorDetails = data.details;
		var errorFatal = data.fatal;
		console.log(errorType, errorDetails, errorFatal);
		if (errorFatal) {
			switch (errorFatal) {
				case Hls.ErrorTypes.NETWORK_ERROR:
					// try to recover network error
					console.log("fatal network error encountered, try to recover");
					$("#loading-box").text('拼命加载中...');
					$("#loading-box").show();
					hls.startLoad();
					break;
				case Hls.ErrorTypes.MEDIA_ERROR:
					console.log("fatal media error encountered, try to recover");
					hls.recoverMediaError();
					break;
				default:
					// cannot recover
					console.log("cannot recover, try to destroy");
					$("#loading-box").text('加载失败, 请刷新重试...');
					$("#loading-box").show();
					hls.destroy();
					break;
			}
		}
	});
} else if (video.canPlayType('application/vnd.apple.mpegurl')) {
	console.log('hls:', 'canPlayType');
	video.src = '{$pull}';
	video.addEventListener('loadedmetadata', function() {
		console.log('hls:', 'add event listener loadedmetadata, ', 'start play...');
		$("#loading-box").hide();
		video.play();
		video_play();
	});
}




