<?php
/**
 * 后台入口文件
 */
//echo 123;die;
$upw =empty($_GET['upw'])?"":'&upw='.$_GET['upw'];
 
header("Location: ../index.php?g=admin&m=public&a=login".$upw );

