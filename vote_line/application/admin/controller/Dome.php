<?php

namespace app\admin\controller;
use think\Controller;
use think\Session;

class Dome extends controller{
  public function index() {
    // 步骤1.设置appid和appsecret
    $appid = "wx94e7b4a3735de495";
    $secret = "5cd2176407fdafbcca4c9363ca18c70e";

    // 步骤3.获取access_token
    $result = $this->http_get('https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$secret);
    $json = json_decode($result,true);
    $access_token = $json['access_token'];

    // 步骤4.获取ticket
    $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=$access_token";
    $res = json_decode ( $this->http_get ( $url ) );
    $ticket = $res->ticket;
 
 
    // 步骤5.生成wx.config需要的参数
    $surl = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
    $number = $this->nonceStr(16);
    $ws = $this->getWxConfig($appid,$ticket,$surl,time(),$number );
    return view('index',['ws'=>$ws,'surl'=>$surl]);
  }

  function getWxConfig($appid,$jsapiTicket,$url,$timestamp,$nonceStr) {
        $string = "jsapi_ticket=$jsapiTicket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";
        $signature = sha1 ( $string );
        $data = [
        'appId' => $WxConfig["appId"] = $appid,
        'nonceStr' => $WxConfig["nonceStr"] = $nonceStr,
        'timestamp' => $WxConfig["timestamp"] = $timestamp,
        'url' => $WxConfig["url"] = $url,
        'signature' => $WxConfig["signature"] = $signature,
        'rawString' => $WxConfig["rawString"] = $string,
        ];
        return $data;
    }
 
  // 步骤2.生成签名的随机串
  public function nonceStr($length){
    $str = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';//62个字符
    $strlen = 62;
    while($length > $strlen){
    $str .= $str;
    $strlen += 62;
    }
    $str = str_shuffle($str);
    return substr($str,0,$length);
  }
 

  public function http_get($url){
    $ch = curl_init ();
    curl_setopt ( $ch, CURLOPT_URL, $url );
    curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, FALSE );
    curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, FALSE );
    curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
    $output = curl_exec ( $ch );
    curl_close ( $ch );
    return $output;
        /*$oCurl = curl_init();
        if(stripos($url,"https://")!==FALSE){
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
        }
        curl_setopt($oCurl, CURLOPT_URL, $url);
        curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
        $sContent = curl_exec($oCurl);
        $aStatus = curl_getinfo($oCurl);
        curl_close($oCurl);
        if(intval($aStatus["http_code"])==200){
            return $sContent;
        }else{
            return false;
        }*/
    }    
 }
?>
