<?php

class Api_Home extends Api_Common {  

	public function getRules() {
		return array(
			'getHot' => array(
				'p' => array('name' => 'p', 'type' => 'int', 'default'=>'1' ,'desc' => '页数'),
			),
			
			'getFollow' => array(
				'uid' => array('name' => 'uid', 'type' => 'int','min'=>1,'require' => true, 'desc' => '用户ID'),
				'p' => array('name' => 'p', 'type' => 'int', 'default'=>'1' ,'desc' => '页数'),
			),
			
			'getNew' => array(
                'lng' => array('name' => 'lng', 'type' => 'string', 'desc' => '经度值'),
                'lat' => array('name' => 'lat', 'type' => 'string','desc' => '纬度值'),
				'p' => array('name' => 'p', 'type' => 'int', 'default'=>'1' ,'desc' => '页数'),
            ),
			'getprivatelive' => array(
                'lng' => array('name' => 'lng', 'type' => 'string', 'desc' => '经度值'),
                'lat' => array('name' => 'lat', 'type' => 'string','desc' => '纬度值'),
				'p' => array('name' => 'p', 'type' => 'int', 'default'=>'1' ,'desc' => '页数'),
            ),			
			
			'search' => array(
				'uid' => array('name' => 'uid', 'type' => 'int', 'require' => true, 'min'=>1 ,'desc' => '用户ID'),
				'key' => array('name' => 'key', 'type' => 'string', 'default'=>'' ,'desc' => '用户ID'),
				'p' => array('name' => 'p', 'type' => 'int', 'default'=>'1' ,'desc' => '页数'),
			),
			'getGameLive' => array(
				'p' => array('name' => 'p', 'type' => 'int', 'default'=>'1' ,'desc' => '页数'),
            ),
			
			'getNearby' => array(
				'uid' => array('name' => 'uid', 'type' => 'int','min'=>1 ,'desc' => '用户ID'),
                'lng' => array('name' => 'lng', 'type' => 'string', 'desc' => '经度值'),
                'lat' => array('name' => 'lat', 'type' => 'string','desc' => '纬度值'),
				'p' => array('name' => 'p', 'type' => 'int', 'default'=>'1' ,'desc' => '页数'),
            ),
		);
	}
	
    /**
     * 配置信息
     * @desc 用于获取配置信息
     * @return int code 操作码，0表示成功
     * @return array info 
     * @return array info[0] 配置信息

     * @return string msg 提示信息
     */
    public function getConfig() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $info = $this->getConfigPub();
        $rs['info'][0] = $info;

