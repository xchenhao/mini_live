<?php

class Model_Video extends Model_Common {
	/* 发布视频 */
	public function setVideo($data) {
		$result= DI()->notorm->users_video->insert($data);
		return $result;
	}	

	/* 评论/回复 */
    public function setComment($data) {
    	$videoid=$data['videoid'];

		/* 更新 视频 */
		DI()->notorm->users_video
            ->where("id = '{$videoid}'")
		 	->update( array('comments' => new NotORM_Literal("comments + 1") ) );
		
        DI()->notorm->users_video_comments
            ->insert($data);
			
		$videoinfo=DI()->notorm->users_video
					->select("comments")
					->where('id=?',$videoid)
					->fetchOne();
					
		$count=DI()->notorm->users_video_comments
					->where("commentid='{$data['commentid']}'")
					->count();
		$rs=array(
			'comments'=>$videoinfo['comments'],
			'replys'=>$count,
		);
			
		return $rs;	
    }			

	/* 阅读 */
	public function addView($uid,$videoid){
		$view=DI()->notorm->users_video_view
						->select("id")
						->where("uid='{$uid}' and videoid='{$videoid}'")
						->fetchOne();
		if(!$view){
			DI()->notorm->users_video_view
						->insert(array("uid"=>$uid,"videoid"=>$videoid,"addtime"=>time() ));
						
			DI()->notorm->users_video
				->where("id = '{$videoid}'")
				->update( array('view' => new NotORM_Literal("view + 1") ) );
		}
		return 0;
	}
	/* 点赞 */
	public function addLike($uid,$videoid){
		$rs=array(
			'islike'=>'0',
			'likes'=>'0',
		);
		$like=DI()->notorm->users_video_like
						->select("id")
						->where("uid='{$uid}' and videoid='{$videoid}'")
						->fetchOne();
		if($like){
			DI()->notorm->users_video_like
						->where("uid='{$uid}' and videoid='{$videoid}'")
						->delete();
			
			DI()->notorm->users_video
				->where("id = '{$videoid}' and likes>0")
				->update( array('likes' => new NotORM_Literal("likes - 1") ) );
			$rs['islike']='0';
		}else{
			DI()->notorm->users_video_like
						->insert(array("uid"=>$uid,"videoid"=>$videoid,"addtime"=>time() ));
			
			DI()->notorm->users_video
				->where("id = '{$videoid}'")
				->update( array('likes' => new NotORM_Literal("likes + 1") ) );
			$rs['islike']='1';
		}	
		
		$video=DI()->notorm->users_video
				->select("likes")
				->where("id = '{$videoid}'")
				->fetchOne();
		$rs['likes']=$video['likes'];
		return $rs; 		
	}

	/* 踩 */
	public function addStep($uid,$videoid){
		$rs=array(
			'isstep'=>'0',
			'steps'=>'0',
		);
		$like=DI()->notorm->users_video_step
						->select("id")
						->where("uid='{$uid}' and videoid='{$videoid}'")
						->fetchOne();
		if($like){
			DI()->notorm->users_video_step
						->where("uid='{$uid}' and videoid='{$videoid}'")
						->delete();
			
			DI()->notorm->users_video
				->where("id = '{$videoid}' and steps>0")
				->update( array('steps' => new NotORM_Literal("steps - 1") ) );
			$rs['isstep']='0';
		}else{
			DI()->notorm->users_video_step
						->insert(array("uid"=>$uid,"videoid"=>$videoid,"addtime"=>time() ));
			
			DI()->notorm->users_video
				->where("id = '{$videoid}'")
				->update( array('steps' => new NotORM_Literal("steps + 1") ) );
			$rs['isstep']='1';
		}	
		
		$video=DI()->notorm->users_video
				->select("steps")
				->where("id = '{$videoid}'")
				->fetchOne();
		$rs['steps']=$video['steps'];
		return $rs; 		
	}

	/* 分享 */
	public function addShare($uid,$videoid){
		$rs=array(
			'isshare'=>'0',
			'shares'=>'0',
		);
		DI()->notorm->users_video
			->where("id = '{$videoid}'")
			->update( array('shares' => new NotORM_Literal("shares + 1") ) );
		$rs['isshare']='1';

		
		$video=DI()->notorm->users_video
				->select("shares")
				->where("id = '{$videoid}'")
				->fetchOne();
		$rs['shares']=$video['shares'];
		return $rs; 		
	}

