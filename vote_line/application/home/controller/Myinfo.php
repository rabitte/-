<?php

namespace app\home\controller;

use app\home\model\join;
use think\Image;
use think\Controller;
use think\Request;
use \think\Validate;
use app\home\model\join as joinModel;
use app\home\model\record as recordModel;

class Myinfo extends Controller{
	protected $join_model;
	protected $record_model;
	protected function _initialize() {
		parent::_initialize ();
		$userinfo = session ( "userinfo" );
		if (empty ( $userinfo )) {
			$appid = 'wx94e7b4a3735de495';
			$redirect_uri = urlencode ( 'http://vote.tutu1277.top/index.php/Home/getcode/index' );
			$url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=$appid&redirect_uri=$redirect_uri&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
			$this->redirect ( $url );
		}
		$this->join_model = new joinModel ();
		$this->record_model = new recordModel ();
	}
	
	public function index() {
		$userinfo = session ( "userinfo" );
		$infodata=$this->join_model->where(array('status'=>1))->order("score desc")->select();
		$persondata=array();
		foreach ($infodata as $key=>$val){
			if($val['openid']==$userinfo['openid']){
				$persondata=array(
					'turename'=>$val['turename'],
						'picture'=>$val['picture'],
						'numberid'=>$val['numberid'],
						'rank'=>$key+1,
						'score'=>$val['score'],
						'address'=>$val['address'],
						'Invitation_code'=>$val['Invitation_code'],
						'slogan'=>$val['slogan'],
						'bonus_votenum'=>$val['bonus_votenum'],
						'isuser'=>1,
				);
			}
		}
		$votecord=$this->record_model->where(array('votetime'=>date("Y-m-d",time()),'isbouns'=>0,'voteopenid'=>$userinfo['openid']))->count();
		$votecordnum=6-$votecord;
		if(empty($persondata)){
			$persondata=array(
					'bonus_votenum'=>$votecordnum,
					'turename'=>$userinfo['nickname'],
					'isuser'=>0,
				);
		}else{
			$persondata['bonus_votenum']=$persondata['bonus_votenum']+$votecordnum;
		}
		$this->assign('persondata',$persondata);
		return view ();
	}
}
