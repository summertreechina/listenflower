<?php
namespace app\TorenAdmin\controller;

use think\Controller;
use app\Common\Controller\AuthController;

class OtherController extends AuthController
{
    // +----------------------------------------------------------------------
    // | 视图区
    // +----------------------------------------------------------------------

    /**
     * 其他杂项
     * @return [type] [description]
     */
    public function index() {
        return $this->fetch();
    }

    public function upload() {
        return $this->display('用户上传的试题浏览');
    }


}