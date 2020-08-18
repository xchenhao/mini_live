<?php
session_start();
class Model_Home extends Model_Common {

	/* 轮播 */
	public function getSlide(){

		$rs=DI()->notorm->slide
			->select("slide_pic,slide_url")
			->where("slide_status='1' and slide_cid='0' ")
			->order("listorder asc")
			->fetchAll();
		foreach($rs as $k=>$v){
			$rs[$k]['slide_pic']=$this->get_upload_path($v['slide_pic']);
		}				

		return $rs;				
	}

	/* 热门 */
    public function getHot($p) {

		$pnum=50;
		$start=($p-1)*$pnum;
		$where="l.islive= '1' and l.type != '6' and u.ishot='1'";

		/* if($p!=1){
			$endtime=$_SESSION['new_starttime'];
			$where.=" and starttime < {$endtime}";
		} */
		$prefix= DI()->config->get('dbs.tables.__default__.prefix');
		
		$result=DI()->notorm->users_live
					->queryAll("select l.uid,l.avatar,l.avatar_thumb,l.user_nicename,l.title,l.city,l.stream,l.pull,l.thumb,l.isvideo,l.type,l.type_val,l.goodnum,u.votestotal from {$prefix}users_live l left join {$prefix}users u on l.uid=u.id where {$where} order by u.isrecommend desc,l.starttime desc limit {$start},{$pnum}");

		foreach($result as $k=>$v){
			$nums=DI()->redis->hlen('userlist_'.$v['stream']);

			$result[$k]['nums']=(string)$nums;
			
			$result[$k]['level_anchor']=$this->getLevelAnchor($v['votestotal']);
			
			if(!$v['thumb']){
				$result[$k]['thumb']=$v['avatar'];
			}
			if($v['isvideo']==0){
				$result[$k]['pull']=$this->PrivateKeyA('rtmp',$v['stream'],0);
			}
			
			if($v['type']==1){
				$result[$k]['type_val']='';
			}
			
		}	
		/* if($result){
			$last=array_slice($result,-1,1);
			$_SESSION['new_starttime']=$last['starttime'];
		} */
		
		return $result;
    }
	
		/* 关注列表 */
    public function getFollow($uid,$p) {
		$result=array();
		$pnum=50;
		$start=($p-1)*$pnum;
		
		$touid=DI()->notorm->users_attention
				->select("touid")
				->where('uid=?',$uid)
				->fetchAll();
		$where=" islive='1' ";					
		if($p!=1){
			$endtime=$_SESSION['follow_starttime'];
			$where.=" and starttime < {$endtime}";
		}					
		if($touid){
			$touids=array_column($touid,"touid");
			$touidss=implode(",",$touids);
			$where.=" and uid in ({$touidss})";
			$result=DI()->notorm->users_live
					->select("uid,avatar,avatar_thumb,user_nicename,title,city,stream,pull,thumb,isvideo,type,type_val,goodnum")
					->where($where)
					->order("starttime desc")
					->limit($start,$pnum)
					->fetchAll();
		}	
		foreach($result as $k=>$v){
			$nums=DI()->redis->hlen('userlist_'.$v['stream']);
			$result[$k]['nums']=(string)$nums;
			
			$userinfo=$this->getUserInfo($v['uid']);
			$result[$k]['level_anchor']=$userinfo['level_anchor'];
			$result[$k]['sex']=$userinfo['sex'];
			$result[$k]['age']=$this->birthday_to_age($userinfo['birthday']);

			if(!$v['thumb']){
				$result[$k]['thumb']=$v['avatar'];
			}
			if($v['isvideo']==0){
				$result[$k]['pull']=$this->PrivateKeyA('rtmp',$v['stream'],0);
			}
			
			if($v['type']==1){
				$result[$k]['type_val']='';
			}
			
		}	

		if($result){
			$last=array_slice($result,-1,1);
			$_SESSION['follow_starttime']=$last['starttime'];
		}

		return $result;					
    }
		