	/* 拉黑视频 */
	public function setBlack($uid,$videoid){
		$rs=array(
			'isblack'=>'0',
		);
		$like=DI()->notorm->users_video_black
						->select("id")
						->where("uid='{$uid}' and videoid='{$videoid}'")
						->fetchOne();
		if($like){
			DI()->notorm->users_video_black
						->where("uid='{$uid}' and videoid='{$videoid}'")
						->delete();
			$rs['isshare']='0';
		}else{
			DI()->notorm->users_video_black
						->insert(array("uid"=>$uid,"videoid"=>$videoid,"addtime"=>time() ));
			$rs['isshare']='1';
		}	
		return $rs; 		
	}


	/* 评论/回复 点赞 */
	public function addCommentLike($uid,$commentid){
		$rs=array(
			'islike'=>'0',
			'likes'=>'0',
		);
		$like=DI()->notorm->users_video_comments_like
						->select("id")
						->where("uid='{$uid}' and commentid='{$commentid}'")
						->fetchOne();
		if($like){
			DI()->notorm->users_video_comments_like
						->where("uid='{$uid}' and commentid='{$commentid}'")
						->delete();
			
			DI()->notorm->users_video_comments
				->where("id = '{$commentid}' and likes>0")
				->update( array('likes' => new NotORM_Literal("likes - 1") ) );
			$rs['islike']='0';
		}else{
			DI()->notorm->users_video_comments_like
						->insert(array("uid"=>$uid,"commentid"=>$commentid,"addtime"=>time() ));
			
			DI()->notorm->users_video_comments
				->where("id = '{$commentid}'")
				->update( array('likes' => new NotORM_Literal("likes + 1") ) );
			$rs['islike']='1';
		}	
		
		$video=DI()->notorm->users_video_comments
				->select("likes")
				->where("id = '{$commentid}'")
				->fetchOne();
		$rs['likes']=$video['likes'];
		return $rs; 		
	}
	
	/* 热门视频 */
	public function getVideoList($uid,$p){
		$nums=20;
		$start=($p-1)*$nums;
		
		$videoids_s=$this->getVideoBlack($uid);
		$where="id not in ({$videoids_s}) and isdel=0";
		
		$video=DI()->notorm->users_video
				->select("*")
				->where($where)
				->order("addtime desc")
				->limit($start,$nums)
				->fetchAll();
		foreach($video as $k=>$v){
			$video[$k]['userinfo']=$this->getUserInfo($v['uid']);
			$video[$k]['datetime']=$this->datetime($v['addtime']);	
			$video[$k]['comments']=$this->NumberFormat($v['comments']);	
			$video[$k]['likes']=$this->NumberFormat($v['likes']);	
			$video[$k]['steps']=$this->NumberFormat($v['steps']);	
			$video[$k]['islike']=(string)$this->ifLike($uid,$v['id']);	
			$video[$k]['isstep']=(string)$this->ifStep($uid,$v['id']);	
			$video[$k]['isattent']=(string)$this->isAttention($uid,$v['uid']);	
		}		
		
		return $video;
	} 	
	
	/* 关注人视频 */
	public function getAttentionVideo($uid,$p){
		$nums=20;
		$start=($p-1)*$nums;
		
		$video=array();
		$attention=DI()->notorm->users_attention
				->select("touid")
				->where("uid='{$uid}'")
				->fetchAll();
		
		if($attention){
			
			$uids=$this->array_column2($attention,'touid');
			$touids=implode(",",$uids);
			
			$videoids_s=$this->getVideoBlack($uid);
			$where="uid in ({$touids}) and id not in ({$videoids_s})  and isdel=0";
			
			$video=DI()->notorm->users_video
					->select("*")
					->where($where)
					->order("addtime desc")
					->limit($start,$nums)
					->fetchAll();
			foreach($video as $k=>$v){
				$video[$k]['userinfo']=$this->getUserInfo($v['uid']);;
				$video[$k]['datetime']=$this->datetime($v['addtime']);	
				$video[$k]['comments']=$this->NumberFormat($v['comments']);	
				$video[$k]['likes']=$this->NumberFormat($v['likes']);	
				$video[$k]['steps']=$this->NumberFormat($v['steps']);	
				$video[$k]['islike']=(string)$this->ifLike($uid,$v['id']);	
				$video[$k]['isstep']=(string)$this->ifStep($uid,$v['id']);	
			}					
			
		}
		
		
		return $video;		
	} 			
	
