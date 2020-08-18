<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="zh">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="keywords" content="">
  <meta name="description" content="">
  
  <link rel="stylesheet" href="/public/assets/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="/public/assets/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/public/assets/animate.css">
  <link rel="stylesheet" href="/public/assets/hover/css/hover-min.css">
  <link rel="stylesheet" href="/public/assets/src/css/main.css">
  <link rel="icon" href="/public/static/favicon.ico">
  
  <title><?php echo ($title); ?> - <?php echo ($site_name); ?></title>
  <style>
  </style>
  </head>

<nav class="navbar navbar-expand-md">
		<div class="container-fluid" style="width: 1200px; margin: 0 auto;">
				
				<div class="logo"><a href="/"><img src="/public/images/logo.png" width="170" alt="" /></a></div>
				<ul class="list-group sidebar-nav">
						<li class="list-group-item"> <a href="/" class="on">首页 </a> </li>
						<li class="list-group-item"> <a href="/index.php?g=home&m=index&a=live"> 热门直播 </a> </li>
						<li class="list-group-item"> <a href="/index.php?g=home&m=index&a=record"> 精彩回放 </a> </li>
						<li class="list-group-item"> <a href="/index.php?g=portal&m=page&a=news&id=25"> 直播公约 </a> </li>
						<li class="list-group-item"> <a href="/index.php?g=portal&m=page&a=news&id=26"> 直播服务协议 </a> </li>
						<li class="list-group-item"> <a href="/index.php?g=portal&m=page&a=news&id=27"> 直播承诺书</a> </li>
						<li class="list-group-item"> <a href="/index.php?g=portal&m=page&a=news&id=28"> 纠纷处理</a> </li>
						<li class="list-group-item"> <a href="/admin/"> 后台监管</a> </li>
						<?php if(!$user): ?><li class="list-group-item"> <a class="alink" href="#" data-toggle="modal" data-target="#registerModal"> 注册 </a> </li>
								<li class="list-group-item"> <a class="alink" href="#" data-toggle="modal" data-target="#loginModal"> 登录 </a> </li>
								<?php else: ?>
								<li class="list-group-item">
										<div id="nickname" style="display: none;"><?php echo ($user['user_nicename']); ?></div>
										<a href="./index.php?m=Personal&a=index"><?php echo ($user['user_nicename']); ?></a> </li>
								<li class="list-group-item"> <a href="./index.php?m=Personal&a=live">我的直播</a> </li>
								<li class="list-group-item"> <a href="#" onclick="Login.logout()">退出登录</a> </li><?php endif; ?>
				</ul>
		</div>
		<div class="img01"><img src="/public/images/mainimg.jpg" width="100%" alt="" /></div>
</nav>
<!-- 登录 -->
<div class="modal fade" id="loginModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- 模态框头部 -->
			<div class="modal-header">
				<h4 class="modal-title">用户登录</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- 模态框主体 -->
			<div class="modal-body">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">
							账号
						</span>
					</div>
					<input id="login-username" type="text" class="form-control" placeholder="请输入用户名">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">
							密码
						</span>
					</div>
					<input id="login-password" type="password" class="form-control" placeholder="请输入密码">
				</div>

				<div class="input-group">
					<p>登录即表示您同意<em><a style="color: #da5537;" href="./index.php?m=page&a=agreement" target="_blank">《用户协议》</a></em></p>
				</div>
			</div>

			<!-- 模态框底部 -->
			<div class="modal-footer">
				<button type="button" class="form-control btn btn-primary" onclick="Login.dologin()" style='color:#FFFF99;font-weight:800;'>
					登录
				</button>
			</div>
		</div>
	</div>
</div>

<!-- 注册 -->
<div class="modal fade" id="registerModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- 模态框头部 -->
			<div class="modal-header">
				<h4 class="modal-title">用户注册</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- 模态框主体 -->
			<div class="modal-body">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">
							用户名
						</span>
					</div>
					<input id="reg-username" type="text" class="form-control" placeholder="请输入用户名">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">
							密码
						</span>
					</div>
					<input id="reg-password1" type="password" class="form-control" placeholder="请输入密码">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">
							确认密码
						</span>
					</div>
					<input id="reg-password2" type="password" class="form-control" placeholder="请输入密码">
				</div>
              
              
              
               <div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">
							真实姓名
						</span>
					</div>
					<input id="reg-username1" type="text" class="form-control" placeholder="请输入真实姓名">
				</div>
              <div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">
							手机号
						</span>
					</div>
					<input id="reg-username2" type="text" class="form-control" placeholder="请输入手机号">
				</div>
              <div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">
							身份证号
						</span>
					</div>
					<input id="reg-username3" type="text" class="form-control" placeholder="请输入身份证号">
				</div>
              
              
              
              

				<div class="input-group">
					<p>注册即表示您同意<em><a style="color: #da5537;" href="./index.php?m=page&a=agreement" target="_blank">《用户协议》</a></em></p>
				</div>
			</div>

			<!-- 模态框底部 -->
			<div class="modal-footer">
				<button type="button" class="form-control btn btn-primary" onclick="Login.doreg()">
					注册
				</button>
			</div>
		</div>
	</div>
