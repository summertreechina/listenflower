<?php
namespace app\Toren\controller;

use think\Controller;

class OtherController extends Controller
{
    // +----------------------------------------------------------------------
    // | 前台杂项
    // +----------------------------------------------------------------------

    /**
     * 其他杂项
     * @return [type] [description]
     */
    public function index() {
        return $this->fetch();
    }

    public function upload() {
        return $this->fetch();
    }

    public function tellme() {
        return $this->fetch(); 
    }

    public function saveadvice() {
        $data = input('post.'/a);

        print_r($data);
    }


}