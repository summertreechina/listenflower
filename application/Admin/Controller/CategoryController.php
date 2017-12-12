<?php
namespace app\Admin\controller;
use think\Controller;
use app\Admin\validate\Category as Cate_validate;

class CategoryController extends Controller
{
    public function index()
    {
      return $this->fetch('cate-list');
    }

    public function add() {
    	return $this->fetch('category-add');
    }

    public function save() {
    	$data = input('post.');
    	$validate = new Cate_validate;
    	if (!$validate->scene('add')->check($data)) {
    		$this->error($validate->getError());
    	}
    	// 将验证通过的 $data 数据提交给module层

    }
}