</div>



<body class="home-personal">
	<link type="text/css" rel="stylesheet" href="/public/home/css/personal.css" />
<link type="text/css" rel="stylesheet" href="/public/home/css/font-awesome.min.css" />
<style>
	.hersleft i {
		display: none;
	}
</style>
<div class="headers" style="border: 0px;">
	<div class="container" style="padding-top:15px">
		<div class="hersleft">
			<a href="index.php?m=Personal&a=photo" style="display:inline-block;height:88px">
				<img style="border: 0;" src="<?php echo ($info['avatar']); ?>" alt="" class="herszhezhao">
			</a>
		</div>
		<div class="hersright">
			<div>
				<p style="margin: 10px 0px;">昵称：<?php echo ($info['user_nicename']); ?></p>
				<p style="margin: 10px 0px;">账号：<?php echo ($info['user_login']); ?></p>
			</div>
		</div>
		
		<div><hr style="margin: 15px 0px;"></div>
	</div>

</div>


	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<div class="Leftlayout">
					<ul id="accordion" class="accordion">
	<li>
		<a class="homepage" href="index.php?m=Personal&a=index">
			<!-- <i class="fa fa-paint-brush"></i> -->我的首页
		</a>
	</li>
	<li <?php if($personal == 'Set'): ?>class="gangkaishi open"
		<?php else: ?>class="gangkaishi"<?php endif; ?>>
		<div class="link">账号设置<i class="fa fa-chevron-down"></i></div>
		<ul <?php if($personal == 'Set'): ?>class="submenu pedisplay"
			<?php else: ?>class="submenu"<?php endif; ?>>
			<li><a href="index.php?m=Personal&a=modify">基本资料</a></li>
			<!-- <li><a href="index.php?m=Personal&a=photo">修改头像</a></li> -->
			<li><a href="index.php?m=Personal&a=updatepass">修改密码</a></li>
		</ul>
	</li>
	<li <?php if($personal == 'follow'): ?>class="gangkaishi open"
		<?php else: ?>class="gangkaishi"<?php endif; ?>>
		<div class="link">我的社交<i class="fa fa-chevron-down"></i></div>
		<ul <?php if($personal == 'follow'): ?>class="submenu pedisplay"
			<?php else: ?>class="submenu"<?php endif; ?>>
			<li><a href="index.php?m=Personal&a=follow">我的关注</a></li>
			<li><a href="index.php?m=Personal&a=fans">我的粉丝</a></li>
			<li><a href="index.php?m=Personal&a=namelist">我的黑名单</a></li>
			<li><a href="index.php?m=Personal&a=admin">我的管理员</a></li>
			<li><a href="index.php?m=Personal&a=live">我的直播</a></li>
		</ul>
	</li>
	<li <?php if($personal == 'card'): ?>class="gangkaishi open"
		<?php else: ?>class="gangkaishi"<?php endif; ?>>
		<div class="link">我的认证<i class="fa fa-chevron-down"></i></div>
		<ul <?php if($personal == 'card'): ?>class="submenu pedisplay"
			<?php else: ?>class="submenu"<?php endif; ?>>
			<li><a href="index.php?m=Personal&a=card">我要认证</a></li>
			<!-- <li><a href="index.php?m=Personal&a=exchange">提现中心</a></li> -->
		</ul>
	</li>
