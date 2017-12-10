<?php
namespace app\Common\controller;
use think\Controller;

class Cate extends Controller
{
    public function index()
    {
        return $this->fetch();
    }
}