        return $rs;
    }	

    /**
     * 登录方式开关信息
     * @desc 用于获取登录方式开关信息
     * @return int code 操作码，0表示成功
     * @return array info 
     * @return string info[0].login_qq qq登录，0表示关闭，1表示开启
     * @return string info[0].login_wx 微信登录，0表示关闭，1表示开启
     * @return string info[0].login_sina 新浪微博登陆，0表示关闭，1表示开启
     * @return string info[0].login_fb facebook登陆，0表示关闭，1表示开启
     * @return string info[0].login_tw twitter登陆，0表示关闭，1表示开启
     * @return array info[0].login_type 开启的登录方式
     * @return string info[0].login_type[][0] 登录方式标识

     * @return string msg 提示信息
     */
    public function getLogin() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $info = $this->getConfigPub();
        $rs['info'][0]['login_type'] = $info['login_type'];

        return $rs;
    }		
	
    /**
     * 获取热门主播
     * @desc 用于获取首页热门主播
     * @return int code 操作码，0表示成功
     * @return array info 
     * @return array info[0]['slide'] 
     * @return string info[0]['slide'][].slide_pic 图片
     * @return string info[0]['slide'][].slide_url 链接
     * @return array info[0]['list'] 热门直播列表
     * @return string info[0]['list'][].uid 主播id
     * @return string info[0]['list'][].avatar 主播头像
     * @return string info[0]['list'][].avatar_thumb 头像缩略图
     * @return string info[0]['list'][].user_nicename 直播昵称
     * @return string info[0]['list'][].title 直播标题
     * @return string info[0]['list'][].city 主播位置
     * @return string info[0]['list'][].stream 流名
     * @return string info[0]['list'][].pull 播流地址
     * @return string info[0]['list'][].nums 人数
     * @return string info[0]['list'][].thumb 直播封面
     * @return string info[0]['list'][].level_anchor 主播等级
     * @return string info[0]['list'][].type 直播类型
     * @return string info[0]['list'][].goodnum 靓号
     * @return string msg 提示信息
     */
    public function getHot() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $domain = new Domain_Home();
		$key1='getSlide';
		$slide=$this->getcache($key1);
		if(!$slide){
			$slide = $domain->getSlide();
			$this->setcache($key1,$slide);
		}

		$key2="getHot_".$this->p;
		$list=$this->getcaches($key2);
		if(!$list){
			$list = $domain->getHot($this->p);
			$this->setCaches($key2,$list,2); 
		}

        $rs['info'][0]['slide'] = $slide;
        $rs['info'][0]['list'] = $list;

        return $rs;
    }
    /**
     * 获取关注主播列表
     * @desc 用于获取用户关注的主播的直播列表
     * @return int code 操作码，0表示成功
     * @return array info 直播列表
     * @return string info[].uid 主播id
     * @return string info[].avatar 主播头像
     * @return string info[].avatar_thumb 头像缩略图
     * @return string info[].user_nicename 直播昵称
     * @return string info[].title 直播标题
     * @return string info[].city 主播位置
     * @return string info[].stream 流名
     * @return string info[].pull 播流地址
     * @return string info[].nums 人数
     * @return string info[].thumb 直播封面
     * @return string info[].level_anchor 主播等级
     * @return string info[].type 直播类型
     * @return string info[].goodnum 靓号
     * @return string msg 提示信息
     */
    public function getFollow() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $domain = new Domain_Home();
        $info = $domain->getFollow($this->uid,$this->p);


        $rs['info'] = $info;

        return $rs;
    }

    /**
     * 获取最新主播
     * @desc 用于获取首页最新开播的主播列表
     * @return int code 操作码，0表示成功
     * @return array info 主播列表
     * @return string info[].uid 主播id
     * @return string info[].avatar 主播头像
     * @return string info[].avatar_thumb 头像缩略图
     * @return string info[].user_nicename 直播昵称
     * @return string info[].title 直播标题
     * @return string info[].city 主播位置
     * @return string info[].stream 流名
     * @return string info[].pull 播流地址
     * @return string info[].nums 人数
     * @return string info[].distance 距离
     * @return string info[].thumb 直播封面
     * @return string info[].level_anchor 主播等级
     * @return string info[].type 直播类型
     * @return string info[].goodnum 靓号
     * @return string msg 提示信息
     */
    public function getNew() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
		
		$lng=$this->checkNull($this->lng);
		$lat=$this->checkNull($this->lat);
		$p=$this->checkNull($this->p);
		
		if(!$p){
			$p=1;
		}
		
		$key='getNew_'.$p;
		$info=$this->getCache($key);
		if(!$info){
			$domain = new Domain_Home();
			$info = $domain->getNew($lng,$lat,$p);

			$this->setCaches($key,$info,2);
		}
		
        $rs['info'] = $info;

        return $rs;
    }	

   /**
     * 获取私播主播
     * @desc 用于获取首页最新开播的主播列表
     * @return int code 操作码，0表示成功
     * @return array info 主播列表
     * @return string info[].uid 主播id
     * @return string info[].avatar 主播头像
     * @return string info[].avatar_thumb 头像缩略图
     * @return string info[].user_nicename 直播昵称
     * @return string info[].title 直播标题
     * @return string info[].city 主播位置
     * @return string info[].stream 流名
     * @return string info[].pull 播流地址
     * @return string info[].nums 人数
     * @return string info[].distance 距离
     * @return string info[].thumb 直播封面
     * @return string info[].level_anchor 主播等级
     * @return string info[].type 直播类型
     * @return string info[].goodnum 靓号
     * @return string msg 提示信息
     */
    public function getprivatelive() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
		
		$lng=$this->checkNull($this->lng);
		$lat=$this->checkNull($this->lat);
		$p=$this->checkNull($this->p);
		
		if(!$p){
			$p=1;
		}
		
		$key='getNew_'.$p;
		$info=$this->getCache($key);
		if(!$info){
			$domain = new Domain_Home();
			$info = $domain->getprivatelive($lng,$lat,$p);

			$this->setCaches($key,$info,2);
		}
		
        $rs['info'] = $info;

        return $rs;
    }	
		
	/**
     * 搜索
     * @desc 用于首页搜索会员
     * @return int code 操作码，0表示成功
     * @return array info 会员列表
     * @return string info[].id 用户ID
     * @return string info[].user_nicename 用户昵称
     * @return string info[].avatar 头像
     * @return string info[].sex 性别
     * @return string info[].signature 签名
     * @return string info[].level 等级
     * @return string info[].isattention 是否关注，0未关注，1已关注
     * @return string msg 提示信息
     */
    public function search() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
		
		$uid=$this->checkNull($this->uid);
		$key=$this->checkNull($this->key);
		$p=$this->checkNull($this->p);
		if($key==''){
			$rs['code'] = 1001;
			$rs['msg'] = "请填写关键词";
			return $rs;
		}
		
		if(!$p){
			$p=1;
		}
		
        $domain = new Domain_Home();
        $info = $domain->search($uid,$key,$p);

        $rs['info'] = $info;

        return $rs;
    }	
	
    /**
     * 获取游戏直播
     * @desc 用于获取游戏直播的主播列表
     * @return int code 操作码，0表示成功
     * @return array info 主播列表
     * @return string info[].uid 主播id
     * @return string info[].avatar 主播头像
     * @return string info[].avatar_thumb 头像缩略图
     * @return string info[].user_nicename 直播昵称
     * @return string info[].title 直播标题
     * @return string info[].city 主播位置
     * @return string info[].stream 流名
     * @return string info[].pull 播流地址
     * @return string info[].nums 人数
     * @return string info[].distance 距离
     * @return string info[].thumb 直播封面
     * @return string msg 提示信息
     */
    public function getGameLive() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
		
		$p=$this->checkNull($this->p);
		
		
		if(!$p){
			$p=1;
		}
		
		$key='getGameLive_'.$p;
		$info=$this->getCache($key);
		if(!$info){
			$domain = new Domain_Home();
			$info = $domain->getGameLive($p);

			$this->setCaches($key,$info,2);
		}
		
        $rs['info'] = $info;

        return $rs;
    }		
	
    /**
     * 获取附近主播
     * @desc 用于获取附近开播的主播列表
     * @return int code 操作码，0表示成功
     * @return array info 
     * @return array info[0].live 主播列表
     * @return string info[0].live[].uid 主播id
     * @return string info[0].live[].avatar 主播头像
     * @return string info[0].live[].avatar_thumb 头像缩略图
     * @return string info[0].live[].user_nicename 直播昵称
     * @return string info[0].live[].title 直播标题
     * @return string info[0].live[].province 省份
     * @return string info[0].live[].city 主播位置
     * @return string info[0].live[].stream 流名
     * @return string info[0].live[].pull 播流地址
     * @return string info[0].live[].nums 人数
     * @return string info[0].live[].distance 距离
     * @return string info[0].live[].thumb 直播封面
     * @return string info[0].live[].level_anchor 主播等级
     * @return string info[0].live[].game 游戏名称
     * @return string info[0].live[].type 直播类型
     * @return string info[0].live[].goodnum 靓号
	 * @return array info[0].video 视频列表
	 * @return object info[0].video[].userinfo 用户信息
     * @return string info[0].video[].datetime 格式后的发布时间
     * @return string info[0].video[].thumb_s 封面小图，分享用
     * @return string msg 提示信息
     */
    public function getNearby() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
		
		$uid=$this->uid;
		$lng=$this->checkNull($this->lng);
		$lat=$this->checkNull($this->lat);
		$p=$this->checkNull($this->p);
		
		if($lng==''){
			return $rs;
		}
		
		if($lat==''){
			return $rs;
		}
		
		if(!$p){
			$p=1;
		}
		
		$key='getNearby_'.$lng.'_'.$lat.'_'.$p;
		$info=$this->getCache($key);
		if(!$info){
			$domain = new Domain_Home();
			$info = $domain->getNearby($uid,$lng,$lat,$p);

			$this->setCaches($key,$info,2);
		}
		
        $rs['info'][0] = $info;

        return $rs;
    }	
	
} 
