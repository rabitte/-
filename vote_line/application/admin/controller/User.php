<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\admin\model\user as userModel;

class user extends Controller
{
    protected $user_model;
    protected function _initialize()
    {
        parent::_initialize();
        $this->user_model  = new userModel();
		$userinfo=session("userinfo");
		if(empty($userinfo)){
			$this->redirect("/admin/login/index");
		}
    }
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        return view();
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function add()
    {
        $userinfo=$this->request->param();
        $data =[
            'name' => $userinfo['name'],
            'password'=> encrypt_password($userinfo['password']),
        ];
       $res= $this->user_model->save($data);
        if($res){
            $this->success("添加成功",'admin/user/index');
        }
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