	/* 视频详情 */
	public function getVideo($uid,$videoid){
		$video=DI()->notorm->users_video
					->select("*")
					->where("id = {$videoid}")
					->fetchOne();
		if(!$video){
			return 1000;
		}		
				
		$video['userinfo']=$this->getUserInfo($video['uid']);	
		$video['isattent']=(string)$this->isAttention($uid,$video['uid']);	
		$video['datetime']=$this->datetime($video['addtime']);	
		$video['comments']=$this->NumberFormat($video['comments']);	
		$video['likes']=$this->NumberFormat($video['likes']);	
		$video['steps']=$this->NumberFormat($video['steps']);	
		$video['shares']=$this->NumberFormat($video['shares']);	
		$video['islike']=(string)$this->ifLike($uid,$videoid);			
		$video['isstep']=(string)$this->ifStep($uid,$videoid);			
		
		return 	$video;
	}
	
	/* 评论列表 */
	public function getComments($uid,$videoid,$p){
		$nums=20;
		$start=($p-1)*$nums;
		$comments=DI()->notorm->users_video_comments
					->select("*")
					->where("videoid='{$videoid}' and parentid='0'")
					->order("addtime desc")
					->limit($start,$nums)
					->fetchAll();
		foreach($comments as $k=>$v){
			$comments[$k]['userinfo']=$this->getUserInfo($v['uid']);				
			$comments[$k]['datetime']=$this->datetime($v['addtime']);	
			$comments[$k]['likes']=$this->NumberFormat($v['likes']);	
			$comments[$k]['islike']=(string)$this->ifCommentLike($uid,$v['id']);	
			if($v['touid']>0){
				$touserinfo=$this->getUserInfo($v['touid']);
			}
			if(!$touserinfo){
				$touserinfo=(object)array();
				$comments[$k]['touid']='0';
			}
			$comments[$k]['touserinfo']=$touserinfo;

			$count=DI()->notorm->users_video_comments
					->where("commentid='{$v['id']}'")
					->count();
			$comments[$k]['replys']=$count;
		}
		
		$commentnum=DI()->notorm->users_video_comments
					->where("videoid='{$videoid}'")
					->count();
		
		$rs=array(
			"comments"=>$commentnum,
			"commentlist"=>$comments,
		);
		
		return $rs;
	}

	/* 回复列表 */
	public function getReplys($uid,$commentid,$p){
		$nums=20;
		$start=($p-1)*$nums;
		$comments=DI()->notorm->users_video_comments
					->select("*")
					->where("commentid='{$commentid}'")
					->order("addtime desc")
					->limit($start,$nums)
					->fetchAll();
		foreach($comments as $k=>$v){
			$comments[$k]['userinfo']=$this->getUserInfo($v['uid']);				
			$comments[$k]['datetime']=$this->datetime($v['addtime']);	
			$comments[$k]['likes']=$this->NumberFormat($v['likes']);	
			$comments[$k]['islike']=(string)$this->ifCommentLike($uid,$v['id']);
			if($v['touid']>0){
				$touserinfo=$this->getUserInfo($v['touid']);
			}
			if(!$touserinfo){
				$touserinfo=(object)array();
				$comments[$k]['touid']='0';
			}
			

			if($v['parentid']>0 && $v['parentid']!=$commentid){
				$tocommentinfo=DI()->notorm->users_video_comments
						->select("content")
						->where("id='{$v['parentid']}'")
						->fetchOne();
			}else{
				$tocommentinfo=(object)array();
				$touserinfo=(object)array();
				$comments[$k]['touid']='0';
			}
			$comments[$k]['touserinfo']=$touserinfo;
			$comments[$k]['tocommentinfo']=$tocommentinfo;
		}
		
		return $comments;
	}
	
	/* 是否点赞 */
	public function ifLike($uid,$videoid){
		$like=DI()->notorm->users_video_like
				->select("id")
				->where("uid='{$uid}' and videoid='{$videoid}'")
				->fetchOne();
		if($like){
			return 1;
		}else{
			return 0;
		}	
	}

