<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace Portal\Controller;
use Common\Controller\HomebaseController;
class PageController extends HomebaseController{
	public function index() {
		$id=$_GET['id'];
		$content=sp_sql_page($id);
		
		if(empty($content)){
		    header('HTTP/1.1 404 Not Found');
		    header('Status:404 Not Found');
		    if(sp_template_file_exists(MODULE_NAME."/404")){
		        $this->display(":404");
		    }
		     
		    return ;
		}
		
		$this->assign($content);
		$smeta=json_decode($content['smeta'],true);
		$tplname=isset($smeta['template'])?$smeta['template']:"";
		
		$tplname=sp_get_apphome_tpl($tplname, "page");
		
		$this->display(":$tplname");
	}
	
	public function nav_index(){
		$navcatname="页面";
		$datas=sp_sql_pages("field:id,post_title;");
		$navrule=array(
				"action"=>"Page/index",
				"param"=>array(
						"id"=>"id"
				),
				"label"=>"post_title");
		exit( sp_get_nav4admin($navcatname,$datas,$navrule) );
	}
	
	public function lists() {
		$page=M("posts")->field("id,post_title")->order("orderno asc")->select();
		$this->assign("title","新闻资讯");
		$this->assign("page",$page);
		$this->display();
	}	
	
	public function news() {
		$id=$_GET['id'];
		$news=M("posts")->field("post_title,post_content")->where("id='$id'")->find();
		$this->assign("title",$news["post_title"]);
		$this->assign("news",$news);
		$this->display();
		
	}		
	
	//回放页面
	public function record(){
		$id=$_GET['id'];
		$anchorinfo=getUserInfo($id);
		$this->assign("title", "精彩回放");
		$this->assign("isplay", 1);
		$this->assign("url", '/public/video/'.$id.'.mp4');
		$this->assign("anchorinfo", $anchorinfo);
		$this->display();
	}
	
	//音乐页面
	public function music(){
		$this->assign("title", "音乐欣赏");
		$this->display();
	}
	
	public function start_live(){
		$uid=$_GET['uid'];
		$pull=$_GET['pull'];
		$error = null;
		//获取用户
		if(M("users")->where("id='{$uid}'")->count("*") > 0){
			$user = M("users")->where("id='{$uid}'")->select();
			$avatar_thumb = $user[0]['avatar_thumb'];
			$user_nicename = $user[0]['user_nicename'];
			$data = array(
				"uid"=>$uid,
				"showid" => time(),
				"stream" => $uid,
				"islive" => 1,
				"pull" => $pull,
				"avatar" => $avatar_thumb,
				"avatar_thumb" => $avatar_thumb,
				"user_nicename" => $user_nicename,
			);
		}else{
			$error = "用户不存在";
			echo '[{"code":"100001"}]';
		}
		//判断是否存在直播数据
		if(M("users_live")->where("uid='{$uid}'")->count("*") > 0){
			M("users_live")->where("uid='{$uid}'")->save($data);
		}else{
			$User = M("users_live");
			$User->add($data);
		}
		//
		echo '[{"code":"0"}]';
		// $this->assign("error",$error);
		// $this->assign("uid",$uid);
		// $this->display();
		
	}
	
	public function stop_live(){
		$uid=$_GET['uid'];
		M("users_live")->where("uid='{$uid}'")->save( array("islive"=>0) );
		echo '[{"code":"0"}]';
		// $this->assign("uid",$uid);
		// $this->display();
	}
}