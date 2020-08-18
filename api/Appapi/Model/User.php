<?php

class Model_User extends Model_Common {
	/* 用户全部信息 */
	public function getBaseInfo($uid) {
		$info=DI()->notorm->users
				->select("id,user_nicename,avatar,avatar_thumb,sex,signature,coin,votes,consumption,votestotal,province,city,birthday")
				->where('id=?  and user_type="2"',$uid)
				->fetchOne();	 				
		$info['avatar']=$this->get_upload_path($info['avatar']);
		$info['avatar_thumb']=$this->get_upload_path($info['avatar_thumb']);						
		$info['level']=$this->getLevel($info['consumption']);
		$info['level_anchor']=$this->getLevelAnchor($info['votestotal']);
		$info['lives']=$this->getLives($uid);
		$info['follows']=$this->getFollows($uid);
		$info['fans']=$this->getFans($uid);
		
		$info['vip']=$this->getUserVip($uid);
		$info['liang']=$this->getUserLiang($uid);
					
		return $info;
	}
			
	/* 判断昵称是否重复 */
	public function checkName($uid,$name){
		$isexist=DI()->notorm->users
					->select('id')
					->where('id!=? and user_nicename=?',$uid,$name)
					->fetchOne();
		if($isexist){
			return 0;
		}else{
			return 1;
		}
	}
	
	/* 修改信息 */
	public function userUpdate($uid,$fields){
		/* 清除缓存 */
		$this->delCache("userinfo_".$uid);
		
		return DI()->notorm->users
					->where('id=?',$uid)
					->update($fields);
	}

	/* 修改密码 */
	public function updatePass($uid,$oldpass,$pass){
		$userinfo=DI()->notorm->users
					->select("user_pass")
					->where('id=?',$uid)
					->fetchOne();
		$oldpass=$this->setPass($oldpass);							
		if($userinfo['user_pass']!=$oldpass){
			return 1003;
		}							
		$newpass=$this->setPass($pass);
		return DI()->notorm->users
					->where('id=?',$uid)
					->update( array( "user_pass"=>$newpass ) );
	}
	
	/* 我的钻石 */
	public function getBalance($uid){
		return DI()->notorm->users
				->select("coin")
				->where('id=?',$uid)
				->fetchOne();
	}
	