	/* 是否踩 */
	public function ifStep($uid,$videoid){
		$like=DI()->notorm->users_video_step
				->select("id")
				->where("uid='{$uid}' and videoid='{$videoid}'")
				->fetchOne();
		if($like){
			return 1;
		}else{
			return 0;
		}	
	}
	
	/* 评论/回复 是否点赞 */
	public function ifCommentLike($uid,$commentid){
		$like=DI()->notorm->users_video_comments_like
				->select("id")
				->where("uid='{$uid}' and commentid='{$commentid}'")
				->fetchOne();
		if($like){
			return 1;
		}else{
			return 0;
		}	
	}
	
	/* 我的视频 */
	public function getMyVideo($uid,$p){
		$nums=20;
		$start=($p-1)*$nums;
		
		$video=DI()->notorm->users_video
				->select("*")
				->where('uid=?  and isdel=0',$uid)
				->order("addtime desc")
				->limit($start,$nums)
				->fetchAll();
		foreach($video as $k=>$v){
			$video[$k]['userinfo']=$this->getUserInfo($v['uid']);
			$video[$k]['datetime']=$this->datetime($v['addtime']);
			$video[$k]['comments']=$this->NumberFormat($v['comments']);	
			$video[$k]['likes']=$this->NumberFormat($v['likes']);	
			$video[$k]['steps']=$this->NumberFormat($v['steps']);
			$video[$k]['islike']='0';	
			$video[$k]['isattent']='0';	
		}		
		
		return $video;
	} 	
	/* 删除视频 */
	public function del($uid,$videoid){
		
		$result=DI()->notorm->users_video
					->select("*")
					->where("id='{$videoid}' and uid='{$uid}'")
					->fetchOne();	
		if($result){
			/* 删除 评论记录 */
			/* DI()->notorm->users_video_comments
						->where("videoid='{$videoid}'")
						->delete(); */
			/* 删除  阅读*/
			/* DI()->notorm->users_video_comments
						->where("videoid='{$videoid}'")
						->delete(); */
			/* 删除  点赞*/
			/* DI()->notorm->users_video_like
						->where("videoid='{$videoid}'")
						->delete(); */
			/* 删除视频 */
			/* DI()->notorm->users_video
						->where("id='{$videoid}'")
						->delete();	 */
			DI()->notorm->users_video
						->where("id='{$videoid}'")
						->update( array( 'isdel'=>1 ) );				
		}				
		return 0;
	}	
	
	/* 个人主页视频 */
	public function getHomeVideo($uid,$touid,$p){
		$nums=20;
		$start=($p-1)*$nums;
		
		$videoids_s=$this->getVideoBlack($uid);
		$where="id not in ({$videoids_s}) and uid={$touid}";
		
		$video=DI()->notorm->users_video
				->select("*")
				->where($where)
				->order("addtime desc")
				->limit($start,$nums)
				->fetchAll();
		foreach($video as $k=>$v){
			$video[$k]['userinfo']=$this->getUserInfo($v['uid']);
			$video[$k]['datetime']=$this->datetime($v['addtime']);	
			$video[$k]['comments']=$this->NumberFormat($v['comments']);	
			$video[$k]['likes']=$this->NumberFormat($v['likes']);	
			$video[$k]['steps']=$this->NumberFormat($v['steps']);	
			$video[$k]['islike']=(string)$this->ifLike($uid,$v['id']);	
			$video[$k]['isstep']=(string)$this->ifStep($uid,$v['id']);	
			$video[$k]['isattent']=(string)$this->isAttention($uid,$v['uid']);	
		}		
		
		return $video;
		
	}
	/* 举报 */
	public function report($data) {
		
		$video=DI()->notorm->users_video
					->select("uid")
					->where("id='{$data['videoid']}'")
					->fetchOne();
		if(!$video){
			return 1000;
		}
		
		$data['touid']=$video['uid'];
					
		$result= DI()->notorm->users_video_report->insert($data);
		return 0;
	}	
	
	/* 拉黑视频名单 */
	public function getVideoBlack($uid){
		$videoids=array('0');
		$list=DI()->notorm->users_video_black
						->select("videoid")
						->where("uid='{$uid}'")
						->fetchAll();
		if($list){
			$videoids=$this->array_column2($list,'videoid');
		}
		
		$videoids_s=implode(",",$videoids);
		
		return $videoids_s;
	}

}
