<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class UserController extends AdminbaseController{
	protected $users_model,$role_model;
	
	function _initialize() {
		parent::_initialize();
		$this->users_model = D("Common/Users");
		$this->role_model = D("Common/Role");
	}
	function index(){
		

		$map['user_type']=1;

		$map['status']=0;

		
		$count=$this->users_model->where($map)->count();

		$page = $this->page($count, 20);
		$users = $this->users_model
		->where($map)
		->order("create_time DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		
		$roles_src=$this->role_model->select();
		$roles=array();
		foreach ($roles_src as $r){
			$roleid=$r['id'];
			$roles["$roleid"]=$r;
		}
		$this->assign("page", $page->show('Admin'));
		$this->assign("roles",$roles);
		$this->assign("users",$users);
		$this->display();
	}
	
	
	function add(){
		$roles=$this->role_model->where("status=1 and id !=5 and id !=6")->order("id desc")->select();
		$this->assign("roles",$roles);
		$this->display();
	}
	
	function add_post(){
		if(IS_POST){
			if(!empty($_POST['role_id']) && is_array($_POST['role_id'])){
				$role_ids=$_POST['role_id'];
				unset($_POST['role_id']);
				if ($this->users_model->create()) {
					$result=$this->users_model->add();
					if ($result!==false) {
						$role_user_model=M("RoleUser");
						foreach ($role_ids as $role_id){
							$role_user_model->add(array("role_id"=>$role_id,"user_id"=>$result));
						}
						$this->success("添加成功！", U("user/index"));
					} else {
						$this->error("添加失败！");
					}
				} else {
					$this->error($this->users_model->getError());
				}
			}else{
				$this->error("请为此用户指定角色！");
			}
			
		}
	}
	
	
	function edit(){
		$id= intval(I("get.id"));
		$source=I("source");
		$roles=$this->role_model->where("status=1 and id!=5 and id!=6")->order("id desc")->select();
		$this->assign("roles",$roles);
		$role_user_model=M("RoleUser");
		$role_ids=$role_user_model->where(array("user_id"=>$id))->getField("role_id",true);
		$this->assign("role_ids",$role_ids);
			
		$user=$this->users_model->where(array("id"=>$id))->find();
		$this->assign($user);
		$this->assign("source",$source);
		$this->display();
	}
	
	function edit_post(){
		if (IS_POST) {


			if($_POST['role_id']){

				if(!empty($_POST['role_id']) && is_array($_POST['role_id'])){
					if(empty($_POST['user_pass'])){
						unset($_POST['user_pass']);
					}
					$role_ids=$_POST['role_id'];
					unset($_POST['role_id']);
					if ($this->users_model->create()) {
						$result=$this->users_model->save();
						if ($result!==false) {
							$uid=intval($_POST['id']);
							$role_user_model=M("RoleUser");
							$role_user_model->where(array("user_id"=>$uid))->delete();
							foreach ($role_ids as $role_id){
								$role_user_model->add(array("role_id"=>$role_id,"user_id"=>$uid));
							}
							$this->success("保存成功！");
						} else {
							$this->error("保存失败！");
						}
					} else {
						$this->error($this->users_model->getError());
					}
				}else{
					$this->error("请为此用户指定角色！");
				}
			}

			
			
		}
	}
	
	/**
	 *  删除
	 */
	function delete(){
		$id = intval(I("get.id"));

		if($id==1){
			$this->error("最高管理员不能删除！");
		}
		
		if ($this->users_model->where("id=$id")->delete()!==false) {
			M("RoleUser")->where(array("user_id"=>$id))->delete();
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
	}
	
	
	function userinfo(){
		$id=get_current_admin_id();
		$user=$this->users_model->where(array("id"=>$id))->find();
		$this->assign($user);
		$this->display();
	}
	
	function userinfo_post(){
		if (IS_POST) {
			$_POST['id']=get_current_admin_id();
			$create_result=$this->users_model
			->field("user_login,user_email,last_login_ip,last_login_time,create_time,user_activation_key,user_status,role_id,score,user_type",true)//排除相关字段
			->create();
			if ($create_result) {
				if ($this->users_model->save()!==false) {
					$this->success("保存成功！");
				} else {
					$this->error("保存失败！");
				}
			} else {
				$this->error($this->users_model->getError());
			}
		}
	}
	
	function ban(){
        $id=intval($_GET['id']);

    	if ($id) {
    		$rst = $this->users_model->where(array("id"=>$id,"user_type"=>1))->setField('user_status','0');
    		if ($rst) {
    			
    			$this->success("管理员停用成功！", U("user/index"));
    			
    			
    		} else {
    			$this->error('管理员停用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }
    
    function cancelban(){
    	$id=intval($_GET['id']);

    	if ($id) {
    		$rst = $this->users_model->where(array("id"=>$id,"user_type"=>1))->setField('user_status','1');
    		if ($rst) {
    			
    			$this->success("管理员启用成功！", U("user/index"));
    			
    			
    		} else {
    			$this->error('管理员启用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }


    /*************代理功能区start*******************/


    function add_agent(){

		$this->display();
	}

	function addagent_post(){
		if(IS_POST){
			
			$role_id=$_POST['role_id'];
			if ($this->users_model->create()) {
				$result=$this->users_model->add();
				if ($result!==false) {
					$role_user_model=M("RoleUser");
					
						$role_user_model->add(array("role_id"=>$role_id,"user_id"=>$result));
					
					$this->success("添加成功！", U("user/agent_index"));
				} else {
					$this->error("添加失败！");
				}
			} else {
				$this->error($this->users_model->getError());
			}
		
			
		}
	}

	/*代理列表*/

	function agent_index(){
		
		$map['user_type']=1;

		$map['status']=2;

		 if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$map['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }

		$count=$this->users_model->where($map)->count();

		$page = $this->page($count, 20);
		$users = $this->users_model
		->where($map)
		->order("create_time DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		
		$roles_src=$this->role_model->select();
		$roles=array();
		foreach ($roles_src as $r){
			$roleid=$r['id'];
			$roles["$roleid"]=$r;
		}

		$todayBeginDate=date('Y-m-d 00:00:00');//今天开始时间
		$todayEndDate=date('Y-m-d 23:59:59');//今天结束时间

		$todayBeginDateFormate=strtotime($todayBeginDate);
		$todayEndDateFormate=strtotime($todayEndDate);

		$yesterdayBeginDate=date('Y-m-d 00:00:00',strtotime("-1 day"));//昨天开始时间
		$yesterdayEndDate=date('Y-m-d 23:59:59',strtotime("-1 day"));//昨天结束时间

		$yesterdayBeginDateFormate=strtotime($yesterdayBeginDate);
		$yesterdayEndDateFormate=strtotime($yesterdayEndDate);

		$localMonthBeginDate=date('Y-m-01 00:00:00');//本月第一天，格式成时间戳
		$localMonthEndDate=date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y')));//本月最后一天，格式成时间戳

		$localMonthBeginDateFormate=strtotime($localMonthBeginDate);
		$localMonthEndDateFormate=strtotime($localMonthEndDate);


		foreach ($users as $k => $v) {


			//获取今日该代理下注册用户的数量
			$users[$k]['todayRegNum']=M("users")->where("second_upper={$v['id']} and user_type=2 and create_time>='{$todayBeginDate}' and create_time<='{$todayEndDate}'")->count();
			//获取昨日该代理下注册用户的数量
			$users[$k]['yesterdayRegNum']=M("users")->where("second_upper={$v['id']} and user_type=2 and create_time>='{$yesterdayBeginDate}' and create_time<='{$yesterdayEndDate}'")->count();
			//本月该代理下注册用户的数量
			$users[$k]['localMonthRegNum']=M("users")->where("second_upper={$v['id']} and user_type=2 and create_time>='{$localMonthBeginDate}' and create_time<='{$localMonthEndDate}'")->count();

			//获取今日该代理下的充值总金额
			$users[$k]['todayMoney']=M("users_income_lists")->where("uid={$v['id']}  and addtime>={$todayBeginDateFormate} and addtime<={$todayEndDateFormate}")->sum("charge_money");
			//获取昨天该代理下的充值总金额
			$users[$k]['yesterdayMoney']=M("users_income_lists")->where("uid={$v['id']}  and addtime>={$yesterdayBeginDateFormate} and addtime<={$yesterdayEndDateFormate}")->sum("charge_money");
			//获取本月该代理下的充值总金额
			$users[$k]['localmonthMoney']=M("users_income_lists")->where("uid={$v['id']}  and addtime>={$localMonthBeginDateFormate} and addtime<={$localMonthEndDateFormate}")->sum("charge_money");


			if(!$users[$k]['todayMoney']){
				$users[$k]['todayMoney']="0.00";
			}

			if(!$users[$k]['yesterdayMoney']){
				$users[$k]['yesterdayMoney']="0.00";
			}

			if(!$users[$k]['localmonthMoney']){
				$users[$k]['localmonthMoney']="0.00";
			}

			//获取该代理下的渠道数量
			$users[$k]['channelNum']=M("users")->where("status=1 and user_type=1 and upper={$v['id']}")->count();

			//获取今日该代理下的收益总金额
			$users[$k]['todayInCome']=M("users_income_lists")->where("uid={$v['id']}  and addtime>={$todayBeginDateFormate} and addtime<={$todayEndDateFormate}")->sum("money");
			//获取昨天该代理下的收益总金额
			$users[$k]['yesterdayInCome']=M("users_income_lists")->where("uid={$v['id']}  and addtime>={$yesterdayBeginDateFormate} and addtime<={$yesterdayEndDateFormate}")->sum("money");
			//获取本月该代理下的收益总金额
			$users[$k]['localmonthInCome']=M("users_income_lists")->where("uid={$v['id']}  and addtime>={$localMonthBeginDateFormate} and addtime<={$localMonthEndDateFormate}")->sum("money");

			if(!$users[$k]['todayInCome']){
				$users[$k]['todayInCome']="0.00";
			}

			if(!$users[$k]['yesterdayInCome']){
				$users[$k]['yesterdayInCome']="0.00";
			}

			if(!$users[$k]['localmonthInCome']){
				$users[$k]['localmonthInCome']="0.00";
			}

			//获取代理的收益信息
			$users[$k]['incomeMsg']=M("users_incomes")->where("uid={$v['id']}")->find();
			if(!$users[$k]['incomeMsg']){
				$users[$k]['incomeMsg']['total_income']='0.00';
				$users[$k]['incomeMsg']['settled']='0.00';
				$users[$k]['incomeMsg']['unsettled']='0.00';
			}
		}


		$this->assign("page", $page->show('Admin'));
		$this->assign("roles",$roles);
		$this->assign("users",$users);
		$this->assign('formget', $_GET);
		$this->assign("count",$count);
		$this->display();
	}



	function agent_edit(){
		$id= intval(I("get.id"));
		

		$role_user_model=M("RoleUser");
		$role_ids=$role_user_model->where(array("user_id"=>$id))->getField("role_id",true);
		$this->assign("role_ids",$role_ids);
			
		$user=$this->users_model->where(array("id"=>$id))->find();
		$this->assign($user);
		$this->display();
	}


	function agentedit_post(){
		if (IS_POST) {

				$income_percent=I("income_percent");

				if(!is_numeric($income_percent)){
					$this->error("分成比例必须填写数字");
				}


				if(strstr($income_percent,'.')){
					$this->error("分成比例请填写整数");
				}

				if($income_percent>100||$income_percent<0){
					$this->error("分成比例必须在0-100之间");
				}

				if(M("users")->create()){

					$data=array();

					//判断密码是否为空
					if($_POST['user_pass']!=""){
						$data['user_pass']=sp_password($_POST['user_pass']);
					}



					$data['user_email']=$_POST['user_email'];
					$data['income_percent']=$_POST['income_percent'];

				    $result = M("users")->where("id={$_POST['id']}")->save($data); // 写入数据到数据库 
				    if($result){
				        // 如果主键是自动增长型 成功后返回值就是最新插入的值
				        $this->success("保存成功！");
				    }else {
						$this->error("保存失败！");
					}
				}
					
		}else{
			$this->error("保存失败！");	
		}
	}


	function agent_delete(){
		$id = intval(I("get.id"));

		if($id==1){
			$this->error("最高管理员不能删除！");
		}

			

		
		if ($this->users_model->where("id=$id")->delete()!==false) {

			//将代理下的渠道删除
			M("users")->where("upper={$id} and user_type=1")->delete();
			//将代理下的用户归属平台
			$data = array('upper'=>'0','second_upper'=>'0');
			
			M("users")-> where(array("second_upper"=>$id,"user_type"=>'2'))->setField($data);

			M("RoleUser")->where(array("user_id"=>$id))->delete();

			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
	}

	function agent_ban(){
        $id=intval($_GET['id']);

    	if ($id) {
    		$rst = $this->users_model->where(array("id"=>$id,"user_type"=>1))->setField('user_status','0');
    		if ($rst) {
    			
    			$this->success("代理停用成功！", U("user/agent_index"));
    			
    			
    		} else {
    			$this->error('代理停用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }
    
    function agent_cancelban(){
    	$id=intval($_GET['id']);
    	if ($id) {
    		$rst = $this->users_model->where(array("id"=>$id,"user_type"=>1))->setField('user_status','1');
    		if ($rst) {
    			
    			$this->success("代理启用成功！", U("user/agent_index"));
    			
    			
    		} else {
    			$this->error('代理启用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }


    function agent_regist(){
		

		//获取代理ID
		$agentID=I("id");
		//获取时间参数
		$dataStatus=I("date");


		$todayBeginDate=date('Y-m-d 00:00:00');//今天开始时间
		$todayEndDate=date('Y-m-d 23:59:59');//今天结束时间


		$yestodayBeginDate=date('Y-m-d 00:00:00',strtotime("-1 day"));//昨天开始时间
		$yestodayEndDate=date('Y-m-d 23:59:59',strtotime("-1 day"));//昨天结束时间

		$localMonthBeginDate=date('Y-m-01 00:00:00');//本月第一天，格式成时间戳
		$localMonthEndDate=date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y')));//本月最后一天，格式成时间戳

		$where="";
		if($dataStatus=="today"){
			$where=" create_time >='{$todayBeginDate}' and create_time<='{$todayEndDate}'";
		}

		if($dataStatus=="yesterday"){
			$where=" create_time >='{$yestodayBeginDate}' and create_time<='{$yestodayEndDate}'";
		}

		if($dataStatus=="localmonth"){
			$where=" create_time >='{$localMonthBeginDate}' and create_time<='{$localMonthEndDate}'";
		}

		$map['user_type']=2;//普通用户

		$map['second_upper']=$agentID;


/*		 if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$where['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }*/

		$count=$this->users_model->where($map)->where($where)->count();

		$page = $this->page($count, 20);
		$users = $this->users_model
		->where($map)
		->where($where)
		->order("create_time DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		//var_dump($this->users_model->getLastSql());

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("users",$users);
		$this->assign('formget', $_GET);
		$this->assign("count",$count);
		$this->assign("dateStatus",$dataStatus);
		$this->assign("id",$agentID);
		$this->assign("date",$dataStatus);
		$this->display();

	}


	function agent_charge(){
		
		//获取代理ID
		$agentID=I("id");
		//获取时间参数
		$dataStatus=I("date");


		$todayBeginDate=strtotime(date('Y-m-d 00:00:00'));//今天开始时间
		$todayEndDate=strtotime(date('Y-m-d 23:59:59'));//今天结束时间


		$yestodayBeginDate=strtotime(date('Y-m-d 00:00:00',strtotime("-1 day")));//昨天开始时间
		$yestodayEndDate=strtotime(date('Y-m-d 23:59:59',strtotime("-1 day")));//昨天结束时间

		$localMonthBeginDate=strtotime(date('Y-m-01 00:00:00'));//本月第一天，格式成时间戳
		$localMonthEndDate=strtotime(date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y'))));//本月最后一天，格式成时间戳

		$where="";
		if($dataStatus=="today"){
			$where=" addtime >={$todayBeginDate} and addtime<={$todayEndDate}";
		}

		if($dataStatus=="yesterday"){
			$where=" addtime >='{$yestodayBeginDate}' and addtime<='{$yestodayEndDate}'";
		}

		if($dataStatus=="localmonth"){
			$where=" addtime >='{$localMonthBeginDate}' and addtime<='{$localMonthEndDate}'";
		}


		$map['uid']=$agentID;


		/*if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$where['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }*/

		$incomeList= M("users_income_lists");
		$sum=$incomeList->where($map)->where($where)->sum("charge_money");
		if(!$sum){
			$sum='0.00';
		}
		$count=$incomeList->where($map)->where($where)->count();

		$page = $this->page($count, 20);
		$incomelists = $incomeList
		->where($map)
		->where($where)
		->order("addtime DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		//var_dump($incomeList->getLastSql());

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("incomelists",$incomelists);
		$this->assign('formget', $_GET);
		$this->assign("sum",$sum);
		$this->assign("dateStatus",$dataStatus);
		$this->assign("id",$agentID);
		$this->assign("date",$dataStatus);
		$this->display();

	}

	function agent_income(){
		
		//获取代理ID
		$agentID=I("id");
		//获取时间参数
		$dataStatus=I("date");


		$todayBeginDate=strtotime(date('Y-m-d 00:00:00'));//今天开始时间
		$todayEndDate=strtotime(date('Y-m-d 23:59:59'));//今天结束时间


		$yestodayBeginDate=strtotime(date('Y-m-d 00:00:00',strtotime("-1 day")));//昨天开始时间
		$yestodayEndDate=strtotime(date('Y-m-d 23:59:59',strtotime("-1 day")));//昨天结束时间

		$localMonthBeginDate=strtotime(date('Y-m-01 00:00:00'));//本月第一天，格式成时间戳
		$localMonthEndDate=strtotime(date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y'))));//本月最后一天，格式成时间戳

		$where="";
		if($dataStatus=="today"){
			$where=" addtime >={$todayBeginDate} and addtime<={$todayEndDate}";
		}

		if($dataStatus=="yesterday"){
			$where=" addtime >='{$yestodayBeginDate}' and addtime<='{$yestodayEndDate}'";
		}

		if($dataStatus=="localmonth"){
			$where=" addtime >='{$localMonthBeginDate}' and addtime<='{$localMonthEndDate}'";
		}


		$map['uid']=$agentID;


		/*if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$where['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }*/

		$incomeList= M("users_income_lists");
		$sum=$incomeList->where($map)->where($where)->sum("money");
		if(!$sum){
			$sum='0.00';
		}
		$count=$incomeList->where($map)->where($where)->count();

		$page = $this->page($count, 20);
		$incomelists = $incomeList
		->where($map)
		->where($where)
		->order("addtime DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		//var_dump($incomeList->getLastSql());

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("incomelists",$incomelists);
		$this->assign('formget', $_GET);
		$this->assign("sum",$sum);
		$this->assign("dateStatus",$dataStatus);
		$this->assign("id",$agentID);
		$this->assign("date",$dataStatus);
		$this->display();

	}

	function agent_total(){

		$id=$_SESSION['ADMIN_ID'];//当前代理用户的ID

		$todayBeginDate=date('Y-m-d 00:00:00');//今天开始时间
		$todayEndDate=date('Y-m-d 23:59:59');//今天结束时间

		$todayBeginDateFormate=strtotime($todayBeginDate);
		$todayEndDateFormate=strtotime($todayEndDate);

		$yesterdayBeginDate=date('Y-m-d 00:00:00',strtotime("-1 day"));//昨天开始时间
		$yesterdayEndDate=date('Y-m-d 23:59:59',strtotime("-1 day"));//昨天结束时间

		$yesterdayBeginDateFormate=strtotime($yesterdayBeginDate);
		$yesterdayEndDateFormate=strtotime($yesterdayEndDate);

		$localMonthBeginDate=date('Y-m-01 00:00:00');//本月第一天，格式成时间戳
		$localMonthEndDate=date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y')));//本月最后一天，格式成时间戳

		$localMonthBeginDateFormate=strtotime($localMonthBeginDate);
		$localMonthEndDateFormate=strtotime($localMonthEndDate);

		//获取今日该代理下注册用户的数量
		$todayRegNum=M("users")->where("second_upper={$id} and user_type=2 and create_time>='{$todayBeginDate}' and create_time<='{$todayEndDate}'")->count();
		//获取昨日该代理下注册用户的数量
		$yesterdayRegNum=M("users")->where("second_upper={$id} and user_type=2 and create_time>='{$yesterdayBeginDate}' and create_time<='{$yesterdayEndDate}'")->count();
		//本月该代理下注册用户的数量
		$localMonthRegNum=M("users")->where("second_upper={$id} and user_type=2 and create_time>='{$localMonthBeginDate}' and create_time<='{$localMonthEndDate}'")->count();

		//获取今日该代理下的充值总金额
		$todayMoney=M("users_income_lists")->where("uid={$id}  and addtime>={$todayBeginDateFormate} and addtime<={$todayEndDateFormate}")->sum("charge_money");
		//获取昨天该代理下的充值总金额
		$yesterdayMoney=M("users_income_lists")->where("uid={$id}  and addtime>={$yesterdayBeginDateFormate} and addtime<={$yesterdayEndDateFormate}")->sum("charge_money");
		//获取本月该代理下的充值总金额
		$localmonthMoney=M("users_income_lists")->where("uid={$id}  and addtime>={$localMonthBeginDateFormate} and addtime<={$localMonthEndDateFormate}")->sum("charge_money");


		if(!$todayMoney){
			$todayMoney="0.00";
		}

		if(!$yesterdayMoney){
			$yesterdayMoney="0.00";
		}

		if(!$localmonthMoney){
			$localmonthMoney="0.00";
		}

		//获取今日该代理下的收益总金额
		$todayInCome=M("users_income_lists")->where("uid={$id}  and addtime>={$todayBeginDateFormate} and addtime<={$todayEndDateFormate}")->sum("money");
		//获取昨天该代理下的收益总金额
		$yesterdayInCome=M("users_income_lists")->where("uid={$id}  and addtime>={$yesterdayBeginDateFormate} and addtime<={$yesterdayEndDateFormate}")->sum("money");
		//获取本月该代理下的收益总金额
		$localmonthInCome=M("users_income_lists")->where("uid={$id}  and addtime>={$localMonthBeginDateFormate} and addtime<={$localMonthEndDateFormate}")->sum("money");

		if(!$todayInCome){
			$todayInCome="0.00";
		}

		if(!$yesterdayInCome){
			$yesterdayInCome="0.00";
		}

		if(!$localmonthInCome){
			$localmonthInCome="0.00";
		}

		//获取该代理的收益信息
		$incomeInfo=M("users_incomes")->where("uid={$id}")->find();

		$this->assign("todayRegNum",$todayRegNum);
		$this->assign("yesterdayRegNum",$yesterdayRegNum);
		$this->assign("localMonthRegNum",$localMonthRegNum);
		$this->assign("todayMoney",$todayMoney);
		$this->assign("yesterdayMoney",$yesterdayMoney);
		$this->assign("localmonthMoney",$localmonthMoney);
		$this->assign("todayInCome",$todayInCome);
		$this->assign("yesterdayInCome",$yesterdayInCome);
		$this->assign("localmonthInCome",$localmonthInCome);
		$this->assign("incomeInfo",$incomeInfo);

		$this->display();

	}

	 function agent_total_regist(){
		

		//获取代理ID
		$agentID=$_SESSION['ADMIN_ID'];//当前代理用户的ID
		//获取时间参数
		$dataStatus=I("date");


		$todayBeginDate=date('Y-m-d 00:00:00');//今天开始时间
		$todayEndDate=date('Y-m-d 23:59:59');//今天结束时间


		$yestodayBeginDate=date('Y-m-d 00:00:00',strtotime("-1 day"));//昨天开始时间
		$yestodayEndDate=date('Y-m-d 23:59:59',strtotime("-1 day"));//昨天结束时间

		$localMonthBeginDate=date('Y-m-01 00:00:00');//本月第一天，格式成时间戳
		$localMonthEndDate=date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y')));//本月最后一天，格式成时间戳

		$where="";
		if($dataStatus=="today"){
			$where=" create_time >='{$todayBeginDate}' and create_time<='{$todayEndDate}'";
		}

		if($dataStatus=="yesterday"){
			$where=" create_time >='{$yestodayBeginDate}' and create_time<='{$yestodayEndDate}'";
		}

		if($dataStatus=="localmonth"){
			$where=" create_time >='{$localMonthBeginDate}' and create_time<='{$localMonthEndDate}'";
		}

		$map['user_type']=2;//普通用户

		$map['second_upper']=$agentID;


/*		 if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$where['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }*/

		$count=$this->users_model->where($map)->where($where)->count();

		$page = $this->page($count, 20);
		$users = $this->users_model
		->where($map)
		->where($where)
		->order("create_time DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		//var_dump($this->users_model->getLastSql());

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("users",$users);
		$this->assign('formget', $_GET);
		$this->assign("count",$count);
		$this->assign("dateStatus",$dataStatus);
		$this->assign("id",$agentID);
		$this->assign("date",$dataStatus);
		$this->display();

	}

	function agent_total_charge(){
		
		//获取代理ID
		$agentID=$_SESSION['ADMIN_ID'];//当前代理用户的ID
		//获取时间参数
		$dataStatus=I("date");


		$todayBeginDate=strtotime(date('Y-m-d 00:00:00'));//今天开始时间
		$todayEndDate=strtotime(date('Y-m-d 23:59:59'));//今天结束时间


		$yestodayBeginDate=strtotime(date('Y-m-d 00:00:00',strtotime("-1 day")));//昨天开始时间
		$yestodayEndDate=strtotime(date('Y-m-d 23:59:59',strtotime("-1 day")));//昨天结束时间

		$localMonthBeginDate=strtotime(date('Y-m-01 00:00:00'));//本月第一天，格式成时间戳
		$localMonthEndDate=strtotime(date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y'))));//本月最后一天，格式成时间戳

		$where="";
		if($dataStatus=="today"){
			$where=" addtime >={$todayBeginDate} and addtime<={$todayEndDate}";
		}

		if($dataStatus=="yesterday"){
			$where=" addtime >='{$yestodayBeginDate}' and addtime<='{$yestodayEndDate}'";
		}

		if($dataStatus=="localmonth"){
			$where=" addtime >='{$localMonthBeginDate}' and addtime<='{$localMonthEndDate}'";
		}


		$map['uid']=$agentID;


		/*if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$where['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }*/

		$incomeList= M("users_income_lists");
		$sum=$incomeList->where($map)->where($where)->sum("charge_money");
		if(!$sum){
			$sum='0.00';
		}
		$count=$incomeList->where($map)->where($where)->count();

		$page = $this->page($count, 20);
		$incomelists = $incomeList
		->where($map)
		->where($where)
		->order("addtime DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		//var_dump($incomeList->getLastSql());

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("incomelists",$incomelists);
		$this->assign('formget', $_GET);
		$this->assign("sum",$sum);
		$this->assign("dateStatus",$dataStatus);
		$this->assign("id",$agentID);
		$this->assign("date",$dataStatus);
		$this->display();

	}

	function agent_total_income(){
		
		//获取代理ID
		$agentID=$_SESSION['ADMIN_ID'];//当前代理用户的ID
		//获取时间参数
		$dataStatus=I("date");


		$todayBeginDate=strtotime(date('Y-m-d 00:00:00'));//今天开始时间
		$todayEndDate=strtotime(date('Y-m-d 23:59:59'));//今天结束时间


		$yestodayBeginDate=strtotime(date('Y-m-d 00:00:00',strtotime("-1 day")));//昨天开始时间
		$yestodayEndDate=strtotime(date('Y-m-d 23:59:59',strtotime("-1 day")));//昨天结束时间

		$localMonthBeginDate=strtotime(date('Y-m-01 00:00:00'));//本月第一天，格式成时间戳
		$localMonthEndDate=strtotime(date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y'))));//本月最后一天，格式成时间戳

		$where="";
		if($dataStatus=="today"){
			$where=" addtime >={$todayBeginDate} and addtime<={$todayEndDate}";
		}

		if($dataStatus=="yesterday"){
			$where=" addtime >='{$yestodayBeginDate}' and addtime<='{$yestodayEndDate}'";
		}

		if($dataStatus=="localmonth"){
			$where=" addtime >='{$localMonthBeginDate}' and addtime<='{$localMonthEndDate}'";
		}


		$map['uid']=$agentID;


		/*if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$where['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }*/

		$incomeList= M("users_income_lists");
		$sum=$incomeList->where($map)->where($where)->sum("money");
		if(!$sum){
			$sum='0.00';
		}
		$count=$incomeList->where($map)->where($where)->count();

		$page = $this->page($count, 20);
		$incomelists = $incomeList
		->where($map)
		->where($where)
		->order("addtime DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		//var_dump($incomeList->getLastSql());

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("incomelists",$incomelists);
		$this->assign('formget', $_GET);
		$this->assign("sum",$sum);
		$this->assign("dateStatus",$dataStatus);
		$this->assign("id",$agentID);
		$this->assign("date",$dataStatus);
		$this->display();

	}

	//代理收益结算
	function agent_settle(){
		$agentID=I("agentid");
		
		$adminID=$_SESSION['ADMIN_ID'];//获取当前用户的登录名
		
		//从用户收益表中读取该用户的未结算金额
		$incomeInfo=M("users_incomes")->where(array("uid"=>$agentID))->find();
		if(!$incomeInfo){
			$this->error("该代理无法结算");
		}
		//读取用户的登录名
		$userLogin=M("users")->where("id={$incomeInfo['uid']}")->getField("user_login");

		$this->assign("unsettledMoney",$incomeInfo['unsettled']);
		$this->assign("uid",$incomeInfo['uid']);
		$this->assign("userLogin",$userLogin);
		$this->display();
	}

	function agent_settle_post(){
		$unsettledMoney=I("unsettledMoney");
		$settleMoney=I("settleMoney");
		$uid=I("uid");

		if($unsettledMoney==0){
			$this->error("该代理用户无金额可结算");
		}

		if($settleMoney==""){
			$this->error("请填写结算金额");
		}

		if(!is_numeric($settleMoney)){
			$this->error("结算金额请填写数字");
		}

		if($settleMoney<0){
			$this->error("结算金额必须大于0");
		}

		if($settleMoney>$unsettledMoney){
			$this->error("结算金额必须小于未结算金额");
		}

		$settleMoney=round(I("settleMoney"),2);//四舍五入保留2位小数

		
		//更新用户收益表
		$now=time();
		$rs=M("users_incomes")->execute("update __PREFIX__users_incomes set settled=settled+{$settleMoney},unsettled=unsettled-{$settleMoney},last_settle_time={$now} where uid={$uid}");
		if($rs!==false){
			//向结算记录表中加入数据
			$data=array(
				'adminid'=>$_SESSION['ADMIN_ID'],
				'settle_money'=>$settleMoney,
				'settle_before_money'=>$unsettledMoney,
				'settle_after_money'=>$unsettledMoney-$settleMoney,
				'uid'=>$uid,
				'addtime'=>time(),

			);

			M("users_settle_lists")->add($data);
		}
		$this->success("结算成功成功！", U("user/agent_index"));
	}

	//代理结算明细
	function agent_settle_lists(){
		$agentid=I("agentid");
		$agent_user_login=M("users")->where("id={$agentid}")->getField("user_login");

		$map['uid']=$agentid;
		$count=M("users_settle_lists")->where($map)->count();
		$page = $this->page($count, 20);
		$lists = M("users_settle_lists")
		->where($map)
		->order("addtime DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		foreach ($lists as $k => $v) {
			$lists[$k]['agent_user_login']=$agent_user_login;
			$lists[$k]['settle_user_login']=M("users")->where("id={$v['adminid']}")->getField("user_login");
		}

		$this->assign("page", $page->show('Admin'));
		$this->assign("lists",$lists);
		//$this->assign('formget', $_GET);
		$this->display();

	}

	//代理结算明细
	function agent_total_settle(){
		$agentid=$_SESSION['ADMIN_ID'];

		$agent_user_login=M("users")->where("id={$agentid}")->getField("user_login");

		$map['uid']=$agentid;
		$count=M("users_settle_lists")->where($map)->count();
		$page = $this->page($count, 20);
		$lists = M("users_settle_lists")
		->where($map)
		->order("addtime DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		foreach ($lists as $k => $v) {
			$lists[$k]['agent_user_login']=$agent_user_login;
			$lists[$k]['settle_user_login']=M("users")->where("id={$v['adminid']}")->getField("user_login");
		}

		$this->assign("page", $page->show('Admin'));
		$this->assign("lists",$lists);
		//$this->assign('formget', $_GET);
		$this->display();

	}


    /**************代理功能区end**************/


    /***************渠道功能start**************/

	/*渠道列表*/

	function channel_index(){
		
		$adminStatus=$_SESSION['ADMIN_status'];

		$map['user_type']=1;

		$map['status']=1;

		if($adminStatus==2){//如果当前用户是代理

			$map['upper']=$_SESSION['ADMIN_ID'];
		}

		 if($_REQUEST['keyword']!=''){

		 	if($_SESSION['ADMIN_status']=='0'){
		 		$where['id|user_login|upper']=$_REQUEST['keyword'];
		 	}else{
		 		$where['id|user_login']=$_REQUEST['keyword'];
		 	}
			

			$where['_logic']	="or";
			$map['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }


		$todayBeginDate=date('Y-m-d 00:00:00');//今天开始时间
		$todayEndDate=date('Y-m-d 23:59:59');//今天结束时间

		$todayBeginDateFormate=strtotime($todayBeginDate);
		$todayEndDateFormate=strtotime($todayEndDate);

		$yesterdayBeginDate=date('Y-m-d 00:00:00',strtotime("-1 day"));//昨天开始时间
		$yesterdayEndDate=date('Y-m-d 23:59:59',strtotime("-1 day"));//昨天结束时间

		$yesterdayBeginDateFormate=strtotime($yesterdayBeginDate);
		$yesterdayEndDateFormate=strtotime($yesterdayEndDate);

		$localMonthBeginDate=date('Y-m-01 00:00:00');//本月第一天，格式成时间戳
		$localMonthEndDate=date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y')));//本月最后一天，格式成时间戳

		$localMonthBeginDateFormate=strtotime($localMonthBeginDate);
		$localMonthEndDateFormate=strtotime($localMonthEndDate);

		$count=$this->users_model->where($map)->count();

		$page = $this->page($count, 20);
		$users = $this->users_model
		->where($map)
		->order("create_time DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		foreach ($users as $k => $v) {
			$users[$k]['uppername']=$this->users_model->where("id={$v['upper']}")->getField("user_login");
		}
		
		$roles_src=$this->role_model->select();
		$roles=array();
		foreach ($roles_src as $r){
			$roleid=$r['id'];
			$roles["$roleid"]=$r;
		}

		foreach ($users as $k => $v) {


			//获取今日该渠道下注册用户的数量
			$users[$k]['todayRegNum']=M("users")->where("upper={$v['id']} and user_type=2 and create_time>='{$todayBeginDate}' and create_time<='{$todayEndDate}'")->count();
			//获取昨日该渠道下注册用户的数量
			$users[$k]['yesterdayRegNum']=M("users")->where("upper={$v['id']} and user_type=2 and create_time>='{$yesterdayBeginDate}' and create_time<='{$yesterdayEndDate}'")->count();
			//本月该渠道下注册用户的数量
			$users[$k]['localMonthRegNum']=M("users")->where("upper={$v['id']} and user_type=2 and create_time>='{$localMonthBeginDate}' and create_time<='{$localMonthEndDate}'")->count();

			//获取今日该渠道下的充值总金额
			$users[$k]['todayMoney']=M("users_income_lists")->where("uid={$v['id']}  and addtime>={$todayBeginDateFormate} and addtime<={$todayEndDateFormate}")->sum("charge_money");
			//获取昨天该渠道下的充值总金额
			$users[$k]['yesterdayMoney']=M("users_income_lists")->where("uid={$v['id']}  and addtime>={$yesterdayBeginDateFormate} and addtime<={$yesterdayEndDateFormate}")->sum("charge_money");
			//获取本月该渠道下的充值总金额
			$users[$k]['localmonthMoney']=M("users_income_lists")->where("uid={$v['id']}  and addtime>={$localMonthBeginDateFormate} and addtime<={$localMonthEndDateFormate}")->sum("charge_money");


			if(!$users[$k]['todayMoney']){
				$users[$k]['todayMoney']="0.00";
			}

			if(!$users[$k]['yesterdayMoney']){
				$users[$k]['yesterdayMoney']="0.00";
			}

			if(!$users[$k]['localmonthMoney']){
				$users[$k]['localmonthMoney']="0.00";
			}

			//获取该渠道下的渠道数量
			$users[$k]['userNum']=M("users")->where("status=0 and user_type=2 and upper={$v['id']}")->count();

			//获取今日该渠道下的收益总金额
			$users[$k]['todayInCome']=M("users_income_lists")->where("uid={$v['id']}  and addtime>={$todayBeginDateFormate} and addtime<={$todayEndDateFormate}")->sum("money");
			//获取昨天该渠道下的收益总金额
			$users[$k]['yesterdayInCome']=M("users_income_lists")->where("uid={$v['id']}  and addtime>={$yesterdayBeginDateFormate} and addtime<={$yesterdayEndDateFormate}")->sum("money");
			//获取本月该渠道下的收益总金额
			$users[$k]['localmonthInCome']=M("users_income_lists")->where("uid={$v['id']}  and addtime>={$localMonthBeginDateFormate} and addtime<={$localMonthEndDateFormate}")->sum("money");

			if(!$users[$k]['todayInCome']){
				$users[$k]['todayInCome']="0.00";
			}

			if(!$users[$k]['yesterdayInCome']){
				$users[$k]['yesterdayInCome']="0.00";
			}

			if(!$users[$k]['localmonthInCome']){
				$users[$k]['localmonthInCome']="0.00";
			}

			//获取代理的收益信息
			$users[$k]['incomeMsg']=M("users_incomes")->where("uid={$v['id']}")->find();
			if(!$users[$k]['incomeMsg']){
				$users[$k]['incomeMsg']['total_income']='0.00';
				$users[$k]['incomeMsg']['settled']='0.00';
				$users[$k]['incomeMsg']['unsettled']='0.00';
			}


		}

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("roles",$roles);
		$this->assign("users",$users);
		$this->assign('formget', $_GET);
		$this->assign('count', $count);
		$this->display();
	}

	function add_channel(){
		$source=I("source");

		$agentid=I("agentid");
		$adminid=$_SESSION['ADMIN_ID'];

		$upper=$adminid;

		if($agentid){
			$upper=$agentid;
		}

		$this->assign("upper",$upper);
		$this->assign("source",$source);
		$this->display();
	}

	function addchannel_post(){
		if(IS_POST){
			
			$income_percent=I("income_percent");

			if(!is_numeric($income_percent)){
				$this->error("分成比例必须填写数字");
			}


			if(strstr($income_percent,'.')){
				$this->error("分成比例请填写整数");
			}

			if($income_percent>100||$income_percent<0){
				$this->error("分成比例必须在0-100之间");
			}
				
			$role_id=$_POST['role_id'];

			if ($this->users_model->create()) {
				$result=$this->users_model->add();
				if ($result!==false) {
					$role_user_model=M("RoleUser");
					
						$role_user_model->add(array("role_id"=>$role_id,"user_id"=>$result));
					
					$this->success("添加成功！", U("user/channel_index"));
				} else {
					$this->error("添加失败！");
				}
			} else {
				$this->error($this->users_model->getError());
			}
		
			
		}
	}


	function channel_edit(){

		$id= intval(I("get.id"));
		
		$role_user_model=M("RoleUser");
		$role_ids=$role_user_model->where(array("user_id"=>$id))->getField("role_id",true);
		$this->assign("role_ids",$role_ids);
			
		$user=$this->users_model->where(array("id"=>$id))->find();
		$this->assign($user);
		$this->display();


	}

	function channeledit_post(){

		if (IS_POST) {

				$income_percent=I("income_percent");

				if(!is_numeric($income_percent)){
					$this->error("分成比例必须填写数字");
				}


				if(strstr($income_percent,'.')){
					$this->error("分成比例请填写整数");
				}

				if($income_percent>100||$income_percent<0){
					$this->error("分成比例必须在0-100之间");
				}

				if(M("users")->create()){

					$data=array();

					//判断密码是否为空
					if($_POST['user_pass']!=""){
						$data['user_pass']=sp_password($_POST['user_pass']);
					}



					$data['user_email']=$_POST['user_email'];
					$data['income_percent']=$_POST['income_percent'];

				    $result = M("users")->where("id={$_POST['id']}")->save($data); // 写入数据到数据库 
				    if($result){
				        // 如果主键是自动增长型 成功后返回值就是最新插入的值
				        $this->success("保存成功！");
				    }else {
						$this->error("保存失败！");
					}
				}
					
		}else{
			$this->error("保存失败！");	
		}

	}

	//渠道删除

	function channel_delete(){
		$id = intval(I("get.id"));

		if($id==1){
			$this->error("最高管理员不能删除！");
		}
		
		if ($this->users_model->where("id=$id")->delete()!==false) {

			//将渠道下的用户归属平台
			$data = array('upper'=>'0','second_upper'=>'0');
			M("users")->where(array("upper"=>$id,"user_type"=>'2'))->setField($data);

			M("RoleUser")->where(array("user_id"=>$id))->delete();
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
	}

	function channel_ban(){
        $id=intval($_GET['id']);

    	if ($id) {
    		$rst = $this->users_model->where(array("id"=>$id,"user_type"=>1))->setField('user_status','0');
    		if ($rst) {
    			
    			$this->success("渠道停用成功！", U("user/channel_index"));
    			
    			
    		} else {
    			$this->error('渠道停用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }
    
    function channel_cancelban(){
    	$id=intval($_GET['id']);
    	if ($id) {
    		$rst = $this->users_model->where(array("id"=>$id,"user_type"=>1))->setField('user_status','1');
    		if ($rst) {
    			
    			$this->success("渠道启用成功！", U("user/channel_index"));
    			
    			
    		} else {
    			$this->error('渠道启用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }
	
	
	 function channel_regist(){
		
		//获取渠道ID
		$channelID=I("id");
		//获取时间参数
		$dataStatus=I("date");


		$todayBeginDate=date('Y-m-d 00:00:00');//今天开始时间
		$todayEndDate=date('Y-m-d 23:59:59');//今天结束时间


		$yestodayBeginDate=date('Y-m-d 00:00:00',strtotime("-1 day"));//昨天开始时间
		$yestodayEndDate=date('Y-m-d 23:59:59',strtotime("-1 day"));//昨天结束时间

		$localMonthBeginDate=date('Y-m-01 00:00:00');//本月第一天，格式成时间戳
		$localMonthEndDate=date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y')));//本月最后一天，格式成时间戳

		$where="";
		if($dataStatus=="today"){
			$where=" create_time >='{$todayBeginDate}' and create_time<='{$todayEndDate}'";
		}

		if($dataStatus=="yesterday"){
			$where=" create_time >='{$yestodayBeginDate}' and create_time<='{$yestodayEndDate}'";
		}

		if($dataStatus=="localmonth"){
			$where=" create_time >='{$localMonthBeginDate}' and create_time<='{$localMonthEndDate}'";
		}

		$map['user_type']=2;//普通用户

		$map['upper']=$channelID;


/*		 if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$where['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }*/

		$count=$this->users_model->where($map)->where($where)->count();

		$page = $this->page($count, 20);
		$users = $this->users_model
		->where($map)
		->where($where)
		->order("create_time DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		//var_dump($this->users_model->getLastSql());

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("users",$users);
		$this->assign('formget', $_GET);
		$this->assign("count",$count);
		$this->assign("dateStatus",$dataStatus);
		$this->assign("id",$channelID);
		$this->assign("date",$dataStatus);
		$this->display();

	}


	function channel_charge(){
		
		//获取渠道ID
		$channelID=I("id");
		//获取时间参数
		$dataStatus=I("date");


		$todayBeginDate=strtotime(date('Y-m-d 00:00:00'));//今天开始时间
		$todayEndDate=strtotime(date('Y-m-d 23:59:59'));//今天结束时间


		$yestodayBeginDate=strtotime(date('Y-m-d 00:00:00',strtotime("-1 day")));//昨天开始时间
		$yestodayEndDate=strtotime(date('Y-m-d 23:59:59',strtotime("-1 day")));//昨天结束时间

		$localMonthBeginDate=strtotime(date('Y-m-01 00:00:00'));//本月第一天，格式成时间戳
		$localMonthEndDate=strtotime(date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y'))));//本月最后一天，格式成时间戳

		$where="";
		if($dataStatus=="today"){
			$where=" addtime >={$todayBeginDate} and addtime<={$todayEndDate}";
		}

		if($dataStatus=="yesterday"){
			$where=" addtime >='{$yestodayBeginDate}' and addtime<='{$yestodayEndDate}'";
		}

		if($dataStatus=="localmonth"){
			$where=" addtime >='{$localMonthBeginDate}' and addtime<='{$localMonthEndDate}'";
		}


		$map['uid']=$channelID;


/*		 if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$where['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }*/

		$incomeList= M("users_income_lists");
		$sum=$incomeList->where($map)->where($where)->sum("charge_money");
		if(!$sum){
			$sum='0.00';
		}
		$count=$incomeList->where($map)->where($where)->count();

		$page = $this->page($count, 20);
		$incomelists = $incomeList
		->where($map)
		->where($where)
		->order("addtime DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("incomelists",$incomelists);
		$this->assign('formget', $_GET);
		$this->assign("sum",$sum);
		$this->assign("dateStatus",$dataStatus);
		$this->assign("id",$channelID);
		$this->assign("date",$dataStatus);
		$this->display();

	}


	function channel_income(){
		
		//获取代理ID
		$channelID=I("id");
		//获取时间参数
		$dataStatus=I("date");


		$todayBeginDate=strtotime(date('Y-m-d 00:00:00'));//今天开始时间
		$todayEndDate=strtotime(date('Y-m-d 23:59:59'));//今天结束时间


		$yestodayBeginDate=strtotime(date('Y-m-d 00:00:00',strtotime("-1 day")));//昨天开始时间
		$yestodayEndDate=strtotime(date('Y-m-d 23:59:59',strtotime("-1 day")));//昨天结束时间

		$localMonthBeginDate=strtotime(date('Y-m-01 00:00:00'));//本月第一天，格式成时间戳
		$localMonthEndDate=strtotime(date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y'))));//本月最后一天，格式成时间戳

		$where="";
		if($dataStatus=="today"){
			$where=" addtime >={$todayBeginDate} and addtime<={$todayEndDate}";
		}

		if($dataStatus=="yesterday"){
			$where=" addtime >='{$yestodayBeginDate}' and addtime<='{$yestodayEndDate}'";
		}

		if($dataStatus=="localmonth"){
			$where=" addtime >='{$localMonthBeginDate}' and addtime<='{$localMonthEndDate}'";
		}


		$map['uid']=$channelID;


		/*if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$where['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }*/

		$incomeList= M("users_income_lists");
		$sum=$incomeList->where($map)->where($where)->sum("money");
		if(!$sum){
			$sum='0.00';
		}
		$count=$incomeList->where($map)->where($where)->count();

		$page = $this->page($count, 20);
		$incomelists = $incomeList
		->where($map)
		->where($where)
		->order("addtime DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		//var_dump($incomeList->getLastSql());

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("incomelists",$incomelists);
		$this->assign('formget', $_GET);
		$this->assign("sum",$sum);
		$this->assign("dateStatus",$dataStatus);
		$this->assign("id",$channelID);
		$this->assign("date",$dataStatus);
		$this->display();

	}

	function channel_total(){

		$id=$_SESSION['ADMIN_ID'];//当前渠道用户的ID


		$todayBeginDate=date('Y-m-d 00:00:00');//今天开始时间
		$todayEndDate=date('Y-m-d 23:59:59');//今天结束时间

		$todayBeginDateFormate=strtotime($todayBeginDate);
		$todayEndDateFormate=strtotime($todayEndDate);

		$yesterdayBeginDate=date('Y-m-d 00:00:00',strtotime("-1 day"));//昨天开始时间
		$yesterdayEndDate=date('Y-m-d 23:59:59',strtotime("-1 day"));//昨天结束时间

		$yesterdayBeginDateFormate=strtotime($yesterdayBeginDate);
		$yesterdayEndDateFormate=strtotime($yesterdayEndDate);

		$localMonthBeginDate=date('Y-m-01 00:00:00');//本月第一天，格式成时间戳
		$localMonthEndDate=date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y')));//本月最后一天，格式成时间戳

		$localMonthBeginDateFormate=strtotime($localMonthBeginDate);
		$localMonthEndDateFormate=strtotime($localMonthEndDate);

		//获取今日该渠道下注册用户的数量
		$todayRegNum=M("users")->where("upper={$id} and user_type=2 and create_time>='{$todayBeginDate}' and create_time<='{$todayEndDate}'")->count();
		//获取昨日该渠道下注册用户的数量
		$yesterdayRegNum=M("users")->where("upper={$id} and user_type=2 and create_time>='{$yesterdayBeginDate}' and create_time<='{$yesterdayEndDate}'")->count();
		//本月该渠道下注册用户的数量
		$localMonthRegNum=M("users")->where("upper={$id} and user_type=2 and create_time>='{$localMonthBeginDate}' and create_time<='{$localMonthEndDate}'")->count();

		//获取今日该渠道下的充值总金额
		$todayMoney=M("users_income_lists")->where("uid={$id}  and addtime>={$todayBeginDateFormate} and addtime<={$todayEndDateFormate}")->sum("charge_money");
		//获取昨天该渠道下的充值总金额
		$yesterdayMoney=M("users_income_lists")->where("uid={$id}  and addtime>={$yesterdayBeginDateFormate} and addtime<={$yesterdayEndDateFormate}")->sum("charge_money");
		//获取本月该渠道下的充值总金额
		$localmonthMoney=M("users_income_lists")->where("uid={$id}  and addtime>={$localMonthBeginDateFormate} and addtime<={$localMonthEndDateFormate}")->sum("charge_money");


		if(!$todayMoney){
			$todayMoney="0.00";
		}

		if(!$yesterdayMoney){
			$yesterdayMoney="0.00";
		}

		if(!$localmonthMoney){
			$localmonthMoney="0.00";
		}

		//获取今日该代理下的收益总金额
		$todayInCome=M("users_income_lists")->where("uid={$id}  and addtime>={$todayBeginDateFormate} and addtime<={$todayEndDateFormate}")->sum("money");
		//获取昨天该代理下的收益总金额
		$yesterdayInCome=M("users_income_lists")->where("uid={$id}  and addtime>={$yesterdayBeginDateFormate} and addtime<={$yesterdayEndDateFormate}")->sum("money");
		//获取本月该代理下的收益总金额
		$localmonthInCome=M("users_income_lists")->where("uid={$id}  and addtime>={$localMonthBeginDateFormate} and addtime<={$localMonthEndDateFormate}")->sum("money");

		if(!$todayInCome){
			$todayInCome="0.00";
		}

		if(!$yesterdayInCome){
			$yesterdayInCome="0.00";
		}

		if(!$localmonthInCome){
			$localmonthInCome="0.00";
		}

		//获取该代理的收益信息
		$incomeInfo=M("users_incomes")->where("uid={$id}")->find();

		$this->assign("todayRegNum",$todayRegNum);
		$this->assign("yesterdayRegNum",$yesterdayRegNum);
		$this->assign("localMonthRegNum",$localMonthRegNum);
		$this->assign("todayMoney",$todayMoney);
		$this->assign("yesterdayMoney",$yesterdayMoney);
		$this->assign("localmonthMoney",$localmonthMoney);
		$this->assign("todayInCome",$todayInCome);
		$this->assign("yesterdayInCome",$yesterdayInCome);
		$this->assign("localmonthInCome",$localmonthInCome);
		$this->assign("incomeInfo",$incomeInfo);
		$this->display();

	}


	function channel_total_regist(){
		

		//获取渠道ID
		$channelID=$_SESSION['ADMIN_ID'];//当前渠道用户的ID
		//获取时间参数
		$dataStatus=I("date");


		$todayBeginDate=date('Y-m-d 00:00:00');//今天开始时间
		$todayEndDate=date('Y-m-d 23:59:59');//今天结束时间


		$yestodayBeginDate=date('Y-m-d 00:00:00',strtotime("-1 day"));//昨天开始时间
		$yestodayEndDate=date('Y-m-d 23:59:59',strtotime("-1 day"));//昨天结束时间

		$localMonthBeginDate=date('Y-m-01 00:00:00');//本月第一天，格式成时间戳
		$localMonthEndDate=date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y')));//本月最后一天，格式成时间戳

		$where="";
		if($dataStatus=="today"){
			$where=" create_time >='{$todayBeginDate}' and create_time<='{$todayEndDate}'";
		}

		if($dataStatus=="yesterday"){
			$where=" create_time >='{$yestodayBeginDate}' and create_time<='{$yestodayEndDate}'";
		}

		if($dataStatus=="localmonth"){
			$where=" create_time >='{$localMonthBeginDate}' and create_time<='{$localMonthEndDate}'";
		}

		$map['user_type']=2;//普通用户

		$map['second_upper']=$channelID;


/*		 if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$where['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }*/

		$count=$this->users_model->where($map)->where($where)->count();

		$page = $this->page($count, 20);
		$users = $this->users_model
		->where($map)
		->where($where)
		->order("create_time DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		//var_dump($this->users_model->getLastSql());

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("users",$users);
		$this->assign('formget', $_GET);
		$this->assign("count",$count);
		$this->assign("dateStatus",$dataStatus);
		$this->assign("id",$channelID);
		$this->assign("date",$dataStatus);
		$this->display();

	}

	function channel_total_charge(){
		
		//获取渠道ID
		$channelID=$_SESSION['ADMIN_ID'];//当前渠道用户的ID
		//获取时间参数
		$dataStatus=I("date");


		$todayBeginDate=strtotime(date('Y-m-d 00:00:00'));//今天开始时间
		$todayEndDate=strtotime(date('Y-m-d 23:59:59'));//今天结束时间


		$yestodayBeginDate=strtotime(date('Y-m-d 00:00:00',strtotime("-1 day")));//昨天开始时间
		$yestodayEndDate=strtotime(date('Y-m-d 23:59:59',strtotime("-1 day")));//昨天结束时间

		$localMonthBeginDate=strtotime(date('Y-m-01 00:00:00'));//本月第一天，格式成时间戳
		$localMonthEndDate=strtotime(date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y'))));//本月最后一天，格式成时间戳

		$where="";
		if($dataStatus=="today"){
			$where=" addtime >={$todayBeginDate} and addtime<={$todayEndDate}";
		}

		if($dataStatus=="yesterday"){
			$where=" addtime >='{$yestodayBeginDate}' and addtime<='{$yestodayEndDate}'";
		}

		if($dataStatus=="localmonth"){
			$where=" addtime >='{$localMonthBeginDate}' and addtime<='{$localMonthEndDate}'";
		}


		$map['uid']=$channelID;


		/*if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$where['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }*/

		$incomeList= M("users_income_lists");
		$sum=$incomeList->where($map)->where($where)->sum("charge_money");
		if(!$sum){
			$sum='0.00';
		}
		$count=$incomeList->where($map)->where($where)->count();

		$page = $this->page($count, 20);
		$incomelists = $incomeList
		->where($map)
		->where($where)
		->order("addtime DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		//var_dump($incomeList->getLastSql());

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("incomelists",$incomelists);
		$this->assign('formget', $_GET);
		$this->assign("sum",$sum);
		$this->assign("dateStatus",$dataStatus);
		$this->assign("id",$channelID);
		$this->assign("date",$dataStatus);
		$this->display();

	}

	function channel_total_income(){
		
		//获取渠道ID
		$channelID=$_SESSION['ADMIN_ID'];//当前渠道用户的ID
		//获取时间参数
		$dataStatus=I("date");


		$todayBeginDate=strtotime(date('Y-m-d 00:00:00'));//今天开始时间
		$todayEndDate=strtotime(date('Y-m-d 23:59:59'));//今天结束时间


		$yestodayBeginDate=strtotime(date('Y-m-d 00:00:00',strtotime("-1 day")));//昨天开始时间
		$yestodayEndDate=strtotime(date('Y-m-d 23:59:59',strtotime("-1 day")));//昨天结束时间

		$localMonthBeginDate=strtotime(date('Y-m-01 00:00:00'));//本月第一天，格式成时间戳
		$localMonthEndDate=strtotime(date('Y-m-d H:i:s',mktime(23,59,59,date('n'),date('t'),date('Y'))));//本月最后一天，格式成时间戳

		$where="";
		if($dataStatus=="today"){
			$where=" addtime >={$todayBeginDate} and addtime<={$todayEndDate}";
		}

		if($dataStatus=="yesterday"){
			$where=" addtime >='{$yestodayBeginDate}' and addtime<='{$yestodayEndDate}'";
		}

		if($dataStatus=="localmonth"){
			$where=" addtime >='{$localMonthBeginDate}' and addtime<='{$localMonthEndDate}'";
		}


		$map['uid']=$channelID;


		/*if($_REQUEST['keyword']!=''){

			$where['id|user_login']	=array("like","%".$_REQUEST['keyword']."%");
			$where['_logic']	="or";
			$where['_complex']=$where;
			
			$_GET['keyword']=$_REQUEST['keyword'];

		 }*/

		$incomeList= M("users_income_lists");
		$sum=$incomeList->where($map)->where($where)->sum("money");
		if(!$sum){
			$sum='0.00';
		}
		$count=$incomeList->where($map)->where($where)->count();

		$page = $this->page($count, 20);
		$incomelists = $incomeList
		->where($map)
		->where($where)
		->order("addtime DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		//var_dump($incomeList->getLastSql());

		
		$this->assign("page", $page->show('Admin'));
		$this->assign("incomelists",$incomelists);
		$this->assign('formget', $_GET);
		$this->assign("sum",$sum);
		$this->assign("dateStatus",$dataStatus);
		$this->assign("id",$channelID);
		$this->assign("date",$dataStatus);
		$this->display();

	}


	//代理收益结算
	function channel_settle(){
		$channelID=I("channelid");
		
		$adminID=$_SESSION['ADMIN_ID'];//获取当前用户的登录名
		
		//从用户收益表中读取该用户的未结算金额
		$incomeInfo=M("users_incomes")->where(array("uid"=>$channelID))->find();

		if($incomeInfo){
			//读取用户的登录名
			$userLogin=M("users")->where("id={$incomeInfo['uid']}")->getField("user_login");

			$this->assign("unsettledMoney",$incomeInfo['unsettled']);
			$this->assign("uid",$incomeInfo['uid']);
			$this->assign("userLogin",$userLogin);
		}else{
			$this->error("该渠道无法结算");
		}
		
		$this->display();
	}

	function channel_settle_post(){
		$unsettledMoney=I("unsettledMoney");
		$settleMoney=I("settleMoney");
		$uid=I("uid");

		if($unsettledMoney==0){
			$this->error("该渠道用户无金额可结算");
		}

		if($settleMoney==""){
			$this->error("请填写结算金额");
		}

		if(!is_numeric($settleMoney)){
			$this->error("结算金额请填写数字");
		}

		if($settleMoney<0){
			$this->error("结算金额必须大于0");
		}

		if($settleMoney>$unsettledMoney){
			$this->error("结算金额必须小于未结算金额");
		}

		$settleMoney=round(I("settleMoney"),2);//四舍五入保留2位小数

		
		//更新用户收益表
		$now=time();
		$rs=M("users_incomes")->execute("update __PREFIX__users_incomes set settled=settled+{$settleMoney},unsettled=unsettled-{$settleMoney},last_settle_time={$now} where uid={$uid}");
		if($rs!==false){
			//向结算记录表中加入数据
			$data=array(
				'adminid'=>$_SESSION['ADMIN_ID'],
				'settle_money'=>$settleMoney,
				'settle_before_money'=>$unsettledMoney,
				'settle_after_money'=>$unsettledMoney-$settleMoney,
				'uid'=>$uid,
				'addtime'=>time(),

			);

			M("users_settle_lists")->add($data);
		}
		$this->success("结算成功成功！", U("user/channel_index"));
	}

	//渠道结算明细
	function channel_settle_lists(){
		$channelid=I("channelid");
		$agent_user_login=M("users")->where("id={$channelid}")->getField("user_login");

		$map['uid']=$channelid;
		$count=M("users_settle_lists")->where($map)->count();
		$page = $this->page($count, 20);
		$lists = M("users_settle_lists")
		->where($map)
		->order("addtime DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		foreach ($lists as $k => $v) {
			$lists[$k]['agent_user_login']=$agent_user_login;
			$lists[$k]['settle_user_login']=M("users")->where("id={$v['adminid']}")->getField("user_login");
		}

		$this->assign("page", $page->show('Admin'));
		$this->assign("lists",$lists);
		//$this->assign('formget', $_GET);
		$this->display();

	}

	function channel_total_settle(){

		$channelid=$_SESSION['ADMIN_ID'];
		$agent_user_login=M("users")->where("id={$channelid}")->getField("user_login");

		$map['uid']=$channelid;
		$count=M("users_settle_lists")->where($map)->count();
		$page = $this->page($count, 20);
		$lists = M("users_settle_lists")
		->where($map)
		->order("addtime DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		foreach ($lists as $k => $v) {
			$lists[$k]['agent_user_login']=$agent_user_login;
			$lists[$k]['settle_user_login']=M("users")->where("id={$v['adminid']}")->getField("user_login");
		}

		$this->assign("page", $page->show('Admin'));
		$this->assign("lists",$lists);
		//$this->assign('formget', $_GET);
		$this->display();

	}

	
}