	/* 充值规则 */
	public function getChargeRules(){

		$rules= DI()->notorm->charge_rules
				->select('id,coin,money,money_ios,product_id,give')
				->order('orderno asc')
				->fetchAll();

		return 	$rules;
	}
	/* 我的收益 */
	public function getProfit($uid){
		$info= DI()->notorm->users
				->select("votes,consumption")
				->where('id=?',$uid)
				->fetchOne();
		$level=$this->getLevel($info['consumption']);		
		//等级限制金额
		$limitcash=$this->getLevelSection($level);	
		
		$config=$this->getConfigPri();
		
		//提现比例
		$cash_rate=$config['cash_rate'];
		//剩余票数
		$votes=$info['votes'];
		//总可提现数
		$total=floor($votes/$cash_rate);
		
		$nowtime=time();
		//当天0点
		$today=date("Ymd",$nowtime);
		$today_start=strtotime($today)-1;
		//当天 23:59:59
		$today_end=strtotime("{$today} + 1 day");
		
		//已提现
		$hascash=DI()->notorm->users_cashrecord
					->where('uid=? and addtime>? and addtime<? and status!=2',$uid,$today_start,$today_end)
					->sum("money");
		if(!$hascash){
			$hascash=0;
		}		
		//今天可体现
		$todaycancash=$limitcash - $hascash;
		
		//今天能提
		if($todaycancash<$total){
			$todaycash=$todaycancash;
		}else{
			$todaycash=$total;
		}
		
		$rs=array(
			"votes"=>$votes,
			"todaycash"=>$todaycash,
			"total"=>$total,
		);
		return $rs;
	}	
	/* 提现  */
	public function setCash($uid){
		$isrz=DI()->notorm->users_auth
				->select("status")
				->where('uid=?',$uid)
				->fetchOne();
		if(!$isrz || $isrz['status']!=1){
			return 1003;
		}					
		$info= DI()->notorm->users
				->select("votes,consumption")
				->where('id=?',$uid)
				->fetchOne();
		$level=$this->getLevel($info['consumption']);		
		//等级限制金额
		$limitcash=$this->getLevelSection($level);	
		
		$config=$this->getConfigPri();
		
		//提现比例
		$cash_rate=$config['cash_rate'];
		/* 最低额度 */
		$cash_min=$config['cash_min'];
		//剩余票数
		$votes=$info['votes'];
		//总可提现数
		$total=floor($votes/$cash_rate);
		
		//已提现
		$nowtime=time();
		//当天0点
		$today=date("Ymd",$nowtime);
		$today_start=strtotime($today)-1;
		//当天 23:59:59
		$today_end=strtotime("{$today} + 1 day");
		
		$hascash =DI()->notorm->users_cashrecord
					->where('uid=? and addtime>? and addtime<? and status!=2',$uid,$today_start,$today_end)
					->sum("money");
		if(!$hascash){
			$hascash=0;
		}		
		//今天可体现
		$todaycancash=$limitcash - $hascash;
		
		//今天能提
		if($todaycancash<$total){
			$todaycash=$todaycancash;
		}else{
			$todaycash=$total;
		}
		
		if($todaycash==0){
			return 1001;
		}
		
		if($todaycash < $cash_min){
			return 1004;
		}
		
		$cashvotes=$todaycash*$cash_rate;
		
		$nowtime=time();
		
		$data=array(
			"uid"=>$uid,
			"money"=>$todaycash,
			"votes"=>$cashvotes,
			"orderno"=>$uid.'_'.$nowtime.rand(100,999),
			"status"=>0,
			"addtime"=>$nowtime,
			"uptime"=>$nowtime,
		);
		
		$rs=DI()->notorm->users_cashrecord->insert($data);
		if($rs){
			DI()->notorm->users
				->where('id = ?', $uid)
				->update(array('votes' => new NotORM_Literal("votes - {$cashvotes}")) );
		}else{
			return 1002;
		}				
		
		return $rs;
	}
	
	/* 关注 */
	public function setAttent($uid,$touid){
		$isexist=DI()->notorm->users_attention
					->select("*")
					->where('uid=? and touid=?',$uid,$touid)
					->fetchOne();
		if($isexist){
			DI()->notorm->users_attention
				->where('uid=? and touid=?',$uid,$touid)
				->delete();
			return 0;
		}else{
			DI()->notorm->users_black
				->where('uid=? and touid=?',$uid,$touid)
				->delete();
			DI()->notorm->users_attention
				->insert(array("uid"=>$uid,"touid"=>$touid));
			return 1;
		}			 
	}	
	
	/* 拉黑 */
	public function setBlack($uid,$touid){
		$isexist=DI()->notorm->users_black
					->select("*")
					->where('uid=? and touid=?',$uid,$touid)
					->fetchOne();
		if($isexist){
			DI()->notorm->users_black
				->where('uid=? and touid=?',$uid,$touid)
				->delete();
			return 0;
		}else{
			DI()->notorm->users_attention
				->where('uid=? and touid=?',$uid,$touid)
				->delete();
			DI()->notorm->users_black
				->insert(array("uid"=>$uid,"touid"=>$touid));

			return 1;
		}			 
	}
	
	/* 关注列表 */
	public function getFollowsList($uid,$touid,$p){
		$pnum=50;
		$start=($p-1)*$pnum;
		$touids=DI()->notorm->users_attention
					->select("touid")
					->where('uid=?',$touid)
					->limit($start,$pnum)
					->fetchAll();
		foreach($touids as $k=>$v){
			$userinfo=$this->getUserInfo($v['touid']);
			if($userinfo){
				if($uid==$touid){
					$isattent=1;
				}else{
					$isattent=$this->isAttention($uid,$v['touid']);
				}
				$userinfo['isattention']=$isattent;
				$touids[$k]=$userinfo;
			}else{
				DI()->notorm->users_attention->where('uid=? or touid=?',$v['touid'],$v['touid'])->delete();
				unset($touids[$k]);
			}
		}		
		$touids=array_values($touids);
		return $touids;
	}
	
