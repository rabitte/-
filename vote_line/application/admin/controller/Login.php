<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use think\Validate;
use app\admin\model\user as userModel;

class Login extends Controller
{
    protected $user_model;
    protected function _initialize()
    {
        parent::_initialize();
        $this->user_model  = new userModel();

    }
    public function index()
    {
        return view();
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function login()
    {

      $data=$this->request->param();
        $rule = [
            'name' => 'require',
            'password' => 'require',
        ];
        $msg = [
            'name.require' => '用户名不能为空',
            'password.require' => '密码不能为空',
        ];
        $validate = new \think\Validate($rule, $msg);
        if( !$validate->check($data) ){
            $error = $validate->getError();
            $this->error($error);
        }
      //加盐方式是md5(md5($password.$salt))文件在common。php
        $password = encrypt_password($data['password']);
//
        $where = [
            'name' => $data['name'],
            'password' => $password
        ];
        $info=$this->user_model->where($where)->find();
        if(empty($info)){
            $this->error('用户名或密码错误');
        }
        //设置登录标识
        session('userinfo', $info->toArray());
        //页面跳转 到 后台首页
        $this->success('登录成功', 'admin/index/index');
    }

    //退出
    public function logout()
    {
        //清空session数据
        session(null);
        //页面跳转 登录页
        $this->redirect('login');
    }
}
