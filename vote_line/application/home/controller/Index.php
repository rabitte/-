<?php

namespace app\home\controller;

use think\Controller;

class Index extends controller {
	protected function _initialize() {
		parent::_initialize ();
		$userinfo = session ( "userinfo" );
		if (empty ( $userinfo )) {
			$appid = 'wx94e7b4a3735de495';
			$redirect_uri = urlencode ( 'http://vote.tutu1277.top/index.php/Home/getcode/index' );
			$url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=$appid&redirect_uri=$redirect_uri&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
			$this->redirect ( $url );
		}
	}
	
	public function index() {
		return $this->fetch();
	}
	
	// 关注二维码
	public function gzewm() {
		return $this->fetch ();
	}
}