	/* 粉丝列表 */
	public function getFansList($uid,$touid,$p){
		$pnum=50;
		$start=($p-1)*$pnum;
		$touids=DI()->notorm->users_attention
					->select("uid")
					->where('touid=?',$touid)
					->limit($start,$pnum)
					->fetchAll();
		foreach($touids as $k=>$v){
			$userinfo=$this->getUserInfo($v['uid']);
			if($userinfo){
				$userinfo['isattention']=$this->isAttention($uid,$v['uid']);
				$touids[$k]=$userinfo;
			}else{
				DI()->notorm->users_attention->where('uid=? or touid=?',$v['uid'],$v['uid'])->delete();
				unset($touids[$k]);
			}
			
		}		
		$touids=array_values($touids);
		return $touids;
	}	

	/* 黑名单列表 */
	public function getBlackList($uid,$touid,$p){
		$pnum=50;
		$start=($p-1)*$pnum;
		$touids=DI()->notorm->users_black
					->select("touid")
					->where('uid=?',$touid)
					->limit($start,$pnum)
					->fetchAll();
		foreach($touids as $k=>$v){
			$userinfo=$this->getUserInfo($v['touid']);
			if($userinfo){
				$touids[$k]=$userinfo;
			}else{
				DI()->notorm->users_black->where('uid=? or touid=?',$v['touid'],$v['touid'])->delete();
				unset($touids[$k]);
			}
		}
		$touids=array_values($touids);
		return $touids;
	}
	
	/* 直播记录 */
	public function getLiverecord($touid,$p){
		$pnum=50;
		$start=($p-1)*$pnum;
		$record=DI()->notorm->users_liverecord
					->select("id,uid,nums,starttime,endtime,title,city")
					->where('uid=?',$touid)
					->order("id desc")
					->limit($start,$pnum)
					->fetchAll();
		foreach($record as $k=>$v){
			$record[$k]['datestarttime']=date("Y年m月d日 H:i",$v['starttime']);
			$record[$k]['dateendtime']=date("Y年m月d日 H:i",$v['endtime']);
		}						
		return $record;						
	}	
	
