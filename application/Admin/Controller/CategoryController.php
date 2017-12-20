<?php
namespace app\Admin\controller;
use think\Controller;
use app\Common\CatesModel;
use app\Admin\validate\CategoryValidate;

class CategoryController extends Controller
{
    public function index()
    {
        // $ChildCitys = model('Cates')->getChildCate();
        
        return $this->fetch('cate-list');
    }

    Public function getCityList() {
        $pid = input('get.pid/d');

        return model('Cates')->getChildCate($pid);
    }

    public function add() {
    	return $this->fetch('category-add');
    }

    public function save() {
    	$data = input('post.');
    	$validate = new CategoryValidate();
    	if (!$validate->scene('addCate')->check($data)) {
    		$this->error($validate->getError());
    	} else {
        	// 将验证通过的 $data 数据提交给module层
            if (!model('Cates')->addCate($data)) {
                $this->error('录入的城市已存在，请检查');
            } else {
                $this->success('新增成功', 'Category/index');
            }
            
        }
    }
}