<?php
namespace app\Common\controller;
use think\Controller;

class CateController extends Controller
{
    public function index()
    {
        return $this->fetch();
    }
}