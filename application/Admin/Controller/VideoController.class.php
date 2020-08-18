<?php

/**
 * 短视频
 */
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class VideoController extends AdminbaseController {
    function index(){
		$map['isdel']=0;
		if($_REQUEST['keyword']!=''){
			$map['uid|id']=array("eq",$_REQUEST['keyword']); 
			$_GET['keyword']=$_REQUEST['keyword'];
		}		
			
			
    	$video_model=M("users_video");
    	$count=$video_model->where($map)->count();
    	$page = $this->page($count, 20);
    	$lists = $video_model
			->where($map)
			->order("addtime DESC")
			->limit($page->firstRow . ',' . $page->listRows)
			->select();
		foreach($lists as $k=>$v){
			$userinfo=getUserInfo($v['uid']);
			if(!$userinfo){
				$userinfo=array(
					'user_nicename'=>'已删除'
				);
			}
			$lists[$k]['userinfo']=$userinfo;
		}
    	$this->assign('lists', $lists);
    	$this->assign("page", $page->show('Admin'));
    	
    	$this->display();
    }
		
	function del(){
		$id=intval($_GET['id']);
		if($id){
			$result=M("users_video")->where("id={$id}")->setField("isdel",1);				
			if($result!==false){
				$this->success('删除成功');
			}else{
				$this->error('删除失败');
			}			
		}else{				
			$this->error('数据传入失败！');
		}								  
		$this->display();				
	}		
    //排序
    public function listorders() { 
		
        $ids = $_POST['listorders'];
        foreach ($ids as $key => $r) {
            $data['orderno'] = $r;
            M("users_video")->where(array('id' => $key))->save($data);
        }
				
        $status = true;
        if ($status) {
            $this->success("排序更新成功！");
        } else {
            $this->error("排序更新失败！");
        }
    }	
    

	function add(){
		$this->display();				
	}	
	function add_post(){
		if(IS_POST){			
			$video=M("users_video");
			$video->create();
			$video->addtime=time();
			$result=$video->add(); 
			if($result){
				$this->success('添加成功');
			}else{
				$this->error('添加失败');
			}
		}			
	}		
	function edit(){
		$id=intval($_GET['id']);
		if($id){
			$video=M("users_video")->where("id={$id}")->find();
			
			$userinfo=getUserInfo($video['uid']);
			if(!$userinfo){
				$userinfo=array(
					'user_nicename'=>'已删除'
				);
			}
			$video['userinfo']=$userinfo;
			$this->assign('video', $video);						
		}else{				
			$this->error('数据传入失败！');
		}								  
		$this->display();				
	}
	
	function edit_post(){
		if(IS_POST){			
			$user=M("users_video");
			$user->create();
			$result=$user->save(); 
			if($result!==false){
				  $this->success('修改成功');
			 }else{
				  $this->error('修改失败');
			 }
		}			
	}
	
    function index2(){

		if($_REQUEST['status']!=''){
			$map['status']=$_REQUEST['status'];
			$_GET['status']=$_REQUEST['status'];
		}
		if($_REQUEST['start_time']!=''){
			$map['addtime']=array("gt",strtotime($_REQUEST['start_time']));
			$_GET['start_time']=$_REQUEST['start_time'];
		}

		if($_REQUEST['end_time']!=''){
		 
			$map['addtime']=array("lt",strtotime($_REQUEST['end_time']));
			$_GET['end_time']=$_REQUEST['end_time'];
		}
		if($_REQUEST['start_time']!='' && $_REQUEST['end_time']!='' ){
		 
			$map['addtime']=array("between",array(strtotime($_REQUEST['start_time']),strtotime($_REQUEST['end_time'])));
			$_GET['start_time']=$_REQUEST['start_time'];
			$_GET['end_time']=$_REQUEST['end_time'];
		}

		if($_REQUEST['keyword']!=''){
			$map['uid']=array("like","%".$_REQUEST['keyword']."%"); 
			$_GET['keyword']=$_REQUEST['keyword'];
		}		
			
    	$Report=M("users_video_report");
    	$Users=M("users");
    	$count=$Report->where($map)->count();
    	$page = $this->page($count, 20);
    	$lists = $Report
			->where($map)
			->order("addtime DESC")
			->limit($page->firstRow . ',' . $page->listRows)
			->select();
			
		foreach($lists as $k=>$v){
			$userinfo=$Users->field("user_nicename")->where("id='{$v[uid]}'")->find();
			if(!$userinfo){
				$userinfo=array(
					'user_nicename'=>'已删除'
				);
			}
			$lists[$k]['userinfo']= $userinfo;
			$touserinfo=$Users->field("user_nicename")->where("id='{$v[touid]}'")->find();
			if(!$touserinfo){
				$touserinfo=array(
					'user_nicename'=>'已删除'
				);
			}
			$lists[$k]['touserinfo']= $touserinfo;
		}			
			
    	$this->assign('lists', $lists);
    	$this->assign('formget', $_GET);
    	$this->assign("page", $page->show('Admin'));
    	
    	$this->display();
    }
		
	function setstatus(){
		$id=intval($_GET['id']);
		if($id){
			$data['status']=1;
			$data['uptime']=time();
			$result=M("users_video_report")->where("id='{$id}'")->save($data);				
			if($result!==false){
				$this->success('标记成功');
			}else{
				$this->error('标记失败');
			}			
		}else{				
			$this->error('数据传入失败！');
		}								  		
	}		
	
	function report_del(){
		$id=intval($_GET['id']);
		if($id){
			$result=M("users_video_report")->delete($id);				
			if($result){
				$this->success('删除成功');
			}else{
				$this->error('删除失败');
			}			
		}else{				
			$this->error('数据传入失败！');
		}								  
	}		
}
