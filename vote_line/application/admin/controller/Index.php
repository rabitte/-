<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\admin\model\join as joinModel;
use app\admin\model\record as recordModel;
class Index extends Controller
{
    protected $join_model;
    protected $record_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->join_model = new joinModel();
        $this->record_model = new recordModel();
    	$userinfo=session("userinfo");
		if(empty($userinfo)){
			$this->redirect("/admin/login/index");
		}
    }

    public function index()
    {
    	$pagenum=input('get.page');
        $data = $this->join_model->where('status', 1)->order('score desc')->paginate(18);
        foreach ($data as $k => $v) {
            if ($v['sex'] == 1) {
                $v['sex'] = '男';
            } else {
                $v['sex'] = '女';
            }
            //一天投票的普通次数
            $votecord = $this->record_model->where(array('votetime' => date("Y-m-d", time()), 'isbouns' => 0, 'voteopenid' => $v['openid']))->count();
            //剩余投票次数
            $data[$k]['bonus_votenum']=6-$votecord+$v['bonus_votenum'];
            if(!empty($pagenum)){
            	$data[$k]['page']=($pagenum-1)*18;
            }else{
            	$data[$k]['page']=0;
            }
        }
        $page = $data->render();
        $this->assign('page', $page);
        $this->assign('data',$data);
        return $this->fetch('index');
    }

        //用掉的奖励票数




    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
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
    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function edit()
    {
        $vote =$this->request->param();

        $data = $this->join_model->where('openid',$vote['openid'])->setField('score',$vote['score']);
            return $data;
    }
}