</ul>

				</div>
			</div>
			<div class="col-md-10">
			<div class="clearfix">
				<div class="shouyez">
					<h3 class="personal_h3">
						<i class="h3_one"></i>
						我的直播记录
						<span>
						 <?php echo ($getConfigName['name_coin']); ?>:<?php echo ($coin); ?>
						 <a class="icon"></a>
						</span>
						<a class="buy-coins" href="index.php?m=Payment&a=index">充值<a>
						<a class="buy-coins" onclick="Personal.played(<?php echo ($uid); ?>)">回放<a>
						<div class="linexi"></div>
					</h3>
				</div>
			</div>
			<div class="schedule">
				<div class="charge_mt">
				<h4>我的直播记录</h4>
				 <form action="index.php?m=Personal&a=live" method="post">
				  查询时间：
					<input type="text" name="start_time" class="js-date date" value="<?php echo ($formget["start_time"]); ?>"  autocomplete="off">-
					<input type="text" name="end_time" class="js-date date" value="<?php echo ($formget["end_time"]); ?>"  autocomplete="off">
					<button type="submit" value="搜索">搜索</button>
				</form> 
				</div>
				<div class="charge_table">
					<table>
					 <tbody>
						<tr>
						  <th width="20%">开播时间</th>
							<th width="15%">结束时间</th>
							<th width="15%">房间人数</th>
							<th width="20%">直播标题</th>
						  <th width="10%">直播类型</th>
						</tr>
						<?php if(is_array($lists)): foreach($lists as $key=>$vo): ?><tr>
								<td width="20%"><?php echo (date("Y-m-d H:i:s",$vo['starttime'])); ?></td>
								<?php if($vo['endtime'] != 0 ): ?><td width="15%"><?php echo (date("Y-m-d H:i:s",$vo['endtime'])); ?></td>
								<?php else: ?>
									<td width="15%"></td><?php endif; ?>
								<td width="15%"><?php echo ($vo['nums']); ?></td>
								<td width="20%"><?php echo ($vo['title']); ?></td>
								<?php if($vo['type'] == 0): ?><td width="10%">一般直播</td>
								<?php elseif($vo['islive'] == 1): ?>
									<td width="10%">私密直播</td>
								<?php else: ?>
									<td width="10%">计时直播</td><?php endif; ?>
							</tr><?php endforeach; endif; ?>
						</tbody>						
					</table>
          <div class="page">
					
	          </div>		    	   					
				</div>
			</div>
				<?php echo ($page); ?>
		</div>
  </div>
</div>
<div class="footer">
		<div class="container">
				<div class="footer-row l1"> <a href="/">首页</a> <a href="/admin/">后台监管</a> <a href="/index.php?g=portal&m=page&a=news&id=25"> 直播公约 </a> <a href="/index.php?g=portal&m=page&a=news&id=26"> 直播服务协议 </a> <a href="/index.php?g=portal&m=page&a=news&id=27"> 直播承诺书 </a> <a href="/index.php?g=portal&m=page&a=news&id=28"> 纠纷处理 </a></div>
				<div id="footer-row l1" style="margin-top:15px;"> <a href="http://jbts.mct.gov.cn/">12318全国文化市场举报网站</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="http://www.bjjubao.net/">北京互联网违法和不良信息举报 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="http://www.bjjubao.org/">网上有害信息举报专区</a> </div>
				<div class="footer-row l3">
						<p> <?php echo ($site_telephone); ?><span> | </span><?php echo ($site_email); ?><span> | </span> <?php echo ($copyright); ?> <span> | </span> <a href="http://www.beian.miit.gov.cn"><?php echo ($site_icp); ?></a></p>
				</div>
		</div>
</div>
<script src="/public/assets/js/jquery3.3.1.min.js"></script> 
<script src="/public/assets/js/popper.min.js"></script> 
<script src="/public/assets/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
<script src="/public/assets/vue/vue.js"></script> 
<script src="/public/assets/js/jquery.cookie.js"></script> 
<script src="/public/assets/js/holder.min.js"></script> 
<script src="/public/home/js/login.js"></script> 
<script src="/public/assets/src/js/main.js"></script>
</body></html>
<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/",
    JS_ROOT: "public/js/",
    TOKEN: ""
};
$(function()
{
	  /* 时间控件 */
     $("input.js-date").datePicker();
}
)
</script>
<script src="/public/js/jquery.js"></script>
<script>
$(function(){
  //打开上传视频窗口
  $('.dianji').click(function()
	{
		$("#datas").css('display','none');
		$("#modify").css('display','block');
  });  
	$('.hersquxiao').click(function()
	{
		$("#modify").css('display','none');
		$("#datas").css('display','block');
  });
  $('.hersbaocun').click(function()
	{
	  var name=$("#name").val();
	  if(name!=""&&name!="请输入新昵称")
		{ 
			if(name.length>8)
			{
				layer.alert('昵称最多为八位', 
				{
					skin: 'layui-layer-molv' //样式类名
					,closeBtn: 0,
					shift: 5,
					icon: 2,
				}, function(){
				layer.closeAll();
				});
			}
			else
			{
				$.getJSON("/index.php?g=home&m=Personal&a=edit_name", {name:name},
				function(data)
				{
					if(data["state"]==0)
					{
					 	layer.alert('修改完成', 
						{
							skin: 'layui-layer-molv' //样式类名
							,closeBtn: 0,
							shift: 5,
							icon: 1
						}, function(){
							window.location.href="";
						});
					}
				});
			}
    }
	  else
	  {
			layer.alert('昵称不能为空', 
			{
				skin: 'layui-layer-molv' //样式类名
				,closeBtn: 0,
				shift: 5,
				icon: 2,
			}, function(){
			 layer.closeAll();
			});
	  }      
  });
	})
</script>  
<script src="/public/js/wind.js"></script>	
<script type="text/javascript" src="/public/js/datePicker/datePicker.js"></script>
<script type="text/javascript" src="/public/home/js/personal.js"></script>