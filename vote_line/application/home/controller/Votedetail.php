<?php
namespace app\home\controller;

use app\home\model\join;
use think\Image;
use think\Controller;
use think\Request;
use \think\Validate;
use app\home\model\join as joinModel;
use app\home\model\record as recordModel;

class Votedetail extends Controller
{
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
	
    public function index()
    {
    	$voteid = input('get.voteid');
        $list =$this->join_model->where(array('id'=>$voteid))->find();
        $data = $this->join_model->field('id,score')->where(array('status'=>1))->order('score desc')->select();
        foreach ($data as $k =>$v){
			if($list['id']==$v['id']){
				$list['rank']=$k+1;
			}
        }
    	return view('index',['list'=>$list]);
    }
    
    
    //投票方法
    public function vote(){
    	if(request ()->isAjax ()){
    		$openid=input('post.openid');
    		$userinfo = session ( "userinfo" );
    		$votenum=$this->join_model->field("bonus_votenum,id")->where(array('openid'=>$userinfo['openid']))->find();
    		if($votenum['bonus_votenum']>0){
    			//给被投票人加分
    			$this->join_model->where(array('openid'=>$openid))->setInc("score",1);
    			//给投票人减票
    			$this->join_model->where(array('id'=>$votenum['id']))->setDec("bonus_votenum",1);
    			//记录
    			$data=array(
    					'voteopenid'=>$userinfo['openid'],
    					'voteedopenid'=>$openid,
    					'votetime'=>date("Y-m-d",time()),
    					'isbouns'=>1,
    			);
    			$this->record_model->insert($data);
    			echo 1;
    			exit;
    		}else{
    			$votecord=$this->record_model->where(array('votetime'=>date("Y-m-d",time()),'isbouns'=>0,'voteopenid'=>$userinfo['openid']))->count();
				$votecordnum=6-$votecord;
				if($votecordnum<=0){
					echo 2;
					exit;
				}else{
					//给被投票人加分
    				$this->join_model->where(array('openid'=>$openid))->setInc("score",1);
    				//记录
	    			$data=array(
	    					'voteopenid'=>$userinfo['openid'],
	    					'voteedopenid'=>$openid,
	    					'votetime'=>date("Y-m-d",time()),
	    					'isbouns'=>0,
	    			);
	    			$this->record_model->insert($data);
	    			echo 1;
	    			exit;
				}
    		}
    	}
    }
}
