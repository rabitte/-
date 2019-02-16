<?php

namespace app\home\controller;
use think\Controller;
use think\Session;

class Getcode extends controller{
	public function index() {
		$appid = "wx94e7b4a3735de495";
		$secret = "5cd2176407fdafbcca4c9363ca18c70e";
		$code = $_GET ["code"];
		// 第一步:取全局access_token
		$url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appid&secret=$secret";
		$token = $this->getJson ( $url );
		
		// 第二步:取得openid
		$oauth2Url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=$appid&secret=$secret&code=$code&grant_type=authorization_code";
		$oauth2 = $this->getJson ( $oauth2Url );
		
		// 第三步:根据全局access_token和openid查询用户信息
		$access_token = $token ["access_token"];
		$openid = $oauth2 ['openid'];
		$get_user_info_url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=$access_token&openid=$openid&lang=zh_CN";
		$userinfo =$this->getJson ( $get_user_info_url );
		if($userinfo['subscribe']==0){
			$this->redirect("/index.php/home/getcode/gzewm");
			exit;
		}
		$userinfodata=array(
				'openid'=>$userinfo['openid'],
				'nickname'=>$userinfo['nickname'],
		);
	
		Session::set('userinfo',$userinfodata);
 		$this->redirect("/");
	}
	function getJson($url) {
		$ch = curl_init ();
		curl_setopt ( $ch, CURLOPT_URL, $url );
		curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, FALSE );
		curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, FALSE );
		curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
		$output = curl_exec ( $ch );
		curl_close ( $ch );
		return json_decode ( $output, true );
	}
	
	// 关注二维码
	public function gzewm() {
		return $this->fetch ();
	}
}