		/* 个人主页 */
	public function getUserHome($uid,$touid){
		$info=$this->getUserInfo($touid);				

		$info['follows']=$this->NumberFormat($this->getFollows($touid));
		$info['fans']=$this->NumberFormat($this->getFans($touid));
		$info['isattention']=(string)$this->isAttention($uid,$touid);
		$info['isblack']=(string)$this->isBlack($uid,$touid);
		$info['isblack2']=(string)$this->isBlack($touid,$uid);
		
		/* 贡献榜前三 */
		$rs=array();
		$rs=DI()->notorm->users_coinrecord
				->select("uid,sum(totalcoin) as total")
				->where('action="sendgift" and touid=?',$touid)
				->group("uid")
				->order("total desc")
				->limit(0,3)
				->fetchAll();
		foreach($rs as $k=>$v){
			$userinfo=$this->getUserInfo($v['uid']);
			$rs[$k]['avatar']=$userinfo['avatar'];
		}		
		$info['contribute']=$rs;	
		
		/* 是否直播 */
		$info['islive']='1';
		if($uid==$touid){
			$live=array(
				'uid'=>'',
				'avatar'=>'',
				'avatar_thumb'=>'',
				'user_nicename'=>'',
				'title'=>'',
				'city'=>'',
				'stream'=>'',
				'pull'=>'',
				'type'=>'',
				'thumb'=>'',
				'isvideo'=>'',
				'type'=>'',
				'goodnum'=>'',
				'level_anchor'=>'1',
			);
			$info['islive']='0';
		}else{
			$live=DI()->notorm->users_live
					->select("uid,avatar,avatar_thumb,thumb,user_nicename,title,city,stream,pull,type,thumb,goodnum,isvideo")
					->where('uid=? and islive="1"',$touid)
					->fetchOne();
			if(!$live){
				$live=array(
					'uid'=>'',
					'avatar'=>'',
					'avatar_thumb'=>'',
					'user_nicename'=>'',
					'title'=>'',
					'city'=>'',
					'stream'=>'',
					'pull'=>'',
					'type'=>'',
					'thumb'=>'',
					'isvideo'=>'',
					'type'=>'',
					'goodnum'=>'',
					'level_anchor'=>'1',
					
				);
				$info['islive']='0';
			}else{
				if(!$live['thumb']){
					$live['thumb']=$this->get_upload_path($live['avatar']);;
				}
				if($v['isvideo']==0){
					$live['pull']=$this->PrivateKeyA('rtmp',$live['stream'],0);
				}
				$live['level_anchor']=$info['level_anchor'];
			}	
			
		}
		$live['sex']=$info['sex'];
		$live['age']=$this->birthday_to_age($info['birthday']);
		$info['liveinfo']=$live;	

		/* 直播记录 */
		$record=array();
		$record=DI()->notorm->users_liverecord
					->select("id,uid,nums,starttime,endtime,title,city")
					->where('uid=?',$touid)
					->order("id desc")
					->limit(0,20)
					->fetchAll();
		foreach($record as $k=>$v){
			$record[$k]['datestarttime']=date("Y年m月d日 H:i",$v['starttime']);
			$record[$k]['dateendtime']=date("Y年m月d日 H:i",$v['endtime']);
		}		
		$info['liverecord']=$record;	
		
		/* 短视频 */
		$video=array();
		$video=DI()->notorm->users_video
					->select("*")
					->where('uid=?  and isdel=0',$touid)
					->order("id desc")
					->limit(0,20)
					->fetchAll();
		foreach($video as $k=>$v){
			$video[$k]['datetime']=$this->datetime($v['addtime']);	
			$video[$k]['comments']=$this->NumberFormat($v['comments']);	
			$video[$k]['likes']=$this->NumberFormat($v['likes']);	
			$video[$k]['steps']=$this->NumberFormat($v['steps']);	
			$video[$k]['userinfo']=$this->getUserInfo($v['uid']);	
			$video[$k]['isattent']=(string)$this->isAttention($uid,$v['uid']);	
			$video[$k]['islike']='0';			
			$video[$k]['isstep']='0';		
			//$video[$k]['isstep']=(string)$this->ifStep($uid,$v['id']);	
			
		}		
		$info['video']=$video;	
		
		return $info;
	}
	
	/* 贡献榜 */
	public function getContributeList($touid,$p){
		
		$pnum=50;
		$start=($p-1)*$pnum;

		$rs=array();
		$rs=DI()->notorm->users_coinrecord
				->select("uid,sum(totalcoin) as total")
				->where('touid=?',$touid)
				->group("uid")
				->order("total desc")
				->limit($start,$pnum)
				->fetchAll();
				
		foreach($rs as $k=>$v){
			$rs[$k]['userinfo']=$this->getUserInfo($v['uid']);
		}		
		
		return $rs;
	}
	
	/* 设置分销 */
	public function setDistribut($uid,$code){
		$oneinfo=DI()->notorm->users
				->select("id")
				->where('code=? and id!=?',$code,$uid)
				->fetchOne();
		if(!$oneinfo){
			return 1002;
		}
		
		$agentinfo=DI()->notorm->users_agent
				->select("*")
				->where('uid=?',$oneinfo['id'])
				->fetchOne();
		if(!$agentinfo){
			$agentinfo=array(
				'uid'=>$oneinfo['id'],
				'one_uid'=>0,
				'two_uid'=>0,
			);
		}
		
		$data=array(
			'uid'=>$uid,
			'one_uid'=>$agentinfo['uid'],
			'two_uid'=>$agentinfo['one_uid'],
			'three_uid'=>$agentinfo['two_uid'],
			'addtime'=>time(),
		);
		DI()->notorm->users_agent->insert($data);
		return 0;
	}
}
