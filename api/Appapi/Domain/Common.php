<?php

class Domain_Common {

	public function getConfigPub() {
		$rs = array();
		$model = new Model_Common();
		$rs = $model->getConfigPub();
		return $rs;
	}
	
	public function getConfigPri() {
		$rs = array();
		$model = new Model_Common();
		$rs = $model->getConfigPri();
		return $rs;
	}
	
	public function checkToken($uid,$token) {
		$rs = array();
		$model = new Model_Common();
		$rs = $model->checkToken($uid,$token);
		return $rs;
	}

	public function getUserInfo($uid) {
		$rs = array();
		$model = new Model_Common();
		$rs = $model->getUserInfo($uid);
		return $rs;
	}
	
	public function isAttention($uid,$touid) {
		$rs = array();
		$model = new Model_Common();
		$rs = $model->isAttention($uid,$touid);
		return $rs;
	}
	
	public function isBlack($uid,$touid) {
		$rs = array();
		$model = new Model_Common();
		$rs = $model->isBlack($uid,$touid);
		return $rs;
	}

	public function isAdmin($uid,$liveuid) {
		$rs = array();
		$model = new Model_Common();
		$rs = $model->isAdmin($uid,$liveuid);
		return $rs;
	}
	public function getLevel($experience) {
		$rs = array();
		$model = new Model_Common();
		$rs = $model->getLevel($experience);
		return $rs;
	}
	public function getLevelAnchor($experience) {
		$rs = array();
		$model = new Model_Common();
		$rs = $model->getLevelAnchor($experience);
		return $rs;
	}
	
	public function isBan($uid) {
		$rs = array();
		$model = new Model_Common();
		$rs = $model->isBan($uid);
		return $rs;
	}
	public function isAuth($uid) {
		$rs = array();
		$model = new Model_Common();
		$rs = $model->isAuth($uid);
		return $rs;
	}
	
	public function LoginBonus($uid,$token){
		$rs = array();
		$model = new Model_Common();
		$rs = $model->LoginBonus($uid,$token);
		return $rs;

	}

	public function getUserVip($uid){
		$rs = array();
		$model = new Model_Common();
		$rs = $model->getUserVip($uid);
		return $rs;

	}

	public function getUserCar($uid){
		$rs = array();
		$model = new Model_Common();
		$rs = $model->getUserCar($uid);
		return $rs;

	}

	public function getUserLiang($uid){
		$rs = array();
		$model = new Model_Common();
		$rs = $model->getUserLiang($uid);
		return $rs;

	}
    public function ip_limit() {
        $rs = array();
        $model = new Model_Common();
        $rs = $model->ip_limit();

        return $rs;
    }
}
