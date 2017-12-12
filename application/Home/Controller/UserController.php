<?php
namespace app\Home\controller;
use think\Controller;

class UserController extends Controller
{
		// 登录页面
    public function login()
    {
      return $this->fetch();
    }
    // 注册页面
    public function register()
    {
      return $this->fetch();
    }
    // 用户协议页面
    public function agreement()
    {
    	return $this->fetch();
    }
}