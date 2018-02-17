<?php
namespace app\TorenAdmin\controller;
use think\Controller;
use app\Common\Model\AskModel;
use app\Common\Model\AnsModel;
use app\Common\Model\TRTomorrowModel;
use app\Common\Controller\AuthController;

class IndexController extends AuthController
{
    /**
     * 后台首页视图
     * @return [type] [description]
     */
    public function index() {
        return $this->fetch();
    }

    /**
     * 空白页视图 & 范例
     * @return [type] [description]
     */
    public function blank() {
        return $this->fetch();
    }

}



















