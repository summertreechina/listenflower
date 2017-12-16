<?php
namespace app\Admin\controller;
use think\Controller;
use app\Common\CategoryModel;
use app\Admin\validate\CategoryValidate;

class CategoryController extends Controller
{
    public function index()
    {
        // $ChildCitys = model('Cates')->getChildCate();
        
        return $this->fetch('cate-list');
    }

    Public function getCityList() {
        return model('Cates')->getChildCate();
    }

    public function add() {
    	return $this->fetch('category-add');
    }

    public function save() {
    	$data = input('post.');
    	$validate = new CategoryValidate;
    	if (!$validate->scene('add')->check($data)) {
    		$this->error($validate->getError());
    	}
    	// 将验证通过的 $data 数据提交给module层
        model('Category')->add($data);

    }
}