		/* 最新 */
    public function getNew($lng,$lat,$p) {
		$pnum=50;
		$start=($p-1)*$pnum;
		$where=" islive='1' type != '6' ";

		if($p!=1){
			$endtime=$_SESSION['new_starttime'];
			$where.=" and starttime < {$endtime}";
		}
		
		$result=DI()->notorm->users_live
				->select("uid,avatar,avatar_thumb,user_nicename,title,city,stream,lng,lat,pull,thumb,isvideo,type,type_val,goodnum")
				->where($where)
				->order("starttime desc")
				->limit($start,$pnum)
				->fetchAll();	
		foreach($result as $k=>$v){
			$nums=DI()->redis->hlen('userlist_'.$v['stream']);
			$result[$k]['nums']=(string)$nums;
			
			$userinfo=$this->getUserInfo($v['uid']);
			$result[$k]['level_anchor']=$userinfo['level_anchor'];
			
			if(!$v['thumb']){
				$result[$k]['thumb']=$v['avatar'];
			}
			if($v['isvideo']==0){
				$result[$k]['pull']=$this->PrivateKeyA('rtmp',$v['stream'],0);
			}
			
			if($v['type']==1){
				$result[$k]['type_val']='';
			}
			
			
			$distance='好像在火星';
			if($lng!='' && $lat!='' && $v['lat']!='' && $v['lng']!=''){
				$distance=$this->getDistance($lat,$lng,$v['lat'],$v['lng']);
			}else if($v['city']){
				$distance=$v['city'];	
			}
			
			$result[$k]['distance']=$distance;
			unset($result[$k]['lng']);
			unset($result[$k]['lat']);
			
		}		
		if($result){
			$last=array_slice($result,-1,1);
			$_SESSION['new_starttime']=$last['starttime'];
		}

		return $result;
    }
	
		/* 最新 */
    public function getprivatelive($lng,$lat,$p) {
		$pnum=50;
		$start=($p-1)*$pnum;
		$where=" islive='1' and type = '6' ";

		if($p!=1){
			$endtime=$_SESSION['new_starttime'];
			$where.=" and starttime < {$endtime}";
		}
		
		$result=DI()->notorm->users_live
				->select("uid,avatar,avatar_thumb,user_nicename,title,city,stream,lng,lat,pull,thumb,isvideo,type,type_val,goodnum,is_communicating")
				->where($where)
				->order("is_communicating asc,starttime desc")
				->limit($start,$pnum)
				->fetchAll();	
		foreach($result as $k=>$v){
			$result[$k]['avatar']=$this->get_upload_path($result[$k]['avatar']);
			
			$result[$k]['avatar_thumb']=$this->get_upload_path($result[$k]['avatar_thumb']);
			$nums=DI()->redis->hlen('userlist_'.$v['stream']);
			$result[$k]['nums']=(string)$nums;
			
			$userinfo=$this->getUserInfo($v['uid']);
			$result[$k]['age']=$this->birthday_to_age($userinfo['birthday']);
			$result[$k]['level_anchor']=$userinfo['level_anchor'];
			$result[$k]['sex']=$userinfo['sex'];
			
			if(!$v['thumb']){
				$result[$k]['thumb']=$result[$k]['thumb']=$this->get_upload_path($v['avatar']);;
			}
			if($v['isvideo']==0){
				$result[$k]['pull']=$this->PrivateKeyA('rtmp',$v['stream'],0);
			}
			
			if($v['type']==1){
				$result[$k]['type_val']='';
			}
			
			
			$distance='好像在火星';
			if($lng!='' && $lat!='' && $v['lat']!='' && $v['lng']!=''){
				$distance=$this->getDistance($lat,$lng,$v['lat'],$v['lng']);
			}else if($v['city']){
				$distance=$v['city'];	
			}
			
			$result[$k]['distance']=$distance;
			unset($result[$k]['lng']);
			unset($result[$k]['lat']);
			
		}		
		if($result){
			$last=array_slice($result,-1,1);
			$_SESSION['new_starttime']=$last['starttime'];
		}

		return $result;
    }	
	
		
		/* 搜索 */
    public function search($uid,$key,$p) {
		$pnum=50;
		$start=($p-1)*$pnum;
		$where=' user_type="2" and ( id=? or user_nicename like ?  or goodnum like ? ) and id!=?';
		if($p!=1){
			$id=$_SESSION['search'];
			$where.=" and id < {$id}";
		}
		
		$result=DI()->notorm->users
				->select("id,user_nicename,avatar,sex,signature,consumption,votestotal")
				->where($where,$key,'%'.$key.'%','%'.$key.'%',$uid)
				->order("id desc")
				->limit($start,$pnum)
				->fetchAll();
		foreach($result as $k=>$v){
			$result[$k]['level']=(string)$this->getLevel($v['consumption']);
			$result[$k]['level_anchor']=(string)$this->getLevelAnchor($v['votestotal']);
			$result[$k]['isattention']=(string)$this->isAttention($uid,$v['id']);
			$result[$k]['avatar']=$this->get_upload_path($v['avatar']);
			unset($result[$k]['consumption']);
		}				
		
		if($result){
			$last=array_slice($result,-1,1);
			$_SESSION['search']=$last['id'];
		}
		
		return $result;
    }
	

