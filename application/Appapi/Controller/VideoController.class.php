<?php
/**
 * 短视频
 */
namespace Appapi\Controller;
use Common\Controller\HomebaseController;
class VideoController extends HomebaseController {

	function index(){       
		$videoid=I("videoid");
		if( !$videoid ){
			$this->assign("reason",'信息错误');
			$this->display(':error');
			exit;
		} 
		$Video=M("users_video");
		$videoinfo=$Video->where("id={$videoid}")->find();
		
		if(!$videoinfo){
			$this->assign("reason",'视频不存在');
			$this->display(':error');
			exit;
		}
		
		$liveinfo=getUserInfo($videoinfo['uid']);
		
		$this->assign("hls",$videoinfo['href']);
		$this->assign("videoinfo",$videoinfo);
		$this->assign("liveinfo",$liveinfo);

		$this->display();
	}
}