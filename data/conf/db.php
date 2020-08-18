<?php
/**
 * 配置文件
 */
return array(
//    'DB_TYPE' => 'mysqli',
    'DB_TYPE' => 'mysql',
    'DB_HOST' => 'localhost',
    'DB_NAME' => 'mql',
    'DB_USER' => 'root',
    'DB_PWD' => '123456',
    'DB_PORT' => '3306',
    'DB_PREFIX' => 'cmf_',
						
	/* redis */
	'REDIS_HOST' => "127.0.0.1",
	'REDIS_AUTH' => "123456",
	'REDIS_PORT' => "6379",
    //密钥
    "AUTHCODE" => 'rCt52pF2cnnKNB3Hkp',
    //cookies
    "COOKIE_PREFIX" => 'AJ1sOD_',
);