	/* 游戏直播 */
    public function getGameLive($p) {
		$pnum=50;
		$start=($p-1)*$pnum;
		$where=" islive='1' and type=5 ";

		if($p!=1){
			$endtime=$_SESSION['getGameLive_starttime'];
			$where.=" and starttime < {$endtime}";
		}
		
		$result=DI()->notorm->users_live
				->select("uid,avatar,avatar_thumb,user_nicename,title,city,stream,lng,lat,pull,thumb,isvideo,type,type_val,goodnum")
				->where($where)
				->order("starttime desc")
				->limit($start,$pnum)
				->fetchAll();	
		foreach($result as $k=>$v){
			$nums=DI()->redis->hlen('userlist_'.$v['stream']);
			$result[$k]['nums']=(string)$nums;
			
			$userinfo=$this->getUserInfo($v['uid']);
			$result[$k]['level_anchor']=$userinfo['level_anchor'];
			
			if(!$v['thumb']){
				$result[$k]['thumb']=$v['avatar'];
			}
			
			if($v['isvideo']==0){
				$result[$k]['pull']=$this->PrivateKeyA('rtmp',$v['stream'],0);
			}
			
			if($v['type']==1){
				$result[$k]['type_val']='';
			}
		}		
		if($result){
			$last=array_slice($result);
			$_SESSION['getGameLive_starttime']=$last['starttime'];
		}

		return $result;
    }
	
	/* 附近 */
    public function getNearby($uid,$lng,$lat,$p) {
		$pnum=2;
		$start=($p-1)*$pnum;
		
		/* 直播 */
		$where=" islive='1' and type != '6' and lng!='' and lat!='' ";
		
		$livelist=DI()->notorm->users_live
				->select("uid,avatar,avatar_thumb,user_nicename,title,province,city,stream,lng,lat,pull,isvideo,thumb,islive,type,type_val,goodnum")
				->where($where)
				->fetchAll();	
		foreach($livelist as $k=>$v){
			$nums=DI()->redis->hlen('userlist_'.$v['stream']);
			$livelist[$k]['nums']=(string)$nums;
			
			$userinfo=$this->getUserInfo($v['uid']);
			$livelist[$k]['level_anchor']=$userinfo['level_anchor'];
		
			if(!$v['thumb']){
				$livelist[$k]['thumb']=$v['avatar'];
			}
			if($v['isvideo']==0){
				$livelist[$k]['pull']=$this->PrivateKeyA('rtmp',$v['stream'],0);
			}
			
			if($v['type']==1){
				$livelist[$k]['type_val']='';
			}
			
			$distance=$this->getDistance($lat,$lng,$v['lat'],$v['lng']);

			$livelist[$k]['distance']=$distance;
			$order1[$k]=(float)$distance;
			unset($livelist[$k]['lng']);
			unset($livelist[$k]['lat']);
			
		}		
		array_multisort($order1, SORT_ASC, $livelist); //推荐倒序 点亮倒序 开播时间倒序
		
		/* 视频 */
		$videoids=array('0');
		$list=DI()->notorm->users_video_black
						->select("videoid")
						->where("uid='{$uid}'")
						->fetchAll();
		if($list){
			$videoids=$this->array_column2($list,'videoid');
		}
		
		$videoids_s=implode(",",$videoids);
		
		$where2="id not in ({$videoids_s}) and isdel=0";
		
		$video=DI()->notorm->users_video
				->select("*")
				->where($where2)
				->order("addtime desc")
				->limit($start,$pnum)
				->fetchAll();
		foreach($video as $k=>$v){
			$video[$k]['userinfo']=$this->getUserInfo($v['uid']);
			$video[$k]['datetime']=$this->datetime($v['addtime']);	
			
			$distance='>1000km';
			if($lng!='' && $lat!='' && $v['lat']!='' && $v['lng']!=''){
				$distance=$this->getDistance($lat,$lng,$v['lat'],$v['lng']);
			}
			
			$video[$k]['distance']=$distance;
			$order2[$k]=(float)$distance;
			unset($video[$k]['lat']);
			unset($video[$k]['lng']);
		}	
		array_multisort($order2, SORT_ASC, $livelist);
		
		$result=array(
			'live'=>$livelist,
			'video'=>$video,
		);
		
		return $result;
    }


}
