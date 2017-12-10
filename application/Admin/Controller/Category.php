<?php
namespace app\Admin\controller;
use think\Controller;

class Category extends Controller
{
    public function index()
    {
      return $this->fetch('cate-list');
    }

    public function add() {
    	return $this->fetch('category-add');
    }
}