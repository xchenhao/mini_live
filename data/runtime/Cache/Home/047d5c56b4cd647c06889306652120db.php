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
								<li class="list-group-item"> <a href="./index.php?m=Personal&a=index"><?php echo ($user['user_nicename']); ?></a> </li>
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



<body class="home-index">
<div class="jumbotron">
		<div class="zhiboBox">
				<div class="module-title">
						<h2><em>Live online</em>在线直播中</h2>
				</div>
				<div class="container m-list menuList">
						<?php if(is_array($live_show)): $k = 0; $__LIST__ = $live_show;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($k % 2 );++$k; if($k==1){?>
							<div class="row m-list-item" onClick="window.location.href='/index.php?g=portal&m=page&a=record&id=11958';">
						<?php }elseif($k==2){?>
							<div class="row m-list-item" onClick="window.location.href='/index.php?g=portal&m=page&a=record&id=11959';">
						<?php }elseif($k==3){?>
							<div class="row m-list-item" onClick="window.location.href='/index.php?g=portal&m=page&a=record&id=11960';">
						<?php }elseif($k==4){?>
							<div class="row m-list-item" onClick="window.location.href='/index.php?g=portal&m=page&a=record&id=11955';">
						<?php }?>
								<div class="col-md-12 m-item <?php if(($mod) == "1"): if( $v['islive'] == '1'): ?>live live<?php echo ($v['uid']); ?>
												<?php else: ?>
												none-live<?php endif; endif; ?>
										" onclick="window.location.href='./<?php echo ($v['uid']); ?>';"> <div class="item" 
										
										
										
										<?php if(($mod) == "1"): else: ?>
												style=" position:absolute;top:0;bottom:0;left:0;right:0;"<?php endif; ?>
										>
										<?php if(($mod) == "1"): ?><img src="<?php echo ($v['thumb']); ?>" class="img-fluid">
												<?php else: ?>
												<h5 class="username"> <img src="<?php echo ($v['thumb']); ?>" class="img-fluid"> <?php echo ($v['user_nicename']); ?> <span class="showTime"><?php echo ($live_show_time); ?></span></h5>
												<div class="description" id="user<?php echo ($v['uid']); ?>">
														<p>
																<?php if($v['description'] != ''): echo ($v['description']); ?>
																		<?php else: ?>
																		这家伙很懒，什么都没有留下。<?php endif; ?>
														</p>
												</div><?php endif; ?>
										<h5 class="username"> <img src="<?php echo ($v['thumb']); ?>" class="img-fluid"> <?php echo ($v['user_nicename']); ?> <span class="showTime"><?php echo ($live_show_time); ?></span></h5>
								</div>
						</div>
						<div class="col-md-12 m-item <?php if(($mod) == "1"): else: ?>
								<?php if( $v['islive'] == '1'): ?>live live<?php echo ($v['uid']); ?>
										<?php else: ?>
										none-live<?php endif; endif; ?>
								"> <div class="item" 
								
								
								<?php if(($mod) == "1"): ?>style="position:absolute;top:0;bottom:0;left:0;right:0;"<?php endif; ?>
								>
								<?php if(($mod) == "1"): ?><div class="description" id="user<?php echo ($v['uid']); ?>">
												<p>
														<?php if($v['description'] != ''): echo ($v['description']); endif; ?>
												</p>
										</div>
										<?php else: ?>
										<img src="<?php echo ($v['thumb']); ?>" class="img-fluid"><?php endif; ?>
								<?php if($k != 4): ?><h5 class="username"> <img src="<?php echo ($v['thumb']); ?>" class="img-fluid"> <?php echo ($v['user_nicename']); ?> <span class="showTime"><?php echo ($live_show_time); ?></span></h5><?php endif; ?>
						</div>
				</div>
		</div><?php endforeach; endif; else: echo "" ;endif; ?>
</div>
</div>
<div class="companyBox">
		<h3>公司简介</h3>
		<p>北京喵斯拉网络科技有限公司成立于2014年07月28日，注册地位于北京市朝阳区阜通东大街1号院5号楼2单元18层321801。经营范围包括技术推广服务；组织文化艺术交流活动（不含演出）；设计、制作、代理、发布广告；经济贸易咨询；企业管理咨询；市场调查；销售计算机、软件及辅助设备、服装、鞋帽、玩具、文具用品、电子产品、工艺品、日用品；计算机系统服务；企业策划；票务代理（不含航空机票销售代理）；出版物零售；从事互联网文化活动；广播电视节目制作；销售食品；演出经纪；音像制品制作...</p>
</div>
<div class="mainBox clearfix">
		<div class="container">
				<div class="module-title">
						<h2><em>Wonderful playback</em>精彩回放中</h2>
				</div>
				<div class="row m-list">
						<?php if(is_array($live_record)): $i = 0; $__LIST__ = $live_record;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div class="col-md-3 m-item record-live" onClick="window.location.href='/index.php?g=portal&m=page&a=record&id=<?php echo ($v['uid']); ?>';">
										<div class="item"> <img src="<?php echo ($v['thumb']); ?>" class="img-fluid">
												<h5 class="username"> <img src="<?php echo ($v['thumb']); ?>" class="img-fluid"> <?php echo ($v['user_nicename']); ?> </h5>
										</div>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
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