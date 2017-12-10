<?php
namespace app\Admin\controller;
use think\Controller;

class Index extends Controller
{
		// 后台首页
    public function index() {
      return $this->fetch();
    }

    public function welcome() {
    	return "我不知道这样会输出什么";
    }

}