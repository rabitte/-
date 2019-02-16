<?php
namespace app\home\controller;
use think\Controller;
use think\Request;
use \think\Validate;
use app\home\model\join as joinModel;

class Ranklist extends Controller
{
	protected $join_model;
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
	}
	
    public function index()
    {

        $data = $this->join_model->where('status',1)->order('score desc')->limit(0,10)->select();
        $nowpage=1;
        return view('index', ['data' => $data,'nowpage'=>$nowpage]);

    }

    public function append(){
        $nowpage = input('post.nowpage');
        $perpage=10;
        $nowpage=$nowpage+1;
        $start = ($nowpage-1)*$perpage;
        $data = $this->join_model->where('status',1)->order('score desc')->limit($start,$perpage)->select();
        if(empty($data)){
        	echo 1;
            exit;
        }
        $data[0]['nowpage']=$nowpage;
        echo json_encode($data);
        exit;
    }
}
