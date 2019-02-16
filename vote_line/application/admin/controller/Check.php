<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\admin\model\join as joinModel;
use app\admin\model\record as recordModel;
use think\Session;


class Check extends Controller
{
    protected $join_model;
    protected $record_model;
    protected function _initialize()
    {
        parent::_initialize();
        $this->join_model  = new joinModel();
         $this->record_model = new recordModel();
   		 $userinfo=session("userinfo");
		if(empty($userinfo)){
			$this->redirect("/admin/login/index");
		}
        	
    }
    public function index()
    {
        $data= $this->join_model->where(array('status'=>0,'ischeck'=>0))->select();
        foreach ($data as $k=>$v){
    		if($v['sex'] == 1){
                $v['sex']='男';
            }else{
                $v['sex']='女';
            }
        }
        return view('index',['data'=>$data]);
    }
    
    //审核通过
    public function check(){
	    if(request()->isAjax()){
    		$id=input('post.id');
    		$infodata=$this->join_model->where(array('id'=>$id))->find();
			$this->join_model->where(array('id'=>$id))->update(array("status"=>1,"ischeck"=>1));
			$date=date("Y-m-d H:i:s",time());
			$access_token=$this->getaccesstoken();
			if($infodata['Invitation_codeman']!=''){
				$invitationopenid=$this->join_model->where(array('Invitation_code'=>strtoupper($infodata['Invitation_codeman'])))->find();
				$this->join_model->where(array('id'=>$invitationopenid['id']))->setInc("bonus_votenum",6);
				$this->join_model->where(array('id'=>$invitationopenid['id']))->setInc("Invitation_times",1);
				//推送消息给邀请人
				$template=array(
			      'touser'=>$invitationopenid['openid'],  //用户openid
			      'template_id'=>"DBkXjY16tVYsLh0YgGBdwz5QAPtIGl70ZTb-wgOfE00", //在公众号下配置的模板id
			      'url'=>"http://vote.tutu1277.top/", //点击模板消息会跳转的链接
			      'topcolor'=>"#7B68EE",
			      'data'=>array(
			        'first'=>array('value'=>"邀请好友成功通知",'color'=>"#FF0000"),
			        'keyword1'=>array('value'=>$invitationopenid['nickname'],'color'=>'#FF0000'),  //keyword需要与配置的模板消息对应
			        'keyword2'=>array('value'=>"我和广西老照片",'color'=>'#FF0000'),
			        'keyword3'=>array('value'=>$date,'color'=>'#FF0000'),
			        'keyword4'=>array('value'=>'邀请成功','color'=>'#c12020'),
			        'remark' =>array('value'=>'恭喜您，邀请好友报名成功，您获得了额外的6次投票机会','color'=>'#FF0000'), )
			);
		       $json_template=json_encode($template);
		    	$url="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$access_token;
		        $res=$this->curl_post($url,$json_template);
				//推送消息给用户
				$template1=array(
			      'touser'=>$infodata['openid'],  //用户openid
			      'template_id'=>"DBkXjY16tVYsLh0YgGBdwz5QAPtIGl70ZTb-wgOfE00", //在公众号下配置的模板id
			      'url'=>"http://vote.tutu1277.top/", //点击模板消息会跳转的链接
			      'topcolor'=>"#7B68EE",
			      'data'=>array(
			        'first'=>array('value'=>"报名审核通知",'color'=>"#FF0000"),
			        'keyword1'=>array('value'=>$infodata['nickname'],'color'=>'#FF0000'),  //keyword需要与配置的模板消息对应
			        'keyword2'=>array('value'=>"我和广西老照片",'color'=>'#FF0000'),
			        'keyword3'=>array('value'=>$date,'color'=>'#FF0000'),
			        'keyword4'=>array('value'=>'审核成功','color'=>'#c12020'),
			        'remark' =>array('value'=>'恭喜您，报名成功，现在去给自己拉票吧，也可以分享自己的邀请码，分享成功即可为自己获得额外的投票机会','color'=>'#FF0000'), )
			);
		       $json_template1=json_encode($template1);
		    	$url1="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$access_token;
		        $res1=$this->curl_post($url1,$json_template1);
		    	echo 1;
		    	exit;
			}else{
				$template=array(
			      'touser'=>$infodata['openid'],  //用户openid
			      'template_id'=>"DBkXjY16tVYsLh0YgGBdwz5QAPtIGl70ZTb-wgOfE00", //在公众号下配置的模板id
			      'url'=>"http://vote.tutu1277.top/", //点击模板消息会跳转的链接
			      'topcolor'=>"#7B68EE",
			      'data'=>array(
			        'first'=>array('value'=>"报名审核通知",'color'=>"#FF0000"),
			        'keyword1'=>array('value'=>$infodata['nickname'],'color'=>'#FF0000'),  //keyword需要与配置的模板消息对应
			        'keyword2'=>array('value'=>"我和广西老照片",'color'=>'#FF0000'),
			        'keyword3'=>array('value'=>$date,'color'=>'#FF0000'),
			        'keyword4'=>array('value'=>'审核成功','color'=>'#c12020'),
			        'remark' =>array('value'=>'恭喜您，报名成功，现在去给自己拉票吧，也可以分享自己的邀请码，分享成功即可为自己获得额外的投票机会','color'=>'#FF0000'), )
			);
		       $json_template=json_encode($template);
		    	$url="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$access_token;
		        $res=$this->curl_post($url,$json_template);
		    	echo 1;
		    	exit;
			} 
	    }
    }
    
    
    //审核不通过
    public function uncheck(){
    	if(request()->isAjax()){
    		$id=input('post.id');
    		$this->join_model->where(array('id'=>$id))->update(array('ischeck'=>1));
			$infodata=$this->join_model->where(array('id'=>$id))->find();
			$date=date("Y-m-d H:i:s",time());
			$access_token=$this->getaccesstoken();
			$template=array(
			      'touser'=>$infodata['openid'],  //用户openid
			      'template_id'=>"DBkXjY16tVYsLh0YgGBdwz5QAPtIGl70ZTb-wgOfE00", //在公众号下配置的模板id
			      'url'=>"http://vote.tutu1277.top/", //点击模板消息会跳转的链接
			      'topcolor'=>"#7B68EE",
			      'data'=>array(
			        'first'=>array('value'=>"报名审核通知",'color'=>"#FF0000"),
			        'keyword1'=>array('value'=>$infodata['nickname'],'color'=>'#FF0000'),  //keyword需要与配置的模板消息对应
			        'keyword2'=>array('value'=>"我和广西老照片",'color'=>'#FF0000'),
			        'keyword3'=>array('value'=>$date,'color'=>'#FF0000'),
			        'keyword4'=>array('value'=>'审核失败','color'=>'#c12020'),
			        'remark' =>array('value'=>'很遗憾，您填写的报名信息不符合规定，请到报名页面参考要求重新填写，然后重新提交审核','color'=>'#FF0000'), )
			);
	       $json_template=json_encode($template);
	    	$url="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$access_token;
	        $res=$this->curl_post($url,$json_template);
	    	echo 1;
	    	exit;
    	 
    	}
    }
    
    
   public function getaccesstoken(){
    		$appid = "wx94e7b4a3735de495";
			$secret = "5cd2176407fdafbcca4c9363ca18c70e";
			$json_token=$this->curl_post("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appid&secret=$secret");
			  $access_token1=json_decode($json_token,true);
			  $access_token2=$access_token1['access_token'];
			 return $access_token2;
    }
    
  public function curl_post($url , $data=null){
    $curl = curl_init();
        curl_setopt($curl,CURLOPT_URL,$url);
        curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($curl,CURLOPT_SSL_VERIFYHOST,FALSE);
        if(!empty($data)){
            curl_setopt($curl,CURLOPT_POST,1);
            curl_setopt($curl,CURLOPT_POSTFIELDS,$data);
        }
        curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);
        $output = curl_exec($curl);
        curl_close($curl);
        return $output;
  }
  
    public function detail($openid)
    {
        $data = $this->join_model->where('openid',$openid)->find();
        if($data['sex'] ==1){
            $data['sex']="男";
        }else{
            $data['sex']="女";
        }
        //一天投票的普通次数
        $votecord = $this->record_model->where(array('votetime' => date("Y-m-d", time()), 'isbouns' => 0, 'voteopenid' => $data['openid']))->count();
        //剩余投票次数
        $data['bonus_votenum']=6-$votecord+$data['bonus_votenum'];
        return view('detail',['data'=>$data]);
    }

}
